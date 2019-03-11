package com.les.LesHotel.entities;

import java.math.BigDecimal;

import javax.persistence.Entity;

@Entity
public class Taxa extends EntidadeDominio {
	
	
	private String nome;
	private BigDecimal valor;
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public BigDecimal getValor() {
		return valor;
	}
	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}
	
	

}
