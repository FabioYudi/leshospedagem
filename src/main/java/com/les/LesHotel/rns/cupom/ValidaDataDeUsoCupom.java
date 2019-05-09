package com.les.LesHotel.rns.cupom;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.les.LesHotel.entities.Cupom;
import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.rns.IStrategy;

public class ValidaDataDeUsoCupom implements IStrategy {
	


	@Override
	public String processar(EntidadeDominio entidade) {
		Cupom cupom = (Cupom) entidade;
		if(cupom.getValidade().isAfter(LocalDate.now())) {
			return "Cupom expirado em:" + cupom.getValidade().format(DateTimeFormatter.ofPattern("DD/MM/YYYY"));
		}
		return null;
	} 
	

}
