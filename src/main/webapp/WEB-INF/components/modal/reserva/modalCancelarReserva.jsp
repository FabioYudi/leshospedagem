<!-- Modal -->
<div class="modal fade" id="modalCancelarReserva" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
     <div id="erroCancelar" class="alert alert-danger hide" role="alert"></div>
      <div class="modal-header">
        <h5 class="modal-title" id="modalMotivoLabel">Qual o motivo do cancelamento da reserva?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
        	 <div class="form-group">
          	<div class="form-row">
          		<div class="form-group">
          			<label for="exampleFormControlTextarea1">Descrição do motivo</label>
   					<textarea style="width:480px;" class="form-control" id="motivoCancelamento" rows="5"></textarea>
  				</div>
          	</div>     
          </div> 
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" onclick="cancelarReserva()" class="btn btn-danger">Cancelar Reserva</button>
      </div>
    </div>
  </div>
</div>






<!-- modal avaliação -->
<div class="modal fade" id="modalAvaliacao" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalAvaliacaoLabel">Avalie seu hóspede</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
        <div class="form-group">
          	<div class="form-row">	
    			<label for="exampleFormControlSelect1">Nota</label>
			    <select class="form-control" id="exampleFormControlSelect1">
			      <option>1</option>
			      <option>2</option>
			      <option>3</option>
			      <option>4</option>
			      <option>5</option>
			    </select>
          	</div>
          </div>
          <div class="form-group">
          	<div class="form-row">
          		<div class="form-group">
          			<label for="exampleFormControlTextarea1">Comentário sobre seu hóspede</label>
   					<textarea style="width:480px;" class="form-control" id="exampleFormControlTextarea1" rows="5"></textarea>
  				</div>
          	</div>     
          </div> 
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Cancelar</button>
      </div>
    </div>
  </div>
</div>




<!-- modal ver avaliação -->
<div class="modal fade" id="modalVerAvaliacao" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalVerAvaliacaoLabel">Avalie seu hóspede</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
        <div class="form-group">
          	<div class="form-row">	
    			<label for="exampleFormControlSelect1">Nota: </label>
    			<br>
			    <strong>5</strong>
          	</div>
          </div>
          <div class="form-group">
          	<div class="form-row">
          		<div class="form-group">
          			<label for="exampleFormControlTextarea1">Comentário sobre seu hóspede</label>
          			<br>
   					<strong>Muito bom, recomendo</strong>
  				</div>
          	</div>     
          </div> 
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
      </div>
    </div>
  </div>
</div>