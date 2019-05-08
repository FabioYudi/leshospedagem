package com.les.LesHotel.helper;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import com.les.LesHotel.entities.Cartao;
import com.les.LesHotel.entities.CartaoReserva;
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
	
	
	
	private static Set<CartaoReserva> getCartoes(Reserva reserva, Cliente cliente){
		Set<CartaoReserva> cartoes = new HashSet<>();
		for(CartaoReserva cartaoUsado : reserva.getCartoes()) {
			for(Cartao cartaoCliente : cliente.getCartoes()) {
				if(cartaoUsado.getId() == cartaoCliente.getId()) {
					CartaoReserva cartaoReserva = new CartaoReserva();
					cartaoReserva.setBandeira(cartaoCliente.getBandeira());
					cartaoReserva.setCvv(cartaoCliente.getCvv());
					cartaoReserva.setNumero(cartaoCliente.getNumero());
					cartaoReserva.setPrincipal(cartaoCliente.getPrincipal());
					cartaoReserva.setValidade(cartaoCliente.getValidade());
					if(reserva.getCartoes().size() == 1) {
						cartaoReserva.setValor(reserva.getTotal());
					}else {
						cartaoReserva.setValor(cartaoUsado.getValor());
					}
					cartoes.add(cartaoReserva);
				}
			}
		}
		
		return cartoes;
	}
	
	
	
}
