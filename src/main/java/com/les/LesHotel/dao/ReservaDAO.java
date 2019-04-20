package com.les.LesHotel.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.entities.Reserva;
import com.les.LesHotel.repository.ReservaRepository;

@Component
public class ReservaDAO extends AbstractDAO {
	@Autowired
	private ReservaRepository repository;

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
		Reserva reserva = (Reserva) entidade;
		List<Predicate<Reserva>> allPredicates = new ArrayList<Predicate<Reserva>>();
		if(reserva.getId() != null && reserva.getId() > 0)
			allPredicates.add(c -> c.getId() == reserva.getId());
		if(reserva.getHospedagem() != null)
			allPredicates.add(r -> r.getHospedagem() == reserva.getHospedagem());
		if(reserva.getCliente() != null) 
			allPredicates.add(r -> r.getCliente() == reserva.getCliente());
		
		
		
		Predicate<Reserva> compositePredicate = allPredicates.stream().reduce(c -> true, Predicate::and);
		return repository.findAll().stream().filter(compositePredicate).collect(Collectors.toList());
	}

	@Override
	public void deletar(EntidadeDominio entidade) {
		repository.save(noCast(entidade));	
		
	}

	
}
