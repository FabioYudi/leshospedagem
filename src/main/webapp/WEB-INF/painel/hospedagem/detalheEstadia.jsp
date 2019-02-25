<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <link href="../../../resources/css/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
 		
  <!-- Page level plugin CSS-->
  <link href="../../../resources/js/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../../../resources/css/sb-admin.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Dados Pessoais</title>
</head>
<body class="bg-dark">
<jsp:include page="../../components/hospedagem/modalMotivoHospede.jsp" />  
<jsp:include page="../../components/navbar.jsp" />
<jsp:include page="../../components/sidebar.jsp" />

<div style="margin-top:-35%" class="row">
	<div style="margin-left: 20%; margin-right:-100px" class="col-lg-4">
        <div class="card mt-9 ">
          <div class="card-body">
            <h3 class="card-title">Dados do hóspede</h3>
            <h4>Nome: Fabio Spada</h4>
            <p class="card-text">Email: teste@email.com</p>
            <p class="card-text">Telefone: 1111-1111</p>
            <p class="card-text">data de nascimento: 19/02/1997</p>
            
             <h3 class="card-title">Dados do Anfitrião</h3>
            <h4>Nome: Lucas</h4>
            <p class="card-text">Email: teste@email.com</p>
            <p class="card-text">Telefone: 1111-1111</p>
            <p class="card-text">data de nascimento: 19/02/1997</p>
            
            <h3 class="card-title">Dados da hospedagem</h3>
            <h4>Casa na praia</h4>
            <p class="card-text">Rua teste</p>
            <p class="card-text">5 hóspedes</p>
            <p class="card-text">check-in: 21/02/2019</p>
            <p class="card-text">check-out: 25/02/2019</p>
            <button data-toggle="modal" data-target="#modalMotivo" type="button" class="btn btn-danger">Cancelar Estadia</button>
          </div>
        </div>
        
        <div style="width:350px" class="card card-outline-secondary my-4">
          <div class="card-header">
            Mensagem do hóspede para o anfitrião
          </div>
          <div class="card-body">
            <p>Mensagem do hóspede</p>
           
          </div>
        </div>
        
         
        <div style="width:350px" class="card card-outline-secondary my-4">
          <div class="card-header">
            Avaliações do hóspede
          </div>
          <div class="card-body">
          	<h5>Nota: <strong>5</strong></h5>
            <p>Muito simpático, cuidou bem da casa, recomendo</p>
            <small class="text-muted">Avaliado por: Lucas 24/02/19</small>
            <hr>
          </div>
        </div>
        
         <div style="width:350px" class="card card-outline-secondary my-4">
          <div class="card-header">
            Avaliações do anfitrião
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
      
      
      

</div>

</body>
 <!-- Bootstrap core JavaScript-->
<script src="../../resources/js/jquery.js"></script>
  <script src="../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../resources/js/jquery-easing/jquery.easing.min.js"></script>
</html>