package com.les.LesHotel.rns.hospedagem;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;

import com.les.LesHotel.entities.ClienteAluguel;
import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.repository.ClienteRepository;
import com.les.LesHotel.rns.IStrategy;

public class ValidaEmailJaCadastrado implements IStrategy {
	
	@Autowired
	private ClienteRepository repository;

	@Override
	public String processar(EntidadeDominio entidade) {
		
		ClienteAluguel cliente = (ClienteAluguel) entidade;
		
		
			return null;
		
		
	}

}
