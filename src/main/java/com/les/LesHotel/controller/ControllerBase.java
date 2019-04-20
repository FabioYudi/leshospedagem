package com.les.LesHotel.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.les.LesHotel.command.AbstractCommand;
import com.les.LesHotel.command.AlterarCommand;
import com.les.LesHotel.command.ConsultarCommand;
import com.les.LesHotel.command.ExcluirCommand;
import com.les.LesHotel.command.SalvarCommand;
import com.les.LesHotel.command.VisualizarCommand;
import com.les.LesHotel.helper.MensagemHelper;

@Component
public class ControllerBase {
	
	@Autowired
	protected MensagemHelper mensagemHelper;
	
	@Autowired
	protected SalvarCommand salvarCmd;
	
	@Autowired
	protected ConsultarCommand consultarCmd;
	
	@Autowired
	protected AlterarCommand alterarCmd;
	
	@Autowired
	protected ExcluirCommand excluirCmd;
	
	@Autowired
	protected VisualizarCommand visualizarCmd;
	
	@Autowired
	protected HttpSession httpSession;
	
	protected Map<String, AbstractCommand> commands;
	@Autowired
	protected ObjectMapper mapper;
	
	protected final String CONSULTAR = "CONSULTAR";
	protected final String VISUALIZAR = "VISUALIZAR";
	protected final String EXCLUIR = "EXCLUIR";
	protected final String ALTERAR = "ALTERAR";
	protected final String SALVAR = "SALVAR";
	@PostConstruct
	public void init() {
		commands = new HashMap<>();
		commands.put("SALVAR", salvarCmd);
		commands.put("CONSULTAR", consultarCmd);
		commands.put("ALTERAR", alterarCmd);
		commands.put("EXCLUIR", excluirCmd);
		commands.put("VISUALIZAR", visualizarCmd);
	
	
	}
}
