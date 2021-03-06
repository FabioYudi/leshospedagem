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
<style>
	.hide{
		display:none;
	}
</style>
</head>

<body class="bg-dark page-top">

<jsp:include page="../../components/navbar.jsp" />

<div id="wrapper">

<jsp:include page="../../components/sidebar.jsp" />

    <div id="content-wrapper">

      <div class="container-fluid">

        
        <!-- Icon Cards-->
        <div id="alertaErro" class="alert alert-warning hide" role="alert"></div>
        
        <div class="row" style="margin-left: 50px">
          <div style="background-color:white; color:black"  class="col-xl-6 col-sm-7 mb-3 ">
            <div class="card-header">Editar Hospedagem</div>
			      <div class="card-body">
			        <form  id="form-cadastro">
			          <div class="form-group">
			            <div class="form-row">
			              <div class="col-md-6">
			                <div class="form-label-group">
			                  <input type="text" id="titulo"  name="titulo" class="form-control" value="${hospedagem.titulo}" placeholder="First name" required="required" autofocus="autofocus">
			                  <label for="titulo">Titulo</label>
			                </div>
			              </div>
			              <div class="col-md-6">
			                <div class="form-label-group">
			                  <input type="text" id="categoria" name="categoria" value="${hospedagem.categoria}" class="form-control" placeholder="Last name" required="required">
			                  <label for="categoria">Categoria</label>
			                </div>
			              </div>
			            </div>
			          </div>
			          <div class="form-group">
			            <div class="form-label-group">
			              <input type="email" id="valorDiaria" name="diaria" value="${hospedagem.diaria}" class="form-control" placeholder="Email address" required="required">
			              <label for="valorDiaria">Valor Di�ria</label>
			            </div>
			          </div>
			          <div class="form-group">
			            <div class="form-row">
			              <div class="col-md-6">
			                <div class="form-label-group">
			                  <input type="text" id="qtdHospedes" name="qtdHospedes" value="${hospedagem.qtdHospedes}" class="form-control" placeholder="Password" required="required">
			                  <label for="qtdHospedes">Quantidade de h�spedes</label>
			                </div>
			              </div>
			              <div class="col-md-6">
			                <div class="form-label-group">
			                  <input type="text" id="qtdQuartos" name="qtdQuartos" value="${hospedagem.qtdQuartos}" class="form-control" placeholder="Confirm password" required="required">
			                  <label for="qtdQuartos">Quantidade de quartos</label>
			                </div>
			              </div>
			            </div>
			          </div>
			           <div class="form-group">
			            <div class="form-row">
			              <div class="col-md-6">
			                <div class="form-label-group">
			                  <input type="date" id="dataInicio" name="dataInicio" value="${hospedagem.dataInicio}" class="form-control" placeholder="Password" required="required">
			                  <label for="dataInicio">Data inicio</label>
			                </div>
			              </div>
			              <div class="col-md-6">
			                <div class="form-label-group">
			                  <input type="date" id="dataFim" name="dataFim" value="${hospedagem.dataFim}" class="form-control" placeholder="Confirm password" required="required">
			                  <label for="dataFim">Data Fim</label>
			                </div>
			              </div>
			            </div>
			          </div>
			          <div class="form-group">
			          	<div class="form-row">
			          		<div class="form-group">
			          			<label for="exampleFormControlTextarea1">Descri��o</label>
			   					<textarea name="descricao"  style="width:600px;"  class="form-control" id="descricao" rows="5">${hospedagem.descricao}</textarea>
			  				</div>
			          	</div>     
			          </div>
			        </form>
			        
			      </div>
          </div>
          
          <div style="background-color:white; color:black" class="col-xl-6 col-sm-7 mb-3 ">
		        <div class="card-header"></div>
			      <div class="card-body">
			        <form  id="form-endereco">
			         <div class="form-group">
			         	<input id="idHospedagem" value="${hospedagem.id}" name="id" style="display:none"/>
			            <div class="form-label-group">
			              <input type="text" id="logradouro" name="logradouro" value="${hospedagem.endereco.logradouro}" class="form-control" placeholder="Logradouro" required="required">
			              <label for="logradouro">Logradouro</label>
			            </div>
			          </div>
			           <div class="form-group">
			           	 <div class="form-row">
				           	 <div class="col-md-6">
					            <div class="form-label-group">
					              <input style="width:100px" type="text" value="${hospedagem.endereco.numero}" id="numero" name="numero" class="form-control" placeholder="N�mero" required="required">
					              <label for="numero">N�mero</label>
					            </div>
					          </div> 
					          <div class="col-md-6">
					            <div class="form-label-group">
					              <input style="width:300px" type="email" value="${hospedagem.endereco.bairro}" name="bairro" id="bairro" class="form-control" placeholder="Bairro" required="required">
					              <label for="bairro">Bairro</label>
					            </div>
					          </div>   
				      	 </div>     
			          </div>
			          <div class="form-group">
			           	 <div class="form-row">
				           	 <div class="col-md-6">
					            <div class="form-label-group">
					              <input style="width:300px" type="text" value="${hospedagem.endereco.cidade}" name="cidade" id="cidade" class="form-control" placeholder="Cidade" required="required">
					              <label for="cidade">Cidade</label>
					            </div>
					          </div> 
					          <div class="col-md-6">
					            <div class="form-label-group">
					              <input style="width:300px" type="email" value="${hospedagem.endereco.estado}" name="estado" id="estado" class="form-control" placeholder="Estado" required="required">
					              <label for="estado">Estado</label>
					            </div>
					          </div>   
				      	 </div>     
			          </div>
			          <div class="form-group">
			          	<div class="form-row">
				        <div class="col-md-6">
				            <div class="form-label-group">
				              <input style="width:300px" type="TEXT" value="${hospedagem.endereco.cep}" id="cep" name="cep" class="form-control" placeholder="Logradouro" required="required">
				              <label for="cep">CEP</label>
				            </div>
				        </div>
				        <div class="col-md-6">
					            <div class="form-label-group">
					              <input style="width:300px" type="email" name="complemento" value="${hospedagem.endereco.complemento}" id="complemento" class="form-control" placeholder="Estado" required="required">
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
							              <input style="width:300px" type="text" id="inputTituloTaxa" value=""  name="nome" class="form-control" placeholder="N�mero" required="required">
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
			         <input class="hide" name="ativo" id="ativo" value="${hospedagem.ativo}">
			         <a class="btn btn-primary btn-block" style="color:white" onclick="cadastrar()"  id="btn-cadastrar">Editar</a>
			        
			      </div>
          </div>
        </div>

        

       

      </div>
      <!-- /.container-fluid -->

      

    </div>



  </div>
  <!-- /#wrapper -->
		    
	
    

  <!-- Bootstrap core JavaScript-->
<script src="../../../resources/js/jquery.js"></script>
  <script src="../../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../../resources/js/jquery-easing/jquery.easing.min.js"></script>
	<form method="post" style="display:none" id="formConsulta" action="/painel/hospedagem/consultarAtualizacao/">
		<input type="text" id="mensagem" name="mensagem" />
	
	</form>
</body>


<script>

$(document).ready(function(){
	debugger;
	var dataInicio = "${hospedagem.dataInicio}";
	var dataFim = "${hospedagem.dataFim}";
	dataInicio = dataInicio.substr(0,10);
	dataFim = dataFim.substr(0,10);
	$("#dataInicio").val(dataInicio);
	$("#dataFim").val(dataFim);
});

	$("#adicionarTaxa").click(function(){
		$("#taxas").append(
		'<div class="row" style="margin-top:15px">'
        + '<div class="col-md-6">'
            +'<div class="form-label-group">'
            +'<input style="width:300px" type="text" id="inputTituloTaxa" value=""  name="nome" class="form-control" placeholder="N�mero" required="required">'
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
		if($("#dataFim").val() == ""){
			$("#dataFim").val("1111-11-11");
		}
		if($("#dataInicio").val() == ""){
			$("#dataInicio").val("1111-11-11");
		}
		
		if($("#qtdHospedes").val() == ""){
			$("#qtdHospedes").val("0");
		}
		
		if($("#qtdQuartos").val() == ""){
			$("#qtdQuartos").val("0");
		}
		
		if($("#valorDiaria").val() == ""){
			$("#valorDiaria").val("0");
		}
		
		
		
		
		var action = { action: "ALTERAR"}
		
		var data = {
					   id: $("#idHospedagem").val(),
		        	   titulo: $("#titulo").val(),
		        	   categoria: $("#categoria").val(),
		        	   diaria: $("#valorDiaria").val(),
		        	   qtdHospedes: $("#qtdHospedes").val(),
		        	   qtdQuartos: $("#qtdQuartos").val(),
		        	   dataInicio: $("#dataInicio").val(),
		        	   dataFim: $("#dataFim").val(),
		        	   descricao:$("#descricao").val(),
		        	   taxas: [{nome:"teste", valor: "23"}],
		        	   ativo: $("#ativo").val(),
		        	   endereco: {
		        		   logradouro:$("#logradouro").val(),
		        		   numero:$("#numero").val(),
		        		   bairro:$("#bairro").val(),
		        		   cep:$("#cep").val(),
		        		   estado:$("#estado").val(),
		        		   cidade:$("#cidade").val(),
		        		   principal: false,
		        		   complemento:$("#complemento").val()
		        	   }
		       
		       };
		$.ajax({
			 method: "POST",
			 url: "/painel/hospedagem/editar/",
			 data: {hospedagem: JSON.stringify(data)},
			 success: function(data) {
				 data = JSON.parse(data);
				 if(data.ok == true){
					$("#mensagem").val(data.mensagem);
					$("#formConsulta").submit();
				 }else{
					 $("#alertaErro").removeClass("hide");
		        	 $("#alertaErro").html(data.mensagem);
				 }
 
		      },
		      error: function(){
		    	    $("#alertaErro").removeClass("hide");
		        	 $("#alertaErro").html("Ocorreu um erro ao editar a hospedagem, por favor, tente novamente mais tarde");

		      }
		});
	}
</script>
</html>
