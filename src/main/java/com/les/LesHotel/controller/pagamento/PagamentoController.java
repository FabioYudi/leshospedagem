package com.les.LesHotel.controller.pagamento;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.les.LesHotel.controller.ControllerBase;
import com.les.LesHotel.entities.ClienteAluguel;
import com.les.LesHotel.entities.HospedagemAluguel;
import com.les.LesHotel.entities.Reserva;
import com.les.LesHotel.helper.MapperReservaHelper;

@Controller
@RequestMapping("/pagamento")
public class PagamentoController extends ControllerBase {

	@ResponseBody
	@PostMapping("/irParaConfirmacao/{idHospedagem}/{idCliente}")
	public String irParaConfirmacao( @RequestParam("reserva") String reserva, Model model,
			@PathVariable("idHospedagem") String idHospedagem, @PathVariable("idCliente") String idCliente) throws IOException {
		ObjectMapper mapper = new ObjectMapper().registerModule(new JavaTimeModule());
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		Reserva reservaCliente = mapper.readValue(reserva, Reserva.class);
		ClienteAluguel cliente = new ClienteAluguel();
		HospedagemAluguel hospedagem = new HospedagemAluguel();
		
		cliente.setId(Long.parseLong(idCliente));
		hospedagem.setId(Long.parseLong(idHospedagem));
		cliente = (ClienteAluguel) commands.get(VISUALIZAR).execute(cliente).getEntidades().get(0);
		hospedagem = (HospedagemAluguel) commands.get(VISUALIZAR).execute(hospedagem).getEntidades().get(0);
		reservaCliente = MapperReservaHelper.mapearReserva(reservaCliente, cliente, hospedagem);
		
		return mapper.writeValueAsString(model);
	}
}
