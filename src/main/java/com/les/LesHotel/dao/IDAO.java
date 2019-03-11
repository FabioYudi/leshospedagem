package com.les.LesHotel.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.les.LesHotel.entities.EntidadeDominio;

@Component	
public interface IDAO {
	public void salvar(EntidadeDominio entidade);
	public void alterar(EntidadeDominio entidade);
	public List<EntidadeDominio> consultar(EntidadeDominio entidade);
	public void deletar(EntidadeDominio entidade);
}
