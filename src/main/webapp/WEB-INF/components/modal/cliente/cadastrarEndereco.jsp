<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
<div class="modal fade" id="modalCadastrarEndereco" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Cadastrar Endereço</h5>
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
			      <label for="logradouroCadastro">Logradouro</label>
			      <input type="text" class="form-control" id="logradouroCadastro" >
			    </div>
			    <div class="form-group col-md-12">
			      <label for="numeroCadastro">Número</label>
			      <input type="text" class="form-control" id="numeroCadastro" >
			    </div>
			    <div class="form-group col-md-12">
			      <label for="cepCadastro">CEP</label>
			      <input type="text" class="form-control" id="cepCadastro" >
			    </div>
			    
			  </div>
			  <div class="form-row">
			  	<div class="form-group col-md-12">
			      <label for="bairroCadastro">Bairro</label>
			      <input type="text" class="form-control" id="bairroCadastro" >
			    </div>
			    <div class="form-group col-md-12">
			      <label for="cidadeCadastro">Cidade</label>
			      <input type="text" class="form-control" id="cidadeCadastro" >
			    </div>
			    <div class="form-group col-md-12">
			      <label for="estadoCadastro">Estado</label>
			      <input type="text" class="form-control" id="estadoCadastro" >
			    </div>
			    
			  </div>
			  <div class="form-row">
			  	<div class="form-group col-md-12">
			      <label for="complementoCadastro">Complemento</label>
			      <input type="text" class="form-control" id="complementoCadastro" >
			    </div>
			   </div>
				  
		 </form> 
  
      </div>
      <div class="modal-footer">
        <button type="button" onclick="cadastrar()" class="btn btn-primary">Cadastrar</button>
      </div>
    </div>
  </div>
</div>












<div class="modal fade" id="modalEditarEndereco" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Editar Endereço</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
      </div>
      <div class="modal-body">
      <div class="alert alert-danger hide" id="alertaErroEdicao" role="alert">
  					
		</div>
        <form style="margin-top:20px">
			  <div class="form-row">
			    <div class="form-group col-md-12">
			      <label for="logradouroEdicao">Logradouro</label>
			      <input type="text" class="form-control" id="logradouroEdicao" >
			    </div>
			    <div class="form-group col-md-12">
			      <label for="numeroEdicao">Número</label>
			      <input type="text" class="form-control" id="numeroEdicao" >
			    </div>
			    <div class="form-group col-md-12">
			      <label for="cepEdicao">CEP</label>
			      <input type="text" class="form-control" id="cepEdicao" >
			    </div>
			    
			  </div>
			  <div class="form-row">
			  	<div class="form-group col-md-12">
			      <label for="bairroEdicao">Bairro</label>
			      <input type="text" class="form-control" id="bairroEdicao" >
			    </div>
			    <div class="form-group col-md-12">
			      <label for="cidadeEdicao">Cidade</label>
			      <input type="text" class="form-control" id="cidadeEdicao" >
			    </div>
			    <div class="form-group col-md-12">
			      <label for="estadoEdicao">Estado</label>
			      <input type="text" class="form-control" id="estadoEdicao" >
			    </div>
			    
			  </div>
			  <div class="form-row">
			  	<div class="form-group col-md-12">
			      <label for="complementoEdicao">Complemento</label>
			      <input type="text" class="form-control" id="complementoEdicao" >
			    </div>
			   </div>
				  
		 </form> 
  
      </div>
      <div class="modal-footer">
        <button type="button" onclick="editar()" class="btn btn-primary">Editar</button>
      </div>
    </div>
  </div>
</div>



<form id="formDados" class="hide" method="POST" action="/cliente/endereco/consultarAtualizacao">
	<input id="mensagemEdicao" name="mensagemEdicao"></input>
	 
</form>
<input id="id" name="id" class="hide" value="${cliente.id}"/>

<input id="principal" name="principal" class="hide" value=""/>
<input id="idEndereco" name="idEndereco" class="hide" value=""/>

<script>
function cadastrar(){
	var data = {
			   id: $("#id").val(),
        	   nome: "",
        	   email: "",
        	   senha: "",
        	   dataNascimento: "",
        	   cpf: "",
        	   genero: "",
        	   telefone:"",
        	   enderecos: [{
        		   logradouro:$("#logradouroCadastro").val(),
        		   numero:$("#numeroCadastro").val(),
        		   bairro:$("#bairroCadastro").val(),
        		   cep:$("#cepCadastro").val(),
        		   estado:$("#estadoCadastro").val(),
        		   cidade:$("#cidadeCadastro").val(),
        		   complemento:$("#complementoCadastro").val(),
        		   principal: false
        	   }]
       
       };
$.ajax({
	 method: "POST",
	 url: "/cliente/cadastrarEndereco",
	 data: { cliente: JSON.stringify(data)},
	 success: function(data) {
		 data = JSON.parse(data);
         if(data.ok == true){
        	 $("#mensagemEdicao").val(data.mensagem);
        	 $("#formDados").submit();
         }else{
        	 $("#alertaErroCadastro").removeClass("hide");
        	 $("#alertaErroCadastro").html(data.mensagem);
         }
      },
      error: function(){
    	  
      }
});
}


function editar(){
	var data = {
			   id: $("#id").val(),
        	   nome: "",
        	   email: "",
        	   senha: "",
        	   dataNascimento: "",
        	   cpf: "",
        	   genero: "",
        	   telefone:"",
        	   enderecos: [{
        		   logradouro:$("#logradouroEdicao").val(),
        		   numero:$("#numeroEdicao").val(),
        		   bairro:$("#bairroEdicao").val(),
        		   cep:$("#cepEdicao").val(),
        		   estado:$("#estadoEdicao").val(),
        		   cidade:$("#cidadeEdicao").val(),
        		   complemento:$("#complementoEdicao").val(),
        		   id: $("#idEndereco").val(),
        		   principal:  $("#principal").val()
        	   }]
       
       };
	$.ajax({
		 method: "POST",
		 url: "/cliente/editarEndereco",
		 data: { cliente: JSON.stringify(data)},
		 success: function(data) {
			 data = JSON.parse(data);
	         if(data.ok == true){
	        	 $("#mensagemEdicao").val(data.mensagem);
	        	 $("#formDados").submit();
	         }else{
	        	 $("#alertaErroEdicao").removeClass("hide");
	        	 $("#alertaErroEdicao").html(data.mensagem);
	         }
	      },
	      error: function(){
	    	  
	      }
	});
}


function getDadosEndereco(botao){
	$.ajax({
		 method: "GET",
		 url: "/cliente/endereco/dadosEndereco/" + $(botao).attr("idEndereco"),
		 success: function(data) {
			 data = JSON.parse(data);
		   $("#logradouroEdicao").val(data.endereco.logradouro);
  		   $("#numeroEdicao").val(data.endereco.numero);
  		   $("#bairroEdicao").val(data.endereco.bairro);
  		   $("#cepEdicao").val(data.endereco.cep);
  		   $("#estadoEdicao").val(data.endereco.estado);
  		   $("#cidadeEdicao").val(data.endereco.cidade);
  		   $("#complementoEdicao").val(data.endereco.complemento);
  		   $("#principal").val(data.endereco.principal);
  		   $("#idEndereco").val(data.endereco.id);
  		   $("#botaoModalEndereco").click();
  		
	      },
	      error: function(){
	    	  
	      }
	});
}

</script>
	
