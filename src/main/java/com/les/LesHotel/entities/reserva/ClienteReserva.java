package com.les.LesHotel.entities.reserva;

import java.time.LocalDate;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;

import org.springframework.format.annotation.DateTimeFormat;

import com.les.LesHotel.entities.EntidadeDominio;

@Entity
public class ClienteReserva extends EntidadeDominio {
	private String nome;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate dtNascimento;
	private String email;
	private String senha;
	private String cpf;
	private String genero;
	private String telefone;
	private Boolean ativo;
	private String idAnfitriao;
	@OneToOne(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	private EnderecoReserva endereco;

	
	
	
	
	
	public EnderecoReserva getEndereco() {
		return endereco;
	}
	public void setEndereco(EnderecoReserva endereco) {
		this.endereco = endereco;
	}
	public String getIdAnfitriao() {
		return idAnfitriao;
	}
	public void setIdAnfitriao(String idAnfitriao) {
		this.idAnfitriao = idAnfitriao;
	}
	public Boolean getAtivo() {
		return ativo;
	}
	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public LocalDate getDtNascimento() {
		return dtNascimento;
	}
	public void setDtNascimento(LocalDate dtNascimento) {
		this.dtNascimento = dtNascimento;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getGenero() {
		return genero;
	}
	public void setGenero(String genero) {
		this.genero = genero;
	}
	
	
	
	
}
