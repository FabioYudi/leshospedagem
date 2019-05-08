package com.les.LesHotel.entities;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Avaliacao extends EntidadeDominio {
	
	private int nota;
	private String comentario;
	@OneToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JsonIgnore
	private Cliente avaliador;
	
	
	
	public Cliente getAvaliador() {
		return avaliador;
	}
	public void setAvaliador(Cliente avaliador) {
		this.avaliador = avaliador;
	}
	public int getNota() {
		return nota;
	}
	public void setNota(int nota) {
		this.nota = nota;
	}
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	
	
	

}
