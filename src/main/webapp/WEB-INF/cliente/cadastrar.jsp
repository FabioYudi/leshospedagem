<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../resources/js/jquery.js"></script>
<script src="../../resources/js/moment.js"></script>
 <link href="../../resources/css/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
 <link href="../../resources/js/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <link href="../../../resources/js/datatables/dataTables.bootstrap4.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" media="screen" href="../../resources/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" media="screen" href="../../resources/css/common.css">
<style>
label{
	color: white;
}
.hide{
	display:none;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="bg-dark">
<jsp:include page="../components/navbar.jsp" />
				<div class="alert alert-danger hide" id="alert" role="alert">
  					
				</div>
<form style="margin-left:20px; margin-top:20px">
  <div class="form-row">
    <div class="form-group col-md-2">
      <label for="email">Email</label>
      <input type="email" class="form-control" id="email" >
    </div>
    <div class="form-group col-md-2">
      <label for="senha">Senha</label>
      <input type="password" class="form-control" id="senha" >
    </div>
    <div class="form-group col-md-2">
      <label for="nome">Nome</label>
      <input type="text" class="form-control" id="nome" placeholder=>
    </div>
    <div class="form-group col-md-2">
      <label for="nome">Telefone</label>
      <input type="text" class="form-control" id="telefone" placeholder=>
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-2">
      <label for="dtNascimento">Data de nascimento</label>
      <input type="date" class="form-control" id="dtNascimento" >
    </div>
    <div class="form-group col-md-2">
      <label for="cpf">CPF</label>
      <input type="text" class="form-control" id="cpf" >
    </div>
    <div class="form-group col-md-2">
      <label for="genero">G�nero</label>
      <select id="genero" class="form-control">
        <option value="masculino" selected>Masculino</option>
        <option value="feminino" >Feminino</option>
        <option value="outros">Outros...</option>
       </select>
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-2">
      <label for="logradouro">Logradouro</label>
      <input type="text" class="form-control" id="logradouro" >
    </div>
    <div class="form-group col-md-2">
      <label for="numero">N�mero</label>
      <input type="text" class="form-control" id="numero" >
    </div>
    <div class="form-group col-md-2">
      <label for="cep">CEP</label>
      <input type="text" class="form-control" id="cep" >
    </div>
    
  </div>
  <div class="form-row">
  	<div class="form-group col-md-2">
      <label for="bairro">Bairro</label>
      <input type="text" class="form-control" id="bairro" >
    </div>
    <div class="form-group col-md-2">
      <label for="cidade">Cidade</label>
      <input type="text" class="form-control" id="cidade" >
    </div>
    <div class="form-group col-md-2">
      <label for="estado">Estado</label>
      <input type="text" class="form-control" id="estado" >
    </div>
    
  </div>
  <div class="form-row">
  	<div class="form-group col-md-2">
      <label for="complemento">Complemento</label>
      <input type="text" class="form-control" id="complemento" >
    </div>
   </div>
    
  <button type="button" onclick="cadastrar()" class="btn btn-primary">Cadastrar-se</button>
</form>



<form id="formDados" class="hide" method="POST" action="/painel/homePost">
	<input id="mensagem"  name="mensagem"></input>
	
</form>

</body>
<script>
	function cadastrar(){
		var data = {
	        	   nome: $("#nome").val(),
	        	   email: $("#email").val(),
	        	   senha: $("#senha").val(),
	        	   dtNascimento: $("#dtNascimento").val(),
	        	   cpf: $("#cpf").val(),
	        	   genero: $("#genero").val(),
	        	   telefone: $("#telefone").val(),
	        	   ativo: true,
	        	   enderecos: [{
	        		   logradouro:$("#logradouro").val(),
	        		   numero:$("#numero").val(),
	        		   bairro:$("#bairro").val(),
	        		   cep:$("#cep").val(),
	        		   estado:$("#estado").val(),
	        		   cidade:$("#cidade").val(),
	        		   complemento:$("#complemento").val(),
	        		   principal: true
	        	   }]
	       
	       };
	$.ajax({
		 method: "POST",
		 url: "/cliente/cadastrar",
		 data: { cliente: JSON.stringify(data)},
		 success: function(data) {
			 data = JSON.parse(data);
	         if(data.ok == true){
	        	 $("#mensagem").val(data.mensagem);
	        	 $("#formDados").submit();
	         }else{
	        	 $("#alert").removeClass("hide");
	        	 $("#alert").html(data.mensagem);
	         }
	      },
	      error: function(){
	    	  
	      }
	});
	}

</script>
</html>