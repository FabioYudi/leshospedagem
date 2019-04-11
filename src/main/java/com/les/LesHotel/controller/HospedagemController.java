package com.les.LesHotel.controller;

import java.io.IOException;

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
		Hospedagem hospedagem = new Hospedagem();
		Resultado resultado = commands.get(CONSULTAR).execute(hospedagem);
		model.addAttribute("hospedagens", resultado.getEntidades());
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
		Hospedagem hospedagem = new Hospedagem();
		Resultado resultado = commands.get(CONSULTAR).execute(hospedagem);
		model.addAttribute("hospedagens", resultado.getEntidades());
		return "painel/hospedagem/consultar";
	}
	
	@ResponseBody
	@PostMapping("/editar")
	public String editaHospedagem(@RequestParam("hospedagem") String hospedagem, Model model) throws JsonParseException, JsonMappingException, IOException {
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		
		Hospedagem hos = (Hospedagem) mapper.readValue(hospedagem, Hospedagem.class);
		Resultado resultado = commands.get("ALTERAR").execute(hos);
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
	public String detalhesHospedagem(@PathVariable String id, Model model) {
		Hospedagem hospedagem = new Hospedagem();
		hospedagem.setId(Long.parseLong(id));
		Resultado resultado = commands.get(VISUALIZAR).execute(hospedagem);
		model.addAttribute("hospedagem", resultado.getEntidades().get(0));
		
		return "painel/hospedagem/detalhes";
	}
	
	@PostMapping("/pagamento/{id}")
	public String pagamentoHospedagem(@PathVariable String id, Model model, Reserva reserva) {
		Hospedagem hospedagem = new Hospedagem();
		hospedagem.setId(Long.parseLong(id));
		Cliente clienteLogado = (Cliente) httpSession.getAttribute("clienteLogado");
		
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
		Hospedagem hospedagem = (Hospedagem) mapper.readValue(entidade, Hospedagem.class);
		Resultado resultado = commands.get(action).execute(hospedagem);
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Hospedagem cadastrada com sucesso!");
			model.addAttribute("ok", true);
		}else {
			model.addAttribute("ok", false);
		}
		model.addAttribute("mensagem", resultado.getMsg());
		return mapper.writeValueAsString(model);
	}
}
