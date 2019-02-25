<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link type="text/css" rel="stylesheet" media="screen" href="../../../resources/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" media="screen" href="../../../resources/css/common.css">
<meta charset="ISO-8859-1">
<title>Detalhes</title>
<jsp:include page="../../components/navbar.jsp" />
</head>
<body class="bg-dark">
	
  
  <!-- Page Content -->
  <div class="container">

    <div class="row">
	
   

      <div class="col-lg-9">

        <div class="card mt-4">
          <img class="card-img-top img-fluid" src="https://q-ec.bstatic.com/images/hotel/max1024x768/853/85381305.jpg" alt="">
          <div class="card-body">
            <h3 class="card-title">Casa na praia</h3>
            <h4>Diária: R$250,00</h4>
            <p class="card-text">Casa na praia em caraguatatuba, 100 metros da praia</p>
           
          </div>
         
        </div>
        
        <!-- /.card -->


        <div class="card card-outline-secondary my-4">
          <div class="card-header">
            Avaliações da hospedagem
          </div>
          <div class="card-body">
          	<h5>Nota: <strong>5</strong></h5>
            <p>Muito bom, recomendo!</p>
            <small class="text-muted">Avaliado por: Fabio Spada 24/02/19</small>
            <hr>
          </div>
        </div>
        <div class="card card-outline-secondary my-4">
          <div class="card-header">
            Avaliações do anfitrião
          </div>
          <div class="card-body">
          	<h5>Nota: <strong>5</strong></h5>
            <p>Muito simpático, recomendo</p>
            <small class="text-muted">Avaliado por: Fabio Spada 24/02/19</small>
            <hr>
          </div>
        </div>
        <!-- /.card -->

      </div>
      <div class="col-lg-3">
        <div style="width:300px"class="card mt-4">
        	<div class="card-body">
            <h4>Total: R$250,00</h4>
            <form>
            	<div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		                  <label for="inputPassword">Qtd hóspedes</label>
		                  <input type="text" id="inputPassword" class="form-control" placeholder="" required="required"> 
		                </div>
		              </div>
		            </div>
          		</div>
          		<div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		                  <label for="inputPassword">check-in</label>
		                  <input type="text" id="inputPassword" class="form-control" placeholder="" required="required"> 
		                </div>
		              </div>
		              <div class="col-md-6">
		                <div class="form-label-group">
		                  <label for="inputPassword">check-out</label>
		                  <input type="text" id="inputPassword" class="form-control" placeholder="" required="required"> 
		                </div>
		              </div>
		            </div>
          		</div>
          		 <a class="btn btn-primary btn-block" href="/painel/hospedagem/pagamento">Reservar</a>
            </form>
          </div>
        </div>
      </div>
      <!-- /.col-lg-9 -->

    </div>

  </div>
  <!-- /.container -->

 
</body>
<!-- Bootstrap core JavaScript -->
<script src="../../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/jquery.js"></script>
</html>