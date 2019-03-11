package com.les.LesHotel.dao;

import org.springframework.stereotype.Component;

@Component
public abstract class AbstractDAO implements IDAO {
	protected <T> T noCast(Object entidade) {
		return (T) entidade;
	}
}
