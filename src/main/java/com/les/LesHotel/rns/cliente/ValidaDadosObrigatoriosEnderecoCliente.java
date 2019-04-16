package com.les.LesHotel.rns.cliente;

import com.les.LesHotel.entities.ClienteAluguel;
import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.helper.StringHelper;
import com.les.LesHotel.rns.IStrategy;

public class ValidaDadosObrigatoriosEnderecoCliente implements IStrategy {
	
	@Override
	public String processar(EntidadeDominio entidade) {
		ClienteAluguel cliente = (ClienteAluguel) entidade;
		StringBuilder builder = new StringBuilder();
		int index = cliente.getEnderecos().size() - 1;
		if(StringHelper.isNullOrEmpty(cliente.getEnderecos().get(index).getLogradouro())) {
			montaBuilder("logradouro", builder);
		}
		
	
		if(StringHelper.isNullOrEmpty(cliente.getEnderecos().get(index).getCep())) {
			montaBuilder("cep", builder);
		}
		
		if(StringHelper.isNullOrEmpty(cliente.getEnderecos().get(index).getCidade())) {
			montaBuilder("cidade", builder);
		}
		
		if(StringHelper.isNullOrEmpty(cliente.getEnderecos().get(index).getComplemento())) {
			montaBuilder("complemento", builder);
		}
		
		if(StringHelper.isNullOrEmpty(cliente.getEnderecos().get(index).getEstado())) {
			montaBuilder("estado", builder);
		}
		
		if(StringHelper.isNullOrEmpty(cliente.getEnderecos().get(index).getBairro())) {
			montaBuilder("bairro", builder);
		}
		
		if(StringHelper.isNullOrEmpty(cliente.getEnderecos().get(index).getNumero())) {
			montaBuilder("numero", builder);
		}
		
		return builder.toString();
	}

	private void montaBuilder(String campo, StringBuilder builder) {
		builder.append("O campo " + campo + " é obrigatório!<br>");
	}

	
		
	

}
