
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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

.hide{
	display: none;
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
      		<div class="alert alert-danger hide" id="alertaExcluir" role="alert">
  					
				</div>
      		<c:if test="${!empty mensagem}">
      			<div class="alert alert-success" id="alertaMensagem" role="alert">
  					${mensagem}
				</div>
      		</c:if>
      		<form method="post" id="form-cadastro" action="/painel/hospedagem/filtrar" style="margin-left:20px">
			          <div class="form-group">
			            <div class="form-row">
			              <div class="col-md-2">
			                <div class="form-label-group">
			                  <input type="text" id="titulo"  name="titulo" class="form-control"  >
			                  <label for="titulo">Logradouro</label>
			                </div>
			              </div>
			              <div class="col-md-2">
			                <div class="form-label-group">
			                  <input value="0" type="text" id="qtdHospedes" name="qtdHospedes" class="form-control" >
			                  <label for="qtdHospedes">Quatidade de h�spedes</label>
			                </div>
			              </div>
			              <div class="col-md-2">
			                <div class="form-label-group">
			                  <input value="0" type="text" id="qtdQuartos" name="qtdQuartos" class="form-control"  >
			                  <label for="qtdQuartos">Quantidade de quartos</label>
			                </div>
			              </div>
			            </div>
			             <div class="form-row" style="margin-top:20px; margin-bottom:10px">
				           	 <div class="col-md-2">
					            <div class="form-label-group">
					              <input  type="text" id="logradouro" name="endereco.logradouro" class="form-control" >
					              <label for="logradouro">logradouro</label>
					            </div>
					          </div> 
					          <div class="col-md-2">
					            <div class="form-label-group">
					              <input style="width:300px" type="text" name="endereco.cidade" id="cidade" class="form-control"  >
					              <label for="cidade">cidade</label>
					            </div>
					          </div>   
					          <div class="col-md-2">
					            <div class="form-label-group">
					              <input style="width:300px" type="text" name="endereco.estado" id="estado" class="form-control"  >
					              <label for="estado">estado</label>
					            </div>
					          </div>   
				      	 </div>  
				      	 <span style="margin-top:30px">Status</span>	
				      	 <div class="form-row">
				      	 	
				      	 	<select name="ativo" style="width: 200px; margin-left:5px" class="form-control" id="ativo">
						      <option value="">Selecione...</option>
						      <option value="true">Ativo</option>
						      <option value="false">Inativo</option>
						    </select>
						   <div class="col-md-2">
					            <div class="form-label-group">
					              <button type="submit" class="btn btn-primary">Buscar</button>
					            </div>
					          </div>  
				      	 </div>   
			          </div>
			     </form>   
			     <button data-toggle="modal" data-target="#modalCadastrarEndereco" class="btn btn-danger"><strong>Cadastrar novo endere�o</strong></button>  
          <div class="card-header">
            <i class="fas fa-table"></i>
            Consulta de hospedagens</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                   	  <th>Logradouro</th>
	      			  <th>N�mero</th>
				      <th>Bairro</th>
				      <th>CEP</th>
				      <th>Complemento</th>
				      <th>Estado</th>
				      <th>Cidade</th>
				      <th>Status</th>
                  </tr>
                </thead>
               
                <tbody>
                   <c:forEach var="endereco" items="${cliente.enderecos}">
				  	<tr>
				      <th scope="row">${endereco.logradouro}</th>
				      <td>${endereco.numero}</td>
				      <td>${endereco.bairro}</td>
				      <td>${endereco.cep}</td>
				      <td>${endereco.complemento}</td>
				      <td>${endereco.estado}</td>
				      <td>${endereco.cidade}</td>
				      
				     
				      <td>
				      	 <button type="button" idEndereco="${endereco.id}"  onclick="getDadosEndereco(this)" class="btn btn-primary"><a style="color:white" href="javascript:;}">Editar</a></button>
				      	 <c:choose>
				      	 	<c:when test="${!endereco.principal}">
				      	 		<button onclick="setPrincipal(this)" valor="true" type="button" idCliente="${cliente.id}" idEndereco="${endereco.id}" class="btn btn-success">Selecionar como principal</button>
				      	 	</c:when>
				      	 	<c:otherwise>
				      	 		<button  valor="true" type="button" class="btn btn-warning">Este � seu endere�o principal</button>
				      	 		
				      	 	</c:otherwise>	
				      	 </c:choose>
				      	 
				     	 
				     	 <button onclick="excluir(this)" valor="true"  type="button" class="btn btn-danger" idCliente="${cliente.id}" idEndereco="${endereco.id}">Excluir</button>	
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

  
    <form method="POST" id="formDesativar" class="hide" action="/painel/hospedagem/consultarAtualizacao">
    	<input id="mensagem" name="mensagem"></input>
    </form>

<button data-toggle="modal" data-target="#modalEditarEndereco" class="hide" id="botaoModalEndereco"></button>
    

  <!-- Bootstrap core JavaScript-->
<jsp:include page="../../components/modal/cliente/cadastrarEndereco.jsp" />

</body>

<script>
	function desativar(botao){
		var id = $(botao).attr("idHospedagem");
		$.ajax({
			 method: "POST",
			 url: "/painel/hospedagem/desativar/" + id + "/" + $(botao).attr("valor"),
			 data: {},
			 success: function(data) {
		        data = JSON.parse(data);
		        if(data.ok == true){
		        	
		        	$("#mensagem").val(data.mensagem);
		        	$("#formDesativar").submit();
		        }else{
		        	
		        }
		      },
		      error: function(){
		    	  
		      }
		});
	}
	
	function setPrincipal(botao){
		$.ajax({
			 method: "POST",
			 url: "/cliente/endereco/setarComoPrincipal/" + $(botao).attr("idEndereco") + "/" + $(botao).attr("idCliente"),
			 data: {},
			 success: function(data) {
		        data = JSON.parse(data);
		        if(data.ok == true){
		        	
		        	 $("#mensagemEdicao").val(data.mensagem);
		        	 $("#formDados").submit();
		        }else{
		        	
		        }
		      },
		      error: function(){
		    	  
		      }
		});
	}
	
	
	function excluir(botao){
		$.ajax({
			 method: "POST",
			 url: "/cliente/endereco/excluirEndereco/" + $(botao).attr("idEndereco") + "/" + $(botao).attr("idCliente"),
			 data: {},
			 success: function(data) {
		        data = JSON.parse(data);
		        if(data.ok == true){
		        	$("#alertaExcluir").removeClass("hide");
		        	$("#alertaExcluir").html("Endere�o excluido com sucesso!");
		        	 $("#mensagemEdicao").val(data.mensagem);
		        	 $("#formDados").submit();
		        }else{
		        	$("#alertaMensagem").addClass("hide");
		        	$("#alertaExcluir").removeClass("hide");
		        	$("#alertaExcluir").html(data.mensagem);
				
		        }
		      },
		      error: function(){
		    	  
		      }
		});
	}

	
	
</script>
<script src="../../../resources/js/jquery.js"></script>
  <script src="../../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../../resources/js/jquery-easing/jquery.easing.min.js"></script>
  <script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
  <script src="../../../resources/js/jquery.js"></script>
</html>
