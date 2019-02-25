package com.les.LesHotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HospedagemController {
	@GetMapping("painel/hospedagem/detalhes")
	public String detalhesHospedagem() {
		return "painel/hospedagem/detalhes";
	}
	
	@GetMapping("painel/hospedagem/pagamento")
	public String pagamentoHospedagem() {
		return "painel/hospedagem/pagamento";
	}
}
