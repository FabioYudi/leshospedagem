package com.les.LesHotel.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.repository.ClienteRepository;

@Component
public class ClienteDAO extends AbstractDAO {
	
	@Autowired
	private ClienteRepository repository;

	@Override
	public void salvar(EntidadeDominio entidade) {
		repository.save(noCast(entidade));
		
	}

	@Override
	public void alterar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deletar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		
	}

}
