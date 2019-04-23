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
	
   

      <div class="col-lg-9">

        <div class="card mt-4">
          <div class="card-body">
          	<h2>Confirmação de dados</h2>
            <h3 class="card-title">${hospedagem.titulo}</h3>
            <h4>Diária: R$${hospedagem.diaria}</h4>
            <p class="card-text">${hospedagem.descricao}</p>
	        <form>
		        <div class="form-group">
		          	<div class="form">	
		    			<label for="exampleFormControlSelect1">Selecione seu cartão de crédito ou cadastre um novo</label>
		    			<br>
		    			<div id="divCartoes" >
			    			<div class="form-group">
			          			<div  class="form-row">
				    				<select  id="selectCartao"  class="form-control col-5" id="exampleFormControlSelect1">
								    	<c:forEach var="cartao" items="${cliente.cartoes}">
					    			 		<option idCartao="${cartao.id}">${cartao.bandeira}-${cartao.numero}</option>
					    				</c:forEach>
							   		</select>
									<div id="divInputValor" class="hide valorCartao">
							   			<label style="margin-left:100px" for="valorPorCartao">Valor</label>
				                  		<input style="margin-left:10px" class="col-3" type="text" id="valorPorCartao" class="form-control" placeholder="" required="required" autofocus="autofocus">
				                  		<button idCartaoBotao="" onclick="retirarCartao(this)" type="button" style="background:none; color:red; border:none">X</button>
			    					</div>
			    				</div>
			    			</div>
		    			</div>
		    			<div class="row">
		    				<button type="button" onclick="carregarCartoes()"   style="margin-top:20px"  class="btn btn-warning">Adicionar cartão ao pagamento</button>
					    	<button type="button" data-toggle="modal" data-target="#modalCadastrarCartao"  style="margin-top:20px; margin-left:20px"  class="btn btn-primary">Cadastrar novo Cartão</button>
		    			</div>
					  
		          	</div>
		          </div>
		          <div class="form-group">
		          	<div class="form-row">	
		    			<label for="exampleFormControlSelect1">Selecione seu endereço de cobrança ou cadastre um novo</label>
					    <select id="selectEndereco" class="form-control" id="exampleFormControlSelect1">
					      <c:forEach var="endereco" items="${cliente.enderecos}">
		    			 		<option value="${endereco.id}">${endereco.logradouro} - ${endereco.estado} - ${endereco.cidade}</option>
		    			</c:forEach>
					    </select>
					    <a style="margin-top:20px" data-toggle="modal" data-target="#modalCadastrarEndereco"  class="btn btn-primary" href="/painel/hospedagem/pagamento">Novo Endereço</a>
		          	</div>
		          </div>
		           <div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		                  <label for="firstName">Cupom de desconto</label>
		                  <input type="text" id="firstName" class="form-control" placeholder="" required="required" autofocus="autofocus">
		                  <button style="margin-top:10px"class="btn btn-warning">Aplicar</button>
		                </div>
		              </div>
		            </div>
		          </div>
		          <div class="form-group">
		          	<div class="form-row">
		          		<div class="form-group">
		          			<label for="exampleFormControlTextarea1">Deixe um comentário para o anfitrião</label>
		   					<textarea style="width:480px;" class="form-control" id="textoHospede" rows="5"></textarea>
		  				</div>
		          	</div>     
		          </div> 
		          <button type="button" style="margin-top:20px" class="btn btn-success btn-block" onclick="continuar()">Concordar e continuar</button>
	        </form>
          </div>
         
        </div>
        
        <!-- /.card -->


      

      </div>
      <div class="col-lg-3">
        <div style="width:300px"class="card mt-4">
        	<div class="card-body">
            <h4>Total: R$${reserva.total }</h4>
            <form>
            	<div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
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
            </form>
          </div>
        </div>
      </div>
      <!-- /.col-lg-9 -->

    </div>

  </div>

</body>
<jsp:include page="../../components/modal/cartao/cadastrarCartao.jsp" />
<jsp:include page="../../components/modal/cliente/cadastrarEndereco.jsp" />

<form id="formConfirmacao" method="POST" action="/pagamento/confirmacao">
	<input type="hidden" name="idCliente" id="idCliente"/>
	<input type="hidden" name="idHospedagem" id="idHospedagem"/>
	<input type="hidden" name="idEndereco" id="idEndereco"/>
	<input type="hidden" name="checkin" value="${reserva.checkin}"/>
	<input type="hidden" name="checkout" value="${reserva.checkout}"/>
	<input type="hidden" name="total" value="${reserva.total}"/>
	<input type="hidden" name="qtdHospedes" value="${reserva.qtdHospedes}"/>

</form>
<script>
debugger;
pagamento = true;
var idHospedagem = ${hospedagem.id}; 
var idCliente = ${cliente.id};
var checkin = "${reserva.checkin}";
var checkout = "${reserva.checkout}";
var qtdHospedes = ${reserva.qtdHospedes};
var total = ${reserva.total};
var listaCartoes = [];
function continuar(){
	listaCartoes = [];
	$("#divCartoes .form-group").each(function(){

		var cartao = $(this).find("select option:selected").attr("idCartao");
		var valor = $(this).find("input").val();
		var jsonCartao = {
			id: cartao,
		
		};
		
		listaCartoes.push(jsonCartao);

	});
	
	

	
	
	var reserva = {
		
		checkin: checkin,
		checkout: checkout,
		qtdHospedes: qtdHospedes,
		total: total,
		cartoes: listaCartoes,
		mensagem: $("#textoHospede").val()
		
		
	};

	$.ajax({
		 method: "POST",
		 url: "/pagamento/irParaConfirmacao/" + idHospedagem + "/" + idCliente,
		 data: {reserva: JSON.stringify(reserva)},
		 success: function(data) {
			 debugger;
			 data = JSON.parse(data);
	         if(data.ok == true){
	        	$("#idCliente").val(data.idCliente);
	        	$("#idHospedagem").val(data.idHospedagem);
	        	$("#idEndereco").val($("#selectEndereco option:selected").val());
	        	$("#formConfirmacao").submit();
	        
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
