package com.les.LesHotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/pesquisa")
	public String pesquisar(Model model) {
		
		return "pesquisa";
	}

}
