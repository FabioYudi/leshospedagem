<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" media="screen" href="../../../resources/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" media="screen" href="../../../resources/css/common.css">
<meta charset="ISO-8859-1">
<title>Pagamento</title>
</head>
<body class="bg-dark">
<jsp:include page="../../components/navbar.jsp" />
	
	<div class="container">

    <div class="row">
	
   

      <div class="col-lg-9">

        <div class="card mt-4">
          <div class="card-body">
          	<h2>Confirmação de dados</h2>
            <h3 class="card-title">Casa na praia</h3>
            <h4>Diária: R$250,00</h4>
            <p class="card-text">Casa na praia em caraguatatuba, 100 metros da praia</p>
	        <form>
		        <div class="form-group">
		          	<div class="form-row">	
		    			<label for="exampleFormControlSelect1">Selecione Seu cartão de crédito ou cadastre um novo</label>
					    <select class="form-control" id="exampleFormControlSelect1">
					      <option>visa-xxx321</option>
					      <option>master-xxx245</option>
					    </select>
					    <a style="margin-top:20px" class="btn btn-primary" href="/painel/hospedagem/pagamento">Novo Cartão</a>
		          	</div>
		          </div>
		          <div class="form-group">
		          	<div class="form-row">
		          		<div class="form-group">
		          			<label for="exampleFormControlTextarea1">Deixe um comentário para o anfitrião</label>
		   					<textarea style="width:480px;" class="form-control" id="exampleFormControlTextarea1" rows="5"></textarea>
		  				</div>
		          	</div>     
		          </div> 
	        </form>
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
		                  <label for="inputPassword">3 hóspedes</label>
		                  
		                </div>
		              </div>
		            </div>
          		</div>
          		<div class="form-group">
		            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		                  <label for="inputPassword">check-in: 24/03/2019</label>
		                </div>
		              </div>
		              <div class="col-md-6">
		                <div class="form-label-group">
		                  <label for="inputPassword">check-out: 29/03/2019</label>
		                </div>
		              </div>
		            </div>
          		</div>
            </form>
          </div>
        </div>
      </div>
      <!-- /.col-lg-9 -->

    </div>

  </div>

</body>
<script src="../../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/jquery.js"></script>
</html>