package com.les.LesHotel.rns.cliente;

import com.les.LesHotel.entities.Cliente;
import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.helper.StringHelper;
import com.les.LesHotel.rns.IStrategy;

public class ValidaDadosObrigatoriosCliente implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		Cliente cliente = (Cliente) entidade;
		StringBuilder builder = new StringBuilder();
		
		if(StringHelper.isNullOrEmpty(cliente.getCpf())) {
			montaBuilder("cpf", builder);
		}
		
		if(StringHelper.isNullOrEmpty(cliente.getEmail())) {
			montaBuilder("email", builder);
		}
		
		if(cliente.getDtNascimento() == null) {
			montaBuilder("data de nascimento", builder);
		}
		
		if(StringHelper.isNullOrEmpty(cliente.getGenero())) {
			montaBuilder("gênero", builder);
		}
		
		if(StringHelper.isNullOrEmpty(cliente.getNome())) {
			montaBuilder("nome", builder);
		}
		
		if(StringHelper.isNullOrEmpty(cliente.getSenha())) {
			montaBuilder("senha", builder);
		}
		
		if(StringHelper.isNullOrEmpty(cliente.getTelefone())) {
			montaBuilder("telefone", builder);
		}
		
		
		if(StringHelper.isNullOrEmpty(cliente.getEnderecos().get(0).getLogradouro())) {
			montaBuilder("logradouro", builder);
		}
		

		if(StringHelper.isNullOrEmpty(cliente.getEnderecos().get(0).getCep())) {
			montaBuilder("cep", builder);
		}
		
		if(StringHelper.isNullOrEmpty(cliente.getEnderecos().get(0).getCidade())) {
			montaBuilder("cidade", builder);
		}
		
		if(StringHelper.isNullOrEmpty(cliente.getEnderecos().get(0).getComplemento())) {
			montaBuilder("complemento", builder);
		}
		
		if(StringHelper.isNullOrEmpty(cliente.getEnderecos().get(0).getEstado())) {
			montaBuilder("estado", builder);
		}
		
		if(StringHelper.isNullOrEmpty(cliente.getEnderecos().get(0).getBairro())) {
			montaBuilder("bairro", builder);
		}
		
		if(StringHelper.isNullOrEmpty(cliente.getEnderecos().get(0).getNumero())) {
			montaBuilder("numero", builder);
		}
		
		return builder.toString();
	}
	
	private void montaBuilder(String campo, StringBuilder builder) {
		builder.append("O campo " + campo + " é obrigatório!<br>");
	}

}
