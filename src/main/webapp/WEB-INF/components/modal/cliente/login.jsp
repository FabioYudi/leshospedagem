<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
<div class="modal fade" id="logiloginlogin" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Login</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
      </div>
      <div class="modal-body">
      <div class="alert alert-danger hide" id="alertaErroCadastro" role="alert">
  					
		</div>
        <form style="margin-top:20px">
			  <div class="form-row">
			    <div class="form-group col-md-12">
			      <label for="email">Email</label>
			      <input type="text" class="form-control" id="email" >
			    </div>
			    <div class="form-group col-md-12">
			      <label for="senha">senha</label>
			      <input type="text" class="form-control" id="senha" >
			    </div>
		
			    
			  </div>
  
		 </form> 
  
      </div>
      <div class="modal-footer">
        <button type="button" onclick="login()"  data-dismiss="modal" class="btn btn-primary">Cadastrar</button>
      </div>
    </div>
  </div>
</div>
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