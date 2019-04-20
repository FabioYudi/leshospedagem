package com.les.LesHotel.rns.hospedagem;

import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.entities.Hospedagem;
import com.les.LesHotel.rns.IStrategy;

public class ValidaTamanhoDescricaoHospedagem implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		Hospedagem hospedagem = (Hospedagem) entidade;
		
		if(hospedagem.getDescricao().length() > 250) {
			return "A descrição não pode conter mais que 250 caracteres<br>";
		}
		
		return null;
	}

}
