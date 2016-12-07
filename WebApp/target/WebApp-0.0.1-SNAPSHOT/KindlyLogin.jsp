<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<head>
<% 

response.setHeader("Cache-Control","no-cache"); // HTTP 1.1 
response.setHeader("Pragma","no-cache"); //HTTP 1.0 
response.setHeader("Cache-Control","must-revalidate");
response.setDateHeader ("Expires", 0); 
%> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alarm Connect</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
<link rel="${pageContext.request.contextPath}/org/staticcontent/fileinput.css"/>
<link rel="${pageContext.request.contextPath}/org/staticcontent/fileinput.min.css"/>
<script src="${pageContext.request.contextPath}/org/staticcontent/jquery.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/angular.min.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/fileinput.min.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/fileinput.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/org/staticcontent/bootstrap-theme.min.css"/>
<link href='https://fonts.googleapis.com/css?family=Courgette' rel='stylesheet' type='text/css'>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link href='https://fonts.googleapis.com/css?family=Libre+Baskerville' rel='stylesheet' type='text/css'>
  <script>
window.onbeforeunload = function (e) {
	$.ajax({
		url: "/check",
		method:'GET',
		success:function(response){
			$("#myModal1").modal('show');
		},
		error: function(e){
			$("#myModal2").modal('show'); 
		}
	});
}
</script>
  <style type="text/css">
.jumbotron{
background-color:#1C1C18;
}
.fclass{
	font-family: 'Libre Baskerville', serif;
	font-size:75px;
	color:#FFE200;
}
</style>
</head>
<body  style="background-color:#1C1C18;">
<div class="container-fluid" style="background-color:#1C1C18;">
<nav class="navbar navbar-inverse navbar-fixed-top" style="background: #1C1C18;">	
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/HomePage.jsp" style="color:white;font-weight:bold;" >Home</a></li>

			</ul>
		</div>
	</nav>
	<div class="jumbotron" style="background-color:#1C1C18;">
	</div>
		<center><h1 class="fclass">Not Logged In.</h1></center>
	</div>
</body>
</html>