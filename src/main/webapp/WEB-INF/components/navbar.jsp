<link type="text/css" rel="stylesheet" media="screen" href="../resources/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" media="screen" href="../resources/css/common.css">

<script src="../../resources/bootstrap/js/bootstrap.min.js"></script>
<script src="../../resources/js/jquery.js"></script>

<style>
	.hide{
		display:none;
	}
</style>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">LES HOSPEDAGEM</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/">Home</a>
      </li>
      <li id="cadastrar" class="nav-item">
        <a class="nav-link" href="/cliente/paginaCadastrar">Cadastrar-se</a>
      </li>
      <li id="login" class="nav-item">
        <a class="nav-link" href="/cliente/login">Login</a>
      </li>
      
      <li id="painel" class="nav-item hide">
        <a id="linkPainel" class="nav-link" href="/painel/home">Painel de controle</a>
      </li>
      <li id="sair" class="hide">
      	<a  class="nav-link" href="/cliente/logout">Sair</a>
      	
      </li>
    </ul>
  </div>
</nav>

<script>

	$(document).ready(function(){

		$.ajax({
			 method: "GET",
			 url: "/cliente/verificaLogin",
			 success: function(data) {
				
				 data = JSON.parse(data);
				if(data.clienteLogado == null){
				 $("#cadastrar").removeClass("hide");
					$("#login").removeClass("hide");
					$("#painel").addClass("hide");
					$("#sair").addClass("hide");
			      
				}else{
					
					$("#cadastrar").addClass("hide");
					$("#login").addClass("hide");
					$("#painel").removeClass("hide");
					$("#sair").removeClass("hide");
				}
				
		      },
		      error: function(){
		    	
		    	  $("#cadastrar").removeClass("hide");
					$("#login").removeClass("hide");
					$("#painel").addClass("hide");
					$("#sair").addClass("hide");
		      }
		});
	});
</script>
