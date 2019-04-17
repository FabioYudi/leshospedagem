package com.les.LesHotel.helper;

import java.io.IOException;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.les.LesHotel.entities.Reserva;
import com.les.LesHotel.entities.reserva.ClienteReserva;
import com.les.LesHotel.entities.reserva.HospedagemReserva;
import com.les.LesHotel.entities.superclasses.Cliente;
import com.les.LesHotel.entities.superclasses.Hospedagem;

public class MapperReservaHelper {
	
	private MapperReservaHelper() {
		
	}

	public static Reserva mapearReserva(Reserva reserva, Cliente cliente, Hospedagem hospedagem) throws IOException {
		reserva.setCliente(getCliente(cliente, reserva));
		reserva.setHospedagem(getHospedagem(hospedagem, reserva));
		
		return reserva;
	}
	
	private static ClienteReserva getCliente(Cliente cliente, Reserva reserva) throws IOException {
		ObjectMapper mapper = new ObjectMapper().registerModule(new JavaTimeModule());
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		String clienteString = mapper.writeValueAsString(cliente);
		ClienteReserva clienteReserva = mapper.readValue(clienteString, ClienteReserva.class);
		return clienteReserva;
	}
	
	private static HospedagemReserva getHospedagem(Hospedagem hospedagem, Reserva reserva) throws IOException {
		ObjectMapper mapper = new ObjectMapper().registerModule(new JavaTimeModule());
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		String hospedagemString = mapper.writeValueAsString(hospedagem);
		HospedagemReserva hospedagemReserva = mapper.readValue(hospedagemString, HospedagemReserva.class);
		return hospedagemReserva;
	}
}
