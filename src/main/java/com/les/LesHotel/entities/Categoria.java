package com.les.LesHotel.entities;

import javax.persistence.Entity;


@Entity
public class Categoria extends EntidadeDominio {
	
	
	private String nome;

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	
}
