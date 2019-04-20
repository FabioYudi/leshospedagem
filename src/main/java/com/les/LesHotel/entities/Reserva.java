package com.les.LesHotel.entities;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
public class Reserva extends EntidadeDominio {
	
	@OneToOne(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	private Cliente cliente;
	@OneToOne(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	private Hospedagem hospedagem;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate checkin;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate checkout;
	
	private BigDecimal total;
	private Integer qtdHospedes;
	@OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	private Set<Cartao> cartoes;
	
	private String status;
	
	
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
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
	public Set<Cartao> getCartoes() {
		return cartoes;
	}
	public void setCartoes(Set<Cartao> cartoes) {
		this.cartoes = cartoes;
	}
	
	
	
	

}
