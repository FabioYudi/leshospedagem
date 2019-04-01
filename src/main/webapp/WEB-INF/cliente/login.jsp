<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.hide{
		display:none
	}
</style>
<meta charset="ISO-8859-1">
<title>Entrar </title>
</head>
<body class="bg-dark">
<jsp:include page="../components/navbar.jsp" />
	<div id="alertaErro" class="alert alert-danger hide" role="alert">
  		
	</div>
	<form style="margin-left:20px; color: white; margin-top:20px">
	  <div class="form-row">
		    <div class="form-group col-md-2">
		      <label for="email">Email</label>
		      <input required type="text" class="form-control" id="email" >
		    </div>
	    </div>
	   	<div class="form-row">
		    <div class="form-group col-md-2">
		      <label for="senha">Senha</label>
		      <input required type="password" class="form-control" id="senha" >
		    </div>
		 </div>
		 <button type="button" onclick="entrar()" class="btn btn-primary">Entrar</button>
	</form >	
		
	<form class="hide" id="formPainel" action="/painel/home">
	
	</form>   
</body>
<script>
	function entrar(){
		
		if( $("#email").val() == "" || $("#senha").val() == ""){
			 $("#alertaErro").removeClass("hide");
        	 $("#alertaErro").html("Preencha todos os campos!");
        	 return;
		}
		
		var data = {
	        	   email: $("#email").val(),
	        	   senha: $("#senha").val()

	       };
	$.ajax({
		 method: "POST",
		 url: "/cliente/logar",
		 data: { cliente: JSON.stringify(data)},
		 success: function(data) {
			 data = JSON.parse(data);
	         if(data.ok == true){
	        	 $("#mensagem").val(data.mensagem);
	        	 $("#formPainel").submit();
	         }else{
	        	 $("#alertaErro").removeClass("hide");
	        	 $("#alertaErro").html("Email ou senha incorretos, por favor, tente novamente!");
	         }
	      },
	      error: function(){
	    	  $("#alertaErro").removeClass("hide");
	        	$("#alertaErro").html("Email ou senha incorretos, por favor, tente novamente!");
	      }
	});
	}

</script>
</html>