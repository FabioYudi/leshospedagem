<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
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
            <h3 class="card-title">Casa na praia</h3>
            <h4>Diária: R$250,00</h4>
            <p class="card-text">Casa na praia em caraguatatuba, 100 metros da praia</p>
	        <form>
		        <div class="form-group">
		          	<div class="form-row">	
		    			<label for="exampleFormControlSelect1">Selecione seu cartão de crédito ou cadastre um novo</label>
		    			
					    <select class="form-control" id="exampleFormControlSelect1">
					    	<c:forEach var="cartao" items="${cliente.cartoes}">
		    			 		<option>${cartao.bandeira}-${cartao.numero}</option>
		    				</c:forEach>
					    </select>
					    <button type="button" data-toggle="modal" style="margin-top:20px" data-target="#modalCadastrarCartao" class="btn btn-primary">Novo Cartão</button>
		          	</div>
		          </div>
		          <div class="form-group">
		          	<div class="form-row">	
		    			<label for="exampleFormControlSelect1">Selecione seu endereço de cobrança ou cadastre um novo</label>
					    <select class="form-control" id="exampleFormControlSelect1">
					      <c:forEach var="endereco" items="${cliente.enderecos}">
		    			 		<option>${endereco.logradouro} - ${endereco.estado} - ${endereco.cidade}</option>
		    			</c:forEach>
					    </select>
					    <a style="margin-top:20px" class="btn btn-primary" href="/painel/hospedagem/pagamento">Novo Endereço</a>
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
		   					<textarea style="width:480px;" class="form-control" id="exampleFormControlTextarea1" rows="5"></textarea>
		  				</div>
		          	</div>     
		          </div> 
		          <a style="margin-top:20px" class="btn btn-success btn-block" href="/painel/estadia/consultar">Concordar e continuar</a>
	        </form>
          </div>
         
        </div>
        
        <!-- /.card -->


      

      </div>
      <div class="col-lg-3">
        <div style="width:300px"class="card mt-4">
        	<div class="card-body">
            <h4>Total: R$250,00</h4>
            <form>
            	<div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		                  <label for="inputPassword">3 hóspedes</label>
		                  
		                </div>
		              </div>
		            </div>
          		</div>
          		<div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		                  <label for="inputPassword">check-in: 24/03/2019</label>
		                </div>
		              </div>
		              <div class="col-md-6">
		                <div class="form-label-group">
		                  <label for="inputPassword">check-out: 29/03/2019</label>
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

<script>
pagamento = true;
</script>
</html>