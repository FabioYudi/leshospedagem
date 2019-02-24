<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Cadastro de hospedagem</title>

  <!-- Custom fonts for this template-->
 <link href="../../resources/css/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="../../resources/css/sb-admin.css" rel="stylesheet">
  <!-- Page level plugin CSS-->
  <link href="../../resources/js/datatables/dataTables.bootstrap4.css" rel="stylesheet">

</head>

<body class="bg-dark">

<jsp:include page="../../components/navbar.jsp" />
<jsp:include page="../../components/sidebar.jsp" />
   

    <div style="margin-top:-35%!important" class="card card-register mx-auto ">
      <div class="card-header">Cadastrar Hospedagem</div>
      <div class="card-body">
        <form>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="firstName" class="form-control" placeholder="First name" required="required" autofocus="autofocus">
                  <label for="firstName">Titulo</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="lastName" class="form-control" placeholder="Last name" required="required">
                  <label for="lastName">Categoria</label>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="required">
              <label for="inputEmail">Valor Diária</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="required">
                  <label for="inputPassword">Quantidade de hóspedes</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="password" id="confirmPassword" class="form-control" placeholder="Confirm password" required="required">
                  <label for="confirmPassword">Quantidade de quartos</label>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="email" id="inputLogradouro" class="form-control" placeholder="Logradouro" required="required">
              <label for="inputLogradouro">Logradouro</label>
            </div>
          </div>
           <div class="form-group">
           	 <div class="form-row">
	           	 <div class="col-md-6">
		            <div class="form-label-group">
		              <input style="width:100px" type="email" id="inputNumero" class="form-control" placeholder="Número" required="required">
		              <label for="inputNumero">Número</label>
		            </div>
		          </div> 
		          <div class="col-md-6">
		            <div class="form-label-group">
		              <input style="width:300px" type="email" id="inputBairro" class="form-control" placeholder="Bairro" required="required">
		              <label for="inputBairro">Bairro</label>
		            </div>
		          </div>   
	      	 </div>     
          </div>
          <div class="form-group">
           	 <div class="form-row">
	           	 <div class="col-md-6">
		            <div class="form-label-group">
		              <input style="width:300px" type="email" id="inputCidade" class="form-control" placeholder="Cidade" required="required">
		              <label for="inputCidade">Cidade</label>
		            </div>
		          </div> 
		          <div class="col-md-6">
		            <div class="form-label-group">
		              <input style="width:300px" type="email" id="inputEstado" class="form-control" placeholder="Estado" required="required">
		              <label for="inputEstado">Estado</label>
		            </div>
		          </div>   
	      	 </div>     
          </div>
          <div class="form-group">
          	<div class="form-row">
          		<div class="form-group">
          			<label for="exampleFormControlTextarea1">Descrição</label>
   					<textarea style="width:600px;" class="form-control" id="exampleFormControlTextarea1" rows="5"></textarea>
  				</div>
          	</div>     
          </div>
          <a class="btn btn-primary btn-block" href="login.html">Register</a>
        </form>
        
      </div>
    </div>
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
