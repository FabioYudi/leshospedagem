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
	@OneToOne(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	private Endereco endereco;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate checkin;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate checkout;
	private BigDecimal total;
	private Integer qtdHospedes;
	@OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	private Set<CartaoReserva> cartoes;
	private String status;
	private String mensagem;
	private String motivoCancelamento;
	private boolean avaliadoHospede;
	private boolean avaliadoAnfitriao;
	
	
	
	
	public boolean isAvaliadoHospede() {
		return avaliadoHospede;
	}
	public void setAvaliadoHospede(boolean avaliadoHospede) {
		this.avaliadoHospede = avaliadoHospede;
	}
	public boolean isAvaliadoAnfitriao() {
		return avaliadoAnfitriao;
	}
	public void setAvaliadoAnfitriao(boolean avaliadoAnfitriao) {
		this.avaliadoAnfitriao = avaliadoAnfitriao;
	}
	public String getMotivoCancelamento() {
		return motivoCancelamento;
	}
	public void setMotivoCancelamento(String motivoCancelamento) {
		this.motivoCancelamento = motivoCancelamento;
	}
	public Endereco getEndereco() {
		return endereco;
	}
	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}
	public String getMensagem() {
		return mensagem;
	}
	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}
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
	public Set<CartaoReserva> getCartoes() {
		return cartoes;
	}
	public void setCartoes(Set<CartaoReserva> cartoes) {
		this.cartoes = cartoes;
	}
	
	
	
	

}
