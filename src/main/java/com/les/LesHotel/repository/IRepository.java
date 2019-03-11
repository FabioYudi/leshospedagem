package com.les.LesHotel.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Component;

import com.les.LesHotel.entities.EntidadeDominio;


@Component
@Configurable
public interface IRepository {
	public void salvar(EntidadeDominio entidade);
	
	public List<EntidadeDominio> consultar(EntidadeDominio entidade);
	
	public Optional<EntidadeDominio> visualizar(EntidadeDominio entidade);
	
	public void alterar(EntidadeDominio entidade);
	
	public void deletar(EntidadeDominio entidade);
	
}
