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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alarm Connect</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/org/staticcontent/jquery.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/angular.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/org/staticcontent/bootstrap-theme.min.css"/>
<link href='https://fonts.googleapis.com/css?family=Coming+Soon' rel='stylesheet' type='text/css'>
<script>
var jsonarr;
var eid;
var tmac;
var fname,mname,lname,emailid,password,address,contactno,macaddress='';
var app = angular.module('myApp', []);
app.controller('mainController',function($scope,$http){
	$http.get("myaccount/extractuser").success(
		        function(data, status, headers, config) {
			       $scope.arr      = data;
			       jsonarr = data;
			       $scope.fname = jsonarr[0].firstname;
			       $scope.mname = jsonarr[0].middlename;
			       $scope.lname = jsonarr[0].lastname;
			       $scope.emailid = jsonarr[0].emailid;
			       $scope.password = jsonarr[0].password;
			       $scope.address = jsonarr[0].address;
			       $scope.contactno = jsonarr[0].contactno;
			       eid = jsonarr[0].emailid;
			    /*   $scope.macaddress = '  ';
			       for(var tt=0;tt<jsonarr.length;tt++)
			    	   $scope.macaddress = $scope.macaddress + jsonarr[tt].macaddress+" ";
			     */  			       
		        }).error(function(data, status, headers, config){});
	$http.get("myaccount/extractproduct").success(
			function(data,status,headers,config) {
				$scope.macaddress = '';
				tmac = data;
				for(var t=0;t<tmac.length;t++)
					$scope.macaddress = $scope.macaddress + tmac[t].macaddress+"    ";
			}).error(function(data,status,headers,config){});
	});
app.controller('networkController',function($scope,$http){
	$http.get("myaccount/ownnetwork").success(
			function(data,status,headers,config){
				var x='';
				var y='';
				var t=0;
				for(t=0;t<data.length-1;t++)
						x=x+data[t].nname+',';
			//	alert(data[t].nname+" "+x);
				x = x+data[t].nname;
				//alert(x);
				//x=x+data[t].name;					
					$scope.networkarr = x;
				//alert(x);
				}).error(function(data,status,headers,config){});
});
app.controller('joinednetworkController',function($scope,$http){
	$http.get("myaccount/myjoinednetwork").success(
			function(data,status,headers,config){
				var x='';
				for(var t=0;t<data.length;t++)
					x=x+data[i].nname;
				$scope.joinednetwork = x;
			}).error(function(data,status,headers,config){});
});
app.controller('joinednetworkController',function($scope,$http){
	$http.get("myaccount/joinednetworkss").success(
			function(data,status,headers,config){
				var x='';
				for(var t=0;t<data.length;t++)
					x=x+data[i].nname;
				$scope.joinednetwork = x;
			}).error(function(data,status,headers,config){});
});
</script>
<style type="text/css">
.jumbotron{
 	background-color:#1C1C18;
}
.fclass{
	font-family: 'Coming Soon', cursive;
}
</style>
</head>
<body ng-app="myApp" style="background: #1C1C18;">
<nav class="navbar navbar-inverse navbar-fixed-top" style="background: #1C1C18;">
		<div class="container-fluid"> 	
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
	
	<div class="container-fluid fclass" style="background: #1C1C18;color:#FFE200;font-weight:bold;">
		<ul class="nav nav-tabs">
			<li><a data-toggle="tab" href="#home" class="abc"><h1>Your Info</h1></a></li>
		</ul>
	<div class="tab-content">
		<!-- menu 1 start-->
		<div id="home" class="tab-pane fade in active">
		<center>
			<table class="table table-hover table-responsive" id="details" name="details"   ng-controller="mainController">
					<tr>
						<td>First Name:</td>
						<td>{{fname}}</td>
					</tr>
					<tr>
						<td>Middle Name:</td>
						<td>{{mname}}</td>
					</tr>
					<tr>
						<td>Last Name:</td>
						<td>{{lname}}</td>
					</tr>
					<tr>
						<td>Email Id:</td>
						<td>{{emailid}}</td>
					</tr>
					<tr>
						<td>Password:</td>
						<td>{{password}}</td>
					</tr>
					<tr>
						<td>Address:</td>
						<td>{{address}}</td>
					</tr>
					<tr>
						<td>Contact No:</td>
						<td>{{contactno}}</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					</table>
			</center>
    </div>
   
  </div>
</div>
</body>
</html>