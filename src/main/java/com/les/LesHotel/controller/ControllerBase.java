package com.les.LesHotel.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.les.LesHotel.command.AbstractCommand;
import com.les.LesHotel.command.AlterarCommand;
import com.les.LesHotel.command.ConsultarCommand;
import com.les.LesHotel.command.SalvarCommand;

@Component
public class ControllerBase {
	@Autowired
	protected SalvarCommand salvarCmd;
	
	@Autowired
	protected ConsultarCommand consultarCmd;
	
	@Autowired
	protected AlterarCommand alterarCmd;
	
	protected Map<String, AbstractCommand> commands;
	@Autowired
	protected ObjectMapper mapper;
	
	protected final String CONSULTAR = "CONSULTAR";
	
	@PostConstruct
	public void init() {
		commands = new HashMap<>();
		commands.put("SALVAR", salvarCmd);
		commands.put("CONSULTAR", consultarCmd);
		commands.put("ALTERAR", alterarCmd);
	
	
	}
}
