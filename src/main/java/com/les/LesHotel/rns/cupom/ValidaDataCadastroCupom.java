package com.les.LesHotel.rns.cupom;

import java.time.LocalDate;

import com.les.LesHotel.entities.Cupom;
import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.rns.IStrategy;

public class ValidaDataCadastroCupom implements IStrategy{

	@Override
	public String processar(EntidadeDominio entidade) {
		Cupom cupom = (Cupom) entidade;
		
		
		if(cupom.getValidade() == null || cupom.getValidade().isBefore(LocalDate.now())) {
			return "A validade do cupom deve ser maior ou igual a data atual";
		}
		
		return null;
	}
	
	
	

}
