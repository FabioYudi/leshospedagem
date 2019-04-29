<!-- modal avaliação -->
<div class="modal fade" id="modalAvaliacaoHospedagem" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalAvaliacaoHospedagemLabel">Avalie seu hóspede</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="post" id="formAvaliacao">
        <div class="form-group">
          	<div class="form-row">	
    			<label for="notaHospede">Nota</label>
			    <select class="form-control" id="notaHospede">
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
          			<label for="comentarioHospede">Comentário sobre seu hospede</label>
   					<textarea style="width:480px;" class="form-control" id="comentarioHospede" rows="5"></textarea>
  				</div>
          	</div>     
          </div> 
        </form>
      </div>
      <div class="modal-footer">
      
        <button onclick="avaliarHospedagem()" type="button" class="btn btn-primary">Avaliar reserva</button>
      </div>
    </div>
  </div>
</div>

<script>
function avaliarHospedagem(){
	
	
	var hospede = {
			nota : $("#notaHospede").val(),
			comentario : $("#comentarioHospede").val()
		};
		
		$.ajax({
			 method: "GET",
			 url: "/cliente/avaliar/hospede/" + idReservaAvaliacao,
			 data: {avaliacaoHospede: JSON.stringify(hospede) },
			 success: function(data) {
				 window.location.reload();
		      },
		      error: function(){
		    	  
		      }
		});
	
}
</script>