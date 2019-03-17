package com.les.LesHotel.rns.hospedagem;

import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.entities.Hospedagem;
import com.les.LesHotel.helper.StringHelper;
import com.les.LesHotel.rns.IStrategy;

public class ValidarDadosObrigatoriosHospedagem implements IStrategy{

	@Override
	public String processar(EntidadeDominio entidade) {
		Hospedagem hospedagem = (Hospedagem) entidade;
		StringBuilder builder = new StringBuilder();
		
		if(StringHelper.isNullOrEmpty(hospedagem.getCategoria())) {
			montaBuilder("categoria", builder);
		}
		
		if(StringHelper.isNullOrEmpty(hospedagem.getDescricao())) {
			montaBuilder("descrição", builder);
		}
		
		if(StringHelper.isNullOrEmpty(hospedagem.getTitulo())) {
			montaBuilder("titulo", builder);
		}
		
		if(StringHelper.isNullOrEmpty(hospedagem.getEndereco().getLogradouro())) {
			montaBuilder("logradouro", builder);
		}
		

		if(StringHelper.isNullOrEmpty(hospedagem.getEndereco().getCep())) {
			montaBuilder("cep", builder);
		}
		
		if(StringHelper.isNullOrEmpty(hospedagem.getEndereco().getCidade())) {
			montaBuilder("cidade", builder);
		}
		
		if(StringHelper.isNullOrEmpty(hospedagem.getEndereco().getComplemento())) {
			montaBuilder("complemento", builder);
		}
		
		if(StringHelper.isNullOrEmpty(hospedagem.getEndereco().getEstado())) {
			montaBuilder("estado", builder);
		}
		
		if(StringHelper.isNullOrEmpty(hospedagem.getEndereco().getBairro())) {
			montaBuilder("bairro", builder);
		}
		
		if(StringHelper.isNullOrEmpty(hospedagem.getEndereco().getNumero())) {
			montaBuilder("numero", builder);
		}
		
		if(hospedagem.getQtdHospedes() == 0) {
			montaBuilder("quantidade de hóspedes", builder);
		}
		
		if(hospedagem.getQtdQuartos() == 0) {
			montaBuilder("quantidade de quartos", builder);
		}
		
		if(hospedagem.getDiaria() == null) {
			montaBuilder("diaria", builder);
		}
		
		if(hospedagem.getDataFim() == null) {
			montaBuilder("data fim", builder);
		}
		
		if(hospedagem.getDataInicio() == null) {
			montaBuilder("data inicio", builder);
		}
		
		return builder.toString();
		
	}
	
	
	
	private void montaBuilder(String campo, StringBuilder builder) {
		builder.append("O campo " + campo + " é obrigatório!<br>");
	}

}
