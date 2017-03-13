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
		response.setHeader("Cache-Control", "must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);

	} catch (Exception e) {
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
.w3-inchange {
	background: #242316;
	color: #FFE200 !important;
}

.w3-text-custom {
	color: #FFE200 !important
}
/* Set the width of the sidenav to 120px */
.w3-sidenav {
	width: 120px;
	background: #222;
}
/* Add a left margin to the "page content" that matches the width of the sidenav (120px) */
#main {
	margin-left: 120px
}
/* Remove margins from "page content" on small screens */
@media only screen and (max-width: 600px) {
	#main {
		margin-left: 0
	}
}

.w3-border-bottom {
	border-style: solid;
	border-width: 0px 0px 2px 0px;
	border-color: #FFE200;
}
</style>
<script>
	var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
	var app = angular.module('myApp', []);
	var products = [];
	app.controller('validateCtrl', function($scope) {
	});
	app.controller('productController', function($scope, $http) {
		$http.get("myadmin/getallproduct").success(
				function(data, status, headers, config) {
					$scope.itemsdata = data;
					$scope.sortType = 'name'; // set the default sort type
					$scope.reverseSort = false;
					products = data;
				}).error(function(data, status, headers, config) {
		});

	});
	function addproduct() {
		var pidval = document.getElementById("pid");
		var vals = pid.value;
		alert(document.getElementById("pid").value+" "+document.getElementById("name").value+" "+document.getElementById("description").value);
		if (vals === "" || !vals || vals.length==0) {
			$("#msg").append("Please generate Product Id");
		} else {
			
			$.ajax({
				url : "myadmin/addaddAdminProduct",
				method : 'GET',
				data: 'pid='+document.getElementById("pid").value+'&name='+document.getElementById("name").value+'&description='+document.getElementById("description").value,
				success : function(response) {
					$("#msg").append("Details Saved");
				}
			});
		}
	}
	function deleteproduct() {
		var delearr = [];
		$('input[type=checkbox]:checked').each(function(){
			delearr.push($(this).val());
		});
		//alert(delearr);
			$.ajax({
				url : "myadmin/deleteAdminProduct",
				method : 'GET',
				data: 'deletearr='+delearr,
				success : function(response) {
					if(response === "success")
						$("#msg1").append("Deletion Done");
					else
						$("#msg1").append("Some Error");
				}
			});
	}
	function w3_open() {
		document.getElementById("mySidenav").style.display = "block";
	}

	function w3_close() {
		document.getElementById("mySidenav").style.display = "none";
	}
	function openCity(cityName) {
		var i;
		var x = document.getElementsByClassName("city");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		document.getElementById(cityName).style.display = "block";
	}
	function generatepid() {
		var t2 = document.getElementById("pid");
		t2.value = "";
		cid = "PD";
		for (var i = 0; i < 8; i++) {
			var rnum = Math.floor(Math.random() * chars.length);
			cid += chars.substring(rnum, rnum + 1);
		}
		t2.value = cid;
	}
</script>
</head>
<body style="background-color: #1C1C18;" ng-app="myApp">
	<div>

		<!-- menu with tabs -->
		<nav
			class="w3-sidenav w3-center w3-small w3-hide-small w3-inner-color w3-text-custom ">
		<a class="w3-padding-large w3-black" href="#addproducts"> <i
			class="fa fa-home w3-xxlarge"></i>
			<p>Add</p>
		</a> <a class="w3-padding-large" href="#deleteproducts"> <i
			class="fa fa-eye w3-xxlarge"></i>
			<p>Delete</p>
		</a> </a> <a class="w3-padding-large" href="#photos"> <i
			class="fa fa-home  w3-xxlarge"></i>
			<p>Home</p>
		</a> </a> <a class="w3-padding-large" href="#photos"> <i
			class="fa fa-user w3-xxlarge"></i>
			<p>Log Out</p>
		</a> </nav>
		<!-- menu ends here -->

		<div class="w3-top w3-hide-large w3-hide-medium w3-text-custom "
			id="myNavbar">
			<div
				class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
				<a class="w3-bar-item w3-button" style="width: 25% !important"
					href="#">HOME</a> <a class="w3-bar-item w3-button"
					style="width: 25% !important" href="#about">ABOUT</a> <a
					class="w3-bar-item w3-button" style="width: 25% !important"
					href="#photos">PHOTOS</a> <a class="w3-bar-item w3-button"
					style="width: 25% !important" href="#contact">CONTACT</a>
			</div>
		</div>

		<!-- Add new product -->
		<div id="addproducts" class="w3-container w3-padding-64"
			style="margin-left: 15%;">
			<div class="w3-panel w3-inner-color w3-text-custom w3-border-bottom">
				<center>
					<h1>Add Products</h1>
				</center>
			</div>
			<br> <br> <br>
			<div id="add" name="add">
				<form id="productAdd" name="productAdd" ng-controller="validateCtrl"
					method="get" action="" class="w3-text-custom" novalidate>
					<div class="w3-row w3-section">
						<div class="w3-col " style="width: 100px">
							<input type="button" class="w3-btn w3-text-custom"
								style="background-color: #1C1C18;" onClick="generatepid();"
								value="Generate" />
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-inchange" name="email" type="text"
								id="pid" name="pid" placeholder="Generate Product ID" required
								disabled>
						</div>
						<br> <br>
					</div>
					<div class="w3-row w3-section"
						ng-class="{ 'has-error' : productAdd.name.$invalid && !productAdd.name.$pristine }">
						<div class="w3-col " style="width: 100px">
							<i class="w3-xxlarge glyphicon glyphicon-tasks"></i>
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-inchange" name="name" id="name" type="text"
								placeholder="Product Name" ng-model="name" required><br>
							<span
								ng-if="productAdd.name.$error.required && !productAdd.name.$pristine "
								style="margin-left: 25px; color: #FFE200;">Product Name
								required.</span>
						</div>
						<br>
					</div>
					<div class="w3-row w3-section"
						ng-class="{ 'has-error' : productAdd.description.$invalid && !productAdd.description.$pristine }">
						<div class="w3-col " style="width: 100px">
							<i class="w3-xxlarge glyphicon glyphicon-comment"></i>
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-inchange" name="description"
								type="text" placeholder="Product Description" id="description"
								ng-model="description" required><br> <span
								ng-if="productAdd.description.$error.required && !productAdd.description.$pristine "
								style="margin-left: 25px; color: #FFE200;">Product
								Description required.</span> <br>
						</div>
					</div>
					<br>
					<center>
						<h3><p  id="msg" class="w3-text-custom"></p></h3>
					</center>
					<br>
					<center>
						<a href="" ng-disabled="{{ productAdd.$invalid }}"
							onclick="addproduct();"><i
							class=" w3-xxlarge fa fa-save w3-text-custom"></i></a>
					</center>
				</form>
			</div>
		</div>
		<!-- Add new product ends here -->



		<br> <br> <br>
		<!-- delete new product -->
		<div id="deleteproducts" name="deleteproducts"
			class="w3-container w3-padding-64" style="margin-left: 15%;"
			ng-controller="productController">
			<div class="w3-panel w3-inner-color w3-text-custom w3-border-bottom">
				<center>
					<h1>Delete Products</h1>
				</center>
			</div>
			<br>

			<form class=" w3-padding-64">
				<table
					class="table table-bordered table-stripped table-hover table-responsive"
					style="background-color: #242316;">
					<tr>
						<th><a href="#"
							ng-click="sortType = 'productID'; sortReverse = !sortReverse"
							data-toggle="tooltip" data-placement="top" title="click to sort">
								Product Id <span
								ng-show="sortType == 'productID' && !sortReverse"
								class="fa fa-caret-down"></span> <span
								ng-show="sortType == 'productID' && sortReverse"
								class="fa fa-caret-up"></span>
						</a></th>
						<th><a href="#"
							ng-click="sortType = 'name'; sortReverse = !sortReverse"
							data-toggle="tooltip" data-placement="top" title="click to sort">
								Product Name <span ng-show="sortType == 'name' && !sortReverse"
								class="fa fa-caret-down"></span> <span
								ng-show="sortType == 'name' && sortReverse"
								class="fa fa-caret-up"></span>
						</a></th>
						<th><a href="#"
							ng-click="sortType = 'description'; sortReverse = !sortReverse"
							data-toggle="tooltip" data-placement="top" title="click to sort">
								Product Description <span
								ng-show="sortType == 'description' && !sortReverse"
								class="fa fa-caret-down"></span> <span
								ng-show="sortType == 'description' && sortReverse"
								class="fa fa-caret-up"></span>
						</a></th>
						<th><a href="#"> Delete Products </a></th>
					</tr>
					<tr ng-repeat="x in itemsdata | orderBy:sortType:sortReverse"
						class="w3-text-custom">
						<td>{{x.productID}}</td>
						<td>{{x.name}}</td>
						<td>{{x.description}}</td>
						<td><center>
								<input class="w3-check" type="checkbox" name="selprods" id="selprods"
									value="{{x.productID}}">
							</center>
							</center></td>
					</tr>
				</table>
				<br>
				<center>
						<h3><p  id="msg1" class="w3-text-custom"></p></h3>
					</center>
				<br> <br>
				<center>
					<a href="" ng-disabled="{{ productAdd.$invalid }}"
						onclick="deleteproduct();"><i
						class=" w3-xxlarge fa fa-trash w3-text-custom"></i></a>
				</center>
			</form>
		</div>
		<!-- delete product ends here -->


	</div>
</body>
</html>