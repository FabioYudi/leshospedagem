package com.les.LesHotel.entities.reserva;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.springframework.format.annotation.DateTimeFormat;

import com.les.LesHotel.entities.EntidadeDominio;

@Entity
public class HospedagemReserva extends EntidadeDominio {
	
	private String titulo;
	private BigDecimal diaria;
	@OneToOne(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	private EnderecoReserva endereco;
	@OneToMany(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	private List<TaxaReserva> taxas;
	private int qtdQuartos;
	private int qtdHospedes;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate dataInicio;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate dataFim;
	private String categoria;
	private String descricao;
	private Boolean ativo;
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public BigDecimal getDiaria() {
		return diaria;
	}
	public void setDiaria(BigDecimal diaria) {
		this.diaria = diaria;
	}
	
	public int getQtdQuartos() {
		return qtdQuartos;
	}
	public void setQtdQuartos(int qtdQuartos) {
		this.qtdQuartos = qtdQuartos;
	}
	public int getQtdHospedes() {
		return qtdHospedes;
	}
	public void setQtdHospedes(int qtdHospedes) {
		this.qtdHospedes = qtdHospedes;
	}
	public LocalDate getDataInicio() {
		return dataInicio;
	}
	public void setDataInicio(LocalDate dataInicio) {
		this.dataInicio = dataInicio;
	}
	public LocalDate getDataFim() {
		return dataFim;
	}
	public void setDataFim(LocalDate dataFim) {
		this.dataFim = dataFim;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Boolean getAtivo() {
		return ativo;
	}
	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}
	public EnderecoReserva getEndereco() {
		return endereco;
	}
	public void setEndereco(EnderecoReserva endereco) {
		this.endereco = endereco;
	}
	public List<TaxaReserva> getTaxas() {
		return taxas;
	}
	public void setTaxas(List<TaxaReserva> taxas) {
		this.taxas = taxas;
	}
	
	
	
	
	
}
