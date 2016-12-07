<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 

response.setHeader("Cache-Control","no-cache"); // HTTP 1.1 
response.setHeader("Pragma","no-cache"); //HTTP 1.0 
response.setDateHeader ("Expires", 0); 
%> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alarm Connect</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/org/staticcontent/jquery.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/angular.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/org/staticcontent/bootstrap-theme.min.css"/>
</head>
<body style="background-color:#1C1C18;">
<nav class="navbar navbar-inverse navbar-fixed-top" style="background: #1C1C18;">
		<div class="container-fluid"> 	
		<div class="navbar-header">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/HomePage.jsp"><p style="color: white;font-weight:bold;">Home</p></a></li>
			
			</ul>
		</div>
		</div>
	</nav>
	<div class="jumbotron" >
		<div class="row" style="border:1px solid #FFE200;padding:10px;border-radius:5px;">
			<center><h1 style="color:#FFE200;">Alarm Connect</h1><center>
		</div>	
	</div><center>
	<div class="container-fluid">
	<h1 style="color:white;">Some Error...Try Again...</h1>
	</div></center>
</body>
</html>