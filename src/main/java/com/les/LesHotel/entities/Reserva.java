package com.les.LesHotel.entities;

import java.math.BigDecimal;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class Reserva {
	Cliente cliente;
	Hospedagem hospedagem;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	LocalDate checkin;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	LocalDate checkout;
	BigDecimal total;
	Integer qtdHospedes;
	
	
	
	public Integer getQtdHospedes() {
		return qtdHospedes;
	}
	public void setQtdHospedes(Integer qtdHospedes) {
		this.qtdHospedes = qtdHospedes;
	}
	
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public Hospedagem getHospedagem() {
		return hospedagem;
	}
	public void setHospedagem(Hospedagem hospedagem) {
		this.hospedagem = hospedagem;
	}
	public LocalDate getCheckin() {
		return checkin;
	}
	public void setCheckin(LocalDate checkin) {
		this.checkin = checkin;
	}
	public LocalDate getCheckout() {
		return checkout;
	}
	public void setCheckout(LocalDate checkout) {
		this.checkout = checkout;
	}
	
	

}
