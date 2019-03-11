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
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.les.LesHotel.Facade.Resultado;
import com.les.LesHotel.entities.Hospedagem;

@Controller
@RequestMapping("/painel/hospedagem/")
public class HospedagemController extends ControllerBase {
	
	
	@PostMapping("/consultarAtualizacao")
	public String consultaHospedagemAtualizado(Model model, @RequestParam("mensagem") String mensagem) {
		Hospedagem hospedagem = new Hospedagem();
		Resultado resultado = commands.get(CONSULTAR).execute(hospedagem);
		model.addAttribute("hospedagens", resultado.getEntidades());
		model.addAttribute("mensagem", mensagem);
		return "painel/hospedagem/consultar";
	}
	
	
	
	
	@GetMapping("/consultar")
	public String consultaHospedagem(Model model, String mensagem) {
		Hospedagem hospedagem = new Hospedagem();
		Resultado resultado = commands.get(CONSULTAR).execute(hospedagem);
		model.addAttribute("hospedagens", resultado.getEntidades());
		model.addAttribute("mensagem", mensagem);
		return "painel/hospedagem/consultar";
	}
	
	@ResponseBody
	@PostMapping("/editar")
	public String editaHospedagem(@RequestParam("hospedagem") String hospedagem) throws JsonParseException, JsonMappingException, IOException {
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		
		Hospedagem hos = (Hospedagem) mapper.readValue(hospedagem, Hospedagem.class);
		Resultado resultado = commands.get("ALTERAR").execute(hos);
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Hospedagem alterada com sucesso!");
		}
	
		return resultado.getMsg();
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
	public String detalhesHospedagem() {
		
		return "painel/hospedagem/detalhes";
	}
	
	@GetMapping("/pagamento")
	public String pagamentoHospedagem() {
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
	public String processar(@RequestParam("action") String action, @RequestParam("entidade") String entidade)
			throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		Hospedagem hospedagem = (Hospedagem) mapper.readValue(entidade, Hospedagem.class);
		return mapper.writeValueAsString(commands.get(action).execute(hospedagem));
	}
}
