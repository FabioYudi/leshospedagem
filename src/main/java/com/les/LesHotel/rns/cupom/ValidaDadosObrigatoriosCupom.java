package com.les.LesHotel.rns.cupom;

import java.math.BigDecimal;

import com.les.LesHotel.entities.Cupom;
import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.helper.StringHelper;
import com.les.LesHotel.rns.IStrategy;

public class ValidaDadosObrigatoriosCupom implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		Cupom cupom = (Cupom) entidade;
		StringBuilder builder = new StringBuilder();
		if(StringHelper.isNullOrEmpty(cupom.getCodigo())) {
			builder.append("O campo código é obrigatório<br>");
		}
		
		if(cupom.getValidade() == null) {
			builder.append("O campo validade é obrigatório<br>");
		}
		
		if(cupom.getValor() == null || cupom.getValor().equals(BigDecimal.ZERO)) {
			builder.append("O campo valor é obrigatório<br>");
		}
		
		return builder.toString();
	}

}
