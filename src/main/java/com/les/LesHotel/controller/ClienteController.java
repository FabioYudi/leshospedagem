package com.les.LesHotel.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.les.LesHotel.Facade.Resultado;
import com.les.LesHotel.entities.Cliente;

@Controller
@RequestMapping("/cliente")
public class ClienteController extends ControllerBase{
	
	@GetMapping("/paginaCadastrar")
	public String paginaCadastrar() {
		return "cliente/cadastrar";
	}
	
	@PostMapping("/cadastrar")
	public String cadastrarCliente(Model model, @RequestParam("cliente") String cliente) throws IOException {
		Cliente cli = (Cliente) mapper.readValue(cliente, Cliente.class);
		Resultado resultado = commands.get("SALVAR").execute(cli);
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Hospedagem cadastrada com sucesso!");
			model.addAttribute("ok", true);
		}else {
			model.addAttribute("ok", false);
		}
		model.addAttribute("mensagem", resultado.getMsg());
		return mapper.writeValueAsString(model);
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
