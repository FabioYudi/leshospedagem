
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

  <!-- Custom fonts for this template-->
 <link href="../../resources/css/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="../../resources/css/sb-admin.css" rel="stylesheet">
  <!-- Page level plugin CSS-->
  <link href="../../resources/js/datatables/dataTables.bootstrap4.css" rel="stylesheet">


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
<jsp:include page="../components/navbar.jsp" />

  <div id="wrapper">

	<jsp:include page="../components/sidebar.jsp" />
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
				      <td>${reserva.status}</td>
				      
				      
				     
				      <td>
				      	 
				      	 <c:choose>
				      	 	<c:when test="${!endereco.principal}">
				      	 		<button onclick="setPrincipal(this)" valor="true" type="button" idCliente="${cliente.id}" idEndereco="${endereco.id}" class="btn btn-success">Selecionar como principal</button>
				      	 	</c:when>
				      	 	<c:otherwise>
				      	 		<button  valor="true" type="button" class="btn btn-warning">Este é seu endereço principal</button>
				      	 		
				      	 	</c:otherwise>	
				      	 </c:choose>
				      	 
				     	 
				     	 <button onclick="excluir(this)" valor="true"  type="button" class="btn btn-danger" idCliente="${cliente.id}" idEndereco="${endereco.id}">Excluir</button>	
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
<jsp:include page="../components/modal/cliente/cadastrarEndereco.jsp" />

</body>

<script>
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

	
	
</script>
<script src="../../../resources/js/jquery.js"></script>
  <script src="../../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../../resources/js/jquery-easing/jquery.easing.min.js"></script>
  <script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
  <script src="../../../resources/js/jquery.js"></script>
</html>
