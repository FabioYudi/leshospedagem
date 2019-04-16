package com.les.LesHotel.rns.hospedagem;

import java.time.temporal.ChronoUnit;

import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.entities.HospedagemAluguel;
import com.les.LesHotel.rns.IStrategy;

public class ValidaPeriodoDataReservaHospedagem implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		HospedagemAluguel hospedagem = (HospedagemAluguel) entidade;
        long diferencaEmDias = ChronoUnit.DAYS.between(hospedagem.getDataInicio(), hospedagem.getDataFim());

        
        if(hospedagem.getDataFim() != null && hospedagem.getDataInicio() != null) {
        	if(diferencaEmDias < 20) {
    			return "O intervalo de datas entre o período de reserva deve ser maior ou igual a 20 dias";
    		}
    		
        }
		
		return null;
	}
	
	

}
