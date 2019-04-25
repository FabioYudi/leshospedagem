package com.les.LesHotel.helper;

import java.util.Random;

public class PagamentoCartaoHelper {
	
	public static boolean simularPagamento() {
		Random random = new Random();
		int numero = random.nextInt(10);
		if(numero < 8) {
			return true;
		}
		return false;
	}

}
