<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<head>
<% 

    response.setHeader("Cache-Control","no-cache");
                response.setHeader("Cache-Control","no-store");
             response.setHeader("Pragma","no-cache");
              response.setDateHeader ("Expires", 0);
                 
%> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<script>
var fname,mname,lname,emailid,password,address,contactno,macaddress='';
var app = angular.module('myApp', []);
app.controller('mainController',function($scope,$http){
	$http.get("myaccount/extractuser").success(
		        function(data, status, headers, config) {
			       $scope.arr      = data;
			       jsonarr = data;
			      // alert(jsonarr);
			       $scope.name = jsonarr[0].name;
			       $scope.emailid = jsonarr[0].email;
			       $scope.password = jsonarr[0].password;
			       $scope.address = jsonarr[0].address;
			       $scope.contactno = jsonarr[0].phoneNumber;
			      
		        }).error(function(data, status, headers, config){});
});
function w3_open() {
	document.getElementById("mySidenav").style.display = "block";
}

function w3_close() {
	document.getElementById("mySidenav").style.display = "none";
}
</script>
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

.w3-bottombar {
	border-bottom: 6px solid #FFE200 !important
}

.w3-topbar {
	border-top: 6px solid #FFE200 !important
}

.w3-text-custom {
	color: #FFE200 !important
}

.w3-theme-d5 {
	color: #FFE200 !important;
	background-color: #FFE200 !important
}

.w3-border-custom {
	border: 5px solid #FFE200 !important;
	border-radius: 10px;
}

.w3-inner-color {
	background-color: #242316 !important;
}
</style>
</head>
<body style="background-color: #1C1C18;" ng-app="myApp">
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
				<div class="w3-center">Menu</div>
			</div>
		</div>
	<br>
	<br>
	<br>
	<div class="w3-row w3-section w3-inner-color w3-text-custom w3-padding"
		style="margin-left: 10%; margin-right: 10%;">
		<table class="table table-hover" ng-controller="mainController">
			<tr>
				<td><label>Name</label>&nbsp;&nbsp;&nbsp;&nbsp;<i class="w3-xxlarge fa fa-user"></i></td>
				<td><label>{{name}}</label></td>
			</tr>
			<tr>
				<td><label>Email</label>&nbsp;&nbsp;&nbsp;&nbsp;<i class="w3-xxlarge fa fa-envelope-o"></i></td>
				<td><label>{{emailid}}</label></td>
			</tr>
			<tr>
				<td><label>Password</label>&nbsp;&nbsp;&nbsp;&nbsp;<i
					class="w3-xxlarge fa fa-unlock-alt"></i></td>
				<td><label>{{password}}</label></td>
			</tr>
			<tr>
				<td><label>Address</label>&nbsp;&nbsp;&nbsp;&nbsp;<i
					class="w3-xxlarge fa fa-address-card"></i></td>
				<td><label>{{address}}</label></td>
			</tr>
			<tr>
				<td><label>Contact Number</label>&nbsp;&nbsp;&nbsp;&nbsp;<i
					class="w3-xxlarge fa fa-phone"></i></td>
				<td><label>{{contactno}}</label></td>
			</tr>
		</table>
	</div>
</body>
</html>