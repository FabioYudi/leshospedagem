package com.les.LesHotel.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.les.LesHotel.Facade.Resultado;
import com.les.LesHotel.entities.Cliente;
import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.entities.Hospedagem;
import com.les.LesHotel.entities.Reserva;

@Controller
@RequestMapping("/painel/hospedagem/")
public class HospedagemController extends ControllerBase {
	
	@PostMapping("/filtrar")
	public String filtrarHospedagem(Model model,  Hospedagem hospedagem) {
		Resultado resultado = commands.get(CONSULTAR).execute(hospedagem);
		model.addAttribute("hospedagens", resultado.getEntidades());
		return "painel/hospedagem/consultar";
	}
	
	
	
	@PostMapping("/consultarAtualizacao")
	public String consultaHospedagemAtualizado(Model model, @RequestParam("mensagem") String mensagem) {
		Cliente clienteLogado = (Cliente) httpSession.getAttribute("clienteLogado");
		Cliente cliente = new Cliente();
		cliente.setId(clienteLogado.getId());
		cliente = (Cliente) commands.get(VISUALIZAR).execute(cliente).getEntidades().get(0);

		model.addAttribute("hospedagens", cliente.getHospedagens());
		model.addAttribute("mensagem", mensagem);
		return "painel/hospedagem/consultar";
	}
	
	@ResponseBody
	@PostMapping("/desativar/{id}/{valor}")
	public String desativarHospedagem(Model model, @PathVariable("id") String id, @PathVariable("valor") boolean valor) throws JsonProcessingException {
		Hospedagem hospedagem = new Hospedagem();
		hospedagem.setId(Long.parseLong(id));
		Resultado resultado = commands.get(CONSULTAR).execute(hospedagem);
		hospedagem = (Hospedagem) resultado.getEntidades().get(0);
		hospedagem.setAtivo(valor);
		resultado = commands.get(EXCLUIR).execute(hospedagem);
		model.addAttribute("hospedagens", resultado.getEntidades());
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Hospedagem alterada com sucesso!");
			model.addAttribute("ok", true);
		}else {
			model.addAttribute("ok", false);
		}
		model.addAttribute("mensagem", resultado.getMsg());
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(model);
	}
	
	
	@GetMapping("/consultar")
	public String consultaHospedagem(Model model) {
		Cliente clienteLogado = (Cliente) httpSession.getAttribute("clienteLogado");
		Cliente cliente = new Cliente();
		cliente.setId(clienteLogado.getId());
		cliente = (Cliente) commands.get(VISUALIZAR).execute(cliente).getEntidades().get(0);
		model.addAttribute("hospedagens", cliente.getHospedagens());
		return "painel/hospedagem/consultar";
	}
	
	@ResponseBody
	@PostMapping("/editar")
	public String editaHospedagem(@RequestParam("hospedagem") String hospedagem, Model model) throws JsonParseException, JsonMappingException, IOException {
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		
		Hospedagem hos = (Hospedagem) mapper.readValue(hospedagem, Hospedagem.class);
		Cliente clienteLogado = (Cliente) httpSession.getAttribute("clienteLogado");
		Cliente cliente = new Cliente();
		cliente.setId(clienteLogado.getId());
		cliente = (Cliente) commands.get(VISUALIZAR).execute(cliente).getEntidades().get(0);
		Set<Hospedagem> hospedagens = 
				cliente.getHospedagens().stream()
					.filter(h -> !h.getId().equals(hos.getId()))
					.collect(Collectors.toSet());
		hos.setAnfitriao(cliente);
		hospedagens.add(hos);
		cliente.setHospedagens(hospedagens);
		Resultado resultado = commands.get("ALTERAR").execute(cliente);
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Hospedagem alterada com sucesso!");
			model.addAttribute("ok", true);
			
		}else {
			model.addAttribute("ok", false);
			
		}
		model.addAttribute("mensagem", resultado.getMsg());
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(model);
	}
	
	@GetMapping("/detalhesEdicao/{id}")
	public String carregarDadosEdicao(@PathVariable("id") String id, Model model) {
		Hospedagem hospedagem = new Hospedagem();
		hospedagem.setId(Long.parseLong(id));
		Resultado resultado = commands.get(CONSULTAR).execute(hospedagem);
		model.addAttribute("hospedagem", resultado.getEntidades().get(0));
		return "painel/hospedagem/editar";
	}
	
	
	@GetMapping("/detalhes/{id}")
	public String detalhesHospedagem(@PathVariable String id, Model model) throws JsonProcessingException {
		Hospedagem hospedagem = new Hospedagem();
		hospedagem.setId(Long.parseLong(id));
		Resultado resultado = commands.get(VISUALIZAR).execute(hospedagem);
		Reserva reserva = new Reserva();
		reserva.setHospedagem((Hospedagem)resultado.getEntidades().get(0));
		Resultado resultadoReserva = commands.get(CONSULTAR).execute(reserva);
		
		resultadoReserva.getEntidades();
		List<LocalDate> datasIndisponives = new ArrayList<LocalDate>();
		for(EntidadeDominio entidade : resultadoReserva.getEntidades())	{
			Reserva reservaHospedagem = (Reserva) entidade;
			LocalDate startDate = reservaHospedagem.getCheckin();
			LocalDate endDate = reservaHospedagem.getCheckout();
			List<LocalDate> datas = new ArrayList<>();
			if(!reservaHospedagem.getStatus().equalsIgnoreCase("REPROVADO")) {
				 datas = Stream
						.iterate(startDate, d -> d.plusDays(1))
						.limit(ChronoUnit.DAYS.between(startDate, endDate) + 1)
						.collect(Collectors.toList());
			}
		
			datasIndisponives.addAll(datas);
		}
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		
	
		List<String> datasString = new ArrayList<String>();
		datasIndisponives.forEach(d -> {
			String dataString = d.format(formatter);
			datasString.add(dataString);
		});
		ObjectMapper mapper = new ObjectMapper();
		model.addAttribute("datasIndisponiveis", mapper.writeValueAsString(datasString));
		model.addAttribute("hospedagem", resultado.getEntidades().get(0));
		
		return "painel/hospedagem/detalhes";
	}
	
	@PostMapping("/pagamento/{id}")
	public String pagamentoHospedagem(@PathVariable String id, Model model, Reserva reserva, boolean alterar) {
		Hospedagem hospedagem = new Hospedagem();
		hospedagem.setId(Long.parseLong(id));
		hospedagem = (Hospedagem) commands.get(VISUALIZAR).execute(hospedagem).getEntidades().get(0);	
		Cliente clienteLogado = (Cliente) httpSession.getAttribute("clienteLogado");
		Cliente cliente = new Cliente();
		cliente.setId(clienteLogado.getId());
		cliente = (Cliente) commands.get(VISUALIZAR).execute(cliente).getEntidades().get(0);
		model.addAttribute("cliente", cliente);
		model.addAttribute("reserva", reserva);
		model.addAttribute("hospedagem", hospedagem);
		model.addAttribute("alterar", alterar);
		
	
		return "painel/hospedagem/pagamento";
	}
	
	@GetMapping("/detalheEstadia")
	public String detalhesEstadia() {
		return "painel/hospedagem/detalheEstadia";
	}
	
	@PostMapping("/cadastrar")
	public String cadastrarHospedagem() {
		return "painel/hospedagem/detalheEstadia";
	}
	
	@PostMapping("/processar")
	@ResponseBody
	public String processar(Model model, @RequestParam("action") String action, @RequestParam("entidade") String entidade)
			throws Exception {
		ObjectMapper mapper = new ObjectMapper().registerModule(new JavaTimeModule());
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		Cliente clienteLogado = (Cliente) httpSession.getAttribute("clienteLogado");
		Cliente cliente = new Cliente();
		cliente.setId(clienteLogado.getId());
		cliente = (Cliente) commands.get(VISUALIZAR).execute(cliente).getEntidades().get(0);
	
		Hospedagem hospedagem = (Hospedagem) mapper.readValue(entidade, Hospedagem.class);
		hospedagem.setAnfitriao(cliente);
		cliente.getHospedagens().add(hospedagem);
		Resultado resultado = commands.get(ALTERAR).execute(cliente);
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Hospedagem cadastrada com sucesso!");
			model.addAttribute("ok", true);
		}else {
			model.addAttribute("ok", false);
		}
		model.addAttribute("mensagem", resultado.getMsg());
		return mapper.writeValueAsString(model);
	}
	
	@GetMapping("/consultar/reservas/{idHospedagem}")
	public String consultarReservas(Model model, @PathVariable String idHospedagem) {
		Hospedagem hospedagem = new Hospedagem();
		hospedagem.setId(Long.parseLong(idHospedagem));
		Reserva reserva = new Reserva();
		reserva.setHospedagem(hospedagem);
		Resultado resultado = commands.get(CONSULTAR).execute(reserva);
		Cliente clienteLogado = (Cliente) httpSession.getAttribute("clienteLogado");
		Cliente cliente = new Cliente();
		cliente.setId(clienteLogado.getId());
		cliente = (Cliente) commands.get(VISUALIZAR).execute(cliente).getEntidades().get(0);
		model.addAttribute("cliente", cliente);
		model.addAttribute("reservas", resultado.getEntidades());
		return "painel/hospedagem/reservas";
	}
}
