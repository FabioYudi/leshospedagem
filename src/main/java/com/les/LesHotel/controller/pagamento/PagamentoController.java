package com.les.LesHotel.controller.pagamento;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.les.LesHotel.Facade.Resultado;
import com.les.LesHotel.controller.ControllerBase;
import com.les.LesHotel.entities.Cliente;
import com.les.LesHotel.entities.Hospedagem;
import com.les.LesHotel.entities.Reserva;
import com.les.LesHotel.helper.MapperReservaHelper;

@Controller
@RequestMapping("/pagamento")
public class PagamentoController extends ControllerBase {

	@ResponseBody
	@PostMapping("/irParaConfirmacao/{idHospedagem}/{idCliente}")
	public String processarPagamento( @RequestParam("reserva") String reserva, Model model,
			@PathVariable("idHospedagem") String idHospedagem, @PathVariable("idCliente") String idCliente) throws IOException {
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
		reservaCliente.setStatus("EM PROCESSO");
		Resultado resultado = commands.get(SALVAR).execute(reservaCliente);
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
	public String irParaPagamento(String idCliente, String idHospedagem) {
		Cliente cliente = new Cliente();
		cliente.setId(Long.parseLong(idCliente));
		Hospedagem hospedagem = new Hospedagem();
		hospedagem.setId(Long.parseLong(idHospedagem));
		cliente = (Cliente) commands.get(VISUALIZAR).execute(cliente).getEntidades().get(0);
		hospedagem = (Hospedagem) commands.get(VISUALIZAR).execute(hospedagem).getEntidades().get(0);
		Reserva reserva = new Reserva();
		reserva.setCliente(cliente);
		reserva.setHospedagem(hospedagem);
		reserva = (Reserva) commands.get(VISUALIZAR).execute(reserva).getEntidades().get(0);
				
		
		return "painel/hospedagem/pagamento";
		
	}
}
