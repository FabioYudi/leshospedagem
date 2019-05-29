<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <link href="../../resources/css/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="../../../resources/js/datatables/dataTables.bootstrap4.css" rel="stylesheet">
	<script src="../../../resources/js/chart.js/util.js" type="text/javascript"></script>
  <!-- Custom styles for this template-->
  <link href="../../../resources/css/sb-admin.css" rel="stylesheet">
  <script src="../../../resources/js/moment.js"></script>
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
			<canvas id="myChart" width="1000" height="1000"></canvas>
		</div>

   	 </div>
   	</div> 
</div>


<script src="../../../resources/grafico/Chart.min.js"></script>


  <!-- Custom fonts for this template-->
 
<script>
var mesesMap = new Map();
mesesMap.set("JANEIRO", "1");
mesesMap.set("FEVEREIRO", "2");
mesesMap.set("MARÇO", "3");
mesesMap.set("ABRIL", "4");
mesesMap.set("MAIO", "5");
mesesMap.set("JUNHO", "6");
mesesMap.set("JULHO", "7");
mesesMap.set("AGOSTO", "8");
mesesMap.set("SETEMBRO", "9");
mesesMap.set("OUTUBRO", "10");
mesesMap.set("NOVEMBRO", "11");
mesesMap.set("DEZEMBRO", "12");

var reservasEstadoMap = new Map();
reservasEstadoMap.set("AC", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("AL", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("AM", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("AP", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("BA", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("CE", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("DF", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("ES", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("GO", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("MA", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("MT", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("MS", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("MG", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("PA", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("PB", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("PR", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("PE", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("PI", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("RJ", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("RN", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("RO", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("RS", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("RR", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("SC", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("SE", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("SP", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
reservasEstadoMap.set("TO", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);


var estados = ["AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RO", "RS", "RR", "SC", "SE", "SP", "TO"]
var MESES = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]
var reservas = [];
getReservas();
var reservaPorEstados = [];
getReservasPorEstado(estados, reservas, MESES);
var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'line',
    
    data: {
        labels: MESES,
        datasets: [{
            label: 'AC',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.red,
			borderColor: window.chartColors.red,
            borderWidth: 1,
            fill: false,
            data:[1,2,3,4,5,6,7]
            	
            
        },
        {
            label: 'AL',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.blue,
			borderColor: window.chartColors.blue,
            borderWidth: 1,
            fill: false,
            data:[3,5,2,5,3,6,6]
            
        },
        {
            label: 'AM',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.green,
			borderColor: window.chartColors.green,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'AP',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.yellow,
			borderColor: window.chartColors.yellow,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'BA',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.grey,
			borderColor: window.chartColors.grey,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'CE',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.orange,
			borderColor: window.chartColors.orange,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'DF',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.purple,
			borderColor: window.chartColors.purple,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'ES',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.pink,
			borderColor: window.chartColors.pink,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'GO',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.black,
			borderColor: window.chartColors.black,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'MA',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.aqua,
			borderColor: window.chartColors.aqua,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'MT',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.lightBlue,
			borderColor: window.chartColors.lightBlue,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'MS',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.lightGreen,
			borderColor: window.chartColors.lightGreen,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'MG',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.purple,
			borderColor: window.chartColors.purple,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'PA',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.purple,
			borderColor: window.chartColors.purple,
            borderWidth: 1
        },
        {
            label: 'PB',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.purple,
			borderColor: window.chartColors.purple,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'PR',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.purple,
			borderColor: window.chartColors.purple,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'PE',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.purple,
			borderColor: window.chartColors.purple,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'PI',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.purple,
			borderColor: window.chartColors.purple,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'RJ',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.purple,
			borderColor: window.chartColors.purple,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'RN',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.purple,
			borderColor: window.chartColors.purple,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'RO',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.purple,
			borderColor: window.chartColors.purple,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'RS',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.purple,
			borderColor: window.chartColors.purple,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'SC',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.purple,
			borderColor: window.chartColors.purple,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'SE',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.purple,
			borderColor: window.chartColors.purple,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'SP',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.purple,
			borderColor: window.chartColors.purple,
            borderWidth: 1,
            fill: false
        },
        {
            label: 'TO',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.purple,
			borderColor: window.chartColors.purple,
            borderWidth: 1,
            fill: false
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


function getReservasPorEstado(estados, reservas, meses){
	debugger;
	for(var i = 0; i < estados.length; i++){
		
		for(var j = 0; j < reservas.length; j++){
			if(estados[i].toUpperCase() == reservas[j].hospedagem.endereco.estado.toUpperCase()){
				var qtd = 0;
				for(var k = 0; k < meses.length; k++){
					if(mesesMap.get(meses[k].toUpperCase()) == reservas[j].dataReserva.monthValue){
						debugger;
						reservasEstadoMap.set(estados[i], reservasEstadoMap.get(estados[i])[k]++);
					}
				}
				
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