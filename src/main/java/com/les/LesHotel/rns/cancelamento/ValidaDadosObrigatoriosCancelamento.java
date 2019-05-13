package com.les.LesHotel.rns.cancelamento;

import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.entities.Reserva;
import com.les.LesHotel.enumeration.StatusReservaEnum;
import com.les.LesHotel.helper.StringHelper;
import com.les.LesHotel.rns.IStrategy;

public class ValidaDadosObrigatoriosCancelamento implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		Reserva reserva = (Reserva) entidade;
		StringBuilder builder = new StringBuilder();
		if(reserva.getStatus().equals(StatusReservaEnum.CANCELADO_ANFITRIAO.getStatus()) || reserva.getStatus().equals(StatusReservaEnum.CANCELADO_HOSPEDE.getStatus())) {
			if(StringHelper.isNullOrEmpty(reserva.getMotivoCancelamento())) {
				builder.append("O campo comentário é obrigatório<br>");
			}
		}
		
		
	
		return builder.toString();
	}
	

}
