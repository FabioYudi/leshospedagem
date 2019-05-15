<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <link href="../../resources/css/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="../../../resources/js/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../../../resources/css/sb-admin.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Análise</title>
</head>
<body class="bg-dark">
<jsp:include page="../../components/navbar.jsp" />
<div id="wrapper">
	<jsp:include page="../../components/sidebar.jsp" />
	<div id="content-wrapper">
   	 <div class="container-fluid">
   	 	<div  class="card card-register mx-auto mt-2">
			<canvas id="myChart" width="100" height="100"></canvas>
		</div>

   	 </div>
   	</div> 
</div>


<script src="../../../resources/grafico/Chart.min.js"></script>


  <!-- Custom fonts for this template-->
 
<script>

var estados = ["AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RO", "RS", "RR", "SC", "SE", "SP", "TO"]

var reservas = [];
getReservas();
var reservaPorEstados = [];
getReservasPorEstado(estados, reservas);
var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'line',
    
    data: {
        labels: estados,
        datasets: [{
            label: 'Nº de reservas',
            data: reservaPorEstados,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});

function getReservas(){
	$.ajax({
		 method: "GET",
		 url: "/painel/getReservas",
		 async: false,
		 data: {},
		 success: function(data) {
			 
	        data = JSON.parse(data);
	        reservas = data.reservas;
	        	
	        
	      },
	      error: function(){
	    	  
	      }
	});
}


function getReservasPorEstado(estados, reservas){
	debugger;
	for(var i = 0; i < estados.length; i++){
		var qtd = 0;
		for(var j = 0; j < reservas.length; j++){
			if(estados[i].toUpperCase() == reservas[j].hospedagem.endereco.estado.toUpperCase()){
				qtd++;	
			}
		}
		reservaPorEstados.push(qtd);
		
	}
	

	
}
</script>
<!-- Bootstrap core JavaScript-->
  <script src="../../resources/js/jquery.js"></script>
  <script src="../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../resources/js/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="../../resources/js/chart.js/Chart.min.js"></script>
  <script src="../../resources/js/datatables/jquery.dataTables.js"></script>
  <script src="../../resources/js/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../../resources/js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="js/demo/datatables-demo.js"></script>
  <script src="js/demo/chart-area-demo.js"></script>
</body>
</html>