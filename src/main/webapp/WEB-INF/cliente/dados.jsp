<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<style>
	.hide{
		display:none
	}
</style>
 <link href="../../resources/css/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="../../resources/js/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../../resources/css/sb-admin.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Dados Pessoais</title>
</head>
<body class="bg-dark">
<jsp:include page="../components/navbar.jsp" />
<div id="wrapper">
	<jsp:include page="../components/sidebar.jsp" />
	<div id="content-wrapper">
      <div class="container-fluid">
      	<c:if test="${!empty mensagem}">
      			<div class="alert alert-success" role="alert">
  					${mensagem}
				</div>
      		</c:if>
      	<div class="row">
		    <div class="col">
				 <div class="card mt-12">
		          <div class="card-body">
		            <h3 class="card-title">Dados</h3>
		            <p>Nome: <strong>${cliente.nome}</strong></p>
		            <p class="card-text">Email: <strong> ${cliente.email}</strong></p>
		            <p class="card-text">Telefone: <strong>${cliente.telefone}</strong></p>
		            <p class="card-text">data de nascimento: <strong>${cliente.dtNascimento}</strong></p>
		            <p class="card-text">CPF: <strong>${cliente.cpf}</strong></p>
		            <p class="card-text">G�nero: <strong>${cliente.genero}</strong></p>
		            
		           	<a href="/cliente/cadastrar"  data-toggle="modal" data-target="#modalEdicaoDados" class="btn btn-block btn-primary" >Editar Dados</a>
		          </div>
		         
		        </div>
		    </div>
		    <c:forEach var="endereco" items="${cliente.enderecos}">
			    <div class="col">
			     	 <div class="card mt-12">
			          <div class="card-body">
			            <h3 class="card-title">Endere�o principal</h3>
			            <h4>Logradouro: ${endereco.logradouro}</h4>
			            <p class="card-text">N�mero: ${endereco.numero}</p>
			            <p class="card-text">Bairro: ${endereco.bairro}</p>
			            <p class="card-text">CEP: ${endereco.cep}</p>
			            <p class="card-text">Complemento: ${endereco.complemento}</p>
			            <p class="card-text">Estado: ${endereco.estado}</p>
			            <p class="card-text">Cidade: ${endereco.cidade}</p>
			        
			            
			           	<a href="/cliente/cadastrar" class="btn btn-block btn-warning" ><strong>Consultar Endere�os</strong></a>
			          </div>
			         
			        </div>
			    </div>
			  </c:forEach>  
		   
  		</div>
  		<div class="row">
  			<div class="col">
  				<div class="card card-outline-secondary my-4">
		          <div class="card-header">
		            Avalia��es como h�spede
		          </div>
		          <div class="card-body">
		          	<h5>Nota: <strong>5</strong></h5>
		            <p>Muito simp�tico, cuidou bem da casa, recomendo</p>
		            <small class="text-muted">Avaliado por: Lucas 24/02/19</small>
		            <hr>
		          </div>
		        </div>
  			</div>
  			<div class="col">
		    	<div class="card card-outline-secondary my-4">
		          <div class="card-header">
		            Avalia��es como anfitri�o
		          </div>
		          <div class="card-body">
		          	<h5>Nota: <strong>5</strong></h5>
		            <p>Muito simp�tico, atendeu muito bem, recomendo</p>
		            <small class="text-muted">Avaliado por: Fabio 24/02/19</small>
		            <hr>
		          </div>
		        </div>
		    </div>

  		</div>
     </div>
		
	</div>
		
</div>



<jsp:include page="../components/modal/cliente/editarDados.jsp" />

</body>
<script src="../../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/jquery.js"></script>
</html>