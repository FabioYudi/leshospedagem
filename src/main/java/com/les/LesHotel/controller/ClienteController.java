package com.les.LesHotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cliente")
public class ClienteController {
	
	@GetMapping("/cadastrar")
	public String cadastrar() {
		return "cliente/cadastrar";
	}
	
	@GetMapping("/dados")
	public String carregarDados() {
		return "cliente/dados";
	}
	
	@GetMapping("/login")
	public String index() {
		return "cliente/login";
	}
	
}
