<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
<div class="modal fade" id="modalCadastrarTaxa" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Cadastrar Taxa</h5>
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
			      <label for="nomeTaxa">Nome da Taxa</label>
			      <input type="text" class="form-control" id="nomeTaxa" >
			    </div>
			    <div class="form-group col-md-12">
			      <label for="valorTaxa">Valor</label>
			      <input type="text" class="form-control" id="valorTaxa" >
			    </div>
		
			    
			  </div>
  
		 </form> 
  
      </div>
      <div class="modal-footer">
        <button type="button" onclick="cadastrarTaxa()" class="btn btn-primary">Cadastrar</button>
      </div>
    </div>
  </div>
</div>












<div class="modal fade" id="modalEditarEndereco" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Editar Taxa</h5>
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
			      <label for="nomeTaxa">Logradouro</label>
			      <input type="text" class="form-control" id="nomeTaxa" >
			    </div>
			    <div class="form-group col-md-12">
			      <label for="numeroEdicao">Número</label>
			      <input type="text" class="form-control" id="numeroEdicao" >
			    </div>
			    <div class="form-group col-md-12">
			      <label for="cepEdicao">CEP</label>
			      <input type="text" class="form-control" id="cepEdicao" >
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
function cadastrarTaxa(){
	var taxa = {
			 nome:  $("#nomeTaxa").val(),
			 valor: $("#valorTaxa").val()
       
       };
	
	taxas.push(taxa);
	$("#taxas").html("");
	for(var i = 0; i < taxas.length; i++ ){
		$("#taxas").append("<span style='margin-left:20px' id=spanNomeTaxa"+i+">"+taxas[i].nome+"</span>" +  "<span tyle='margin-left:20px' id=spanValorTaxa"+i+">"+taxas[i].valor+"</span><br>" );
	
	
	}
	
	
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
	
