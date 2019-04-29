<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="../../resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../resources/js/jquery.js"></script>
<script src="../../resources/js/moment.js"></script>
 <link href="../../resources/css/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
 <link href="../../resources/js/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <link href="../../../resources/js/datatables/dataTables.bootstrap4.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" media="screen" href="../../resources/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" media="screen" href="../../resources/css/common.css">
<link type="text/css" rel="stylesheet" href="../resources/css/index.css" type="text/css">
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body class="bg-dark">
<jsp:include page="components/navbar.jsp" />
<div class="intro">
	<form method="get" action="/pesquisa" class="margem-cima-30 form-pesquisa">
	  <div class="form-group">
	    <label style="margin-left:10px!important; color:black; margin-top: 20px" for="exampleInputEmail1">Onde?</label>
	    <input style="width:80%!important" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Destino">
	  </div>
	  <div class="row">
    	<div class="col">
    		<label  style="color:black; margin-left:10px" for="checkin">Check-in</label>
     		<input style="width:80%!important" type="text" id="checkin" class="form-control datepicker"  data-date-format="dd/mm/yyyy" placeholder="dd/mm/aaaa">
    	</div>
    	<div class="col" style="margin-right:20px">
    	    <label style="color:black" for="checkout">Check-out</label>
    	 	<input style="width:80%!important" type="text" id="checkout" class="form-control datepicker"  data-date-format="dd/mm/yyyy"  placeholder="dd/mm/aaaa">
   	 	</div>
  	  </div>
	   <div class="row" style="margin-top:20px">
    	<div class="col">
    		<label  style="color:black; margin-left:10px" for="adultos">Adultos</label>
     		<input style="width:80%!important" type="text" id="adultos" class="form-control" placeholder="">
    	</div>
    	<div class="col" style="margin-right:20px">
    	    <label style="color:black" for="criancas">Crianças</label>
    	 	<input style="width:80%!important" type="text" id="criancas" class="form-control" placeholder="">
   	 	</div>
  	  </div>
  	
	 	
	  <button style="margin-left:80%; margin-top:20px" type="submit" class="btn btn-primary">Pesquisar</button>
	</form>
	 
    <script>
   
    </script>
</div>
</div>

</body>
</html>
 
<script>

$( document ).ready(function() {
    console.log( "ready!" );
});



</script>
