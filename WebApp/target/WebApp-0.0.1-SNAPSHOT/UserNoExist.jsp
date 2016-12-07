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
	<center><h1 class="fclass">User Does not exist.</h1></center>
	</div>
</body>
</html>