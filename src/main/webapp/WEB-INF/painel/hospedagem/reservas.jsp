
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  

  <title>Consulta de reservas</title>
<link type="text/css" rel="stylesheet" media="screen" href="../../../../resources/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" media="screen" href="../../../../resources/css/common.css">
  <!-- Custom fonts for this template-->
 <link href="../../../../resources/css/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="../../../../resources/css/sb-admin.css" rel="stylesheet">
  <!-- Page level plugin CSS-->
  <link href="../../../../resources/js/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  
  <script src="../../../../resources/js/jquery.js"></script>
  <script src="../../../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../../../resources/js/jquery-easing/jquery.easing.min.js"></script>
  <script src="../../../..resources/bootstrap/js/bootstrap.min.js"></script>



<style>
	a:link 
{ 
text-decoration:none; 
} 

.hide{
	display: none;
}
</style>
</head>
 
<body class="bg-dark page-tp">
<jsp:include page="../../components/navbar.jsp" />

  <div id="wrapper">

	<jsp:include page="../../components/sidebar.jsp" />
	<div id="content-wrapper">
      	<div class="container-fluid">
      		
      		<div class="card mb-3">
      		<div class="alert alert-danger hide" id="alertaExcluir" role="alert">
  					
				</div>
      		<c:if test="${!empty mensagem}">
      			<div class="alert alert-success" id="alertaMensagem" role="alert">
  					${mensagem}
				</div>
      		</c:if>
      		    
          <div class="card-header">
            <i class="fas fa-table"></i>
            Consulta de hospedagens</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                   	  <th>Hospedagem</th>
	      			  <th>Check-in</th>
				      <th>Check-out</th>
				      <th>Valor</th>
				      <th>Status</th>
				      <th>Ações</th>
                  </tr>
                </thead>
               
                <tbody>
                   <c:forEach var="reserva" items="${reservas}">
				  	<tr>
				      <th scope="row">${reserva.hospedagem.titulo}</th>
				      <td>${reserva.checkin}</td>
				      <td>${reserva.checkout}</td>
				      <td>${reserva.total}</td>
				      <c:choose>
				      	<c:when test="${reserva.status eq 'EM PROCESSO'}">
				      		<td style="color: #FFD700"><strong>${reserva.status}</strong></td>
				      	</c:when>
				      	<c:when test="${reserva.status eq 'APROVADO'}">
				      		<td style="color: #008000"><strong>${reserva.status}</strong></td>
				      	</c:when>
				      	<c:when test="${reserva.status eq 'REPROVADO'}">
				      		<td style="color: #8B0000"><strong>${reserva.status}</strong></td>
				      	</c:when>
				      	<c:when test="${reserva.status eq 'CANCELADO_HOSPEDE'}">
				      		<td style="color: #8B0000"><strong>CANCELADO PELO HÓSPEDE</strong></td>
				      	</c:when>
				      	<c:when test="${reserva.status eq 'CANCELADO_ANFITRIAO'}">
				      		<td style="color: #8B0000"><strong>CANCELADO PELO ANFITRIÃO</strong></td>
				      	</c:when>
				      	<c:when test="${reserva.avaliadoHospede && !reserva.avaliadoAnfitriao}">
				      		<td style="color: #0000CD"><strong>AVALIADO PELO HÓSPEDE</strong></td>
						</c:when>
						<c:when test="${reserva.avaliadoAnfitriao && !reserva.avaliadoHospede}">
							<td style="color: #008000"><strong>AVALIADO PELO ANFITRIAO</strong></td>
						</c:when>
						<c:when test="${reserva.avaliadoAnfitriao && reserva.avaliadoHospede}">
							<td style="color: #008000"><strong>AVALIADO PELO ANFITRIÃO E HÓSPEDE</strong></td>
						</c:when>
				      </c:choose>
				      
				      <td>
				      	<c:if test="${reserva.status eq 'EM PROCESSO' || reserva.status eq 'APROVADO'}">
				      		<button data-toggle="modal" data-target="#modalCancelarReserva" onclick="setIdReserva(this)" idReserva="${reserva.id}" type="button" class="btn btn-danger">Cancelar Reserva</button>
				      	</c:if>
				      	<c:if test="${!reserva.avaliadoAnfitriao && reserva.status eq 'AVALIADO_HOSPEDE' || reserva.status eq 'APROVADO'}">
				      		<button data-toggle="modal" data-target="#modalAvaliacaoHospedagem" onclick="setIdReservaAvaliacao(this)"   idReserva="${reserva.id}" type="button" class="btn btn-warning">Avaliar</button>
				      	</c:if>
				     	<a type="button" href="/cliente/visualizarReserva/${reserva.id}" class="btn btn-primary">Detalhes</a>	
				      </td>
				    </tr>
				  
			  	</c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          
        </div>
      	
      	
     	 </div>
     </div>
	
  </div>

  	
    <form method="POST" id="formDesativar" class="hide" action="/painel/hospedagem/consultarAtualizacao">
    	<input id="mensagem" name="mensagem"></input>
    </form>

<button data-toggle="modal" data-target="#modalEditarEndereco" class="hide" id="botaoModalEndereco"></button>
    

  <!-- Bootstrap core JavaScript-->
<jsp:include page="../../components/modal/cliente/cadastrarEndereco.jsp" />
 <jsp:include page="../../components/modal/reserva/modalCancelarReserva.jsp" /> 
 <jsp:include page="../../components/reserva/modalAvaliarHospede.jsp" />
  
</body>


<form id="form-pagamento" method="POST" class="hide" action="">
	<input type="hidden" id="valorReserva" name="total"/>
	<input type="hidden" id="qtdHospedesReserva" name="qtdHospedes"/>
	<input type="hidden" id="dataCheckinReserva" name="checkin"/>
	<input type="hidden" id="dataCheckoutReserva" name="checkout"/>
		<input type="hidden" name="alterar" value="true"/>
	
</form>


<script>

	function irParaPagamento(button){
		debugger;
		$("#form-pagamento").attr("action", "/painel/hospedagem/pagamento/" + $(button).attr("idHospedagem"));
		$("#valorReserva").val($(button).attr("valorReserva"));
		$("#qtdHospedesReserva").val($(button).attr("qtdHospedes"));
		$("#dataCheckinReserva").val($(button).attr("checkin"));
		$("#dataCheckoutReserva").val($(button).attr("checkout"));
		$("#form-pagamento").submit();
	}


	function desativar(botao){
		var id = $(botao).attr("idHospedagem");
		$.ajax({
			 method: "POST",
			 url: "/painel/hospedagem/desativar/" + id + "/" + $(botao).attr("valor"),
			 data: {},
			 success: function(data) {
		        data = JSON.parse(data);
		        if(data.ok == true){
		        	
		        	$("#mensagem").val(data.mensagem);
		        	$("#formDesativar").submit();
		        }else{
		        	
		        }
		      },
		      error: function(){
		    	  
		      }
		});
	}
	
	function cancelarReserva(){
		
		var data = {
			motivo : $("#motivoCancelamento").val(),
			hospede : false
		};
		
		$.ajax({
			 method: "GET",
			 url: "/pagamento/cancelarReserva/" + idReservaCancelamento,
			 data: data,
			 success: function(data) {
				 window.location.reload()
		      },
		      error: function(){
		    	  
		      }
		});
	}
	
	function setPrincipal(botao){
		$.ajax({
			 method: "POST",
			 url: "/cliente/endereco/setarComoPrincipal/" + $(botao).attr("idEndereco") + "/" + $(botao).attr("idCliente"),
			 data: {},
			 success: function(data) {
		        data = JSON.parse(data);
		        if(data.ok == true){
		        	
		        	 $("#mensagemEdicao").val(data.mensagem);
		        	 $("#formDados").submit();
		        }else{
		        	
		        }
		      },
		      error: function(){
		    	  
		      }
		});
	}
	
	
	function excluir(botao){
		$.ajax({
			 method: "POST",
			 url: "/cliente/endereco/excluirEndereco/" + $(botao).attr("idEndereco") + "/" + $(botao).attr("idCliente"),
			 data: {},
			 success: function(data) {
		        data = JSON.parse(data);
		        if(data.ok == true){
		        	$("#alertaExcluir").removeClass("hide");
		        	$("#alertaExcluir").html("Endereço excluido com sucesso!");
		        	 $("#mensagemEdicao").val(data.mensagem);
		        	 $("#formDados").submit();
		        }else{
		        	$("#alertaMensagem").addClass("hide");
		        	$("#alertaExcluir").removeClass("hide");
		        	$("#alertaExcluir").html(data.mensagem);
				
		        }
		      },
		      error: function(){
		    	  
		      }
		});
	}

	var idReservaCancelamento = "";
	function setIdReserva(button){
		idReservaCancelamento = $(button).attr("idReserva");
	}
	
	var idReservaAvaliacao = "";
	function setIdReservaAvaliacao(button){
		idReservaAvaliacao = $(button).attr("idReserva");
	}
</script>

</html>
