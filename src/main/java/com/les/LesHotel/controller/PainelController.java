package com.les.LesHotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/")
public class PainelController extends ControllerBase{
	
	
	
	@GetMapping("painel/home")
	public String indexPainel() {
		return "painel/painel";
	}
	
	@PostMapping("painel/homePost")
	public String home(String mensagem, Model model) {
		model.addAttribute("mensagem", mensagem);
		return "painel/painel";
	}
	
	@GetMapping("painel/hospedagem/cadastrar")
	public String cadastroHospedagem() {
		return "painel/hospedagem/cadastrar";
	}
	
	
	
	@GetMapping("painel/hospedagem/estadia")
	public String consultaEstadia() {
		return "painel/hospedagem/estadia";
	}
	
	@GetMapping("painel/estadia/consultar")
	public String consultaEstadiaHospede() {
		return "painel/estadia/consultar";
	}
	
	@GetMapping("painel/graficos/graficos")
	public String consultaDeGraficos() {
		return "painel/graficos/graficos";
	}
	
	
	
	

}
