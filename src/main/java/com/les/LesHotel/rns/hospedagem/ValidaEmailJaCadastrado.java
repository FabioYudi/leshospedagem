package com.les.LesHotel.rns.hospedagem;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;

import com.les.LesHotel.entities.Cliente;
import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.repository.ClienteRepository;
import com.les.LesHotel.rns.IStrategy;

public class ValidaEmailJaCadastrado implements IStrategy {
	
	@Autowired
	private ClienteRepository repository;

	@Override
	public String processar(EntidadeDominio entidade) {
		
		Cliente cliente = (Cliente) entidade;
		
		List<Cliente> clientes = repository.findAll();
		clientes = clientes.stream()
				.filter(c -> c.getEmail().equalsIgnoreCase(cliente.getEmail()))
				.collect(Collectors.toList());
	
		if(!clientes.isEmpty()) {
			return "Este email já esta cadastrado no sistema, por favor, utilize outro <br>";
		}else {
			return null;
		}
		
	}

}
