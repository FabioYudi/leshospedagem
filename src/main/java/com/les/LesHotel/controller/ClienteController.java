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
import com.les.LesHotel.entities.ClienteAluguel;
import com.les.LesHotel.entities.EnderecoAluguel;

@Controller
@RequestMapping("/cliente")
public class ClienteController extends ControllerBase{
	
	@GetMapping("/paginaCadastrar")
	public String paginaCadastrar() {
		return "cliente/cadastrar";
	}
	
	@ResponseBody
	@PostMapping("/desativarCliente/{id}/{valor}")
	public String desativarCliente(Model model, @PathVariable("id") String id, @PathVariable("valor") boolean valor) throws JsonProcessingException {
		ClienteAluguel cliente = new ClienteAluguel();
		cliente.setId(Long.parseLong(id));
		Resultado resultado = commands.get(CONSULTAR).execute(cliente);
		cliente = (ClienteAluguel) resultado.getEntidades().get(0);
		cliente.setAtivo(valor);
		resultado = commands.get(EXCLUIR).execute(cliente);
		model.addAttribute("cliente", resultado.getEntidades());
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Cliente alterado com sucesso!");
			model.addAttribute("ok", true);
		}else {
			model.addAttribute("ok", false);
		}
		model.addAttribute("mensagem", resultado.getMsg());
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(model);
	}
	
	
	@ResponseBody
	@PostMapping("/cadastrar")
	public String cadastrarCliente(Model model, @RequestParam("cliente") String cliente) throws IOException {
		ClienteAluguel cli = (ClienteAluguel) mapper.readValue(cliente, ClienteAluguel.class);
		Resultado resultado = commands.get("SALVAR").execute(cli);
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Cadastro realizado com sucesso!");
			model.addAttribute("ok", true);
			Resultado result = commands.get(VISUALIZAR).execute(cli);
			cli = (ClienteAluguel) result.getEntidades().get(0);
			httpSession.setAttribute("clienteLogado", cli);
		}else {
			model.addAttribute("ok", false);
			

		}
		model.addAttribute("mensagem", resultado.getMsg());
		return mapper.writeValueAsString(model);
	}
	
	@GetMapping("/dados")
	public String carregarDados(Model model) {
		ClienteAluguel clienteConsulta = new ClienteAluguel();
		ClienteAluguel cliente = (ClienteAluguel) httpSession.getAttribute("clienteLogado");
		clienteConsulta.setId(cliente.getId());
		Resultado resultado = commands.get(VISUALIZAR).execute(clienteConsulta);
		cliente = (ClienteAluguel) resultado.getEntidades().get(0);
		cliente.setEnderecos(
					cliente.getEnderecos().stream()
					.filter(e -> e.isPrincipal() == true)
					.collect(Collectors.toList())
				);
		model.addAttribute("cliente", cliente);
		return "cliente/dados";
	}
	
	@PostMapping("/dadosAtualizados")
	public String carregarDadosAtualizados(Model model, String mensagem, String id) {
		ClienteAluguel cliente = new ClienteAluguel();
		cliente.setId(Long.parseLong(id));
		Resultado resultado = commands.get(VISUALIZAR).execute(cliente);
		cliente = (ClienteAluguel) resultado.getEntidades().get(0);
		httpSession.setAttribute("clienteLogado", cliente);
		cliente.setEnderecos(
					cliente.getEnderecos().stream()
					.filter(e -> e.isPrincipal() == true)
					.collect(Collectors.toList())
				);
		model.addAttribute("cliente", cliente);
		model.addAttribute("mensagem", mensagem);
		return "cliente/dados";
	}
	
	@GetMapping("/login")
	public String login() throws JsonParseException, JsonMappingException, IOException {
		
		return "cliente/login";
	}
	
	@ResponseBody
	@PostMapping("/logar")
	public String entrar(@RequestParam("cliente") String cliente, Model model) throws IOException {
		
		ClienteAluguel cli = (ClienteAluguel) mapper.readValue(cliente, ClienteAluguel.class);
		
		Resultado resultado = commands.get(VISUALIZAR).execute(cli);
		if(!resultado.getEntidades().isEmpty() && resultado.getEntidades().size() == 1) {
			model.addAttribute("ok", true);
			ClienteAluguel clien = (ClienteAluguel) resultado.getEntidades().get(0);
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
		ClienteAluguel cliente = new ClienteAluguel();
		cliente.setId(Long.parseLong(id));
		EnderecoAluguel endereco = new EnderecoAluguel();
		endereco.setPrincipal(true);
		List<EnderecoAluguel> enderecos= new ArrayList<>();
		enderecos.add(endereco);
		cliente.setEnderecos(enderecos);
		Resultado resultado = commands.get(VISUALIZAR).execute(cliente);
		mensagemHelper.getMensagem(resultado, model);
		model.addAttribute("cliente", resultado.getEntidades().get(0));
		return "cliente/dados";
	}
	
	
	@GetMapping("/consultar")
	public String consultarClientes(Model model) {
		ClienteAluguel cliente = new ClienteAluguel();
		Resultado resultado = commands.get(CONSULTAR).execute(cliente);
		model.addAttribute("clientes", resultado.getEntidades());
		return "cliente/consultar";
	}
	
	@PostMapping("/filtrar")
	public String filtrarHospedagem(Model model,  ClienteAluguel cliente) {
		Resultado resultado = commands.get(CONSULTAR).execute(cliente);
		model.addAttribute("clientes", resultado.getEntidades());
		return "cliente/consultar";
	}
	
	
	@GetMapping("/logout")
	public String logout() {
		httpSession.removeAttribute("clienteLogado");
		return "index";
	}
	
	
	
	@ResponseBody
	@PostMapping("/editar")
	public String editaHospedagem(@RequestParam("cliente") String cliente, Model model) throws JsonParseException, JsonMappingException, IOException {
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		ClienteAluguel cli = new ClienteAluguel();
		ClienteAluguel clienteEditado = (ClienteAluguel) mapper.readValue(cliente, ClienteAluguel.class);
		cli.setId(clienteEditado.getId());
		Resultado resultado = commands.get(VISUALIZAR).execute(cli);
		cli = (ClienteAluguel) resultado.getEntidades().get(0);
		clienteEditado.setSenha(cli.getSenha());
	    clienteEditado.setEnderecos(cli.getEnderecos());
		 resultado = commands.get("ALTERAR").execute(clienteEditado);
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Seus dados foram alterados com sucesso!");
			model.addAttribute("ok", true);
			
		}else {
			model.addAttribute("ok", false);
			
		}
		model.addAttribute("mensagem", resultado.getMsg());
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(model);
	}
	
	
	
	
	
	//ENDEREÇOS
	
	
	
	@GetMapping("endereco/consultar")
	public String consultarEnderecos(Model model) {
		try {
			ClienteAluguel cliente = (ClienteAluguel)  httpSession.getAttribute("clienteLogado");
			ClienteAluguel clienteConsulta = new ClienteAluguel();
			clienteConsulta.setId(cliente.getId());
			Resultado resultado = commands.get(VISUALIZAR).execute(clienteConsulta);
			cliente = (ClienteAluguel) resultado.getEntidades().get(0);
			model.addAttribute("cliente", cliente);
		}catch (Exception e) {
			model.addAttribute("cliente", "");
		}
		
		return "cliente/endereco/consultar";
	}
	
	@ResponseBody
	@GetMapping("/endereco/dadosEndereco/{id}")
	public String getEndereco(@PathVariable String id, Model model) throws JsonProcessingException {
		ClienteAluguel cliente = (ClienteAluguel)  httpSession.getAttribute("clienteLogado");
		ClienteAluguel clienteConsulta = new ClienteAluguel();
		clienteConsulta.setId(cliente.getId());
		Resultado resultado = commands.get(VISUALIZAR).execute(clienteConsulta);
		cliente = (ClienteAluguel) resultado.getEntidades().get(0);
		List<EnderecoAluguel> endereco = cliente.getEnderecos().stream()
				.filter(e -> e.getId() == Long.parseLong(id))
				.collect(Collectors.toList());
		
		model.addAttribute("endereco", endereco.get(0));
		return mapper.writeValueAsString(model);
	}
	
	
	@ResponseBody
	@PostMapping("/cadastrarEndereco/{pagamento}")
	public String cadastrarEndereco(@RequestParam("cliente") String cliente, Model model, @PathVariable boolean pagamento) throws JsonParseException, JsonMappingException, IOException {
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		ClienteAluguel cli = new ClienteAluguel();
		ClienteAluguel clienteEditado = (ClienteAluguel) mapper.readValue(cliente, ClienteAluguel.class);
		cli.setId(clienteEditado.getId());
		Resultado resultado = commands.get(VISUALIZAR).execute(cli);
		cli = (ClienteAluguel) resultado.getEntidades().get(0);
		clienteEditado.setSenha(cli.getSenha());
		cli.getEnderecos().add(clienteEditado.getEnderecos().get(0));

		 resultado = commands.get("ALTERAR").execute(cli);
	
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Endereço cadastrado com sucesso!");
			model.addAttribute("ok", true);
			model.addAttribute("pagamento", pagamento);
			Resultado result = commands.get(VISUALIZAR).execute(cli);
			cli = (ClienteAluguel) result.getEntidades().get(0);
			httpSession.setAttribute("clienteLogado", cli);
			
		}else {
			model.addAttribute("ok", false);
			
		}
		model.addAttribute("mensagem", resultado.getMsg());
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(model);
	}
	
	@ResponseBody
	@PostMapping("/editarEndereco")
	public String editarEndereco(@RequestParam("cliente") String cliente, Model model) throws JsonParseException, JsonMappingException, IOException {
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		ClienteAluguel cli = new ClienteAluguel();
		ClienteAluguel clienteEditado = (ClienteAluguel) mapper.readValue(cliente, ClienteAluguel.class);
		cli.setId(clienteEditado.getId());
		Resultado resultado = commands.get(VISUALIZAR).execute(cli);
		cli = (ClienteAluguel) resultado.getEntidades().get(0);
		//filtro para retirar o endereço que foi editado da lista
		cli.setEnderecos(cli.getEnderecos().stream()
			.filter(e -> e.getId() != clienteEditado.getEnderecos().get(0).getId())
			.collect(Collectors.toList()));
		cli.getEnderecos().add(clienteEditado.getEnderecos().get(0));
		
		 resultado = commands.get("ALTERAR").execute(cli);
	
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Endereço alterado com sucesso!");
			model.addAttribute("ok", true);
			cli = new ClienteAluguel();
			cli.setId(clienteEditado.getId());
			Resultado result = commands.get(VISUALIZAR).execute(cli);
			cli = (ClienteAluguel) result.getEntidades().get(0);
			httpSession.setAttribute("clienteLogado", cli);
			
		}else {
			model.addAttribute("ok", false);
			
		}
		model.addAttribute("mensagem", resultado.getMsg());
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(model);
	}
	
	
	
	
	@PostMapping("endereco/consultarAtualizacao")
	public String consultarEnderecosAtualizados(Model model, String mensagemEdicao) {
		ClienteAluguel cliente = (ClienteAluguel)  httpSession.getAttribute("clienteLogado");
		ClienteAluguel clienteConsulta = new ClienteAluguel();
		clienteConsulta.setId(cliente.getId());
		Resultado resultado = commands.get(VISUALIZAR).execute(clienteConsulta);
		cliente = (ClienteAluguel) resultado.getEntidades().get(0);
	
		model.addAttribute("cliente", cliente);
		
		model.addAttribute("mensagem", mensagemEdicao);
		return "cliente/endereco/consultar";
	}
	
	@ResponseBody
	@PostMapping("/endereco/setarComoPrincipal/{idEndereco}/{idCliente}")
	public String setPrincipal(Model model, @PathVariable String idEndereco, @PathVariable String idCliente) throws JsonProcessingException {
		ClienteAluguel cliente = new ClienteAluguel();
		cliente.setId(Long.parseLong(idCliente));
		Resultado resultado = commands.get(VISUALIZAR).execute(cliente);
		cliente = (ClienteAluguel) resultado.getEntidades().get(0);
		for(EnderecoAluguel endereco : cliente.getEnderecos()) {
			if(endereco.getId() == Long.parseLong(idEndereco)) {
				endereco.setPrincipal(true);
			}else {
				endereco.setPrincipal(false);
			}
		}
		resultado = commands.get("ALTERAR").execute(cliente);
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Endereço alterado com sucesso!");
			model.addAttribute("ok", true);

		}else {
			model.addAttribute("ok", false);
			
		}
		return mapper.writeValueAsString(model);
	}
	
	@ResponseBody
	@PostMapping("/endereco/excluirEndereco/{idEndereco}/{idCliente}")
	public String excluirEndereco(Model model, @PathVariable String idEndereco, @PathVariable String idCliente) throws JsonProcessingException {
		ClienteAluguel cliente = new ClienteAluguel();
		cliente.setId(Long.parseLong(idCliente));
		Resultado resultado = commands.get(VISUALIZAR).execute(cliente);
		cliente = (ClienteAluguel) resultado.getEntidades().get(0);
		cliente.setEnderecos(cliente.getEnderecos().stream()
				.filter(e -> e.getId() != Long.parseLong(idEndereco))
				.collect(Collectors.toList()));
		resultado = commands.get(EXCLUIR).execute(cliente);
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Endereço excluido com sucesso!");
			model.addAttribute("ok", true);

		}else {
			model.addAttribute("ok", false);
			
		}
		model.addAttribute("mensagem", resultado.getMsg());
		return mapper.writeValueAsString(model);
	}
	
}
