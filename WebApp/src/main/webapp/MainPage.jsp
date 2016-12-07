<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alarm Connect</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" style="background: #993333;">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"  style="color:white;font-weight:bold;">Alarm Connect</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="homepage" style="color:white;font-weight:bold;">Home</a></li>
				<li><a href="#"  style="color:white;font-weight:bold;">About</a></li>
				<li><a href="contactus" style="color:white;font-weight:bold;">Contact Us</a></li>
			</ul>
		</div>
	</nav>
	<div class="jumbotron" >
		<div class="row" style="border:1px solid #993333;padding:10px;border-radius:5px;">
			<center><h1>Alarm Connect</h1><center>
		</div>
	</div>
	<div class="container-fluid">
	<ul class="nav nav-tabs">
			<li><a data-toggle="tab" href="#menu1" class="abc"><h1 style="border:1px solid #993333;border-radius:5px;padding:10px;">Customer</h1></a></li>
			<li><a data-toggle="tab" href="#menu2" class="abc"><h1 style="border:1px solid #993333;border-radius:5px;padding:10px;">Admin</h1></a></li>
		</ul>
	<s:if test="hasActionErrors()">
   		<div class="errors">
      		<s:actionerror/>
   		</div>
	</s:if>
	<div class="tab-content">
	<div id="menu1" class="tab-pane fade">
	<h1 style="color:#993333;">Customer Login Here!!</h1>
		<s:form action="/myaccount/user" role="form" method="post">
		<table>
			<tr>
				<td>User Name:</td>
				<td><input type="email" class="form-control" placeholder="UserName" name="username" ng-model="myInput" required/></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" class="form-control"  placeholder="Password" name="password" label="Password:" id="pwd" required/></td>
			</tr>
		</table>
		<div class="col-sm-4"><input type="submit" class="form-control" style="font-weight:bold;color:#993333;" value="Login"/></div>		
		</s:form>
	</div>
	<div id="menu2" class="tab-pane fade">
	<h1 style="color:#993333;">Admin Login Here!!</h1>
	<form action="/myadmin/admin" name="myForm" method="post">
		<table>
			<tr>
				<td>User Name:</td>
				<td>
					<input type="email" class="form-control" placeholder="UserName" name="username" ng-model="myInput" required/>
				</td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" class="form-control"  placeholder="Password" name="password" label="Password:" id="pwd" required/></td>
			</tr>
		</table>
			<div class="col-sm-4"><input type="submit" class="form-control" style="font-weight:bold;color:#993333;" value="Login"/></div>
		</form>
	</div>
</div>
</div>
</body>
</html>