package com.les.LesHotel.controller;

import java.io.IOException;
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
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.les.LesHotel.Facade.Resultado;
import com.les.LesHotel.entities.CartaoAluguel;
import com.les.LesHotel.entities.ClienteAluguel;

@Controller
@RequestMapping("/cliente/cartoes")
public class CartaoController extends ControllerBase {
	
	@GetMapping("/consultar")
	public String consultarCartoes(Model model) {
		ClienteAluguel cliente = new ClienteAluguel();
		ClienteAluguel clienteLogado = (ClienteAluguel) httpSession.getAttribute("clienteLogado");
		cliente.setId(clienteLogado.getId());
		Resultado resultado = commands.get(VISUALIZAR).execute(cliente);
		cliente = (ClienteAluguel) resultado.getEntidades().get(0);
		model.addAttribute("cliente", cliente);
		return "cliente/cartoes/consultar";
	}
	
	@PostMapping("/consultarAtualizacao")
	public String consultarCartoesAtualizados(Model model, String mensagemEdicao) {
		ClienteAluguel cliente = (ClienteAluguel)  httpSession.getAttribute("clienteLogado");
		ClienteAluguel clienteConsulta = new ClienteAluguel();
		clienteConsulta.setId(cliente.getId());
		Resultado resultado = commands.get(VISUALIZAR).execute(clienteConsulta);
		cliente = (ClienteAluguel) resultado.getEntidades().get(0);
	
		model.addAttribute("cliente", cliente);
		
		model.addAttribute("mensagem", mensagemEdicao);
		return "cliente/cartoes/consultar";

	}
	
	@ResponseBody
	@PostMapping("/cadastrar/{pagamento}")
	public String cadastrarCartao(Model model, @RequestParam("cartao")String cartao, @PathVariable boolean pagamento) throws JsonParseException, JsonMappingException, IOException {
		ClienteAluguel cliente = new ClienteAluguel();
		ObjectMapper mapper = new ObjectMapper();
		ClienteAluguel clienteLogado = (ClienteAluguel)  httpSession.getAttribute("clienteLogado");
		cliente.setId(clienteLogado.getId());
		Resultado resultado = commands.get(VISUALIZAR).execute(cliente);
		cliente = (ClienteAluguel) resultado.getEntidades().get(0);
		CartaoAluguel novoCartao = mapper.readValue(cartao, CartaoAluguel.class);
		cliente.getCartoes().add(novoCartao);
		resultado = commands.get("ALTERAR").execute(cliente);
		
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Cartão cadastrado com sucesso!");
			model.addAttribute("ok", true);
			model.addAttribute("pagamento", pagamento);
		}else {
			model.addAttribute("ok", false);
			
		}
		
		return mapper.writeValueAsString(model);
	}
	
	@ResponseBody	
	@PostMapping("/escolherPrincipal/{idCartao}/{idCliente}")
	public String setPrincipal(Model model, @PathVariable String idCartao, @PathVariable String idCliente) throws JsonProcessingException {
		ClienteAluguel cliente = new ClienteAluguel();
		cliente.setId(Long.parseLong(idCliente));
		Resultado resultado = commands.get(VISUALIZAR).execute(cliente);
		cliente = (ClienteAluguel) resultado.getEntidades().get(0);
		for(CartaoAluguel cartao : cliente.getCartoes()) {
			if(cartao.getId() == Long.parseLong(idCartao)) {
				cartao.setPrincipal(true);
			}else {
				cartao.setPrincipal(false);
			}
		}
		resultado = commands.get("ALTERAR").execute(cliente);
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Cartão alterado com sucesso!");
			model.addAttribute("ok", true);

		}else {
			model.addAttribute("ok", false);
			
		}
		
		return mapper.writeValueAsString(model);
	}
	
	
	@ResponseBody
	@PostMapping("/excluir/{idCartao}/{idCliente}")
	public String excluirEndereco(Model model, @PathVariable String idCartao, @PathVariable String idCliente) throws JsonProcessingException {
		ClienteAluguel cliente = new ClienteAluguel();
		cliente.setId(Long.parseLong(idCliente));
		Resultado resultado = commands.get(VISUALIZAR).execute(cliente);
		cliente = (ClienteAluguel) resultado.getEntidades().get(0);
		cliente.setCartoes( cliente.getCartoes().stream()
				.filter(c -> c.getId() != Long.parseLong(idCartao))
				.collect(Collectors.toSet()));
		resultado = commands.get(EXCLUIR).execute(cliente);
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Cartão excluido com sucesso!");
			model.addAttribute("ok", true);

		}else {
			model.addAttribute("ok", false);
			
		}
		model.addAttribute("mensagem", resultado.getMsg());
		return mapper.writeValueAsString(model);
	}

}
