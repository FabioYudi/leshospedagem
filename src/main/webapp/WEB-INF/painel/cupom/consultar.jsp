
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Consulta de cupons</title>

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
</style>
</head>

<body class="bg-dark page-tp">
<jsp:include page="../../components/navbar.jsp" />

  <div id="wrapper">

	<jsp:include page="../../components/sidebar.jsp" />
	<div id="content-wrapper">
      	<div class="container-fluid">
      		<div class="card mb-3">
      		<c:if test="${!empty mensagem}">
      			<div class="alert alert-success" role="alert">
  					${mensagem}
				</div>
      		</c:if>
      		<form method="post" id="form-cadastro" action="/painel/hospedagem/filtrar" style="margin-left:20px">
			          <div class="form-group">
			            <div class="form-row">
			              <div class="col-md-2">
			                <div class="form-label-group">
			                  <input type="text" id="titulo"  name="titulo" class="form-control"  >
			                  <label for="titulo">Titulo</label>
			                </div>
			              </div>
			              <div class="col-md-2">
			                <div class="form-label-group">
			                  <input value="0" type="text" id="qtdHospedes" name="qtdHospedes" class="form-control" >
			                  <label for="qtdHospedes">Quatidade de hóspedes</label>
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
					            <div class="form-label-group" >
					              <input style="width:300px; " type="text" name="endereco.cidade" id="cidade" class="form-control"  >
					              <label for="cidade">cidade</label>
					            </div>
					          </div>   
					          <div class="col-md-2">
					            <div class="form-label-group" style="margin-left:100px">
					              <input style="width:300px; " type="text" name="endereco.estado" id="estado" class="form-control"  >
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
		<button data-toggle="modal" data-target="#modalCupom" class="btn btn-danger"><strong>Cadastrar novo cupom</strong></button>                  
          <div class="card-header">
            <i class="fas fa-table"></i>
            Consulta de cupons</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                   	  <th>Codigo</th>
	      			  <th>Valor</th>
				      <th>Validade</th>
				      <th>Status</th>
                  </tr>
                </thead>
               
                <tbody>
                  <c:forEach var="cupom" items="${cupons}">
				  	<tr>
				     
				      <td>${cupom.codigo}</td>
				      <td>${cupom.valor}</td>
				      <td>${cupom.validade}</td>
				      <td>
				      	 <c:choose>
				      	 	<c:when test="${cupom.ativo}">
								<span style="color:green">ATIVO</span>
				      	 	</c:when>
				      	 	<c:otherwise>
								<span style="color:red">INATIVO</span>
				      	 	</c:otherwise>	
				      	 </c:choose>	
				      </td>
				     
				      <td>
				      	 <button type="button" class="btn btn-primary"><a style="color:white" href="/painel/hospedagem/detalhesEdicao/${hospedagem.id}">Editar</a></button>
				      	 <c:choose>
				      	 	<c:when test="${cupom.ativo}">
				      	 		<button onclick="desativarCupom(this)" valor="false" type="button" ativar="false" idCupom="${cupom.id}" class="btn btn-danger">Desativar</button>
				      	 	</c:when>
				      	 	<c:otherwise>
				      	 		<button onclick="desativarCupom(this)" valor="true"  type="button" ativar="true" class="btn btn-success" idCupom="${cupom.id}">Ativar</button>
				      	 		
				      	 	</c:otherwise>	
				      	 </c:choose>
						 <a class="btn btn-warning style="color:black" href="/painel/hospedagem/consultar/reservas/${hospedagem.id}">Reservas</a>
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

  
    <form method="POST" class="hide" id="formDesativar" action="/painel/hospedagem/consultarAtualizacao">
    	<input id="mensagem" name="mensagem"></input>
    </form>



  <!-- Bootstrap core JavaScript-->
<script src="../../../resources/js/jquery.js"></script>
  <script src="../../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../../resources/js/jquery-easing/jquery.easing.min.js"></script>
  <jsp:include page="../../components/modal/cupom/modalCupom.jsp" />

</body>

<script>
	function desativarCupom(botao){
		var id = $(botao).attr("idHospedagem");
		$.ajax({
			 method: "GET",
			 url: "/cupom/desativar/" + $(botao).attr("idCupom") + "/" + $(botao).attr("ativar"),
			 data: {},
			 success: function(data) {
				 window.location.reload()
		        
		      },
		      error: function(){
		    	  
		      }
		});
	}
	
	function cadastrarCupom(botao){
		var data = {
			codigo: $("#codigoCupom").val(),
			valor: $("#valorCupom").val(),
			validade: $("#validadeCupom").val(),
			ativo: $("#radioAtivo").prop("checked")
			
		};
		$.ajax({
			 method: "POST",
			 url: "/cupom/cadastrar",
			 data: {cupom: JSON.stringify(data)},
			 success: function(data) {
		        data = JSON.parse(data);
		        if(data.ok == true){
		        	
		        	$("#mensagem").val(data.mensagem);
		        	 window.location.reload()
		        }else{
		        	$("#alertaErroCupom").html(data.mensagem);
		        	$("#alertaErroCupom").removeClass("hide");
		        }
		      },
		      error: function(){
		    	  
		      }
		});
	}
</script>

</html>
