package com.les.LesHotel.command;

import org.springframework.stereotype.Component;

import com.les.LesHotel.Facade.Resultado;
import com.les.LesHotel.entities.EntidadeDominio;

@Component
public class AlterarCommand extends AbstractCommand {
	@Override
	public Resultado execute(EntidadeDominio entidade) {
		return fachada.alterar(entidade);
	}
}
