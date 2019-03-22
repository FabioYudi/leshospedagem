<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <!-- Custom fonts for this template-->
 <link href="../../resources/css/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="../../resources/css/sb-admin.css" rel="stylesheet">
  <!-- Page level plugin CSS-->
  <link href="../../resources/js/datatables/dataTables.bootstrap4.css" rel="stylesheet">
   <!-- Bootstrap core JavaScript-->
<script src="../../resources/js/jquery.js"></script>
  <script src="../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../resources/js/jquery-easing/jquery.easing.min.js"></script>
<style>
label{
	color: white;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="bg-dark">
<jsp:include page="../components/navbar.jsp" />
<div id="wrapper">
	<jsp:include page="../components/sidebar.jsp" />
	<div id="content-wrapper">
      	<div class="container-fluid">
      		<form style="margin-left:20px; margin-top:20px">
				  <div class="form-row">
				    <div class="form-group col-md-2">
				      <label for="email">Email</label>
				      <input value="${cliente.email}" type="email" class="form-control" id="email" >
				    </div>
				    <div class="form-group col-md-2">
				      <label for="nome">Nome</label>
				      <input value="${cliente.nome}" type="text" class="form-control" id="nome" placeholder=>
				    </div>
				  </div>
				  <div class="form-row">
				    <div class="form-group col-md-2">
				      <label for="dtNascimento">Data de nascimento</label>
				      <input value="${cliente.dtNascimento}" type="date" class="form-control" id="dtNascimento" >
				    </div>
				    <div class="form-group col-md-2">
				      <label for="cpf">CPF</label>
				      <input value="${cliente.cpf}" type="text" class="form-control" id="cpf" >
				    </div>
				    <div class="form-group col-md-2">
				      <label for="genero">Gênero</label>
				      <select  id="genero" class="form-control">
				        <option value="masculino" selected>Masculino</option>
				        <option value="feminino" >Feminino</option>
				        <option value="outros">Outros...</option>
				       </select>
				    </div>
				  </div>

				  <button type="button" onclick="cadastrar()" class="btn btn-primary">Editar</button>
				</form>
      	</div>
    </div>  
    
    
    
   </div> 	
   
   <input id="id" value="${cliente.id}">



</body>
<script>
$("#genero option").each(function(){
	if("${cliente.genero}" == $(this).val()){
		$(this).attr("selected", true);
	}
});

	function cadastrar(){
		var data = {
				   id: $("#id").val(),
	        	   nome: $("#nome").val(),
	        	   email: $("#email").val(),
	        	   senha: $("#senha").val(),
	        	   dataNascimento: $("#dtNascimento").val(),
	        	   cpf: $("#cpf").val(),
	        	   genero: $("#genero").val(),
	        	   enderecos: [{
	        		   logradouro:$("#logradouro").val(),
	        		   numero:$("#numero").val(),
	        		   bairro:$("#bairro").val(),
	        		   cep:$("#cep").val(),
	        		   estado:$("#estado").val(),
	        		   cidade:$("#cidade").val(),
	        		   complemento:$("#complemento").val()
	        	   }]
	       
	       };
	$.ajax({
		 method: "POST",
		 url: "/cliente/editar",
		 data: { cliente: JSON.stringify(data)},
		 success: function(data) {
			 data = JSON.parse(data);
	         if(data.ok == true){
	        	 $("#mensagem").val(data.mensagem);
	        	 $("#formConsultar").submit();
	         }else{
	        	 $("#alertaErro").removeClass("hide");
	        	 $("#alertaErro").html(data.mensagem);
	         }
	      },
	      error: function(){
	    	  
	      }
	});
	}

</script>
</html>