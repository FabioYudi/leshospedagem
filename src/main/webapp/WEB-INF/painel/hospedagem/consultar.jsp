
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
 <link href="../../../resources/css/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="../../../resources/css/sb-admin.css" rel="stylesheet">
  <!-- Page level plugin CSS-->
  <link href="../../../resources/js/datatables/dataTables.bootstrap4.css" rel="stylesheet">


<style>
	a:link 
{ 
text-decoration:none; 
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
      		<c:if test="${!empty mensagem}">
      			<div class="alert alert-success" role="alert">
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
                   	  <th>Titulo</th>
	      			  <th>valor diaria</th>
				      <th>Qtd Hospedes</th>
				      <th>Qtd Quartos</th>
				      <th>Logradouro</th>
				      <th>Cidade</th>
				      <th>Estado</th>
				      <th>Ações</th>
                  </tr>
                </thead>
               
                <tbody>
                  <c:forEach var="hospedagem" items="${hospedagens}">
				  	<tr>
				      <th scope="row">${hospedagem.titulo}</th>
				      <td>${hospedagem.diaria}</td>
				      <td>${hospedagem.qtdHospedes}</td>
				      <td>${hospedagem.qtdQuartos}</td>
				      <td>${hospedagem.endereco.logradouro}</td>
				      <td>${hospedagem.endereco.cidade}</td>
				      <td>${hospedagem.endereco.estado}</td>
				     
				      <td>
				      	 <button type="button" class="btn btn-primary"><a style="color:white" href="/painel/hospedagem/detalhesEdicao/${hospedagem.id}">Editar</a></button>	
				     	 <button type="button" class="btn btn-danger">Excluir</button>
				     	 <button type="button" class="btn btn-warning"><a style="color:black" href="/painel/hospedagem/estadia">Estadias</a></button>	
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

  
    

    

  <!-- Bootstrap core JavaScript-->
<script src="../../../resources/js/jquery.js"></script>
  <script src="../../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../../resources/js/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>
