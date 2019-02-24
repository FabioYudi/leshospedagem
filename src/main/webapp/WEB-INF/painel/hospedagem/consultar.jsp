<!DOCTYPE html>
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

<body class="bg-dark">

<jsp:include page="../../components/navbar.jsp" />
<jsp:include page="../../components/sidebar.jsp" />
   
<div style="width:800px!important; max-width:2000px"  class="card card-register mx-auto mt-2">
	 <table style="width:800px" class="table">
	  <thead>
	    <tr>
	      <th scope="col">#</th>
	      <th scope="col">Titulo</th>
	      <th scope="col">Data de cadastro</th>
	      <th scope="col">Qtd Hospedes</th>
	      <th scope="col">Ações</th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <th scope="row">1</th>
	      <td>casa na praia</td>
	      <td>21/02/2019</td>
	      <td>5</td>
	      <td>
	      	 <button type="button" class="btn btn-primary"><a style="color:white" href="/painel/hospedagem/editar">Editar</a></button>	
	     	 <button type="button" class="btn btn-danger">Excluir</button>
	     	 <button type="button" class="btn btn-warning"><a style="color:black" href="/painel/hospedagem/estadia">Estadias</a></button>	
	      </td>
	    </tr>
	    <tr>
	      <th scope="row">2</th>
	      <td>Pousada</td>
	      <td>20/02/2019</td>
	      <td>10</td>
	       <td>
	      	 <button type="button" class="btn btn-primary"><a style="color:white" href="/painel/hospedagem/editar">Editar</a></button>	
	     	 <button type="button" class="btn btn-danger">Excluir</button>
	     	 <button type="button" class="btn btn-warning"><a style="color:black" href="/painel/hospedagem/estadia">Estadias</a></button>
	      </td>
	    </tr>
	    <tr>
	      <th scope="row">3</th>
	      <td>Apartamento na praia</td>
	      <td>19/02/2019</td>
	      <td>9</td>
	       <td>
	      	 <button type="button" class="btn btn-primary"><a style="color:white" href="/painel/hospedagem/editar">Editar</a></button>	
	     	 <button type="button" class="btn btn-danger">Excluir</button>
	     	 <button type="button" class="btn btn-warning"><a style="color:black" href="/painel/hospedagem/estadia">Estadias</a></button>
	      </td>
	    </tr>
	  </tbody>
	</table>
</div>
  
    <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>

    

  <!-- Bootstrap core JavaScript-->
<script src="../../resources/js/jquery.js"></script>
  <script src="../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../resources/js/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>
