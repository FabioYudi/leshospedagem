package com.les.LesHotel.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.entities.Hospedagem;
import com.les.LesHotel.helper.StringHelper;
import com.les.LesHotel.repository.HospedagemRepository;

@Component
public class HospedagemDAO extends AbstractDAO  {
	
	@Autowired
	private HospedagemRepository repository;

	@Override
	public void salvar(EntidadeDominio entidade) {
		repository.save(noCast(entidade));
		
	}

	@Override
	public void alterar(EntidadeDominio entidade) {
		if(entidade.getId() > 0) {
			repository.save(noCast(entidade));
		}
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		Hospedagem hospedagem = (Hospedagem) entidade;
		
		List<Predicate<Hospedagem>> allPredicates = new ArrayList<Predicate<Hospedagem>>();
		if(hospedagem.getId() > 0) 
			allPredicates.add(h -> h.getId() == hospedagem.getId());
		if(!StringHelper.isNullOrEmpty(hospedagem.getTitulo()))
			allPredicates.add(h -> h.getTitulo().toLowerCase().contains(hospedagem.getTitulo().toLowerCase()));
		if(hospedagem.getDiaria() != null)
			allPredicates.add(h -> h.getDiaria() == hospedagem.getDiaria());
		if(hospedagem.getQtdHospedes() > 0)
			allPredicates.add(h-> h.getQtdHospedes() == hospedagem.getQtdHospedes());
		if(hospedagem.getQtdQuartos() > 0)
			allPredicates.add(h-> h.getQtdQuartos() == hospedagem.getQtdQuartos());
		if(hospedagem.getEndereco() != null) {
			if(!StringHelper.isNullOrEmpty(hospedagem.getEndereco().getEstado()))
				allPredicates.add(h -> h.getEndereco().getEstado()
						.toLowerCase().contains(hospedagem.getEndereco().getEstado().toLowerCase()));
			if(!StringHelper.isNullOrEmpty(hospedagem.getEndereco().getCidade()))
				allPredicates.add(h -> h.getEndereco().getCidade()
						.toLowerCase().contains(hospedagem.getEndereco().getCidade().toLowerCase()));
			if(!StringHelper.isNullOrEmpty(hospedagem.getEndereco().getLogradouro()))
				allPredicates.add(h -> h.getEndereco().getLogradouro()
						.toLowerCase().contains(hospedagem.getEndereco().getLogradouro().toLowerCase()));
		}
		if(hospedagem.getAtivo() != null)
			allPredicates.add(h-> h.getAtivo() == hospedagem.getAtivo());

		
		if(hospedagem.getTaxas() != null)
			allPredicates.add(h -> h.getTaxas().containsAll(hospedagem.getTaxas()));

		
		Predicate<Hospedagem> compositePredicate = allPredicates.stream().reduce(h -> true, Predicate::and);
		return repository.findAll().stream().filter(compositePredicate).collect(Collectors.toList());
		
	}

	@Override
	public void deletar(EntidadeDominio entidade) {
		
		if(entidade.getId() > 0) {
			repository.save(noCast(entidade));
		}
	}	
}
