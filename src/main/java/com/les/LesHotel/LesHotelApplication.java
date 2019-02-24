package com.les.LesHotel;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;

@SpringBootApplication
public class LesHotelApplication {


	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(LesHotelApplication.class);
	}
	
	public static void main(String[] args) {
		SpringApplication.run(LesHotelApplication.class, args);
	}

}
