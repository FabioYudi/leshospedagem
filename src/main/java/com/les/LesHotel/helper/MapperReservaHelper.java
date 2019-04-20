package com.les.LesHotel.helper;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import com.les.LesHotel.entities.Cartao;
import com.les.LesHotel.entities.Cliente;
import com.les.LesHotel.entities.Hospedagem;
import com.les.LesHotel.entities.Reserva;

public class MapperReservaHelper {
	
	private MapperReservaHelper() {
		
	}

	public static Reserva mapearReserva(Reserva reserva, Cliente cliente, Hospedagem hospedagem) throws IOException {
		reserva.setCliente(cliente);
		reserva.setHospedagem(hospedagem);
		reserva.setCartoes(getCartoes(reserva, cliente));
		
		return reserva;
	}
	
	
	
	private static Set<Cartao> getCartoes(Reserva reserva, Cliente cliente){
		Set<Cartao> cartoes = new HashSet<>();
		for(Cartao cartaoUsado : reserva.getCartoes()) {
			for(Cartao cartaoCliente : cliente.getCartoes()) {
				if(cartaoUsado.getId() == cartaoCliente.getId()) {
					Cartao cartaoReserva = new Cartao();
					cartaoReserva.setBandeira(cartaoCliente.getBandeira());
					cartaoReserva.setCvv(cartaoCliente.getCvv());
					cartaoReserva.setNumero(cartaoCliente.getNumero());
					cartaoReserva.setPrincipal(cartaoCliente.getPrincipal());
					cartaoReserva.setValidade(cartaoCliente.getValidade());
					cartoes.add(cartaoReserva);
				}
			}
		}
		
		return cartoes;
	}
	
	
	
}
