package com.les.LesHotel.command;

import org.springframework.stereotype.Component;

import com.les.LesHotel.Facade.Resultado;
import com.les.LesHotel.entities.EntidadeDominio;

@Component
public class SalvarCommand extends AbstractCommand {

	@Override
	public Resultado execute(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		return fachada.salvar(entidade);
	}
	
}
