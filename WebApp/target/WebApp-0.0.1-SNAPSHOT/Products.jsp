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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alarm Connect</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/org/staticcontent/jquery.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/angular.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/org/staticcontent/bootstrap-theme.min.css"/>
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<style type="text/css">
.jumbotron{
 	background-color:#1C1C18;
 }
 td{
 	font-family: 'Kaushan Script', cursive;
 	font-color: #FFE200;
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
</script>
</head>
<body style="background-color:#1C1C18;" ng-app="myApp">
<nav class="navbar navbar-inverse navbar-fixed-top" style="background: #1C1C18;">
		<div class="container-fluid" style="background: #1C1C18;"> 	
		<div class="navbar-header">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/UserPage.jsp"><p style="color: white;font-weight:bold;">Home</p></a></li>
				<li><a href="myaccount/logout" style="color:white;font-weight:bold;" >Log Out</a></li>
			</ul>
		</div>
		</div>
	</nav>
	
	<div class="container-fluid" style="background-color:#1C1C18;">
	<div class="jumbotron">
	</div>
	
	<div ng-controller="validateCtrl">
		<center><h1 style="font-family: 'Kaushan Script', cursive;color: #FFE200;">Your Products</h1></center>
		<div >
			<table class="table table-bordered table-stripped table-hover table-responsive" >
				<tr>
					<th>Product Id</th>
					<th>Product Name</th>
					<!-- <th>Mac Address</th> -->
				</tr>
				<tr  ng-repeat="x in prodarr">
					<td style="font-family: 'Kaushan Script', cursive;color: #FFE200;">{{x.pid}}</td>
					<td style="font-family: 'Kaushan Script', cursive;color: #FFE200;">{{x.name}}</td>
					<!-- <td style="font-family: 'Kaushan Script', cursive;color: #FFE200;">{{x.macaddress}}</td> -->
				</tr>
			</table>
		</div>
	</div>	
</body>
</html>