package com.les.LesHotel.entities;

import java.math.BigDecimal;
import java.time.LocalDate;

import javax.persistence.Entity;

@Entity
public class Cupom extends EntidadeDominio{
	private String codigo;
	private BigDecimal valor;
	private LocalDate validade;
	private Boolean ativo;
	
	
	
	
	
	public LocalDate getValidade() {
		return validade;
	}
	public void setValidade(LocalDate validade) {
		this.validade = validade;
	}
	public Boolean getAtivo() {
		return ativo;
	}
	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}
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
