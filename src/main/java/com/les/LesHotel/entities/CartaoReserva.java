package com.les.LesHotel.entities;

import java.math.BigDecimal;

import javax.persistence.Entity;

@Entity
public class CartaoReserva extends Cartao {
	private BigDecimal valor;

	public BigDecimal getValor() {
		return valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}
	
	
}
