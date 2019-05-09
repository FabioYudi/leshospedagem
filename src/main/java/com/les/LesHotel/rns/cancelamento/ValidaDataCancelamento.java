package com.les.LesHotel.rns.cancelamento;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.entities.Reserva;
import com.les.LesHotel.rns.IStrategy;

public class ValidaDataCancelamento implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		Reserva reserva = (Reserva) entidade;
		 long diferencaEmDias = ChronoUnit.DAYS.between(LocalDate.now(), reserva.getCheckin());
		if(diferencaEmDias < 5) {
			return "O cancelamento da reserva só pode ser realizada até 5 dias antes da data do checkin";
		}
		
		return null;
	}
	

}
