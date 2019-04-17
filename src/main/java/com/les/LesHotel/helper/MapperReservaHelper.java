package com.les.LesHotel.helper;

import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;
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
		ClienteReserva clienteReserva = new ClienteReserva();
		clienteReserva.setAtivo(cliente.getAtivo());
		clienteReserva.setCartoes(cliente.getCartoes());
		clienteReserva.setCpf(cliente.getCpf());
		clienteReserva.setDtNascimento(cliente.getDtNascimento());
		clienteReserva.setEmail(cliente.getEmail());
		clienteReserva.setEnderecos(cliente.getEnderecos());
		clienteReserva.setGenero(cliente.getGenero());
		clienteReserva.setId(cliente.getId());
		clienteReserva.setIdAnfitriao(cliente.getIdAnfitriao());
		clienteReserva.setNome(cliente.getNome());
		clienteReserva.setSenha(cliente.getSenha());
		clienteReserva.setTelefone(cliente.getTelefone());
		
		ObjectMapper mapper = new ObjectMapper();
		String clienteTeste =mapper.writeValueAsString(cliente);
		ClienteReserva teste = mapper.readValue(clienteTeste, ClienteReserva.class);
		return clienteReserva;
	}
	
	private static HospedagemReserva getHospedagem(Hospedagem hospedagem, Reserva reserva) throws IOException {
		ObjectMapper mapper = new ObjectMapper();
		String hospedagemString = mapper.writeValueAsString(hospedagem);
		HospedagemReserva hospedagemReserva = mapper.readValue(hospedagemString, HospedagemReserva.class);
		return hospedagemReserva;
	}
}
