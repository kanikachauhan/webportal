<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%
	try {
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);

	} catch (Exception e) {
		response.sendRedirect("/Error.jsp");
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alarm Connect</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath}/org/staticcontent/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/org/staticcontent/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/org/staticcontent/angular.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/org/staticcontent/bootstrap-theme.min.css" />
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<link href='https://fonts.googleapis.com/css?family=Bad+Script'>
<script>
	var app = angular.module('myApp', []);
	app.controller('mainController', function($scope, $http) {
		$http.get("myadmin/allnetworks").success(
				function(data, status, headers, config) {
					$scope.itemsdata = data;
				}).error(function(data, status, headers, config) {
		});
	});
	//Script to open and close sidenav
	function w3_open() {
		document.getElementById("mySidenav").style.display = "block";
	}

	function w3_close() {
		document.getElementById("mySidenav").style.display = "none";
	}
</script>
<style type="text/css">
.jumbotron {
	background-color: #1C1C18;
}

.fclass {
	font-family: 'Bad Script';
}

.w3-inner-color {
	background-color: #242316 !important;
}

.w3-text-custom {
	color: #FFE200 !important
}
</style>
</head>
<body ng-app="myApp" style="background-color: #1C1C18;">
	<nav class="w3-sidenav w3-inner-color  w3-animate-left"
		style="width:70px;display:none;z-index:2;" id="mySidenav"> <a
		class="w3-padding-16" href="#" onclick="w3_close()"><i
		class="fa fa-home w3-xxlarge w3-text-custom"></i></a> <a
		class="w3-padding-16" href="#" onclick="w3_close()"><i
		class="fa fa-user w3-xxlarge w3-text-custom"></i></a> </nav>
	<div class="w3-top">
		<div
			class=" w3-xlarge w3-padding-xlarge w3-text-custom w3-inner-color ">
			<div class="w3-left w3-opennav fa fa-bars" onclick="w3_open()"></div>
			<div class="w3-center ">All Networks</div>
		</div>
	</div>
	<div class="container-fluid"
		style="background-color: #1C1C18; color: #FFE200; width: 75%;">
		<center>
			<ul class="w3-ul w3-card-4" style="background-color: #242316;padding-top:5%;"
				ng-controller="mainController">
				<li ng-repeat=" x in itemsdata">{{x.networkName}}</li>
			</ul>
		</center>
	</div>
</body>
</html>