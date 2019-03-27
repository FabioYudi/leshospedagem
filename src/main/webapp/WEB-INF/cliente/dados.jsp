<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
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
      	
      	<div class="row">
		    <div class="col">
				 <div class="card mt-12">
		          <div class="card-body">
		            <h3 class="card-title">Dados</h3>
		            <h4>Nome: ${cliente.nome}</h4>
		            <p class="card-text">Email: ${cliente.email}</p>
		            <p class="card-text">Telefone:</p>
		            <p class="card-text">data de nascimento: ${cliente.dtNascimento}</p>
		            <p class="card-text">CPF: ${cliente.cpf}</p>
		            <p class="card-text">Gênero: ${cliente.genero}</p>
		            
		           	<a href="/cliente/cadastrar" class="btn btn-block btn-primary" >Editar Dados</a>
		          </div>
		         
		        </div>
		    </div>
		    <c:forEach var="endereco" items="${cliente.enderecos}">
			    <div class="col">
			     	 <div class="card mt-12">
			          <div class="card-body">
			            <h3 class="card-title">Endereço principal</h3>
			            <h4>Logradouro: ${endereco.logradouro}</h4>
			            <p class="card-text">Número: ${endereco.numero}</p>
			            <p class="card-text">Bairro: ${endereco.bairro}</p>
			            <p class="card-text">CEP: ${endereco.cep}</p>
			            <p class="card-text">Complemento: ${endereco.complemento}</p>
			            <p class="card-text">Estado: ${endereco.estado}</p>
			            <p class="card-text">Cidade: ${endereco.cidade}</p>
			        
			            
			           	<a href="/cliente/cadastrar" class="btn btn-block btn-warning" ><strong>Consultar Endereços</strong></a>
			          </div>
			         
			        </div>
			    </div>
			  </c:forEach>  
		   
  		</div>
  		<div class="row">
  			<div class="col">
  				<div class="card card-outline-secondary my-4">
		          <div class="card-header">
		            Avaliações como hóspede
		          </div>
		          <div class="card-body">
		          	<h5>Nota: <strong>5</strong></h5>
		            <p>Muito simpático, cuidou bem da casa, recomendo</p>
		            <small class="text-muted">Avaliado por: Lucas 24/02/19</small>
		            <hr>
		          </div>
		        </div>
  			</div>
  			<div class="col">
		    	<div class="card card-outline-secondary my-4">
		          <div class="card-header">
		            Avaliações como anfitrião
		          </div>
		          <div class="card-body">
		          	<h5>Nota: <strong>5</strong></h5>
		            <p>Muito simpático, atendeu muito bem, recomendo</p>
		            <small class="text-muted">Avaliado por: Fabio 24/02/19</small>
		            <hr>
		          </div>
		        </div>
		    </div>

  		</div>
     </div>
		
	</div>
		
</div>

<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
	



</body>
<script src="../../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/jquery.js"></script>
</html>