<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
<meta charset="ISO-8859-1">
<title>Detalhes</title>
<jsp:include page="../../components/navbar.jsp" />
</head>
<body class="bg-dark">

  
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
          <div class="card-body">
          	<h5>Nota: <strong>5</strong></h5>
            <p>Muito bom, recomendo!</p>
            <small class="text-muted">Avaliado por: Fabio Spada 24/02/19</small>
            <hr>
          </div>
        </div>
        <div class="card card-outline-secondary my-4">
          <div class="card-header">
            Avaliações do anfitrião
          </div>
          <div class="card-body">
          	<h5>Nota: <strong>5</strong></h5>
            <p>Muito simpático, recomendo</p>
            <small class="text-muted">Avaliado por: Fabio Spada 24/02/19</small>
            <hr>
          </div>
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
		                </div>
		              </div>
		            </div>
          		</div>
          		<div class="form-group">
		            <div class="form-row">
			              <div class="col-md-12">
			                <div class="form-label-group">
			                  <label for="checkin">check-in</label>
			                  <input type="date" id="checkin" class="form-control" placeholder="" required="required"> 
			                </div>
			              </div>
		              </div>
		              <div style="margin-top: 10px" class="form-row">
			              <div class="col-md-12">
			                <div class="form-label-group">
			                  <label for="checkout">check-out</label>
			                  <input  type="date" id="checkout" class="form-control" placeholder="" required="required"> 
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

<script>

var diaria = ${hospedagem.diaria};

//href="/painel/hospedagem/pagamento"




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

function recalculaValorTotal(){
	var data1 = moment($("#checkin").val(),'YYYY-MM-DD');
	var data2 = moment($("#checkout").val(),'YYYY-MM-DD');
	var diff  = data2.diff(data1, 'days');
	var qtdHospedes = $("#qtdHospedes").val();
	if($("#qtdHospedes").val() == 1){
		var total = diff * parseFloat(diaria);
	}else{
		var total = diff * parseFloat(diaria) * (qtdHospedes * (diaria * 0.05));
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
				$("#alertaErroLogin").html("Entre ou cadastra-se antes de reservar sua hospedagem");
		      	$("#abrirModalLogin").click();
			}else{
				
				$("#cadastrar").addClass("hide");
				$("#login").addClass("hide");
				$("#painel").removeClass("hide");
				$("#sair").removeClass("hide");
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