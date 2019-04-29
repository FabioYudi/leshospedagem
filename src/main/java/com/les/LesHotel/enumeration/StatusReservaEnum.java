package com.les.LesHotel.enumeration;

public enum StatusReservaEnum {
	CANCELADO_ANFITRIAO("CANCELADO_ANFITRIAO"),
	CANCELADO_HOSPEDE("CANCELADO_HOSPEDE"),
	APROVADO("APROVADO"),
	REPROVADO("REPROVADO"),
	EM_PROCESSO("EM PROCESSO"),
	AVALIADO("AVALIADO");
	
	private String status;
	
	private StatusReservaEnum(String status) {
		this.status = status;
	}
	
	
	public String getStatus() {
		return status;
	}

}
