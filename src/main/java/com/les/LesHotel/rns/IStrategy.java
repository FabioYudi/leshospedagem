package com.les.LesHotel.rns;

import org.springframework.stereotype.Component;

import com.les.LesHotel.entities.EntidadeDominio;

@Component
public interface IStrategy {
	public String processar(EntidadeDominio entidade);

}
