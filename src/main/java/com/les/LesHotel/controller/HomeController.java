package com.les.LesHotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.les.LesHotel.Facade.Resultado;
import com.les.LesHotel.entities.Hospedagem;

@Controller
@RequestMapping("/")
public class HomeController extends ControllerBase{
	
	@GetMapping("/")
	public String index(Model model, Hospedagem hospedagem) {
		Resultado resultado = commands.get(CONSULTAR).execute(hospedagem);
		model.addAttribute("hospedagens", resultado.getEntidades());
		return "pesquisa";
	}
	
	@GetMapping("/pesquisa")
	public String pesquisar(Model model, Hospedagem hospedagem) {
		Resultado resultado = commands.get(CONSULTAR).execute(hospedagem);
		model.addAttribute("hospedagens", resultado.getEntidades());
		return "pesquisa";
	}

}
