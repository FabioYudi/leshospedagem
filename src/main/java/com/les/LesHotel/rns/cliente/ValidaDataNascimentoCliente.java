package com.les.LesHotel.rns.cliente;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import com.les.LesHotel.entities.ClienteAluguel;
import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.rns.IStrategy;

public class ValidaDataNascimentoCliente implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		ClienteAluguel cliente = (ClienteAluguel) entidade;
		if(cliente.getDtNascimento() == null) {
			return "O campo data de nascimento é obrigatório <br>";
		}
		long diferencaEmAnos = ChronoUnit.YEARS.between(cliente.getDtNascimento(), LocalDate.now());
		
		
		if(diferencaEmAnos < 18) {
			return "Você deve ter 18 anos ou mais para realizar o cadastro <br>";
		}else {
			return null;
		}
	}

}
