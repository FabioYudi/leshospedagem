package com.les.LesHotel.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.les.LesHotel.Facade.Resultado;
import com.les.LesHotel.entities.Cliente;
import com.les.LesHotel.entities.Endereco;

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
	public String carregarDados(Model model) {
		Cliente cliente = (Cliente) httpSession.getAttribute("clienteLogado");
		cliente.setEnderecos(
					cliente.getEnderecos().stream()
					.filter(e -> e.isPrincipal() == true)
					.collect(Collectors.toList())
				);
		model.addAttribute("cliente", cliente);
		return "cliente/dados";
	}
	
	@GetMapping("/login")
	public String login() throws JsonParseException, JsonMappingException, IOException {
		
		return "cliente/login";
	}
	
	@PostMapping("/logar")
	public String entrar(@RequestParam("cliente") String cliente, Model model) throws IOException {
		
		Cliente cli = (Cliente) mapper.readValue(cliente, Cliente.class);
		
		Resultado resultado = commands.get(VISUALIZAR).execute(cli);
		if(!resultado.getEntidades().isEmpty()) {
			model.addAttribute("ok", true);
			Cliente clien = (Cliente) resultado.getEntidades().get(0);
			httpSession.setAttribute("clienteLogado", clien);
		}else {
			model.addAttribute("ok", false);
			httpSession.setAttribute("clienteLogado", null);
		}
		return mapper.writeValueAsString(model);
	}
	
	@ResponseBody
	@GetMapping("/verificaLogin")
	public String verificarLogin(Model model) throws JsonProcessingException {
		try {
			model.addAttribute("clienteLogado", httpSession.getAttribute("clienteLogado"));
		} catch (Exception e) {
			model.addAttribute("clienteLogado", "");
		}
		
		return mapper.writeValueAsString(model);
	}
	
	
	@GetMapping("/visualizar/{id}")
	public String carregarDadosEdicao(@PathVariable("id") String id, Model model) {
		Cliente cliente = new Cliente();
		cliente.setId(Long.parseLong(id));
		Endereco endereco = new Endereco();
		endereco.setPrincipal(true);
		List<Endereco> enderecos= new ArrayList<>();
		enderecos.add(endereco);
		cliente.setEnderecos(enderecos);
		Resultado resultado = commands.get(VISUALIZAR).execute(cliente);
		mensagemHelper.getMensagem(resultado, model);
		model.addAttribute("cliente", resultado.getEntidades().get(0));
		return "cliente/dados";
	}
	
	
	@GetMapping("/consultar")
	public String consultarClientes(Model model) {
		Cliente cliente = new Cliente();
		Resultado resultado = commands.get(CONSULTAR).execute(cliente);
		model.addAttribute("clientes", resultado.getEntidades());
		return "cliente/consultar";
	}
	
	@GetMapping("endereco/consultar")
	public String consultarEnderecos(Model model) {
		try {
			
			model.addAttribute("cliente", httpSession.getAttribute("clienteLogado"));
		}catch (Exception e) {
			model.addAttribute("cliente", "");
		}
		
		return "cliente/endereco/consultar";
	}
	
	
	
	@ResponseBody
	@PostMapping("/editar")
	public String editaHospedagem(@RequestParam("cliente") String cliente, Model model) throws JsonParseException, JsonMappingException, IOException {
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		Cliente cli = new Cliente();
		Cliente clienteEditado = (Cliente) mapper.readValue(cliente, Cliente.class);
		cli.setId(clienteEditado.getId());
		Resultado resultado = commands.get(VISUALIZAR).execute(cli);
		cli = (Cliente) resultado.getEntidades().get(0);
		
	    clienteEditado.setEnderecos(cli.getEnderecos());
		 resultado = commands.get("ALTERAR").execute(clienteEditado);
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Dados do cliente alterados com sucesso!");
			model.addAttribute("ok", true);
			
		}else {
			model.addAttribute("ok", false);
			
		}
		model.addAttribute("mensagem", resultado.getMsg());
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(model);
	}
	
}
