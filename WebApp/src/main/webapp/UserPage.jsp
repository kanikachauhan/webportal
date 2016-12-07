<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<head>
<% 
    response.setHeader("Cache-Control","no-cache");
                response.setHeader("Cache-Control","no-store");
                response.setHeader("Cache-Control","must-revalidate");
             response.setHeader("Pragma","no-cache");
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
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lobster"/> 
<style type="text/css">
.jumbotron{
 	background-color:#1C1C18;
 }
  .abcd{
 border:2px solid #FFE200;padding:150px;background-color:#242316;
 color:#FFE200;
 border-radius:10px;
 }
 .abcd:hover{
 background-color:#FFE200;
 color:white;
 transition-property:color;
 transition-duration:2s;
 transition-timing-function: ease-out;
 transition-delay:initial;
 font-size:100px;
 }
 .inset-text-effect {
	font: normal 50px "Lobster", Helvetica, cursive;
	text-shadow: 1px 1px 0 #FFE200 , -1px -1px 1px rgba(0,0,0,0.67) ;
}
</style>
</head>
<body style="background-color:#1C1C18;">
<nav class="navbar navbar-inverse navbar-fixed-top" style="background: #1C1C18;">
		<div class="container-fluid" style="background: #1C1C18;"> 	
		<div class="navbar-header">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/HomePage.jsp"><p style="color: white;font-weight:bold;">Home</p></a></li>
				<li><a href="myaccount/logout" style="color:white;font-weight:bold;" >Log Out</a></li>
			</ul>
		</div>
		</div>
	</nav>
	<div class="jumbotron">
	</div>
	
	<div class="container-fluid" style="background-color:#1C1C18;">
		<center><div class="inset-text-effect">Welcome User</div></center>
		<div class="row">
		<div class="col-sm-6">
				<center><a href="myaccount/userData"><span style="font-size:75px;"><i class="glyphicon glyphicon-user  abcd"></i></span></a>
				<br><br>
				<h4 style="color:white;">User Data</h4>
				</center>
			</div>
			<div class="col-sm-6 ">
				<center><a href="myaccount/network"><span style="font-size:75px;"><i class="glyphicon glyphicon-globe  abcd"></i></span></a>
				<br><br>
				<h4 style="color:white;">Network Details</h4>
				</center>
			</div>
		</div>
		<div class="row">
		<div class="col-sm-6">
				<center><a href="myaccount/myproducts"><span style="font-size:75px;"><i class="glyphicon glyphicon-th-list  abcd"></i></span></a>
				<br><br>
				<h4 style="color:white;">Products</h4>
				</center>
			</div>
			<div class="col-sm-6">
				<center><a href="myaccount/helps"><span style="font-size:75px;"><i class="glyphicon glyphicon-question-sign  abcd"></i></span></a>
				<br><br>
				<h4 style="color:white;">Help</h4>
				</center>
			</div>
		</div>
	</div>
</body>
</html>