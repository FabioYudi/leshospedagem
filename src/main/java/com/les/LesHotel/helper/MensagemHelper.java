package com.les.LesHotel.helper;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.les.LesHotel.Facade.Resultado;

@Component
public class MensagemHelper {
	
	public Model getMensagem(Resultado resultado, Model model) {
		if(resultado.getMsg() == null || resultado.getMsg().length() <=0)  {
			resultado.setMsg("Dados do cliente alterados com sucesso!");
			model.addAttribute("ok", true);
			
			
		}else {
			
			model.addAttribute("ok", false);
			
		}
		model.addAttribute("msg", resultado.getMsg());
		return model;
	}

}
