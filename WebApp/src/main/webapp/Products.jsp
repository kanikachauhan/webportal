<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
     <%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 
    response.setHeader("Cache-Control","no-cache");
                response.setHeader("Cache-Control","no-store");
             response.setHeader("Pragma","no-cache");
              response.setDateHeader ("Expires", 0);
                
%> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alarm Connect</title>
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="javascript/Script.js"></script>
<style>
.w3-inner-color {
	background-color: #242316 !important
}

.w3-text-custom {
	color: #FFE200 !important
}

.abcd {
	border: 2px solid #FFE200;
	padding: 150px;
	background-color: #242316;
	color: #FFE200;
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
var prodarr = [];
var app = angular.module('myApp', []);
app.controller('validateCtrl', function($scope,$http) {
	$http.get("myadmin/fetchmyproducts").success(
	        function(data, status, headers, config) {
	        	$scope.prodarr = data;
	        }).error(function(data, status, headers, config){});
	
});
function w3_open() {
	document.getElementById("mySidenav").style.display = "block";
}

function w3_close() {
	document.getElementById("mySidenav").style.display = "none";
}
</script>
</head>
<body style="background-color:#1C1C18;" ng-app="myApp">
<nav class="w3-sidenav w3-inner-color  w3-animate-left"
		style="width:70px;display:none;z-index:2;" id="mySidenav"> <a
		class="w3-padding-16" href="#" onclick="w3_close()"><i
		class="fa fa-home w3-xxlarge w3-text-custom"></i></a> <a
		class="w3-padding-16" href="#" onclick="w3_close()"><i
		class="fa fa-user w3-xxlarge w3-text-custom"></i></a> </nav>
		<div class="w3-top">
			<div class="w3-white w3-xlarge w3-padding-xlarge w3-text-custom w3-inner-color "
				>
				<div class="w3-left w3-opennav fa fa-bars"
					onclick="w3_open()"></div>
				<div class="w3-center">Your Products</div>
			</div>
		</div>
	<div class="container-fluid" style="background-color:#1C1C18;" ng-controller="validateCtrl">
		<div >
			<table class=" table table-bordered table-stripped table-hover table-responsive w3-text-custom" style="margin-top:10%;margin-left:10%;width:75%;margin-right:10%;" >
				<tr>
					<th><center>Product Id</center></th>
					<th><center>Product Name</center></th>
				</tr>
				<tr  ng-repeat="x in prodarr">
					<td style="font-family: 'Kaushan Script', cursive;color: #FFE200;"><center>{{x.productID}}</center></td>
					<td style="font-family: 'Kaushan Script', cursive;color: #FFE200;"><center>{{x.name}}</center></td>
				</tr>
			</table>
		</div>
	</div>	
</body>
</html>