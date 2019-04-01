package com.les.LesHotel.rns.cliente;

import com.les.LesHotel.entities.Cliente;
import com.les.LesHotel.entities.Endereco;
import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.rns.IStrategy;

public class ValidaEnderecoPrincipal implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		Cliente cliente = (Cliente) entidade;
		boolean principalExcluido = false;
		
		if(cliente.getEnderecos().isEmpty()) {
			return "Você não pode excluir seu endereço principal";
		}
		
		for(Endereco endereco : cliente.getEnderecos()) {
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
