package com.les.LesHotel.entities.reserva;

import javax.persistence.Entity;

import com.les.LesHotel.entities.EntidadeDominio;

@Entity
public class CartaoReserva extends EntidadeDominio {
	
	private String bandeira;
	private String numero;
	private String validade;
	private String cvv;
	private Boolean principal;
	
	
	
	public Boolean getPrincipal() {
		return principal;
	}
	public void setPrincipal(Boolean principal) {
		this.principal = principal;
	}
	public String getBandeira() {
		return bandeira;
	}
	public void setBandeira(String bandeira) {
		this.bandeira = bandeira;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getValidade() {
		return validade;
	}
	public void setValidade(String validade) {
		this.validade = validade;
	}
	public String getCvv() {
		return cvv;
	}
	public void setCvv(String cvv) {
		this.cvv = cvv;
	}
	
	

}
