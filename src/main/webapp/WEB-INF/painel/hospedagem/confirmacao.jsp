<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>

	.hide{
		display:none;
	}
</style>
<link type="text/css" rel="stylesheet" media="screen" href="../../../resources/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" media="screen" href="../../../resources/css/common.css">
<script src="../../../resources/js/jquery.js"></script>
<script src="../../../resources/bootstrap/css/bootstrap.min.css"></script>
<script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
<script src="../../../resources/bootstrap/js/bootstrap.bundle.js"></script>
<script src="../../../resources/bootstrap/js/popper.min.js"></script>
<script src="../../../resources/js/moment.js"></script>
<meta charset="ISO-8859-1">
<title>Pagamento</title>
</head>
<body class="bg-dark">
<jsp:include page="../../components/navbar.jsp" />
	
	<div class="container">

    <div class="row">
	
   

      <div class="col-lg-8">

        <div class="card mt-4">
          <div class="card-body">
            <h4 class="card-title">${reserva.hospedagem.titulo}</h4>
            <p>Diária: <strong>R$${reserva.hospedagem.diaria}</strong></p>
            <p class="card-text">${reserva.hospedagem.descricao}</p>
			 <hr style="background-color:red">
		    <h4>Cartões utilizados na reserva</h4>
		    	<div id="divCartoes" >
					<c:forEach var="cartao" items="${reserva.cartoes}">
						<div class="row">
							<div class="col-sm">
								<p idCartao="${cartao.id}">Cartão: <strong>${cartao.bandeira} - ${cartao.numero}</strong></p>
							</div>
						</div>
					    			
					</c:forEach>
			    			
			    </div>
			    <hr style="background-color:red">
		          	<div class="row col-sm">	
		    			<h4>Dados do hóspede</h4>
		          	</div>
		          		<div class="row">
						    <div class="col-sm">
						    	<p>Nome: <strong>${reserva.cliente.nome}</strong></p>
						    </div>
						     <div class="col-sm">
						     		<p>Email: <strong>${reserva.cliente.email}</strong></p>
						     </div>
						</div>   
			          	<div class="row">
						    <div class="col-sm">
						    	<p>Telefone: <strong>${reserva.cliente.telefone}</strong></p>
						    </div>
						     <div class="col-sm">
						     	<p>CPF: <strong>${reserva.cliente.cpf}</strong></p>
						     </div>
						</div>
						<hr style="background-color:red">
			    		<div class="row col-sm">
			    			<h4>Dados de cobrança</h4>
			    		</div>
			    		<div class="row">
			    		
						    <div class="col-sm">
						    	<p>Logradouro: <strong>${reserva.endereco.logradouro}</strong></p>
						    </div>
						    <div class="col-sm">
						    	<p>Número: <strong>${reserva.endereco.numero}</strong></p>
						    </div>
						</div> 
						<div class="row">
							<div class="col-sm">
								<p>Bairro: <strong>${reserva.endereco.bairro}</strong></p>
							</div>
							<div class="col-sm">
								<p>CEP: <strong>${reserva.endereco.cep}</strong></p>
							</div>
						</div>  
						<div class="row">
							<div class="col-sm">
								<p>Cidade: <strong>${reserva.endereco.cidade}</strong></p>
							</div>
							<div class="col-sm">
								<p>Estado: <strong>${reserva.endereco.estado}</strong></p>
							</div>
						</div> 
				  <hr style="background-color:red">		   
 				  <h4>Comentário do hóspede para o anfitrião</h4>	
		          <div class="form-group">	
		          	<div class="row">
		          		<div class="col-sm">
		          			${reserva.mensagem}
		          		</div>
		          	</div>	
		          </div>     
		          </div> 
		          <a href="/pagamento/atualizarPagamento/${reserva.id}" type="button" style="margin-top:20px" class="btn btn-success btn-block" >Concordar e continuar</a>
	       
          </div>
         
        </div>
     
        <div class="card mt-4 col-lg-4">
        	<div class="card-body">
            <h4 id="txtTotal">Total: R$${reserva.total }</h4>
            <form>
            	<div class="form-group">
		            <div class="form-row">
		              <div class="col-md-12">
		                <div class="form-label-group">
		                  <label for="inputPassword"><strong>Quantidade de hóspedes:</strong> ${reserva.qtdHospedes}</label>
		                  
		                </div>
		              </div>
		            </div>
          		</div>
          		<div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		                  <label for="inputPassword"><strong>Data Check-in:</strong> ${reserva.checkin}</label>
		                </div>
		              </div>
		              <div class="col-md-6">
		                <div class="form-label-group">
		                  <label for="inputPassword"><strong>Data Check-out:</strong> ${reserva.checkout}</label>
		                </div>
		              </div>
		            </div>
          		</div>
          		<div class="form-group">
          			<hr style="background-color:red">
          			<h4>Anfitrião</h4>
          			<div class="row">
			              <div class="col-md-12">
			                  <label for="inputPassword"><strong>Nome:</strong> ${reserva.hospedagem.anfitriao.nome}</label>
			              </div>
			        </div>
			           <div class="row">      
			              <div class="col-md-12">
			                  <label for="inputPassword"><strong>Telefone:</strong> ${reserva.hospedagem.anfitriao.telefone}</label>
			              </div>
		              </div>
			              <div class="row">
			              	<div class="col-md-12">
			              	   <label for="inputPassword"><strong>Email:</strong> ${reserva.hospedagem.anfitriao.email}</label>
			              	</div>
			              </div>
          		</div>
            </form>
          </div>
        </div>
      
      
      
  
      </div>
      <!-- /.col-lg-9 -->

    </div>

  

</body>
<jsp:include page="../../components/modal/cartao/cadastrarCartao.jsp" />
<jsp:include page="../../components/modal/cliente/cadastrarEndereco.jsp" />
<script>

pagamento = true;
var idHospedagem = ${hospedagem.id}; 
var idCliente = ${cliente.id};
var checkin = "${reserva.checkin}";
var checkout = "${reserva.checkout}";
var qtdHospedes = ${reserva.qtdHospedes};
var total = ${reserva.total};
var idReserva = ${reserva.id};
var listaCartoes = [];
$("#txtTotal").text(total.toFixed(2))
function continuar(){
	total = total.toFixed(2);
	listaCartoes = [];
	$("#divCartoes .form-group").each(function(){

		var cartao = $(this).find("select option:selected").attr("idCartao");
		var valor = $(this).find("input").val();
		var jsonCartao = {
			id: cartao,
		
		};
		
		listaCartoes.push(jsonCartao);

	});

	
	debugger;
	var reserva = {
		
		checkin: checkin,
		checkout: checkout,
		qtdHospedes: qtdHospedes,
		total: total,
		cartoes: listaCartoes
		
	};
	
	$.ajax({
		 method: "POST",
		 url: "/pagamento/irParaConfirmacao/" + idHospedagem + "/" + idCliente,
		 data: {reserva: JSON.stringify(reserva)},
		 success: function(data) {
			 debugger;
			 data = JSON.parse(data);
	         if(data.ok == true){
	        	
	         }else{
	        	
	         }
	      },
	      error: function(){
	    	  
	      }
	});
	
	
}

var divCartoes = $("#divCartoes").html();

function carregarCartoes(){
	
	$("#divCartoes").append(divCartoes);
	$(".valorCartao").removeClass("hide");
	
	colocaIds();
}





var i = 0;
function colocaIds(){
	debugger;
		$("#divCartoes .form-group").each(function(){
	     $(this).attr("id", "cartao"+i);
	     $(this).find("button").attr("idCartaoBotao", "cartao"+i);
	     i++;

		});
	
}





function retirarCartao(button){
	
	$("#" + $(button).attr("idCartaoBotao")).remove();
}
</script>

</html>
