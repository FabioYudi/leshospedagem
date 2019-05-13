package com.les.LesHotel.Facade;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.les.LesHotel.dao.AvaliacaoDAO;
import com.les.LesHotel.dao.ClienteDAO;
import com.les.LesHotel.dao.CupomDAO;
import com.les.LesHotel.dao.HospedagemDAO;
import com.les.LesHotel.dao.IDAO;
import com.les.LesHotel.dao.ReservaDAO;
import com.les.LesHotel.entities.Avaliacao;
import com.les.LesHotel.entities.Cliente;
import com.les.LesHotel.entities.Cupom;
import com.les.LesHotel.entities.EntidadeDominio;
import com.les.LesHotel.entities.Hospedagem;
import com.les.LesHotel.entities.Reserva;
import com.les.LesHotel.helper.StringHelper;
import com.les.LesHotel.rns.IStrategy;
import com.les.LesHotel.rns.avaliacao.ValidaDadosObrigatoriosAvaliacao;
import com.les.LesHotel.rns.avaliacao.ValidaDataAvaliacao;
import com.les.LesHotel.rns.cancelamento.ValidaDadosObrigatoriosCancelamento;
import com.les.LesHotel.rns.cancelamento.ValidaDataCancelamento;
import com.les.LesHotel.rns.cliente.ValidaDadosObrigatoriosCliente;
import com.les.LesHotel.rns.cliente.ValidaDadosObrigatoriosEnderecoCliente;
import com.les.LesHotel.rns.cliente.ValidaDataNascimentoCliente;
import com.les.LesHotel.rns.cliente.ValidaEnderecoPrincipal;
import com.les.LesHotel.rns.cupom.ValidaDadosObrigatoriosCupom;
import com.les.LesHotel.rns.cupom.ValidaDataCadastroCupom;
import com.les.LesHotel.rns.cupom.ValidaDataDeUsoCupom;
import com.les.LesHotel.rns.hospedagem.ValidaEmailJaCadastrado;
import com.les.LesHotel.rns.hospedagem.ValidaPeriodoDataReservaHospedagem;
import com.les.LesHotel.rns.hospedagem.ValidaQtdNegativasHospedagem;
import com.les.LesHotel.rns.hospedagem.ValidaTamanhoDescricaoHospedagem;
import com.les.LesHotel.rns.hospedagem.ValidarDadosObrigatoriosHospedagem;
import com.les.LesHotel.rns.hospedagem.ValidarDataHospedagem;
import com.les.LesHotel.rns.reserva.ValidaDataCheckoutMenorDataCheckin;
import com.les.LesHotel.rns.reserva.ValidaPeriodoReserva;
import com.les.LesHotel.rns.reserva.ValidaQuantidadeHospedes;

@Component
public class Facade implements IFacade {
	private Resultado resultado;
	private Map<String, Map<String, List<IStrategy>>> rns;
	private Map<String, IDAO> repositories;

	@Autowired 
	private HospedagemDAO hospedagemDao;
	
	@Autowired
	private ClienteDAO clienteDAO;
	
	@Autowired 
	private ReservaDAO reservaDAO;
	
	@Autowired
	private CupomDAO cupomDAO;
	
	@Autowired
	private AvaliacaoDAO avaliacaoDAO;
	
	@PostConstruct
	public void init() {
		repositories = new HashMap<>();
		rns = new HashMap<>();
		
		//regras para hospedagem
		List<IStrategy> rnsSalvarHospedagem = new ArrayList<>();
		Map<String, List<IStrategy>> rnsHospedagem = new HashMap<>();
		rnsSalvarHospedagem.add(new ValidarDadosObrigatoriosHospedagem());
		rnsSalvarHospedagem.add(new ValidarDataHospedagem());
		rnsSalvarHospedagem.add(new ValidaTamanhoDescricaoHospedagem());
		rnsSalvarHospedagem.add(new ValidaQtdNegativasHospedagem());
		rnsSalvarHospedagem.add(new ValidaPeriodoDataReservaHospedagem());
		
		rnsHospedagem.put("SALVAR", rnsSalvarHospedagem);
		rnsHospedagem.put("ALTERAR", rnsSalvarHospedagem);
		
		
	//regras para cliente
		List<IStrategy> rnsSalvarCliente = new ArrayList<>();
		List<IStrategy> rnsAlterarCliente = new ArrayList<>();
		List<IStrategy> rnsExcluirEnderecoCliente = new ArrayList<>();
		Map<String, List<IStrategy>> rnsCliente = new HashMap<>();
		rnsSalvarCliente.add(new ValidaDadosObrigatoriosCliente());
		rnsSalvarCliente.add(new ValidaDataNascimentoCliente());
		rnsSalvarCliente.add(new ValidaEmailJaCadastrado());
		
		rnsExcluirEnderecoCliente.add(new ValidaEnderecoPrincipal());
		
		rnsAlterarCliente.add(new ValidaDadosObrigatoriosEnderecoCliente());
		rnsAlterarCliente.add(new ValidaDadosObrigatoriosCliente());
		rnsAlterarCliente.add(new ValidaDataNascimentoCliente());
		
		rnsCliente.put("SALVAR", rnsSalvarCliente);
		rnsCliente.put("ALTERAR", rnsSalvarCliente);
		rnsCliente.put("ALTERAR", rnsAlterarCliente);
		
		rnsCliente.put("EXCLUIR", rnsExcluirEnderecoCliente);
		
		
		//Regras para reserva
		List<IStrategy> rnsSalvarReserva = new ArrayList<>();
		List<IStrategy> rnsCancelarReserva = new ArrayList<>();
		Map<String, List<IStrategy>> rnsReserva = new HashMap<>();
		
		rnsSalvarReserva.add(new ValidaDataCheckoutMenorDataCheckin());
		rnsSalvarReserva.add(new ValidaQuantidadeHospedes());
		rnsSalvarReserva.add(new ValidaPeriodoReserva());
		
		rnsCancelarReserva.add(new ValidaDataCancelamento());
		rnsCancelarReserva.add(new ValidaDataAvaliacao());
		rnsCancelarReserva.add(new ValidaDadosObrigatoriosCancelamento());
		
		
		rnsReserva.put("EXCLUIR", rnsCancelarReserva);
		rnsReserva.put("SALVAR", rnsSalvarReserva);
		
		
		//Regras para cupom
		List<IStrategy> rnsSalvarCupom = new ArrayList<>();
		List<IStrategy> rnsConsultarCupom = new ArrayList<>();
		Map<String, List<IStrategy>> rnsCupom = new HashMap<>();
		
		rnsConsultarCupom.add( new ValidaDataDeUsoCupom());
		rnsSalvarCupom.add(new ValidaDadosObrigatoriosCupom());
		rnsSalvarCupom.add(new ValidaDataCadastroCupom());
		
		rnsCupom.put("SALVAR", rnsSalvarCupom);
		rnsCupom.put("VISUALIZAR", rnsConsultarCupom);
		
		//Regras de avaliação
		List<IStrategy> rnsAvaliarReserva = new ArrayList<>();
		Map<String, List<IStrategy>> rnsAvaliacao = new HashMap<>();
		
		rnsAvaliarReserva.add(new ValidaDadosObrigatoriosAvaliacao());
		

		
		rnsAvaliacao.put("SALVAR", rnsAvaliarReserva);
		
	
		//lista de repositorios
		repositories.put(Hospedagem.class.getName(), hospedagemDao);
		repositories.put(Cliente.class.getName(), clienteDAO);
		repositories.put(Reserva.class.getName(), reservaDAO);
		repositories.put(Cupom.class.getName(), cupomDAO);
		repositories.put(Avaliacao.class.getName(), avaliacaoDAO);
		
		rns.put(Hospedagem.class.getName(), rnsHospedagem);
		rns.put(Cliente.class.getName(), rnsCliente);
		rns.put(Reserva.class.getName(), rnsReserva);
		rns.put(Cupom.class.getName(), rnsCupom);
		rns.put(Avaliacao.class.getName(), rnsAvaliacao);

	}

	@Override
	public Resultado salvar(EntidadeDominio entidade) {
		resultado = new Resultado();
		String nmClass = entidade.getClass().getName();
		String msg = executaRegras(entidade, "SALVAR");
		if (msg == null) {
			try {
				repositories.get(nmClass).salvar(entidade);
			}catch(Exception ex) {
				ex.printStackTrace();
				resultado.setMsg("Não foi possivel salvar os dados");
			}
		} else {
			resultado.setMsg(msg);
			List<EntidadeDominio> entidades = new ArrayList<>();
			entidades.add(entidade);
			resultado.setEntidades(entidades);
		}
		return resultado;
	}

	@Override
	public Resultado alterar(EntidadeDominio entidade) {
		resultado = new Resultado();
		String nmClass = entidade.getClass().getName();
		String msg = executaRegras(entidade, "ALTERAR");
		if (msg == null) {
			try {
				repositories.get(nmClass).alterar(entidade);
			}catch(Exception ex) {
				ex.printStackTrace();
				resultado.setMsg("Não foi possivel salvar os dados");
			}
		} else {
			resultado.setMsg(msg);
		}
		return resultado;
	}

	@Override
	public Resultado excluir(EntidadeDominio entidade) {
		resultado = new Resultado();
		String nmClass = entidade.getClass().getName();
		String msg = executaRegras(entidade, "EXCLUIR");
		if (msg == null) {
			try {
				repositories.get(nmClass).deletar(entidade);
			}catch(Exception ex) {
				ex.printStackTrace();
				resultado.setMsg("Não foi possivel excluir os dados");
			}
		} else {
			resultado.setMsg(msg);
		}
		return resultado;
	}

	@Override
	public Resultado consultar(EntidadeDominio entidade) {
		resultado = new Resultado();
		String nmClass = entidade.getClass().getName();
		String msg = executaRegras(entidade, "CONSULTAR");
		if (msg == null) {
			try {
				resultado.setEntidades(repositories.get(nmClass).consultar(entidade));
			}catch(Exception ex) {
				ex.printStackTrace();
				resultado.setMsg("Não foi possivel salvar os dados");
			}
		} else {
			resultado.setMsg(msg);
		}
		return resultado;
	}

	@Override
	public Resultado visualizar(EntidadeDominio entidade) {
		resultado = new Resultado();
		String nmClass = entidade.getClass().getName();
		String msg = executaRegras(entidade, "CONSULTAR");
		if (msg == null) {
			try {
				resultado.setEntidades(repositories.get(nmClass).consultar(entidade));
			}catch(Exception ex) {
				ex.printStackTrace();
				resultado.setMsg("Não foi possivel resgatar os dados");
			}
		} else {
			resultado.setMsg(msg);
		}
		return resultado;
	}
	
	private String executaRegras(EntidadeDominio entidade, String operacao) {
		String nmClass = entidade.getClass().getName();
		StringBuilder msg = new StringBuilder();
		Map<String, List<IStrategy>> regrasOperacao = rns.get(nmClass);
		if (regrasOperacao != null) {
			List<IStrategy> regras = regrasOperacao.get(operacao);
			if (regras != null) {
				for (IStrategy s : regras) {
					String m = s.processar(entidade);
					if (!StringHelper.isNullOrEmpty(m)) {
						msg.append(m);
						msg.append("\n");
					}
				}
			}
		}

		if (msg.length() > 0)
			return msg.toString();
		else
			return null;
	}
}
