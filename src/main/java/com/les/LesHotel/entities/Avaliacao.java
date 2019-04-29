package com.les.LesHotel.entities;

import javax.persistence.Entity;

@Entity
public class Avaliacao extends EntidadeDominio {
	
	private int nota;
	private String comentario;
	
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
