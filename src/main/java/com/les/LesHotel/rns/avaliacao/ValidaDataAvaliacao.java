package com.les.LesHotel.rns.avaliacao;

import java.time.LocalDate;

import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.entities.Reserva;
import com.les.LesHotel.enumeration.StatusReservaEnum;
import com.les.LesHotel.rns.IStrategy;

public class ValidaDataAvaliacao implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		Reserva reserva = (Reserva)entidade;
		
		if(reserva.getStatus().equals(StatusReservaEnum.AVALIADO_ANFITRIAO.getStatus()) || reserva.getStatus().equals(StatusReservaEnum.AVALIADO_HOSPEDE.getStatus()) || reserva.getStatus().equals(StatusReservaEnum.AVALIADO.getStatus()) ) {
			
			if(reserva.getCheckout().isAfter(LocalDate.now()) || reserva.getCheckout().equals(LocalDate.now())) {
				//return "A avaliação só pode ser realizada 1 dia após a data de checkout<br>";
				return null;
			}
		}
		
		
		return null;
	}
	
	

}
