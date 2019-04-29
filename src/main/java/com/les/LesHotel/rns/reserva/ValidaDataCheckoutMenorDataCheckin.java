package com.les.LesHotel.rns.reserva;

import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.entities.Reserva;
import com.les.LesHotel.rns.IStrategy;

public class ValidaDataCheckoutMenorDataCheckin implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		Reserva reserva = (Reserva) entidade;
		if(reserva.getCheckout().isBefore(reserva.getCheckin()) || reserva.getCheckout().equals(reserva.getCheckin())) {
			return "A data do checkout deve ser maior que a data de checkin";
		}
		
		return null;
	}

}
