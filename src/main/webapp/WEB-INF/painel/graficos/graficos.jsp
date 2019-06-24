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
		<form>
		 <div class="form-row">
		    <div class="col-2">
		       <label style="color:white" for="ano">Ano</label>
		    	<input maxlength="4" type="text" class="form-control" id="ano" placeholder="2019">
		    </div>
		     <div class="col-2">
		       <label style="color:white" for="estadoFiltro">Estado</label>
			    <select class="form-control" id="estadoFiltro">
			    	<option value="">Selecione...</option>
			     	<option value="AC">Acre</option>
					<option value="AL">Alagoas</option>
					<option value="AP">Amapá</option>
					<option value="AM">Amazonas</option>
					<option value="BA">Bahia</option>
					<option value="CE">Ceará</option>
					<option value="DF">Distrito Federal</option>
					<option value="ES">Espírito Santo</option>
					<option value="GO">Goiás</option>
					<option value="MA">Maranhão</option>
					<option value="MT">Mato Grosso</option>
					<option value="MS">Mato Grosso do Sul</option>
					<option value="MG">Minas Gerais</option>
					<option value="PA">Pará</option>
					<option value="PB">Paraíba</option>
					<option value="PR">Paraná</option>
					<option value="PE">Pernambuco</option>
					<option value="PI">Piauí</option>
					<option value="RJ">Rio de Janeiro</option>
					<option value="RN">Rio Grande do Norte</option>
					<option value="RS">Rio Grande do Sul</option>
					<option value="RO">Rondônia</option>
					<option value="RR">Roraima</option>
					<option value="SC">Santa Catarina</option>
					<option value="SP">São Paulo</option>
					<option value="SE">Sergipe</option>
					<option value="TO">Tocantins</option>
			    </select>
		    </div>
		  </div>
	    <div class="form-row" style="margin-top:20px">
	    	
		    <div class="col-2">
			    <label style="color:white" for="mes1">Mes 1</label>
			    <select class="form-control" id="mes1">
			     	<option value="">Selecione...</option>
					<option value="1">Janeiro</option>
					<option value="2">Fevereiro</option>
					<option value="3">Março</option>
					<option value="4">Abril</option>
					<option value="5">Maio</option>
					<option value="6">Junho</option>
					<option value="7">Julho</option>
					<option value="8">Agosto</option>
					<option value="9">Setembro</option>
					<option value="10">Outubro</option>
					<option value="11">Novembro</option>
					<option value="12">Dezembro</option>
				</select>
		    </div>
		    <div class="col-2">
		    	<label style="color:white" for="mes2">Mes 2</label>
		   		<select class="form-control" id="mes2">
			     	<option value="">Selecione...</option>
					<option value="1">Janeiro</option>
					<option value="2">Fevereiro</option>
					<option value="3">Março</option>
					<option value="4">Abril</option>
					<option value="5">Maio</option>
					<option value="6">Junho</option>
					<option value="7">Julho</option>
					<option value="8">Agosto</option>
					<option value="9">Setembro</option>
					<option value="10">Outubro</option>
					<option value="11">Novembro</option>
					<option value="12">Dezembro</option>
				</select>
		    </div>
		    
		 </div>
		 <div class="form-row" style="margin-top:20px; margin-bottom:20px">
		 	<div class="col-2">
		    	<button onclick="filtrar()" class="btn btn-primary" type="button">Filtrar</button>
		    </div>
		 </div>
		  
		</form>
   	 
   	 
   	 
   	 	<div  style="width:100%;" class="card">
   	 		<div class="chartjs-size-monitor">
   	 			<div class="chartjs-size-monitor-expand">
   	 				<div class=""></div>
   	 			</div>
   	 			<div class="chartjs-size-monitor-shrink">
   	 				<div class=""></div>
   	 			</div>
   	 	</div>
			<canvas id="myChart" style="display: block; width: 800px; height: 400px;" class="chartjs-render-monitor"></canvas>
		</div>

   	 </div>
   	</div> 
</div>


<script src="../../../resources/grafico/Chart.min.js"></script>


  <!-- Custom fonts for this template-->
 
<script>



var cores = new Map();
cores.set("AC", window.chartColors.red);
cores.set("AL", window.chartColors.orange);
cores.set("AM", window.chartColors.yellow);
cores.set("AP", window.chartColors.green);
cores.set("BA", window.chartColors.yellow);
cores.set("CE", window.chartColors.green);
cores.set("DF", window.chartColors.blue);
cores.set("ES", window.chartColors.purple);
cores.set("GO", window.chartColors.grey);
cores.set("MA", window.chartColors.pink);
cores.set("MT", window.chartColors.black);
cores.set("MS", window.chartColors.aqua);
cores.set("MG", window.chartColors.lightBlue);
cores.set("PA", window.chartColors.lightGreen);
cores.set("PB", window.chartColors.darkRed);
cores.set("PR", window.chartColors.lightPurple);
cores.set("PE", window.chartColors.brown);
cores.set("PI", window.chartColors.darkBlue);
cores.set("RJ", window.chartColors.coral);
cores.set("RN", window.chartColors.cyan);
cores.set("RO", window.chartColors.lime);
cores.set("RS", window.chartColors.olive);
cores.set("RR", window.chartColors.gpçd);
cores.set("SC", window.chartColors.wheat);
cores.set("SE", window.chartColors.mistyRose);
cores.set("SP", window.chartColors.thistle);
cores.set("TO", window.chartColors.chocolate);


var mesesMap = new Map();
mesesMap.set("JANEIRO", 	"1");
mesesMap.set("FEVEREIRO",	"2");
mesesMap.set("MARÇO", 		"3");
mesesMap.set("ABRIL", 		"4");
mesesMap.set("MAIO", 		"5");
mesesMap.set("JUNHO", 		"6");
mesesMap.set("JULHO", 		"7");
mesesMap.set("AGOSTO", 		"8");
mesesMap.set("SETEMBRO", 	"9");
mesesMap.set("OUTUBRO",		"10");
mesesMap.set("NOVEMBRO", 	"11");
mesesMap.set("DEZEMBRO", 	"12");


var mesesMapInvertido = new Map();
mesesMapInvertido.set("1",	"JANEIRO");
mesesMapInvertido.set("2",	"FEVEREIRO");
mesesMapInvertido.set("3",	"MARÇO");
mesesMapInvertido.set("4",	"ABRIL");
mesesMapInvertido.set("5",	"MAIO");
mesesMapInvertido.set("6",	"JUNHO");
mesesMapInvertido.set("7",	"JULHO");
mesesMapInvertido.set("8",	"AGOSTO");
mesesMapInvertido.set("9",	"SETEMBRO");
mesesMapInvertido.set("10",	"OUTUBRO");
mesesMapInvertido.set("11",	"NOVEMBRO");
mesesMapInvertido.set("12",	"DEZEMBRO");

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
getReservasPorEstado(estados, reservas, MESES, 2019);
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
            data:reservasEstadoMap.get("AC")
            	
            
        },
        {
            label: 'AL',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.blue,
			borderColor: window.chartColors.blue,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("AL")
            
        },
        {
            label: 'AM',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.green,
			borderColor: window.chartColors.green,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("AM")
        },
        {
            label: 'AP',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.yellow,
			borderColor: window.chartColors.yellow,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("AP")
        },
        {
            label: 'BA',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.grey,
			borderColor: window.chartColors.grey,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("BA")
        },
        {
            label: 'CE',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.orange,
			borderColor: window.chartColors.orange,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("CE")
        },
        {
            label: 'DF',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.purple,
			borderColor: window.chartColors.purple,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("DF")
        },
        {
            label: 'ES',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.pink,
			borderColor: window.chartColors.pink,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("ES")
        },
        {
            label: 'GO',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.black,
			borderColor: window.chartColors.black,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("GO")
        },
        {
            label: 'MA',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.aqua,
			borderColor: window.chartColors.aqua,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("MA")
        },
        {
            label: 'MT',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.lightBlue,
			borderColor: window.chartColors.lightBlue,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("MT")
        },
        {
            label: 'MS',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.lightGreen,
			borderColor: window.chartColors.lightGreen,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("MS")
        },
        {
            label: 'MG',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.coral,
			borderColor: window.chartColors.coral,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("MG")
        },
        {
            label: 'PA',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.cyan,
			borderColor: window.chartColors.cyan,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("PA")
        },
        {
            label: 'PB',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.lime,
			borderColor: window.chartColors.lime,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("PB")
        },
        {
            label: 'PR',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.olive,
			borderColor: window.chartColors.olive,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("PR")
        },
        {
            label: 'PE',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.gold,
			borderColor: window.chartColors.gold,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("PE")
        },
        {
            label: 'PI',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.wheat,
			borderColor: window.chartColors.wheat,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("PI")
        },
        {
            label: 'RJ',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.khaki,
			borderColor: window.chartColors.khaki,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("RJ")
        },
        {
            label: 'RN',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.mistyRose,
			borderColor: window.chartColors.mistyRose,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("RN")
        },
        {
            label: 'RO',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.thistle,
			borderColor: window.chartColors.thistle,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("RO")
        },
        {
            label: 'RS',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.chocolate,
			borderColor: window.chartColors.chocolate,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("RS")
        },
        {
            label: 'SC',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.rosy,
			borderColor: window.chartColors.rosy,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("SC")
        },
        {
            label: 'SE',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.sea,
			borderColor: window.chartColors.sea,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("SE")
        },
        {
            label: 'SP',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.teal,
			borderColor: window.chartColors.teal,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("SP")
        },
        {
            label: 'TO',
            data: reservaPorEstados,
            backgroundColor: window.chartColors.blue,
			borderColor: window.chartColors.blue,
            borderWidth: 1,
            fill: false,
            data:reservasEstadoMap.get("TO")
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


function getReservasPorEstado(estados, reservas, meses, ano){
	
	for(var i = 0; i < estados.length; i++){
		
		for(var j = 0; j < reservas.length; j++){
			if(estados[i].toUpperCase() == reservas[j].hospedagem.endereco.estado.toUpperCase()){
				var qtd = 0;
				for(var k = 0; k < meses.length; k++){
					if(mesesMap.get(meses[k].toUpperCase()) == reservas[j].dataReserva.monthValue && reservas[j].dataReserva.year == ano ){
						var arrayReservaPorEstado = reservasEstadoMap.get(estados[i]);
						arrayReservaPorEstado[k]++;
						reservasEstadoMap.set(estados[i], arrayReservaPorEstado);
					}
				}
				
			}
		}
		reservaPorEstados.push(qtd);
		
	}
	
	
	
}

function filtrar(){
	var mes1 = $("#mes1").val();
	var mes2 = $("#mes2").val();
	
	var mesesFiltro = []
	
	
	if(mes1 == "" && mes2 == ""){
		myChart.data.labels = MESES;
		window.myChart.update();
	}else{
		myChart.data.labels = [];
		
		for(var i = parseInt(mes1); i<= parseInt(mes2);i++){
			myChart.data.labels.push(mesesMapInvertido.get(i.toString()));
		}
		
		window.myChart.update();
	}
	


	
	var estado = $("#estadoFiltro").val();
	var ano = $("#ano").val();
	
	
	
	if(ano == ""){
		ano = 2019;
	}else{
		ano = parseInt(ano);
	}
	
	filtrarEstado(estado, ano);
	
	
	/*for(var i = 0; i < estados.length; i++){
		
		for(var j = 0; j < reservas.length; j++){
			if(filtrarEstado(estado, i, j)){
				var qtd = 0;
				for(var k = 0; k < mesesFiltro.length; k++){
					if(filtrarMes(k, j, mesesFiltro)){
						debugger;
						var arrayReservaPorEstado = reservasEstadoMap.get(estados[i]);
						arrayReservaPorEstado[k]++;
						reservasEstadoMap.set(estados[i], arrayReservaPorEstado);
					}else{
						var arrayReservaPorEstado = reservasEstadoMap.get(estados[i]);
						arrayReservaPorEstado[k] = [];
						reservasEstadoMap.set(estados[i], arrayReservaPorEstado);
					}
				}
				
			}
		}
		reservaPorEstados.push(qtd);
		
	}*/
}




function filtrarEstado(estado, ano){
	
	
	if(estado == ""){
		myChart.data.datasets = [];
		for(var i = 0; i < estados.length; i++){
			var arrayReservaPorEstado = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
			
			for(var j = 0; j < reservas.length; j++){
				if(estados[i].toUpperCase() == reservas[j].hospedagem.endereco.estado.toUpperCase()){
					var qtd = 0;
					for(var k = 0; k < myChart.data.labels.length; k++){
						if(mesesMap.get(myChart.data.labels[k].toUpperCase()) == reservas[j].dataReserva.monthValue && reservas[j].dataReserva.year == ano ){
							arrayReservaPorEstado[k]++;
							reservasEstadoMap.set(estados[i], arrayReservaPorEstado);
							
						}
						
					}
					
					
				
				}
			}
			
			reservasEstadoMap.set(estados[i], arrayReservaPorEstado);

			var newDataset = {
					label: estados[i],
					backgroundColor: cores.get(estados[i]),
					borderColor: cores.get(estados[i]),
					data: reservasEstadoMap.get(estados[i]),
					fill: false
				};
			
			myChart.data.datasets.push(newDataset);
			
			
			window.myChart.update();
			
			
		}
		
		
		
		
		
	}else{
		var arrayReservaPorEstado = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		myChart.data.datasets = [];
		for(var j = 0; j < reservas.length; j++){
			if(estado.toUpperCase() == reservas[j].hospedagem.endereco.estado.toUpperCase()){
				var qtd = 0;
				for(var k = 0; k < myChart.data.labels.length; k++){
					if(mesesMap.get(myChart.data.labels[k].toUpperCase()) == reservas[j].dataReserva.monthValue && reservas[j].dataReserva.year == ano ){
						arrayReservaPorEstado[k]++;
						
					}
					reservasEstadoMap.set(estado, arrayReservaPorEstado);
				}
				
				
				
				
				
			}
		}
		
		var newDataset = {
				label: estado,
				backgroundColor: cores.get(estado),
				borderColor: cores.get(estado),
				data: reservasEstadoMap.get(estado),
				fill: false
			};
		
		myChart.data.datasets.push(newDataset);
		window.myChart.update();
		
	}
	

}


function filtrarMes(k, j, mesesFiltro){
	
	var mes1 = parseInt($("#mes1").val());
	var mes2 = parseInt($("#mes2").val());
	
	if(mes1 == "" && mes2 == ""){
		if(mesesMap.get(meses[k].toUpperCase()) == reservas[j].dataReserva.monthValue && reservas[j].dataReserva.year == ano ){
			return true;
		}else{
			
			return false;
		}
	}else{
		
		if(mesesMapInvertido.get(mesesFiltro[k]) == reservas[j].dataReserva.monthValue && reservas[j].dataReserva.year == ano ){
			return true;
		}else{
			return false;
		}
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