package com.les.LesHotel.entities;

import java.math.BigDecimal;

import javax.persistence.Entity;

@Entity
public class Cupom extends EntidadeDominio{
	private String codigo;
	private BigDecimal valor;
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public BigDecimal getValor() {
		return valor;
	}
	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}
	
	
}
