package com.les.LesHotel.entities.reserva;

import java.math.BigDecimal;

import javax.persistence.Entity;

import com.les.LesHotel.entities.superclasses.Cartao;

@Entity
public class CartaoReserva extends Cartao {
	
	private BigDecimal valorCompra;

	public BigDecimal getValorCompra() {
		return valorCompra;
	}

	public void setValorCompra(BigDecimal valorCompra) {
		this.valorCompra = valorCompra;
	}
	
	
	

}
