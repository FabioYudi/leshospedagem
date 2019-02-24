<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../components/navbar.jsp" />
<form style="margin-left:30px; margin-top:20px">
	<div class="row">
	   <div class="col">
		  <div class="form-group" >
		    <label for="formGroupExampleInput">Nome Completo</label>
		    <input type="text" style="width:500px;"" class="form-control" id="formGroupExampleInput" placeholder="Example input">
		  </div>
		</div>
		<div style="margin-left: -50.5%" class="col">
		  <div class="form-group">
		    <label for="formGroupExampleInput2">data de nasc.</label>
		    <input style="width:500px" type="text" class="form-control" id="formGroupExampleInput2" placeholder="dd/mm/aaaa">
		  </div>
		 </div>
	</div>	
	<div class="row">
	   <div class="col">
		  <div class="form-group" >
		    <label for="formGroupExampleInput">Logradouro</label>
		    <input type="text" style="width:500px;"" class="form-control" id="formGroupExampleInput" placeholder="Example input">
		  </div>
		</div>
		<div class="col">
		  <div style="margin-left: -60%" class="form-group">
		    <label for="formGroupExampleInput2">Número.</label>
		    <input style="width:100px" type="text" class="form-control" id="formGroupExampleInput2" placeholder="">
		  </div>
		</div>
		<div style="margin-left: -80%" class="col">
		  <div class="form-group" >
		    <label for="formGroupExampleInput">Bairro</label>
		    <input type="text" style="width:500px;"" class="form-control" id="formGroupExampleInput" placeholder="">
		  </div>
		</div>
	</div>
		
	<div class="row">
	   
		<div class="col">
		  <div  class="form-group">
		    <label for="formGroupExampleInput2">Cidade</label>
		    <input style="width:500px" type="text" class="form-control" id="formGroupExampleInput2" placeholder="">
		  </div>
		</div>  
		<div class="col">
		  <div style="margin-left: -52%" class="form-group">
		    <label for="formGroupExampleInput2">Estado</label>
		    <input style="width:500px" type="text" class="form-control" id="formGroupExampleInput2" placeholder="">
		  </div>
		</div>
	</div>	    
		  <button type="button" class="btn btn-success">Success</button>  
</form>

</body>
</html>