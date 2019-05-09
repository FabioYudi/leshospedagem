<!-- modal avaliação -->
<div class="modal fade" id="modalCupom" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
     <div class="alert alert-danger hide" id="alertaErroCupom" role="alert"></div>
      <div class="modal-header">
        <h5 class="modal-title" id="modalAvaliacaoHospedagemLabel">Cadastrar Cupom</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="post" id="formAvaliacao">
        <div class="form-group">
          	<div class="form-row">	
    			<label for="codigoCupom">Código</label>
			    <input type="text" class="form-control" id="codigoCupom"/>
          	</div>
          </div>
          <div class="form-group">
          	<div class="form-row">	
    			<label for="valorCupom">Valor</label>
			    <input type="text" class="form-control" id="valorCupom"/>
          	</div>
          </div>
          <div class="form-group">
          	<div class="form-row">	
    			<label for="validadeCupom">Validade</label>
			    <input type="date" class="form-control" id="validadeCupom"/>
          	</div>
          </div>
          <div class="form-group">
          	<div class="form-row">	
          		Status
          		<br>
    			<label style="margin-left:20px; margin-right:20px"  class="radio-inline"><input id="radioAtivo" type="radio" name="optradio" checked>Ativo</label>
    			<label id="radioInativo" class="radio-inline"><input type="radio" name="optradio" checked>Inativo</label>
          	</div>
          </div>
          
        </form>
      </div>
      <div class="modal-footer">
      
        <button onclick="cadastrarCupom()" type="button" class="btn btn-primary">Cadastrar cupom</button>
      </div>
    </div>
  </div>
</div>