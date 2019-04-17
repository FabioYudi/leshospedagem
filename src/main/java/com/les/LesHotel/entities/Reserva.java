package com.les.LesHotel.entities;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.springframework.format.annotation.DateTimeFormat;

import com.les.LesHotel.entities.reserva.CartaoReserva;
import com.les.LesHotel.entities.reserva.ClienteReserva;
import com.les.LesHotel.entities.reserva.HospedagemReserva;

@Entity
public class Reserva extends EntidadeDominio {
	@OneToOne(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	private ClienteReserva cliente;
	@OneToOne(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	private HospedagemReserva hospedagem;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate checkin;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate checkout;
	
	private BigDecimal total;
	private Integer qtdHospedes;
	@OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	private List<CartaoReserva> cartoes;
	
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
	public ClienteReserva getCliente() {
		return cliente;
	}
	public void setCliente(ClienteReserva cliente) {
		this.cliente = cliente;
	}
	public HospedagemReserva getHospedagem() {
		return hospedagem;
	}
	public void setHospedagem(HospedagemReserva hospedagem) {
		this.hospedagem = hospedagem;
	}
	public List<CartaoReserva> getCartoes() {
		return cartoes;
	}
	public void setCartoes(List<CartaoReserva> cartoes) {
		this.cartoes = cartoes;
	}
	
	

}
