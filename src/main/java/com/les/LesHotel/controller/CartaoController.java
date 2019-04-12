package com.les.LesHotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cliente")
public class CartaoController extends ControllerBase {
	
	@GetMapping("cartoes/consultar")
	public String consultarEnderecos(Model model) {
	
		
		return "cliente/cartoes/consultar";
	}

}
