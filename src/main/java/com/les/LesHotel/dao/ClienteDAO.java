package com.les.LesHotel.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.les.LesHotel.entities.Cliente;
import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.helper.StringHelper;
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
		repository.save(noCast(entidade));		
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		Cliente cliente = noCast(entidade);
		List<Predicate<Cliente>> allPredicates = new ArrayList<Predicate<Cliente>>();
		if(cliente.getId() > 0)
			allPredicates.add(c -> c.getId() == cliente.getId());
		if(!StringHelper.isNullOrEmpty(cliente.getCpf()))
			allPredicates.add(c -> c.getCpf().toLowerCase().contains(cliente.getCpf().toLowerCase()));
		if(!StringHelper.isNullOrEmpty(cliente.getEmail()))
			allPredicates.add(c -> c.getEmail().toLowerCase().contains(cliente.getEmail().toLowerCase()));
		if(!StringHelper.isNullOrEmpty(cliente.getGenero()))
			allPredicates.add(c -> c.getGenero().contains(cliente.getGenero()));
		if(!StringHelper.isNullOrEmpty(cliente.getNome()))
			allPredicates.add(c -> c.getNome().toLowerCase().contains(cliente.getNome().toLowerCase()));
		if(cliente.getDtNascimento() != null)
			allPredicates.add(c -> c.getDtNascimento().equals(cliente.getDtNascimento()));
		if(cliente.getEnderecos() != null && !cliente.getEnderecos().isEmpty())
			allPredicates.add(c -> c.getEnderecos().containsAll(cliente.getEnderecos()));
		
		
		Predicate<Cliente> compositePredicate = allPredicates.stream().reduce(c -> true, Predicate::and);
		return repository.findAll().stream().filter(compositePredicate).collect(Collectors.toList());
	}

	@Override
	public void deletar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		
	}

}
