package com.les.LesHotel.controller.pagamento;

import java.io.IOException;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.les.LesHotel.Facade.Resultado;
import com.les.LesHotel.controller.ControllerBase;
import com.les.LesHotel.entities.Cliente;
import com.les.LesHotel.entities.Endereco;
import com.les.LesHotel.entities.Hospedagem;
import com.les.LesHotel.entities.Reserva;
import com.les.LesHotel.enumeration.StatusReservaEnum;
import com.les.LesHotel.helper.MapperReservaHelper;
import com.les.LesHotel.helper.PagamentoCartaoHelper;
import com.les.LesHotel.helper.StringHelper;

@Controller
@RequestMapping("/pagamento")
public class PagamentoController extends ControllerBase {

	@ResponseBody
	@PostMapping("/irParaConfirmacao/{idHospedagem}/{idCliente}/{idEndereco}")
	public String processarPagamento( @RequestParam("reserva") String reserva, Model model,
			@PathVariable("idHospedagem") String idHospedagem, @PathVariable("idCliente") String idCliente, @PathVariable("idEndereco") String idEndereco, @RequestParam("alterar")  boolean alterar) throws IOException {
		ObjectMapper mapper = new ObjectMapper().registerModule(new JavaTimeModule());
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		Reserva reservaCliente = mapper.readValue(reserva, Reserva.class);
		Cliente cliente = new Cliente();
		Hospedagem hospedagem = new Hospedagem();
		
		cliente.setId(Long.parseLong(idCliente));
		hospedagem.setId(Long.parseLong(idHospedagem));
		cliente = (Cliente) commands.get(VISUALIZAR).execute(cliente).getEntidades().get(0);
		hospedagem = (Hospedagem) commands.get(VISUALIZAR).execute(hospedagem).getEntidades().get(0);
		reservaCliente = MapperReservaHelper.mapearReserva(reservaCliente, cliente, hospedagem);
		reservaCliente.setStatus(StatusReservaEnum.EM_PROCESSO.getStatus());
		ArrayList<Endereco> enderecos = (ArrayList<Endereco>) cliente.getEnderecos().stream()
				.filter(e -> e.getId().equals(Long.parseLong(idEndereco)))
				.collect(Collectors.toList());
		reservaCliente.setEndereco(enderecos.get(0));
		
		reservaCliente.setDataReserva(LocalDate.now());
		Resultado resultado = new Resultado();
	
			if(!alterar) {
				resultado =  commands.get(SALVAR).execute(reservaCliente);
			}else {
				Reserva reservaAlterar = (Reserva) commands.get(CONSULTAR).execute(reservaCliente).getEntidades().get(0);
				reservaAlterar.setCartoes(reservaCliente.getCartoes());
				reservaAlterar.setEndereco(reservaCliente.getEndereco());
				resultado =  commands.get(ALTERAR).execute(reservaAlterar);
			}
			
		
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			model.addAttribute("ok", true);
		}else {
			model.addAttribute("ok", false);
		}
		model.addAttribute("mensagem", resultado.getMsg());
		model.addAttribute("idCliente", idCliente);
		model.addAttribute("idHospedagem", idHospedagem);
		return mapper.writeValueAsString(model);
	}
	
	@PostMapping("/confirmacao")
	public String irParaPagamento(Model model, String idCliente, String idHospedagem, Reserva dadosReserva) {
		Cliente cliente = new Cliente();
		cliente.setId(Long.parseLong(idCliente));
		Hospedagem hospedagem = new Hospedagem();
		hospedagem.setId(Long.parseLong(idHospedagem));
		cliente = (Cliente) commands.get(VISUALIZAR).execute(cliente).getEntidades().get(0);
		hospedagem = (Hospedagem) commands.get(VISUALIZAR).execute(hospedagem).getEntidades().get(0);
		
		Reserva reserva = new Reserva();
		reserva.setCliente(cliente);
		reserva.setHospedagem(hospedagem);
		reserva.setCheckin(dadosReserva.getCheckin());
		reserva.setCheckout(dadosReserva.getCheckout());
		reserva.setQtdHospedes(dadosReserva.getQtdHospedes());
		reserva.setStatus(StatusReservaEnum.EM_PROCESSO.getStatus());
		reserva.setTotal(dadosReserva.getTotal().setScale(2, RoundingMode.HALF_EVEN));
		reserva = (Reserva) commands.get(CONSULTAR).execute(reserva).getEntidades().get(0);
		model.addAttribute("reserva", reserva);		
		
		return "painel/hospedagem/confirmacao";
		
	}
	
	@GetMapping("/atualizarPagamento/{idReserva}")
	public String atualizarReserva(@PathVariable String idReserva) {
		Reserva reserva = new Reserva();
		reserva.setId(Long.parseLong(idReserva));
		reserva = (Reserva) commands.get(VISUALIZAR).execute(reserva).getEntidades().get(0);
		if(PagamentoCartaoHelper.simularPagamento()) {
			reserva.setStatus(StatusReservaEnum.APROVADO.getStatus());
		}else {
			reserva.setStatus(StatusReservaEnum.REPROVADO.getStatus());
		}
		
		commands.get(ALTERAR).execute(reserva);
		
		return "forward:/cliente/consultar/reservas";
	}
	
	@ResponseBody
	@GetMapping("/cancelarReserva/{idReserva}")
	public String cancelarReserva(Model model, String motivo, @PathVariable String idReserva, boolean hospede) throws JsonProcessingException {
		Reserva reserva = new Reserva();
		reserva.setId(Long.parseLong(idReserva));
		reserva = (Reserva) commands.get(VISUALIZAR).execute(reserva).getEntidades().get(0);
		if(hospede) {
			reserva.setStatus(StatusReservaEnum.CANCELADO_HOSPEDE.getStatus());
		}else {
			reserva.setStatus(StatusReservaEnum.CANCELADO_ANFITRIAO.getStatus());
		}
		reserva.setMotivoCancelamento(motivo);
		Resultado resultado = commands.get(EXCLUIR).execute(reserva);
		if(StringHelper.isNullOrEmpty(resultado.getMsg())) {
			commands.get(ALTERAR).execute(reserva);
			model.addAttribute("ok", true);
			
		}else {
			model.addAttribute("ok", false);
			model.addAttribute("mensagem", resultado.getMsg());
		}
		
		
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(model);
	}
}
