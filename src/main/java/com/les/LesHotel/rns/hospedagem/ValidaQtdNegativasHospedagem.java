package com.les.LesHotel.rns.hospedagem;

import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.entities.HospedagemAluguel;
import com.les.LesHotel.rns.IStrategy;

public class ValidaQtdNegativasHospedagem implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		HospedagemAluguel hospedagem = (HospedagemAluguel) entidade;
		StringBuilder builder = new StringBuilder();
		
		if(hospedagem.getQtdHospedes() <= 0 ) {
			builder.append("A quantidade de hospedes deve ser maior que 0!<br>");
		}
		
		if(hospedagem.getQtdQuartos() <= 0) {
			builder.append("A quantidade de quartos deve ser maior que 0!<br>");
		}
		
		if(hospedagem.getDiaria().floatValue() <= 0) {
			builder.append("O valor da diária deve ser maior que 0!<br>");
		}
		
		return builder.toString();
	}
	
	

}
