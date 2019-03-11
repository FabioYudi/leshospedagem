package com.les.LesHotel.command;

import org.springframework.beans.factory.annotation.Autowired;

import com.les.LesHotel.Facade.Facade;

public abstract class AbstractCommand implements ICommand {
	
	@Autowired
	protected Facade fachada;
}
