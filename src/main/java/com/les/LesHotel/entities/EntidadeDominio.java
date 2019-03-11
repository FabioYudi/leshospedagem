package com.les.LesHotel.entities;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class EntidadeDominio {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	protected long Id;

	public long getId() {
		return Id;
	}

	public void setId(long id) {
		Id = id;
	}
}
