package com.les.LesHotel.rns.reserva;

import java.time.temporal.ChronoUnit;

import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.entities.Reserva;
import com.les.LesHotel.rns.IStrategy;

public class ValidaPeriodoReserva implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		Reserva reserva = (Reserva) entidade;
		 long diferencaEmDias = ChronoUnit.DAYS.between(reserva.getCheckin(), reserva.getCheckout());
		 if(diferencaEmDias > 15) {
			 return "O período máximo de reserva de uma hospedagem é de 15 dias";
		 }
		 
		 return null;

		
	}
	

}
