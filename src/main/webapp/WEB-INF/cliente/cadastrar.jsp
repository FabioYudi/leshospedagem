<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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
      <label for="genero">Gênero</label>
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
      <label for="numero">Número</label>
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

</body>
<script>
	function cadastrar(){
		var data = {
	        	   nome: $("#nome").val(),
	        	   email: $("#email").val(),
	        	   senha: $("#senha").val(),
	        	   dataNascimento: $("#dtNascimento").val(),
	        	   cpf: $("#cpf").val(),
	        	   genero: $("#genero").val(),
	        	   enderecos: {
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
		 url: "/cliente/cadastrar",
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