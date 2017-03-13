<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<head>
<% 
try{
    response.setHeader("Cache-Control","no-cache");
                response.setHeader("Cache-Control","no-store");
             response.setHeader("Pragma","no-cache");
              response.setDateHeader ("Expires", 0);
              
}catch(Exception e){
	response.sendRedirect("/Error.jsp");
}      
%> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alarm Connect</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/org/staticcontent/jquery.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/angular.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/org/staticcontent/bootstrap-theme.min.css"/>
<link href='https://fonts.googleapis.com/css?family=Bad+Script' rel='stylesheet' type='text/css'>
<script>
var app = angular.module('myApp', []);
app.controller('mainController',function($scope,$http){
	$http.get("myadmin/allnetworks").success(
		        function(data, status, headers, config) {
		            $scope.itemsdata    = data;
		        }).error(function(data, status, headers, config){});
	});
</script>
<style type="text/css">
.jumbotron{
	background-color:#1C1C18;
}
.fclass{
	font-family: 'Bad Script';
}
</style>
</head>
<body ng-app="myApp" style="background-color: #1C1C18;">
	<nav class="navbar navbar-inverse navbar-fixed-top" style="background:  #1C1C18;">
		<div class="container-fluid"> 	
		<div class="navbar-header">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/AdminPage.jsp"><p style="color: white;font-weight:bold;">Home</p></a></li>
				<li><a href="myadmin/logout" style="color:white;font-weight:bold;" >Log Out</a></li>
			</ul>
		</div>
		</div>
	</nav>
	<div class="jumbotron">	
	</div>
	
	<div class="container-fluid" style=" background-color:#1C1C18;color:#FFE200;">
		<center>
		<h1 style="color:#FFE200;">All Networks</h1>
			<table class="table table-bordered table-stripped table-hover table-responsive " ng-controller="mainController">
				<th>
					Network Names
				</th>
				<tr ng-repeat=" x in itemsdata">
					<td>{{x.networkName}}</td>
				</tr>
			</table>
		</center>
	</div>
</body>
</html>