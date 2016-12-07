<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 

    response.setHeader("Cache-Control","no-cache");
                response.setHeader("Cache-Control","no-store");
             response.setHeader("Pragma","no-cache");
              response.setDateHeader ("Expires", 0);
                 
%> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alarm Connect</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=Dancing+Script' rel='stylesheet' type='text/css'>
<style type="text/css">
.jumbotron{
 	background-color:#1C1C18;
 }
 .bcircle:hover{
 	background-color:#FFE200;
 	color:#242316;
 	font-size:25px;
 	width:275px;
	height:275px;
	border:5px solid #242316;
	border-radius:275px;
 }
 .bcircle{
	 transition: font 1s ease;
	 background-color:#1C1C18;
	 font-weight:bold;
	 color:#FFE200;
	 width:275px;
	 height:275px;
	 border:5px solid #FFE200;
	 border-radius:275px;
 }
 .inset-text-effect {
	font-family: 'Dancing Script', Georgia, Times, serif;
 font-size: 59px;
 color:#FFE200;
 line-height: 60px;
}
</style>
</head>
<body  style="background-color:#1C1C18;">
<nav class="navbar navbar-inverse navbar-fixed-top" style="background: #993333;">
		<div class="container-fluid" style="background-color:#1C1C18;"> 	
		<div class="navbar-header">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/UserPage.jsp"><p style="color: white;font-weight:bold;">Home</p></a></li>
				<li><a href="myaccount/logout" style="color:white;font-weight:bold;" >Log Out</a></li>
			</ul>
		</div>
		</div>
	</nav>
	<div class="jumbotron">
	</div>
	
	<div class="container-fluid" style="background-color:#1C1C18;">
		<div class="jumbotron" style="width:50%;"></div>
		<div style="margin-bottom:100px;">
			<center><h1 class="inset-text-effect">Networks</h1><center>
		</div><center>
		<div class="col-sm-4">
				<form role="form" action="myaccount/createnetwork"><button class="bcircle" type="submit" class="btn">Create A Network</button></form>
		</div>
		<div class="col-sm-4">	
			<form role="form" action="myaccount/joinnetwork"><button class="bcircle"  type="submit" class="btn">Join A Network</button></form>
		</div>
		<div class="col-sm-4">
			<form role="form" action="myaccount/mynetwork"><button class="bcircle" type="submit" class="btn">My Networks</button></form>
		</div></center>
		</div>
</body> 
</html>