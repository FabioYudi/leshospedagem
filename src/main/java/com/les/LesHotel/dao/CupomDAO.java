package com.les.LesHotel.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.les.LesHotel.entities.Cupom;
import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.helper.StringHelper;
import com.les.LesHotel.repository.CupomRepository;

@Component
public class CupomDAO extends AbstractDAO {
	
	@Autowired
	private CupomRepository repository;

	@Override
	public void salvar(EntidadeDominio entidade) {
		repository.save(noCast(entidade));
		
	}

	@Override
	public void alterar(EntidadeDominio entidade) {
		
		
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		Cupom cupom = (Cupom) entidade;
		
		List<Predicate<Cupom>> allPredicates = new ArrayList<Predicate<Cupom>>();
		if(cupom.getId() != null && cupom.getId() > 0) 
			allPredicates.add(h -> h.getId().equals(cupom.getId()));
		if(!StringHelper.isNullOrEmpty(cupom.getCodigo())) 
			allPredicates.add(h -> h.getCodigo().equals(cupom.getCodigo()));
		

		
		Predicate<Cupom> compositePredicate = allPredicates.stream().reduce(h -> true, Predicate::and);
		return repository.findAll().stream().filter(compositePredicate).collect(Collectors.toList());
	}

	@Override
	public void deletar(EntidadeDominio entidade) {
		if(entidade.getId() > 0) {
			repository.save(noCast(entidade));
		}
		
	}
	

}
