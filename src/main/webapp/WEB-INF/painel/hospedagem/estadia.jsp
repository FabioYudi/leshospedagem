<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Consulta de estadias</title>

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

<body class="bg-dark">

<jsp:include page="../../components/navbar.jsp" />
<jsp:include page="../../components/sidebar.jsp" />
<jsp:include page="../../components/hospedagem/modalMotivoHospede.jsp" />  
<h2 style="color:white; margin-left:500px; margin-bottom:40px">Estadias da hospedagem: Casa na praia</h2> 
<div style="width:1000px!important; max-width:2000px"  class="card card-register mx-auto mt-2">
	 <table style="width:1000px" class="table">
	  <thead>
	    <tr>
	      <th scope="col">#</th>
	      <th scope="col">Nome do H�spede</th>
	      <th scope="col">Data do check-in</th>
	      <th scope="col">Data do check-out</th>
	      <th scope="col">Qtd h�spedes</th>
	      <th scope="col">Status</th>
	      <th scope="col">A��es</th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <th scope="row">1</th>
	      <td>Fabio</td>
	      <td>21/02/2019</td>
	      <td>26/02/2019</td>
	      <td>5</td>
	      <td>Reservado</td>
	      <td>
	     	 <button data-toggle="modal" data-target="#modalMotivo" type="button" class="btn btn-danger">Cancelar Estadia</button>
	     	 <a href="/painel/hospedagem/detalheEstadia"  class="btn btn-danger">Detalhes</a>
	      </td>
	    </tr>
	    <tr>
	      <th scope="row">1</th>
	      <td>Lucas</td>
	      <td>21/02/2019</td>
	      <td>24/02/2019</td>
	      <td>5</td>
	      <td>Realizado</td>
	      <td>
	     	 <button data-toggle="modal" data-target="#modalAvaliacao" type="button" class="btn btn-warning">Avaliar H�spede</button>
	      </td>
	    </tr>
	    <tr>
	      <th scope="row">1</th>
	      <td>Bruno</td>
	      <td>21/02/2019</td>
	      <td>24/02/2019</td>
	      <td>5</td>
	      <td>Realizado</td>
	      <td>
	     	 <button data-toggle="modal" data-target="#modalVerAvaliacao" type="button" class="btn btn-success">Ver avalia��o</button>
	      </td>
	    </tr>
	  </tbody>
	</table>
</div>
  
   
    

  <!-- Bootstrap core JavaScript-->
<script src="../../resources/js/jquery.js"></script>
  <script src="../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../resources/js/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>
