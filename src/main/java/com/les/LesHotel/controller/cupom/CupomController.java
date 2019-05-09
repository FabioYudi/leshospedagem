package com.les.LesHotel.controller.cupom;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
import com.les.LesHotel.entities.Cupom;

@Controller
@RequestMapping("/cupom")
public class CupomController extends ControllerBase {
	
	@GetMapping("/consultar")
	public String consultarCupons(Model model) {
		Cupom cupom = new Cupom();
		Resultado resultado = commands.get(CONSULTAR).execute(cupom);
		model.addAttribute("cupons", resultado.getEntidades());
		return "painel/cupom/consultar";
	}
	
	@ResponseBody
	@PostMapping("/cadastrar")
	public String cadastrarCupom(Model model, @RequestParam("cupom") String cupomString) throws IOException {
	
		ObjectMapper mapper = new ObjectMapper().registerModule(new JavaTimeModule());
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		Cupom cupom = (Cupom) mapper.readValue(cupomString, Cupom.class);
		Resultado resultado = commands.get(SALVAR).execute(cupom);
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Cupom cadastrado com sucesso");
			model.addAttribute("ok", true);
			
		}else {
			model.addAttribute("ok", false);
			
		}
		
		model.addAttribute("mensagem", resultado.getMsg());
		return mapper.writeValueAsString(model);
		
	}
	
	@GetMapping("/desativar/{idCupom}/{valor}")
	public String desativarCupom(Model model, @PathVariable String idCupom, @PathVariable boolean valor) throws IOException {
	
		ObjectMapper mapper = new ObjectMapper().registerModule(new JavaTimeModule());
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		Cupom cupom = new Cupom();
		cupom.setId(Long.parseLong(idCupom));
		cupom = (Cupom) commands.get(CONSULTAR).execute(cupom).getEntidades().get(0);
		cupom.setAtivo(valor);
		Resultado resultado = commands.get(SALVAR).execute(cupom);
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Cupom cadastrado com sucesso");
			model.addAttribute("ok", true);
			
		}else {
			model.addAttribute("ok", false);
			
		}
		
		
		return "forward:/cupom/consultar";
		
	}

}
