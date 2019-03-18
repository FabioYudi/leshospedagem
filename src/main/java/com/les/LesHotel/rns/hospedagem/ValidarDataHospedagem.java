package com.les.LesHotel.rns.hospedagem;

import java.time.LocalDate;

import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.entities.Hospedagem;
import com.les.LesHotel.rns.IStrategy;

public class ValidarDataHospedagem implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		Hospedagem hospedagem = (Hospedagem) entidade;
		StringBuilder builder = new StringBuilder();
		if( hospedagem.getDataFim() == null || hospedagem.getDataFim().isBefore(LocalDate.now()) ) {
			builder.append("A data do final das reservas deve ser maior que a data atual!<br>");
		}
		
		if( hospedagem.getDataInicio() == null || hospedagem.getDataInicio().isBefore(LocalDate.now()) ) {
			builder.append("A data de inicio das reservas deve ser maior que a data atual!<br>");
		}
		
		if(hospedagem.getDataFim() == null || hospedagem.getDataFim().isBefore(hospedagem.getDataInicio())) {
			builder.append("A data de fim das reservas deve ser maior que data de inicio!<br>");
		}
		
		return builder.toString();
	}

}
