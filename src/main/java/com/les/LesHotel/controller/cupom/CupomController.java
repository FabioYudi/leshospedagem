package com.les.LesHotel.controller.cupom;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
	
	@PostMapping("/cadastrar")
	public String cadastrarCupom(Model model, Cupom cupom) throws JsonProcessingException {
		Resultado resultado = commands.get(SALVAR).execute(cupom);
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Cupom cadastrado com sucesso");
			model.addAttribute("ok", true);
			
		}else {
			model.addAttribute("ok", false);
			
		}
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(model);
		
	}

}
