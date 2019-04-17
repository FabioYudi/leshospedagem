package com.les.LesHotel.controller.pagamento;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.les.LesHotel.controller.ControllerBase;
import com.les.LesHotel.entities.Reserva;
import com.les.LesHotel.entities.superclasses.Cliente;
import com.les.LesHotel.entities.superclasses.Hospedagem;

@Controller
@RequestMapping("/pagamento")
public class PagamentoController extends ControllerBase {

	@ResponseBody
	@PostMapping("/irParaConfirmacao/{idHospedagem}/{idCliente}")
	public String irParaConfirmacao( @RequestParam("reserva") String reserva, Model model,
			@PathVariable("idHospedagem") String idHospedagem, @PathVariable("idCliente") String idCliente) throws IOException {
		ObjectMapper mapper = new ObjectMapper();
		Reserva reservaCliente = mapper.readValue(reserva, Reserva.class);
		Cliente cliente = new Cliente();
		Hospedagem hospedagem = new Hospedagem();
		
		cliente.setId(Long.parseLong(idCliente));
		hospedagem.setId(Long.parseLong(idHospedagem));
		cliente = (Cliente) commands.get(VISUALIZAR).execute(cliente).getEntidades().get(0);
		hospedagem = (Hospedagem) commands.get(VISUALIZAR).execute(hospedagem).getEntidades().get(0);
		
		return mapper.writeValueAsString(model);
	}
}
