
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Consulta de hospedagem</title>

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
</style>
</head>

<body class="bg-dark page-tp">
<jsp:include page="../components/navbar.jsp" />

  <div id="wrapper">

	<jsp:include page="../components/sidebar.jsp" />
	<div id="content-wrapper">
      	<div class="container-fluid">
      		<div class="card mb-3">
      		<c:if test="${!empty mensagem}">
      			<div class="alert alert-success" role="alert">
  					${mensagem}
				</div>
      		</c:if>
      		<form method="post" id="form-cadastro" action="/cliente/filtrar" style="margin-left:20px">
			          <div class="form-group">
			            <div class="form-row">
			              <div class="col-md-2">
			                <div class="form-label-group">
			                  <input type="text" id="nomeFiltro"  name="nome" class="form-control"  >
			                  <label for="nomeFiltro">Nome</label>
			                </div>
			              </div>
			              <div class="col-md-2">
			                <div class="form-label-group">
			                  <input  type="text" id="emailFiltro" name="email" class="form-control" >
			                  <label for="emailFiltro">Email</label>
			                </div>
			              </div>
			              <div class="col-md-2">
			                <div class="form-label-group">
			                  <select name="genero" style="width: 200px; margin-left:5px" class="form-control" id="genero">
							      <option value="">Selecione...</option>
							      <option value="masculino">masculino</option>
							      <option value="feminino">feminino</option>
							      <option value="outros">outros</option>
						    </select>
			                </div>
			              </div>
			            </div>
			             <div class="form-row" style="margin-top:20px; margin-bottom:10px">
				           	 <div class="col-md-2">
					            <div class="form-label-group">
					              <input  type="text" id="cpfFiltro" name="cpf" class="form-control" >
					              <label for=""cpfFiltro">CPF</label>
					            </div>
					          </div> 
				      	 </div>  
				      	 <span style="margin-top:30px">Status</span>	
				      	 <div class="form-row">
				      	 	
				      	 	<select name="ativo" style="width: 200px; margin-left:5px" class="form-control" id="ativo">
						      <option value="">Selecione...</option>
						      <option value="true">Ativo</option>
						      <option value="false">Inativo</option>
						    </select>
						   <div class="col-md-2">
					            <div class="form-label-group">
					              <button type="submit" class="btn btn-primary">Buscar</button>
					            </div>
					          </div>  
				      	 </div>   
			          </div>
			     </form>     
          <div class="card-header">
            <i class="fas fa-table"></i>
            Consulta de hospedagens</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                   	  <th>Nome</th>
	      			  <th>Data de nascimento</th>
				      <th>Email</th>
				      <th>CPF</th>
				      <th>Email</th>
				      <th>Gênero</th>
				      <th>Status</th>
				      <th>Ações</th>
                  </tr>
                </thead>
               
                <tbody>
                  <c:forEach var="cliente" items="${clientes}">
				  	<tr>
				      <th scope="row">${cliente.nome}</th>
				      <td>${cliente.dtNascimento}</td>
				      <td>${cliente.email}</td>
				      <td>${cliente.cpf}</td>
				      <td>${cliente.email}</td>
				      <td>${cliente.genero}</td>
				      <td>
				      	 <c:choose>
				      	 	<c:when test="${cliente.ativo}">
								<span style="color:green">ATIVO</span>
				      	 	</c:when>
				      	 	<c:otherwise>
								<span style="color:red">INATIVO</span>
				      	 	</c:otherwise>	
				      	 </c:choose>	
				      </td>
				     
				      <td>
				      	 
				      	 <c:choose>
				      	 	<c:when test="${cliente.ativo}">
				      	 		<button onclick="desativar(this)" valor="false" type="button" idCliente="${cliente.id}" class="btn btn-danger">Desativar</button>
				      	 	</c:when>
				      	 	<c:otherwise>
				      	 		<button onclick="desativar(this)" valor="true"  type="button" class="btn btn-success" idCliente="${cliente.id}">Ativar</button>
				      	 		
				      	 	</c:otherwise>	
				      	 </c:choose>
				      	 
				     	 
				     	
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

  
    <form method="GET" id="formDesativar" action="/cliente/consultar">
    	
    </form>

    

  <!-- Bootstrap core JavaScript-->
<script src="../../resources/js/jquery.js"></script>
  <script src="../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../resources/js/jquery-easing/jquery.easing.min.js"></script>

</body>

<script>
function convertDate(dateString){
	var p = dateString.split(/\D/g)
	return [p[2],p[1],p[0] ].join("/")
}





	function desativar(botao){
		var id = $(botao).attr("idCliente");
		$.ajax({
			 method: "POST",
			 url: "/cliente/desativarCliente/" + id + "/" + $(botao).attr("valor"),
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
</script>

</html>
