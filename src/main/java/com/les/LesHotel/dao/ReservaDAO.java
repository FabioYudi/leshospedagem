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
			allPredicates.add(r -> r.getId() == reserva.getId());
		if(reserva.getHospedagem() != null)
			if(reserva.getHospedagem().getId() != null && reserva.getHospedagem().getId() > 0) {
				allPredicates.add(r -> r.getHospedagem().getId() == reserva.getHospedagem().getId());
			}
			
		if(reserva.getCliente() != null ) {
			if(reserva.getCliente().getId() != null && reserva.getCliente().getId() > 0) {
				allPredicates.add(r -> r.getCliente().getId() == reserva.getCliente().getId());
			}
		}
			
		if(reserva.getTotal() != null) 
			allPredicates.add(r -> r.getTotal() == reserva.getTotal());
		if(reserva.getQtdHospedes() != null && reserva.getQtdHospedes() > 0)
			allPredicates.add(r -> r.getQtdHospedes() == reserva.getQtdHospedes());
		
		
		
		Predicate<Reserva> compositePredicate = allPredicates.stream().reduce(c -> true, Predicate::and);
		return repository.findAll().stream().filter(compositePredicate).collect(Collectors.toList());
	}

	@Override
	public void deletar(EntidadeDominio entidade) {
		repository.save(noCast(entidade));	
		
	}

	
}