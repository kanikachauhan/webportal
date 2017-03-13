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
.w3-theme-d54 {
	color: black !important;
	background-color: #FFCC00 !important
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

.w3-border-bottom {
	border-style: solid;
	border-width: 1px 1px 10px 1px;
	border-color: #FFE200;
}

.w3-inner-color {
	background-color: #242316 !important;
}

.custom-font {
	font-size: 65px;
	margin-top: 15%;
	margin-bottom: 15%;
}

.w3-hfcolor {
	background-color: #FFE200;
	color: #242316 !important;
}

.w3-foot {
	border: 0px 10px solid #FFE200;
}

.w3-inchange {
	background: #242316;
	color: #FFE200 !important;
}

.mpadding {
	padding: 2%;
}

.w3-half {
	width: 40%;
	margin-left: 65px;
}
</style>
<script>
var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
var charss="0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZ";
var users = [];
var delearr = [];
var app = angular.module('myApp', []);
app.controller('adduserctrl', function($scope) {
});

app.controller('validateCtrl', function($scope) {
});

app.controller('validateCtrlOne',function($scope,$http){
	$http.get("myadmin/getalldata").success(
			function(data, status, headers, config) {
				$scope.itemsdata = data;
				users = data;
			}).error(function(data, status, headers, config) {
	});
});
function generatepwd(){
	var t1=document.getElementById("pwd");
	t1.value="";
	randomstring="";
	for (var i=0; i<8; i++) {
    var rnum = Math.floor(Math.random() * chars.length);
    randomstring += chars.substring(rnum,rnum+1);
	}
	t1.value=randomstring;
}
function generateServerPassword(){
	var t1=document.getElementById("spwd");
	t1.value="";
	randomstring="";
	for (var i=0; i<8; i++) {
    var rnum = Math.floor(Math.random() * chars.length);
    randomstring += chars.substring(rnum,rnum+1);
	}
	t1.value=randomstring;
}
function generatecid(){
	var t2=document.getElementById("cid");
	t2.value="";
	cid="AC";
	for (var i=0; i<6; i++) {
	    var rnum = Math.floor(Math.random() * chars.length);
	    cid += chars.substring(rnum,rnum+1);
	}
	t2.value=cid;
}
function removeit(x){
	//alert(x);
	document.getElementById(x).parentElement.style.display='none';
	delearr.push(x);
}
function deleteusers(){
	alert(delearr);
	
	$.ajax({
		url : "myadmin/deletedata",
		method : 'GET',
		data: 'customerid='+deletedata,
		success : function(response) {
			if(response === "success")
				$("#msg1").append("Details Saved");
			else
				$("#msg1").append("Some Error");
		},
		error :function(response){
			$("#msg1").append("Some Error");
		}
	});
}
</script>
</head>
<body style="background-color: #1C1C18;" ng-app="myApp">
	<div>
		<div
			class="w3-top w3-xlarge w3-padding-xlarge w3-text-custom w3-inner-color">
			<div class="w3-center">Manage Users</div>
		</div>
		<br> <br> <br> <br> <br> <br>
		<div
			class="w3-panel w3-half w3-card-24 w3-inner-color w3-text-custom w3-border-bottom">
			<center>
				<header class="w3-container w3-inner-color">
				<h3>Add</h3>
				</header>
				<a href="#add"
					onclick="document.getElementById('add').style.display='block'">
					<span class="glyphicon glyphicon-plus w3-text-custom custom-font"></span>
				</a>
			</center>
		</div>
		<div
			class="w3-panel w3-half w3-card-24 w3-inner-color w3-text-custom w3-border-bottom">
			<center>
				<header class="w3-container w3-inner-color ">
				<h3>Update</h3>
				</header>
				<a href="#"> <span
					class="glyphicon glyphicon-pencil w3-text-custom custom-font"></span>
				</a>
			</center>
		</div>
		<div
			class="w3-panel w3-half w3-card-24 w3-inner-color w3-text-custom  w3-border-bottom">
			<center>
				<header class="w3-container w3-inner-color">
				<h3>Delete</h3>
				</header>

				<a href="#"
					onclick="document.getElementById('delete').style.display='block'">
					<span class="glyphicon glyphicon-trash w3-text-custom custom-font"></span>
				</a>
			</center>
		</div>
		<div
			class="w3-panel w3-half w3-card-24 w3-inner-color w3-text-custom  w3-border-bottom">
			<center>
				<header class="w3-container w3-inner-color">
				<h3>Manage Products</h3>
				</header>

				<a href="#"
					onclick="document.getElementById('delete').style.display='block'">
					<span
					class="glyphicon glyphicon-th-large w3-text-custom custom-font"></span>
				</a>
			</center>
		</div>


		<!-- Addition Form -->
		<div id="add" name="add" 
			class="w3-modal w3-text-custom w3-animate-zoom">
			<div class="w3-modal-content w3-inner-color">
				<header class="w3-container  w3-hfcolor"> <span
					onclick="document.getElementById('add').style.display='none'"
					class="w3-closebtn">&times;</span>
				<h2>Add User</h2>
				</header>
				<div>
				<form id="userAdd" name="userAdd" ng-controller="validateCtrl" method="post" novalidate  >
					<div class="w3-row w3-section mpadding" >
						<div class="w3-col " style="width: 100px">
							<i class="w3-xxlarge fa fa-user"></i>
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-inchange" name="email" type="text"
								placeholder="Name">
						</div>
					</div>
					<div class="w3-row w3-section mpadding">
						<div class="w3-col " style="width: 100px">
							<i class="w3-xxlarge fa fa-envelope-o"></i>
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-inchange" name="email" type="text"
								placeholder="Email">
						</div>
					</div>
					<div class="w3-row w3-section  mpadding">
						<div class="w3-col" style="width: 100px">
							<i class="w3-xxlarge fa fa-phone"></i>
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-inchange" name="email" type="text"
								placeholder="Contact">
						</div>
					</div>
					<div class="w3-row w3-section mpadding">
						<div class="w3-col " style="width: 100px">
							<i class="w3-xxlarge fa fa-home"></i>
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-inchange" name="email" type="text"
								placeholder="Address">
						</div>
					</div>
					<div class="w3-row w3-section mpadding">
						<div class="w3-col " style="width: 100px">
							<i class="w3-xxlarge 	glyphicon glyphicon-globe"></i>
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-inchange" name="email" type="text"
								placeholder="Mac Address">
						</div>
					</div>

					<div class="w3-row w3-section mpadding">
						<div class="w3-col " style="width: 100px">
							<input type="button" class="w3-button w3-text-custom" style="background-color: #242316;"  onClick="generatecid(); " value="Generate"/>
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-inchange" name="email" type="text" id="cid" name="cid"
								placeholder="Generate Customer ID">
						</div>
					</div>

					<div class="w3-row w3-section mpadding">
						<div class="w3-col " style="width: 100px">
							<input type="button" class="w3-button  w3-text-custom" style="background-color: #242316;"  onClick="generatepwd();" value="Generate"/>
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-inchange" name="email" type="text" id="pwd"
								placeholder="Generate Server Password" >
						</div>
					</div>

					<div class="w3-row w3-section mpadding">
						<div class="w3-col " style="width: 100px">
							<input type="button" class="w3-button  w3-text-custom" style="background-color: #242316;"  onClick="generateServerPassword();" value="Generate"/>
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-inchange" name="email" type="text" id="spwd"
								placeholder="Generate One Time Password">
						</div>
					</div>
					<div class="w3-row w3-section mpadding">
						<div class="w3-col " style="width: 100px">
							<i class="w3-xxlarge glyphicon glyphicon-th-large w3-text-custom custom-font"></i>
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-inchange" name="email" type="text" id="spwd"
								placeholder="Generate One Time Password">
						</div>
					</div>
					</form>
				</div>
				<footer class="w3-container  w3-hfcolor">
				<h3>Add</h3>
				</footer>
			</div>
		</div>
		<!-- Addition Form Ended -->




		<!-- Deletion Form -->
		<div class="w3-modal w3-text-custom w3-animate-zoom" id="delete"
			name="delete">
			<form>
			<div class="w3-modal-content w3-inner-color">
				<header class="w3-container  w3-hfcolor"> <span
					onclick="document.getElementById('delete').style.display='none'"
					class="w3-closebtn">&times;</span>
				<h2>Delete User</h2>
				</header>
				<div  ng-controller="validateCtrlOne">
					<ul class="w3-ul w3-card-4">
						<li class="w3-padding-16" ng-repeat=" x in itemsdata"><span
							onclick="removeit($(this).attr('id'));" id="{{x.email}}"
							class="w3-closebtn w3-padding w3-margin-right w3-medium">&times;</span>
							<span>{{x.email}}</span></li>
					</ul>
				</div>
				<br><br>
				<input type="button" value="Delete" class="w3-btn w3-theme-d54" style="color: black;" onclick="deleteusers();"/>
			</div>
			<br><br>
			<h4 class="w3-text-custom">
								<p id="msg1"></p>
							</h4>
				<br>
			</form>
			<br><br>
		</div>
		<!-- Deletion Form Ended -->



		<!-- Update Form -->
		<div></div>
		<!-- Update Form Ended -->
	</div>
</body>
</html>