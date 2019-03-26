<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Entrar </title>
</head>
<body class="bg-dark">
<jsp:include page="../components/navbar.jsp" />
	<form style="margin-left:20px; color: white; margin-top:20px">
	  <div class="form-row">
		    <div class="form-group col-md-2">
		      <label for="email">Email</label>
		      <input type="text" class="form-control" id="email" >
		    </div>
	    </div>
	   	<div class="form-row">
		    <div class="form-group col-md-2">
		      <label for="senha">Senha</label>
		      <input type="password" class="form-control" id="senha" >
		    </div>
		 </div>
		 <button type="submit" onclick="entrar()" class="btn btn-primary">Entrar</button>
	</form>	   
</body>
<script>
	function entrar(){
		
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