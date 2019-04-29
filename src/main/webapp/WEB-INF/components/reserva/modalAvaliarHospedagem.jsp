<!-- modal avaliação -->
<div class="modal fade" id="modalAvaliacaoHospedagem" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalAvaliacaoHospedagemLabel">Avalie seu anfitrião</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="post" id="formAvaliacao">
        <div class="form-group">
          	<div class="form-row">	
    			<label for="notaAnfitriao">Nota</label>
			    <select class="form-control" id="notaAnfitriao">
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
          			<label for="comentarioAnfitriao">Comentário sobre seu anfitrião</label>
   					<textarea style="width:480px;" class="form-control" id="comentarioAnfitriao" rows="5"></textarea>
  				</div>
          	</div>     
          </div> 
          <h5 class="modal-title" id="modalAvaliacaoHospedagemLabel">Avalie a hospedagem</h5>
          <div class="form-group">
          	<div class="form-row">	
    			<label for="notaHospedagem">Nota</label>
			    <select class="form-control" id="notaHospedagem">
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
          			<label for="comentarioHospedagem">Comentário sobre a hospedagem</label>
   					<textarea style="width:480px;" class="form-control" id="comentarioHospedagem" rows="5"></textarea>
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
	var anfitriao = {
			nota : $("#notaAnfitriao").val(),
			comentario : $("#comentarioAnfitriao").val()
		};
	
	var hospedagem = {
			nota : $("#notaHospedagem").val(),
			comentario : $("#comentarioHospedagem").val()
		};
		
		$.ajax({
			 method: "GET",
			 url: "/cliente/avaliar/cliente/" + idReservaAvaliacao,
			 data: {avaliacaoAnfitriao: JSON.stringify(anfitriao), avaliacaoHospedagem: JSON.stringify(hospedagem) },
			 success: function(data) {
				 window.location.assign("/cliente/consultar/reservas");
		      },
		      error: function(){
		    	  
		      }
		});
	
}
</script>