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
 <link href="../../../resources/css/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="../../../resources/css/sb-admin.css" rel="stylesheet">
  <!-- Page level plugin CSS-->
  <link href="../../../resources/js/datatables/dataTables.bootstrap4.css" rel="stylesheet">

</head>

<body class="bg-dark page-top">

<jsp:include page="../../components/navbar.jsp" />

<div id="wrapper">

<jsp:include page="../../components/sidebar.jsp" />

    <div id="content-wrapper">

      <div class="container-fluid">

        
        <!-- Icon Cards-->
        <div class="row" style="margin-left: 50px">
          <div style="background-color:white; color:black"  class="col-xl-4 col-sm-7 mb-3 ">
            <div class="card-header">Cadastrar Hospedagem</div>
			      <div class="card-body">
			        <form  id="form-cadastro">
			          <div class="form-group">
			            <div class="form-row">
			              <div class="col-md-6">
			                <div class="form-label-group">
			                  <input type="text" id="titulo"  name="titulo" class="form-control" placeholder="First name" required="required" autofocus="autofocus">
			                  <label for="titulo">Titulo</label>
			                </div>
			              </div>
			              <div class="col-md-6">
			                <div class="form-label-group">
			                  <input type="text" id="categoria" name="categoria" class="form-control" placeholder="Last name" required="required">
			                  <label for="categoria">Categoria</label>
			                </div>
			              </div>
			            </div>
			          </div>
			          <div class="form-group">
			            <div class="form-label-group">
			              <input type="email" id="valorDiaria" name="diaria" class="form-control" placeholder="Email address" required="required">
			              <label for="valorDiaria">Valor Diária</label>
			            </div>
			          </div>
			          <div class="form-group">
			            <div class="form-row">
			              <div class="col-md-6">
			                <div class="form-label-group">
			                  <input type="text" id="qtdHospedes" name="qtdHospedes" class="form-control" placeholder="Password" required="required">
			                  <label for="qtdHospedes">Quantidade de hóspedes</label>
			                </div>
			              </div>
			              <div class="col-md-6">
			                <div class="form-label-group">
			                  <input type="text" id="qtdQuartos" name="qtdQuartos" class="form-control" placeholder="Confirm password" required="required">
			                  <label for="qtdQuartos">Quantidade de quartos</label>
			                </div>
			              </div>
			            </div>
			          </div>
			           <div class="form-group">
			            <div class="form-row">
			              <div class="col-md-6">
			                <div class="form-label-group">
			                  <input type="date" id="dataInicio" name="dataInicio" class="form-control" placeholder="Password" required="required">
			                  <label for="dataInicio">Data inicio</label>
			                </div>
			              </div>
			              <div class="col-md-6">
			                <div class="form-label-group">
			                  <input type="date" id="dataFim" name="dataFim" class="form-control" placeholder="Confirm password" required="required">
			                  <label for="dataFim">Data Fim</label>
			                </div>
			              </div>
			            </div>
			          </div>
			          <div class="form-group">
			          	<div class="form-row">
			          		<div class="form-group">
			          			<label for="exampleFormControlTextarea1">Descrição</label>
			   					<textarea name="descricao"  style="width:600px;" class="form-control" id="descricao" rows="5"></textarea>
			  				</div>
			          	</div>     
			          </div>
			        </form>
			        
			      </div>
          </div>
          
          <div style="background-color:white; color:black" class="col-xl-4 col-sm-7 mb-3 ">
		        <div class="card-header"></div>
			      <div class="card-body">
			        <form  id="form-endereco">
			         <div class="form-group">
			            <div class="form-label-group">
			              <input type="text" id="logradouro" name="logradouro" class="form-control" placeholder="Logradouro" required="required">
			              <label for="logradouro">Logradouro</label>
			            </div>
			          </div>
			           <div class="form-group">
			           	 <div class="form-row">
				           	 <div class="col-md-6">
					            <div class="form-label-group">
					              <input style="width:100px" type="text" id="numero" name="numero" class="form-control" placeholder="Número" required="required">
					              <label for="numero">Número</label>
					            </div>
					          </div> 
					          <div class="col-md-6">
					            <div class="form-label-group">
					              <input style="width:300px" type="email" name="bairro" id="bairro" class="form-control" placeholder="Bairro" required="required">
					              <label for="bairro">Bairro</label>
					            </div>
					          </div>   
				      	 </div>     
			          </div>
			          <div class="form-group">
			           	 <div class="form-row">
				           	 <div class="col-md-6">
					            <div class="form-label-group">
					              <input style="width:300px" type="text"  name="cidade" id="cidade" class="form-control" placeholder="Cidade" required="required">
					              <label for="cidade">Cidade</label>
					            </div>
					          </div> 
					          <div class="col-md-6">
					            <div class="form-label-group">
					              <input style="width:300px" type="email" name="estado" id="estado" class="form-control" placeholder="Estado" required="required">
					              <label for="estado">Estado</label>
					            </div>
					          </div>   
				      	 </div>     
			          </div>
			          <div class="form-group">
			          	<div class="form-row">
				        <div class="col-md-6">
				            <div class="form-label-group">
				              <input style="width:300px" type="TEXT" id="cep" name="cep" class="form-control" placeholder="Logradouro" required="required">
				              <label for="cep">CEP</label>
				            </div>
				        </div>
				        <div class="col-md-6">
					            <div class="form-label-group">
					              <input style="width:300px" type="email" name="complemento" id="complemento" class="form-control" placeholder="Estado" required="required">
					              <label for="complemento">Complemento</label>
					            </div>
					          </div>  
				      </div>  
			         </div>
			        </form>
			        <form  id="form-taxa" style="margin-top:20px">
			        	<div class="card-header">Taxas</div>
			        	<a type="button" class="btn btn-danger"  style="margin-bottom:20px; color:white; margin-top:10px" id="adicionarTaxa">Adicionar Taxa</a>
					         <div class="form-group" id="taxas">
						         <div class="row">
						            <div class="col-md-6">
							            <div class="form-label-group">
							              <input style="width:300px" type="text" id="inputTituloTaxa"  name="nome" class="form-control" placeholder="Número" required="required">
							              <label for="inputTituloTaxa">Titulo</label>
							            </div>
							          </div> 
							          <div class="col-md-6">
							            <div class="form-label-group">
							              <input style="width:120px" type="text" id="inputValorTaxa" name="valor" class="form-control" placeholder="Bairro" required="required">
							              <label for="inputValorTaxa">Valor</label>
							            </div>
							          </div>   
						          </div>
					         </div> 
			         </form> 
			         <a class="btn btn-primary btn-block" style="color:white" onclick="cadastrar()"  id="btn-cadastrar">Cadastrar</a>
			        
			      </div>
          </div>
        </div>

        

       

      </div>
      <!-- /.container-fluid -->

      

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->
		    

    

  <!-- Bootstrap core JavaScript-->
<script src="../../../resources/js/jquery.js"></script>
  <script src="../../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../../resources/js/jquery-easing/jquery.easing.min.js"></script>

</body>
<script>
var i = 0;
$("#adicionarTaxa").click(function(){
	i = i + 1;
	$("#taxas").append(
	'<div class="row" style="margin-top:15px">'
    + '<div class="col-md-6">'
        +'<div class="form-label-group">'
        +'<input style="width:300px" type="text" id="inputTituloTaxa" value=""  name="nome" class="form-control" placeholder="Número" required="required">'
        +'<label for="inputTituloTaxa">Titulo</label>'
        +'</div>'
      +'</div> '
      +'<div class="col-md-6">'
        +'<div class="form-label-group">'
          +'<input style="width:120px" type="text" id="inputValorTaxa" name="valor" class="form-control" placeholder="Bairro" required="required">'
          +'<label for="inputValorTaxa">Valor</label>'
        +'</div>'
      +'</div>'
  +'</div>');
});


	function cadastrar(){
		var action = { action: "SALVAR"}
		var data = {
		        	   titulo: $("#titulo").val(),
		        	   categoria: $("#categoria").val(),
		        	   diaria: $("#valorDiaria").val(),
		        	   qtdHospedes: $("#qtdHospedes").val(),
		        	   qtdQuartos: $("#qtdQuartos").val(),
		        	   dataInicio: $("#dataInicio").val(),
		        	   dataFim: $("#dataFim").val(),
		        	   descricao:$("#descricao").val(),
		        	   taxas: [{nome:"teste", valor: "23"}],
		        	   endereco: {
		        		   logradouro:$("#logradouro").val(),
		        		   numero:$("#numero").val(),
		        		   bairro:$("#bairro").val(),
		        		   cep:$("#cep").val(),
		        		   estado:$("#estado").val(),
		        		   cidade:$("#cidade").val(),
		        		   complemento:$("#complemento").val()
		        	   }
		       
		       };
		$.ajax({
			 method: "POST",
			 url: "/painel/hospedagem/processar",
			 data: {action: "SALVAR", entidade: JSON.stringify(data)},
			 success: function(data) {
		         console.log("oi");
		      },
		      error: function(){
		    	  
		      }
		});
	}
</script>
</html>
