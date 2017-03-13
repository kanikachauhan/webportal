<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="javascript/Script.js"></script>
<style>
#footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 30px; /* Height of the footer */
}

td {
	padding-bottom: 20px;
	padding-right: 20px;
}

.w3-bottombar {
	border-bottom: 6px solid #FFCC00 !important
}

.w3-topbar {
	border-top: 6px solid #FFCC00 !important
}

.w3-text-custom {
	color: #FFCC00 !important
}

.w3-theme-d5 {
	color: #FFCC00 !important;
	background-color: #FFCC00 !important
}
.w3-theme-d54 {
	color: black !important;
	background-color: #FFCC00 !important
}
.w3-border-custom {
	border: 5px solid #FFCC00 !important;
	border-radius: 10px;
}

.w3-inner-color {
	background-color: #242316 !important
}
</style>
<script>
	var app = angular.module('myApp', []);
	app.controller('customerctrl', function($scope) {
	});
	app.controller('adminctrl', function($scope) {
	});
	function openPage(opt) {
		var i;
		var x = document.getElementsByClassName("reg");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		document.getElementById(opt).style.display = "block";
	}
</script>
</head>

<body style="background-color: #1C1C18;" ng-app="myApp">
	<div class="w3-container w3-bottombar w3-topbar w3-text-custom">
		<h1>Alarm Connect</h1>
	</div>
	<br>
	<br>
	<br>
	<div
		class="w3-padding-xxlarge w3-card-8  w3-half w3-inner-color w3-text-custom w3-border-custom "
		style="margin-left: 25%; margin-top: 5%">
		<div class="w3-bar">
			<button
				class="w3-button w3-bar-item w3-inner-color w3-large w3-border-bottom  w3-border-yellow w3-text-custom"
				onclick="openPage('customer')" style="width: 50%;">Customer</button>
			<button
				class=" w3-button w3-bar-item w3-inner-color w3-large w3-border-bottom w3-border-yellow w3-border-left w3-text-custom"
				onclick="openPage('admin')" style="width: 50%;">Admin</button>
		</div>
		<br>
		<br>
		<!-- part 1 -->

		<div id="customer" class="w3-container reg w3-myfont reg">
			<form name="customer" id="customer" ng-controller="customerctrl"
				action="myaccount/user" novalidate>
				<h4>Customer Login</h4>
				<br>
				<table style="width: 100%;">
					<tr>
						<td><label class="w3-large">Username</label></td>
						<td><input name="username" class="w3-input" type="text"
							ng-model="username" /></td>
						<td><span
							ng-if="customer.username.$error.required && !customer.username.$pristine">Username
								required.</span></td>
					</tr>
					<tr>
						<td><label class="w3-large">Password</label></td>
						<td><input name="password" class="w3-input" type="password"
							ng-model="password" /></td>
						<td><span
							ng-if="customer.password.$error.required && !customer.password.$pristine">Password
								required.</span></td>
					</tr>
				</table>
				<input type="submit" class="w3-btn w3-theme-d54" ng-disabled="{{ customer.$invalid }}"
					style="color: black;" value="Login" />
			</form>
		</div>

		<!-- part 2 -->
		<div id="admin" class="w3-container reg w3-myfont reg"
			style="display: none;">
			<form name="admin" id="admin" ng-controller="adminctrl"
				action="myadmin/admin" novalidate>
				<h4>Admin Login</h4>
				<br>
				<table style="width: 100%;">
					<tr>
						<td><label class="w3-large">Username</label></td>
						<td><input name="uname" class="w3-input" type="text"
							ng-model="uname" required /></td>
						<td><span
							ng-if="admin.uname.$error.required && !admin.uname.$pristine">Username
								required.</span></td>
					</tr>
					<tr>
						<td><label class="w3-large">Password</label></td>
						<td><input name="password" class="w3-input" type="password"
							ng-model="password" required /></td>
						<td><span
							ng-if="admin.password.$error.required && !admin.password.$pristine">Password
								required.</span></td>
					</tr>
				</table>
				<input type="submit" ng-disabled="{{ admin.$invalid }}" class="w3-btn w3-theme-d54"
					style="color: black;" value="Login" />
			</form>
		</div>
	</div>

	<div class="w3-text-custom" id="footer">
		<p>Powered by Pantelwar@co</p>
	</div>
	<!-- #FFCC00,#242316 -->
</body>
</html>
