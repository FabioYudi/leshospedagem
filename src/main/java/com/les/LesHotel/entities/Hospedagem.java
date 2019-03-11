package com.les.LesHotel.entities;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Hospedagem extends EntidadeDominio {
	
	
	private String titulo;
	private BigDecimal diaria;
	@OneToOne(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	private Endereco endereco;
	@OneToMany(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	private List<Taxa> taxas;
	private int qtdQuartos;
	private int qtdHospedes;
	@DateTimeFormat(pattern="dd-MM-yyyy")
	private Date dataInicio;
	@DateTimeFormat(pattern="dd-MM-yyyy")
	private Date dataFim;
	private String categoria;
	private String descricao;
	
	
	
	
	
	
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
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
	
	public Date getDataInicio() {
		return dataInicio;
	}
	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}
	public Date getDataFim() {
		return dataFim;
	}
	public void setDataFim(Date dataFim) {
		this.dataFim = dataFim;
	}
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
	public Endereco getEndereco() {
		return endereco;
	}
	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}
	public List<Taxa> getTaxas() {
		return taxas;
	}
	public void setTaxas(List<Taxa> taxas) {
		this.taxas = taxas;
	}
	
	

}
