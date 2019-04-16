package com.les.LesHotel.rns.cliente;

import com.les.LesHotel.entities.ClienteAluguel;
import com.les.LesHotel.entities.EnderecoAluguel;
import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.rns.IStrategy;

public class ValidaEnderecoPrincipal implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		ClienteAluguel cliente = (ClienteAluguel) entidade;
		boolean principalExcluido = false;
		
		if(cliente.getEnderecos().isEmpty()) {
			return "Você não pode excluir seu endereço principal";
		}
		
		for(EnderecoAluguel endereco : cliente.getEnderecos()) {
			if(endereco.isPrincipal()) {
				principalExcluido = false;
				break;
			}else {
				principalExcluido = true;
			}
		}
		if(principalExcluido) {
			return "Você não pode excluir seu endereço principal";
		}
		
		return null;
	}

}
