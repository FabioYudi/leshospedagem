<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<meta charset="ISO-8859-1">
<title>Pesquisa de hospedagem</title>
</head>
<body class="bg-dark">

<jsp:include page="components/navbar.jsp" />
	
		<div class="container-fluid">
			<c:forEach var="hospedagem" items="${hospedagens}">
				<div style="margin-left:20px; margin-top:10px" >
					<div class="card" style="width: 18rem;">
					  <img class="card-img-top" src="../resources/img/exemplo-card.svg" alt="Card image cap">
					  <div class="card-body">
						  <h5 class="card-title">${hospedagem.titulo}</h5>
						  <p class="card-text">${hospedagem.descricao}</p>
						    <p class="card-text"><strong>Diária:</strong> R$ ${hospedagem.diaria}</p>
						  <a href="/painel/hospedagem/detalhes/${hospedagem.id}" class="btn btn-primary" >Reservar</a>
					  </div>
					 </div> 
				</div>	  
			</c:forEach>
					
		
		</div>
	
	
	
		
</body>
</html>