package com.les.LesHotel.controller;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.les.LesHotel.Facade.Resultado;
import com.les.LesHotel.entities.Hospedagem;

@Controller
@RequestMapping("/")
public class HomeController extends ControllerBase{
	
	@GetMapping("/")
	public String index() {
		LocalDate startDate = LocalDate.now();
		LocalDate endDate = LocalDate.of(2019, 04, 30);
		List<LocalDate> dates = new ArrayList<> ();
		dates = Stream.iterate(startDate, d -> d.plusDays(1))
		.limit(ChronoUnit.DAYS.between(startDate, endDate) + 1).collect(Collectors.toList());
		return "index";
	}
	
	@GetMapping("/pesquisa")
	public String pesquisar(Model model, Hospedagem hospedagem) {
		Resultado resultado = commands.get(CONSULTAR).execute(hospedagem);
		model.addAttribute("hospedagens", resultado.getEntidades());
		return "pesquisa";
	}

}
