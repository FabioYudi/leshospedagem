<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<jsp:include page="../components/sidebar.jsp" />

<div class="row">
	<div style="margin-left: 20%" class="col-lg-4">

        <div class="card mt-9">
          <div class="card-body">
            <h3 class="card-title">Dados</h3>
            <h4>Nome: Fabio Spada</h4>
            <p class="card-text">Email: teste@email.com</p>
            <p class="card-text">Telefone: 1111-1111</p>
            <p class="card-text">data de nascimento: 19/02/1997</p>
           	<a href="/cliente/cadastrar" class="btn btn-block btn-primary" >Editar Dados</a>
          </div>
         
        </div>
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
        
        <!-- /.card -->

      </div>

</div>

</body>
<script src="../../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/jquery.js"></script>
</html>