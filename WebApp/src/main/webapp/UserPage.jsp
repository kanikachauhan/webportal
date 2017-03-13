<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Cache-Control", "must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alarm Connect</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="${pageContext.request.contextPath}/org/staticcontent/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/org/staticcontent/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/org/staticcontent/angular.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/org/staticcontent/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Lobster" />
<style type="text/css">
.jumbotron {
	background-color: #1C1C18;
}

.abcd {
	border: 2px solid #FFCC00;
	padding: 150px;
	background-color: #242316;
	color: #FFCC00;
	border-radius: 10px;
}

.abcd:hover {
	background-color: #FFCC00;
	color: white;
	transition-property: color;
	transition-duration: 2s;
	transition-timing-function: ease-out;
	transition-delay: initial;
	font-size: 100px;
}

.inset-text-effect {
	font: normal 50px "Lobster", Helvetica, cursive;
	text-shadow: 1px 1px 0 #FFCC00, -1px -1px 1px rgba(0, 0, 0, 0.67);
}

.w3-inner-color {
	background-color: #242316 !important
}

.w3-text-custom {
	color: #FFCC00 !important
}

.abcd {
	border: 2px solid #FFCC00;
	padding: 150px;
	background-color: #242316;
	color: #FFCC00;
	border-radius: 10px;
}

.w3-margin {
	margin-left: 10
}

.w3-inner-color {
	background-color: #242316 !important;
}
</style>
<script>
	function w3_open() {
		document.getElementById("mySidenav").style.display = "block";
	}

	function w3_close() {
		document.getElementById("mySidenav").style.display = "none";
	}
</script>
</head>
<body style="background-color: #1C1C18;">
	<nav class="w3-sidenav w3-inner-color  w3-animate-left"
		style="width:70px;display:none;z-index:2;" id="mySidenav"> <a
		class="w3-padding-16" href="#" onclick="w3_close()"><i
		class="fa fa-home w3-xxlarge w3-text-custom"></i></a> <a
		class="w3-padding-16" href="#" onclick="w3_close()"><i
		class="fa fa-user w3-xxlarge w3-text-custom"></i></a> </nav>
	

	<div class="container-fluid"
		style="background-color: #1C1C18;">
		<center><h1>Welcome Admin</h1></center>
	<div>
		<div class="w3-top">
		<div
			class="w3-xlarge w3-padding-xlarge w3-text-custom w3-inner-color ">
			<div class="w3-left w3-opennav fa fa-bars" onclick="w3_open()"></div>
			<div class="w3-center">Menu</div>
		</div>
	</div>
		<div class="row">
			<div class="col-sm-6">
				<center>
					<a href="myaccount/userData"><span style="font-size: 75px;"><i
							class="glyphicon glyphicon-user  abcd"></i></span></a> <br>
					<br>
					<h4 style="color: white;">User Data</h4>
				</center>
			</div>
			<div class="col-sm-6 ">
				<center>
					<a href="myaccount/network"><span style="font-size: 75px;"><i
							class="glyphicon glyphicon-globe  abcd"></i></span></a> <br>
					<br>
					<h4 style="color: white;">Network Details</h4>
				</center>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<center>
					<a href="myaccount/myproducts"><span style="font-size: 75px;"><i
							class="glyphicon glyphicon-th-list  abcd"></i></span></a> <br>
					<br>
					<h4 style="color: white;">Products</h4>
				</center>
			</div>
			<div class="col-sm-6">
				<center>
					<a href="myaccount/helps"><span style="font-size: 75px;"><i
							class="glyphicon glyphicon-question-sign  abcd"></i></span></a> <br>
					<br>
					<h4 style="color: white;">Help</h4>
				</center>
			</div>
		</div>
	</div>
</body>
</html>