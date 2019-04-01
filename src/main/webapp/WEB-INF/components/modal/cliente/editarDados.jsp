<div class="modal fade" id="modalEdicaoDados" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Editar Dados</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="alert alert-danger hide" id="alertaErroDados" role="alert">
  					
		</div>
        <form style="margin-top:20px">
		  <div class="form-row">
		    <div class="form-group col-md-12">
		      <label for="email">Email</label>
		      <input value="${cliente.email}" type="email" class="form-control" id="email" >
		    </div>
		    <div class="form-group col-md-12">
		      <label for="nome">Nome</label>
		      <input value="${cliente.nome}" type="text" class="form-control" id="nome" placeholder=>
		    </div>
		    <div class="form-group col-md-12">
		      <label for="nome">Telefone</label>
		      <input value="${cliente.telefone}" type="text" class="form-control" id="telefone" placeholder=>
		    </div>
		  </div>
		  <div class="form-row">
		    <div class="form-group col-md-6">
		      <label for="dtNascimento">Data de nascimento</label>
		      <input value="${cliente.dtNascimento}" type="date" class="form-control" id="dtNascimento" >
		    </div>
		    <div class="form-group col-md-12">
		      <label for="cpf">CPF</label>
		      <input value="${cliente.cpf}" type="text" class="form-control" id="cpf" >
		    </div>
		    <div class="form-group col-md-6">
		      <label for="genero">Gênero</label>
		      <select  id="genero" class="form-control">
		        <option value="masculino" selected>masculino</option>
		        <option value="feminino" >feminino</option>
		        <option value="outros">outros...</option>
		       </select>
		    </div>
		  </div>
		 </form> 
  
      </div>
      <div class="modal-footer">
        <button type="button" onclick="cadastrar()" class="btn btn-primary">Editar</button>
      </div>
    </div>
  </div>
</div>

<form id="formDados" class="hide" method="POST" action="/cliente/dadosAtualizados">
	<input id="mensagem" name="mensagem"></input>
	 <input id="id" name="id" class="hide" value="${cliente.id}"/>
</form>



<script>
debugger;
$("#genero").val( $('option:contains(${cliente.genero})').val())

function cadastrar(){
	var data = {
			   id: $("#id").val(),
        	   nome: $("#nome").val(),
        	   email: $("#email").val(),
        	   senha: $("#senha").val(),
        	   dtNascimento: $("#dtNascimento").val(),
        	   cpf: $("#cpf").val(),
        	   genero: $("#genero").val(),
        	   telefone:$("#telefone").val(),
        	   enderecos: [{
        		   logradouro:"",
        		   numero:"",
        		   bairro:"",
        		   cep:"",
        		   estado:"",
        		   cidade:"",
        		   complemento:""
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
        	 $("#formDados").submit();
         }else{
        	 $("#alertaErroDados").removeClass("hide");
        	 $("#alertaErroDados").html(data.mensagem);
         }
      },
      error: function(){
    	  
      }
});
}

</script>
	