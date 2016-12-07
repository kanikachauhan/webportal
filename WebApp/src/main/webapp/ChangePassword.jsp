<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<script>
var app= angular.module('myApp', []);
app.controller('mainController', function($scope) {
	  $scope.submitForm = function() {
		  };
});
$(document).ready(function(){
		$("#sbtn").click(function(e){
			var t1=document.getElementById("npwd");
			var t2=document.getElementById("cpwd");
			var npwd=t1.value;
			var cpwd=t2.value;
			if(npwd!==cpwd)
				{
					alert("password fields didn't match..Try Again");
					e.preventDefault();
				}else{
				var ut=document.getElementById("sbtn");
				ut.style.disabled=false;
			}	
		});
	});
</script>
<style type="text/css">
.jumbotron{
 	background-color:#1C1C18;
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
	
	<div class="container-fluid" style="background-color:#1C1C18;">
	<div class="jumbotron">
	</div>
	
	<center>
	<h1 style="color:#FFE200; font-weight:bold;">Change Password</h1>
	<h4 style="color:#FFE200; ">Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters.</h3>
	<br><br>
	<form role="form" action="myaccount/update" name="changeform" method="post">
			<table> 
			<div class="form-group">
			<div class="col-sum-6">
				<tr>
					<td><label style="color:#FFE200; ">New Password</label></td>
					<td><input id="npwd" type="password" name="newpwd"  class="form-control" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Invalid Password"/>
					</td>
				</tr></div>
				</div>
			<div class="form-group">
			<div class="col-sum-6">
				<tr>
					<td><label style="color:#FFE200; ">Confirm Password</label></td>
					<td><input id="cpwd" type="password" name="oldpwd"  class="form-control" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"	title="Invalid Password"/>
					</td>
				</tr></div></div>
				
			</table><br>
			<input type="submit" value="change" name="submit" class="btn btn-default" style="disabled:true;" id="sbtn"/>
		</form>
		</center>
	</div>
</body>
</html>	