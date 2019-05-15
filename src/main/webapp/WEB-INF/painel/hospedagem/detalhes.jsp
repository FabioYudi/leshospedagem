<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<script src="../../../resources/js/jquery.js"></script>
<script src="../../../resources/bootstrap/css/bootstrap.min.css"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="../../../resources/bootstrap/js/popper.min.js"></script>

<script src="../../../resources/js/moment.js"></script>
<style>
.hide{
	display:none;
}
</style>

<link type="text/css" rel="stylesheet" media="screen" href="../../../resources/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" media="screen" href="../../../resources/css/common.css">
 <script src="../../../resources/js/datepicker/datepicker-bootstrap.js" type="text/javascript"></script>
    <link href="../../../resources/js/datepicker/datepicker-css.css" rel="stylesheet" type="text/css" />
<meta charset="ISO-8859-1">

<style>
	.datepicker-days table .disabled-date.day {
  background-color: #FFE4E1;
  color: #000;
}

.datepicker table tr td.disabled, 
.datepicker table tr td.disabled:hover {
  background: #FFE4E1;
  color: #000;
}
</style>
<title>Detalhes</title>
<jsp:include page="../../components/navbar.jsp" />
</head>
<body class="bg-dark">
<div id="alertaErro" class="alert alert-warning hide" role="alert"></div>
  
  <!-- Page Content -->
  <div class="container">

    <div class="row">
	
   

      <div class="col-lg-9">

        <div class="card mt-4">
          <img class="card-img-top img-fluid" src="https://q-ec.bstatic.com/images/hotel/max1024x768/853/85381305.jpg" alt="">
          <div class="card-body">
            <h3 class="card-title">${hospedagem.titulo}</h3>
            <h4>Diária: <strong>R$ ${hospedagem.diaria}</strong></h4>
            <p class="card-text">${hospedagem.descricao}</p>
           
          </div>
         
        </div>
        
        <!-- /.card -->


        <div class="card card-outline-secondary my-4">
          <div class="card-header">
            Avaliações da hospedagem
          </div>
          <c:forEach var="avaliacao" items="${hospedagem.avaliacoesHospedagem}">
          	 <div class="card-body">
	          	<h5>Nota: <strong>${avaliacao.nota}</strong></h5>
	            <p>${avaliacao.comentario}</p>
	            <small class="text-muted">Avaliado por: ${avaliacao.avaliador.nome}</small>
	            <hr>
	         </div>
          </c:forEach>
         
        </div>
        <div class="card card-outline-secondary my-4">
          <div class="card-header">
            Avaliações do anfitrião
          </div>
           <c:forEach var="avaliacao" items="${hospedagem.anfitriao.avaliacoesAnfitriao}">
	          <div class="card-body">
	          	<h5>Nota: <strong>${avaliacao.nota}</strong></h5>
	            <p>${avaliacao.comentario}</p>
	            <small class="text-muted">Avaliado por: ${avaliacao.avaliador.nome}</small>
	            <hr>
	          </div>
	       </c:forEach>  
        </div>
        <!-- /.card -->

      </div>
      <div class="col-lg-3">
        <div style="width:300px"class="card mt-4">
        	<div class="card-body">
            <h4>Total: R$<span id="total">${hospedagem.diaria}</span></h4>
            <form>
            	<div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		                  <label for="qtdHospedes">Qtd hóspedes</label>
		                  <input type="text" id="qtdHospedes" class="form-control" placeholder="" required="required">
		                  <small>MAX: ${hospedagem.qtdHospedes}</small> 
		                </div>
		              </div>
		            </div>
          		</div>
          		<div class="form-group">
		            <div class="form-row">
			              <div class="col-md-12">
			                <div class="form-label-group">
			                  <label for="checkin">check-in</label>
			                  <input  id="checkin" class="form-control datepicker"  required="required"> 
			                 
			                </div>
			              </div>
		              </div>
		              <div style="margin-top: 10px" class="form-row">
			              <div class="col-md-12">
			                <div class="form-label-group">
			                  <label for="checkout">check-out</label>
			                  <input   id="checkout" class="form-control datepicker" placeholder="" required="required"> 
			                </div>
			              </div>
		            </div>
          		</div>
          		 <a onclick="verificaClienteLogado()" class="btn btn-primary btn-block" >Reservar</a>
            </form>
          </div>
        </div>
      </div>
      <!-- /.col-lg-9 -->

    </div>

  </div>
  <!-- /.container -->

 	 	<a href="javascript:;" id="abrirModalLogin"  data-toggle="modal" data-target="#modalLogin" class="hide btn btn-block btn-primary" >da Dados</a>
 	<jsp:include page="../../components/modal/cliente/login.jsp" />
 	
</body>


<!-- Bootstrap core JavaScript -->

<form id="form-pagamento" method="POST" class="hide" action="/painel/hospedagem/pagamento/${hospedagem.id}">
	<input type="hidden" id="valorReserva" name="total"/>
	<input type="hidden" id="qtdHospedesReserva" name="qtdHospedes"/>
	<input type="hidden" id="dataCheckinReserva" name="checkin"/>
	<input type="hidden" id="dataCheckoutReserva" name="checkout"/>
	
	
</form>



	
<script>

var diaria = ${hospedagem.diaria};
debugger;
var datesForDisable = ${datasIndisponiveis};
debugger;
var dataInicio = moment("${hospedagem.dataInicio}");
var dataFim = moment("${hospedagem.dataFim}");;
$('.datepicker').datepicker({
	 format: 'dd/mm/yyyy',
     autoclose: true,
     weekStart: 1,
     todayHighlight: false,
     datesDisabled: datesForDisable,
     startDate: dataInicio.format("DD/MM/YYYY"),
     endDate: dataFim.format("DD/MM/YYYY")
});


function irParaPagamento(){
	if($("checkin").val() == "" || $("#checkin").val() == null || $("#checkout").val() == "" || $("#checkout").val() == null || $("qtdHospedes").val() == ""){
		$("#alertaErro").removeClass("hide");
		$("#alertaErro").html("Por favor, preencha todos os campos");
		return;
	}
	var data = moment($("#checkin").val(), "DD/MM/YYYY")
	$("#dataCheckinReserva").val(data.format("YYYY-MM-DD"));
	var data = moment($("#checkout").val(), "DD/MM/YYYY")
	$("#dataCheckoutReserva").val(data.format("YYYY-MM-DD"));
	
	$("#valorReserva").val(total);
	$("#qtdHospedesReserva").val($("#qtdHospedes").val());

	
	$("#form-pagamento").submit();
}



$("#checkin").on("change", function(){
	recalculaValorTotal();
});

$("#checkout").on("change", function(){
	recalculaValorTotal();
});

$("#qtdHospedes").on("change", function(){
	recalculaValorTotal();
});

$("#qtdHospedes").on("keyup", function(){
	recalculaValorTotal();
});
var total;
function recalculaValorTotal(){
	var data1 = moment($("#checkin").val(),'DD/MM/YYYY');
	var data2 = moment($("#checkout").val(),'DD/MM/YYYY');
	var diff  = data2.diff(data1, 'days');
	var qtdHospedes = $("#qtdHospedes").val();
	if($("#qtdHospedes").val() == 1){
		 total = diff * parseFloat(diaria);
	}else{
		total = diff * parseFloat(diaria) + (qtdHospedes * (diaria * 0.05));
	}
	
	if(!isNaN(total)){
		$("#total").text(total.toFixed(2));
	}
	
	
}

function verificaClienteLogado(){
	$.ajax({
		 method: "GET",
		 url: "/cliente/verificaLogin",
		 success: function(data) {
			
			 data = JSON.parse(data);
			if(data.clienteLogado == null){
			 $("#cadastrar").removeClass("hide");
				$("#login").removeClass("hide");
				$("#painel").addClass("hide");
				$("#sair").addClass("hide");
				$("#alertaErroLogin").removeClass("hide");
				$("#alertaErroLogin").html("Entre ou cadastre-se antes de reservar sua hospedagem");
		      	$("#abrirModalLogin").click();
			}else{
				
				$("#cadastrar").addClass("hide");
				$("#login").addClass("hide");
				$("#painel").removeClass("hide");
				$("#sair").removeClass("hide");
				irParaPagamento();
			}
			
	      },
	      error: function(){
	    	
	    	  $("#cadastrar").removeClass("hide");
				$("#login").removeClass("hide");
				$("#painel").addClass("hide");
				$("#sair").addClass("hide");
	      }
	});
}

</script>
</html>