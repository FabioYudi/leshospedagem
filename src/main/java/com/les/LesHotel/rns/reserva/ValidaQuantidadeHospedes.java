package com.les.LesHotel.rns.reserva;

import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.entities.Reserva;
import com.les.LesHotel.rns.IStrategy;

public class ValidaQuantidadeHospedes implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		Reserva reserva = (Reserva) entidade;
		if(reserva.getQtdHospedes() > reserva.getHospedagem().getQtdHospedes()) {
			return "A quantidade de hóspedes da reserva não deve ser maior que o limite da hospedagem: " 
		+ reserva.getHospedagem().getQtdHospedes() + "<br>";
		}
		
		return null;
	}

}
