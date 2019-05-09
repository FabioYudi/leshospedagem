package com.les.LesHotel.rns.avaliacao;

import com.les.LesHotel.entities.Avaliacao;
import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.helper.StringHelper;
import com.les.LesHotel.rns.IStrategy;

public class ValidaDadosObrigatoriosAvaliacao  implements IStrategy{
	

	@Override
	public String processar(EntidadeDominio entidade) {
		Avaliacao avaliacao = (Avaliacao) entidade;
		StringBuilder builder = new StringBuilder();
		if(StringHelper.isNullOrEmpty(avaliacao.getComentario())) {
			builder.append("O campo comentário é obrigatório<br>");
		}
		
		if(avaliacao.getNota() == 0) {
			builder.append("O campo nota é obrigatório<br>");
		}
		return builder.toString();
	}
	
}
