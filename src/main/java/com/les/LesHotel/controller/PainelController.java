package com.les.LesHotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class PainelController {
	
	@GetMapping("painel/home")
	public String indexPainel() {
		return "painel/painel";
	}
	
	@GetMapping("painel/hospedagem/cadastrar")
	public String cadastroHospedagem() {
		return "painel/hospedagem/cadastrar";
	}
	
	@GetMapping("painel/hospedagem/consultar")
	public String consultaHospedagem() {
		return "painel/hospedagem/consultar";
	}
	
	@GetMapping("painel/hospedagem/editar")
	public String editaHospedagem() {
		return "painel/hospedagem/editar";
	}
	
	@GetMapping("painel/hospedagem/estadia")
	public String consultaEstadia() {
		return "painel/hospedagem/estadia";
	}
	
	@GetMapping("painel/estadia/consultar")
	public String consultaEstadiaHospede() {
		return "painel/estadia/consultar";
	}
	
	
	
	

}
