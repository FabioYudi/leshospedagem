package com.les.LesHotel.entities;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
public class Cliente extends EntidadeDominio implements Cloneable {
	
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
	private List<Endereco> enderecos;
	@OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	private Set<Cartao> cartoes;
	@OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JsonBackReference
	private Set<Hospedagem> hospedagens;
	@OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	private Set<Avaliacao> avaliacoesHospede;
	@OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	private Set<Avaliacao> avaliacoesAnfitriao;
	
	
	
	
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((enderecos == null) ? 0 : enderecos.hashCode());
		return result;
	}




	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cliente other = (Cliente) obj;
		if (enderecos == null) {
			if (other.enderecos != null)
				return false;
		} else if (!enderecos.equals(other.enderecos))
			return false;
		return true;
	}




	@Override
	public  Object clone() throws CloneNotSupportedException {
		return (Cliente) super.clone();
	}
	
	
	
	
	public Set<Avaliacao> getAvaliacoesHospede() {
		return avaliacoesHospede;
	}
	public void setAvaliacoesHospede(Set<Avaliacao> avaliacoesHospede) {
		this.avaliacoesHospede = avaliacoesHospede;
	}
	public Set<Avaliacao> getAvaliacoesAnfitriao() {
		return avaliacoesAnfitriao;
	}
	public void setAvaliacoesAnfitriao(Set<Avaliacao> avaliacoesAnfitriao) {
		this.avaliacoesAnfitriao = avaliacoesAnfitriao;
	}
	public Set<Hospedagem> getHospedagens() {
		return hospedagens;
	}
	public void setHospedagens(Set<Hospedagem> hospedagens) {
		this.hospedagens = hospedagens;
	}
	public Set<Cartao> getCartoes() {
		return cartoes;
	}
	public void setCartoes(Set<Cartao> cartoes) {
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
	public List<Endereco> getEnderecos() {
		return enderecos;
	}
	public void setEnderecos(List<Endereco> enderecos) {
		this.enderecos = enderecos;
	}
	
	

}
