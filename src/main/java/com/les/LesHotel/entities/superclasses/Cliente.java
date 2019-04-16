package com.les.LesHotel.entities.superclasses;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;

import org.springframework.format.annotation.DateTimeFormat;

import com.les.LesHotel.entities.CartaoAluguel;
import com.les.LesHotel.entities.EnderecoAluguel;
import com.les.LesHotel.entities.EntidadeDominio;

@MappedSuperclass
public class Cliente extends EntidadeDominio {

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
	@OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	private List<EnderecoAluguel> enderecos;
	@OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	private Set<CartaoAluguel> cartoes;
	
	
	
	
	
	
	
	
	
	
	public Set<CartaoAluguel> getCartoes() {
		return cartoes;
	}
	public void setCartoes(Set<CartaoAluguel> cartoes) {
		this.cartoes = cartoes;
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
	public List<EnderecoAluguel> getEnderecos() {
		return enderecos;
	}
	public void setEnderecos(List<EnderecoAluguel> enderecos) {
		this.enderecos = enderecos;
	}
	
}