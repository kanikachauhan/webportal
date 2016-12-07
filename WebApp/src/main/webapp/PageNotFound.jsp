<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style type="text/css">
.container-fluid{
 	background-color:#1C1C18;
 }
 .jumbotron{
 	background-color:#1C1C18;
 }
</style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" style="background: #1C1C18;">
		<div class="container-fluid" style="background: #1C1C18;"> 	
		<div class="navbar-header">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/HomePage.jsp"><p style="color: white;font-weight:bold;">Home</p></a></li>
				<li><a href="${pageContext.request.contextPath}/HomePage.jsp" style="color:white;font-weight:bold;" >Log Out</a></li>
			</ul>
		</div>
		</div>
	</nav>
<div class="container-fluid" style="background-color:#1C1C18;">
	<div class="jumbotron">
	</div>
	<center><h1 style="color:#FFE200;">Page Not Found... :( </h1></center>
</div>
</body>
</html>