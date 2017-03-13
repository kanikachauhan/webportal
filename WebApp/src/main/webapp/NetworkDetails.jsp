<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<style type="text/css">
.w3-inner-color {
	background-color: #242316 !important
}

.w3-text-custom {
	color: #FFCC00 !important
}
.w3-hfcolor {
	background-color: #FFCC00;
	color: #242316 !important;
}
.abcd {
	border: 2px solid #FFCC00;
	padding: 150px;
	background-color: #242316;
	color: #FFCC00;
	border-radius: 10px;
}
.w3-theme-d54 {
	color: black !important;
	background-color: #FFCC00 !important
}

.w3-margin {
	margin-left: 10
}
.w3-theme-d45{
	color: #FFCC00 !important;
	background-color: #1C1C18 !important
}
.w3-inner-color {
	background-color: #242316 !important;
}
</style>
<script>
	var jsonarr = [];
	var joinedarr = [];
	var ownedarr = [];
	var usernameval = "";
	function w3_open() {
		document.getElementById("mySidenav").style.display = "block";
	}

	function w3_close() {
		document.getElementById("mySidenav").style.display = "none";
	}
	var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
	var app = angular.module('myApp', []);
	app.controller('mainController', function($scope, $http) {
		$http.get("myaccount/getallnetworks").success(
				function(data, status, headers, config) {
					jsonarr = data;
				}).error(function(data, status, headers, config) {
		});
		$http.get("myaccount/getownednetworksforcurrentuser").success(
				function(data, status, headers, config) {
					ownedarr = data;
				}).error(function(data, status, headers, config) {
		});

		$http.get("myaccount/getjoinednetworksforcurrentuser").success(
				function(data, status, headers, config) {
					joinedarr = data;
					alert(joinedarr[0].networkName);
				}).error(function(data, status, headers, config) {
		});

	});

	app.controller('joinController', function($scope, $http) {

	});
	app.controller('manageController', function($scope, $http) {

	});
	function request() {
		var tname = document.getElementById("nname").value;
		var tu = document.getElementById("uname").value;
		var flag1 = "false";
		var flag2 = "false";
		var flag3 = "false";
		var flag4 = "false";
		var reqflag = "false";
		for (var i = 0; i < ownedarr.length; i++) {
			if (ownedarr[i].networkName === tname) {
				flag1 = "true";
				break;
			}
		}

		for (var j = 0; j < joinedarr.length; j++) {
			if (joinedarr[j].networkName === tname) {
				flag2 = "true";
				break;
			}
		}
		for (var t = 0; t < jsonarr.length; t++) {
			if (jsonarr[t].networkName === tname) {
				var gusers = jsonarr[t].users;
				var k = "do";
				if (gusers !== undefined) {
					if (gusers.length != 0) {
						for (var j = 0; j < gusers.length; j++) {

							if (gusers[j].email === tu
									&& gusers[j].status === "false") {
								alert(gusers[j].email + " " + gusers[j].status);
								flag4 = "true";
								k = "true";
								break;
							}
						}
					}
				}
				if (k === "true") {
					break;
				}
			}
		}

		if (ownedarr.length + joinedarr.length > 10) {
			flag3 = "true";
		}

		if (flag1 === "true") {
			$("#err2").text("Network Owned");
		} else if (flag2 === "true") {
			$("#err2").text("Network Joined");
		} else if (flag3 === "true") {
			$("#err2").text("Cannot Join more networks.Limit Reached.");
		} else if (flag4 === "true") {
			$("#err2").text("Request Already Present");
		} else {
			$.ajax({
				url : "myaccount/request",
				type : 'GET',
				data : 'reqflag=' + reqflag + '&nname=' + tname,
				success : function(response) {
					if (response === "success") {
						$("#req").disabled();
						$("#err2").text("Details Saved");
					} else
						$("#err2").text("Some Error");
				},
				error : function(e) {
					$("#err2").text("Some Error");
				}
			});
		}
	}

	function showres() {
		$("#ntb").remove();
		var tt = document.getElementById("nname");
		var v = tt.value;
		for (var t = 0; t < jsonarr.length; t++) {
			if (v.toUpperCase() === jsonarr[t].networkName.toUpperCase()) {
				$("#abc")
						.after()
						.append(
								"<table class='table table-bordered table-stripped table-hover table-responsive' id='ntb'><tr><th>Network Name</th><th>Request</th></tr><tr><td>"
										+ jsonarr[t].networkName
										+ "</td><td><input type='hidden' value='"+jsonarr[t].networkName+"'/><input type='button' class='btn btn-info' value='Join' onclick='request();' id='req'/></td></tr></table>");
				break;
			}
		}
	}
	function leaveselected(x){
		var x = [];
		$('.lchk:checked').each(function(){
			x.push($(this).val());
		});
		$.ajax({
			url : "myaccount/leavenetwork",
			type : 'GET',
			data : 'nname='+x,
			success : function(response){
				if(response === "success")
					$("#err4").text("Network Left");
				else
					$("#err4").text("Some Error");
		},
		error : function(e){
			$("#err4").text("Some Error");
		}
		});
	}
	function savenetwork() {
		var nname = document.getElementById("networkname").value;
		var flag1 = "false";
		var flag2 = "false";
		var nid = '';
		nid = "NI";
		var cid_len = 6;
		for (var i = 0; i < cid_len; i++) {
			var rnum = Math.floor(Math.random() * chars.length);
			nid += chars.substring(rnum, rnum + 1);
		}
		for (var i = 0; i < jsonarr.length; i++) {
			if (jsonarr[i].networkName === nname) {
				flag1 = "true";
				break;
			}
		}
		if (ownedarr.length + joinedarr.length > 10) {
			flag2 = "true";
		}

		if (nname === "" || !nname || nname.length === 0) {
			//validation name must not be emptuy
			$("#err1").text("Network Name Empty");
		} else if (flag1 === "true") {
			//validation to check network name exists
			$("#err1").text("Network Name Exists");
		} else if (flag2 === "true") {
			//validation to check the number of networks
			$("#err1").text("Creation+Joining Limit Reached");
		} else {
			//submit the form

			$.ajax({
				url : "myaccount/networkcreate",
				method : 'GET',
				data : 'nname=' + nname + '&networkid=' + nid,
				success : function(response) {
					if (response === "success")
						$("#err1").text("Details Saved");
					else
						$("#err1").text("Some Error");
				},
				error : function(e) {
				}
			});
		}
	}
	function myFunction(id) {
		var x = document.getElementById(id);
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
			x.previousElementSibling.className += " w3-";
		} else {
			x.className = x.className.replace(" w3-show", "w3-theme-d54");
			x.previousElementSibling.className = x.previousElementSibling.className
					.replace("w3-theme-d54", "");
		}
	}
	function changetimer(x){
		var nname=x.substring(1);
		document.getElementById("tb"+nname+"").disabled=false;
		$("#c"+nname+"").hide();
		//alert(nname);
		$("#s"+nname+"").show();
	}
	function openmanage() {
		document.getElementById('managenetwork').style.display = 'block';
		usernameval = document.getElementById("uname").value;
		for (var i = 0; i < joinedarr.length; i++) {
			$("#leave > tbody:last-child")
					.append(
							"<tr class='removeRow'><td>"
									+ joinedarr[i].networkName
									+ "</td><td><input class='lchk' type='checkbox' value='"+joinedarr[i].networkName+"' /></td></tr>");
		}
		for (var i = 0; i < ownedarr.length; i++) {
			$("#mmynetworks > tbody:last-child")
					.append(
							"<tr class='removeRow'><td>"
									+ ownedarr[i].networkName
									+ "</td><td><input class='chk' type='checkbox' value='"+ownedarr[i].networkName+"' /></td><td><input type='button' class='w3-btn w3-theme-d54' onclick='changetimer($(this).attr('id'));' id='c"
									+ ownedarr[i].networkName
									+ "' value='Change Timer'/></td><td><input type='text' value='"+ownedarr[i].timer+"'/>"
									+"<input type='button' class='btn btn-success' onclick='savetimer($(this).attr('id'));' id='s"+ownedarr[i].networkName+"' value='Save' style='display:none;'/>"
									+"</td></tr>");
		}
		for (var i = 0; i < jsonarr.length; i++) {
			if (jsonarr[i].admin === usernameval) {
				var gusers = jsonarr[i].users;
				if(gusers !== undefined) {
					if (gusers.length != 0) {
						for (var j = 0; j < gusers.length; j++) {
							
						if(gusers[j].status === "true"){
						$("#requests > tbody:last-child")
						.append("<tr  class='removeRow' style='color:#FFCC00;'><td>"+jsonarr[i].networkName+"</td><td>"+gusers[j].email+"</td><td><input type='checkbox' value='"+jsonarr[i].networkName+" "+gusers[j].email+"'/></td></tr>");
						}
						}
					}
				}
		}
	}/*
		for(var i = 0;i< ownedarr.length;i++){
			var val1 = ownedarr[i].networkName;
			for(var j=0;j<jsonarr.length;j++){
				if(jsonarr[j].networkName == val1){
					var gusers = jsonarr[i].users;
					if(gusers !== undefined) {
						if (gusers.length != 0) {
							for (var j = 0; j < gusers.length; j++) {
								$("#nmembers > tbody:last-child")
								.append("<tr style='color:#FFCC00;'><td>"+jsonarr[i].networkName+"</td><td>"+gusers[j].email+"</td><td><input type='button' class='btn btn-success ' id='"+gusers[j].email+" "+jsonarr[i].networkName+"' value='Approve' onclick='approve();'/>&nbsp;&nbsp;<input type='button' class='btn btn-danger ' id='c"+gusers[j].email+" "+jsonarr[i].networkName+"' value='Cancel' onclick='cancel();' /></td></tr>");
								}
						}
					}
				}
			}
		}*/
	}
	function deleteselected(){
		var delearr = [];
		$('.chk:checked').each(function(){
			delearr.push($(this).val());
		});
		
		alert(delearr);
			$.ajax({
				url : "myadmin/deletenetwork",
				method : 'GET',
				data: 'deletearr='+delearr,
				success : function(response) {
					if(response === "success")
						$("#err3").append("Deletion Done");
					else
						$("#err3").append("Some Error");
				}
			});
	}
</script>
</head>
<body style="background-color: #1C1C18;" ng-app="myApp">
	<nav class="w3-sidenav w3-inner-color  w3-animate-left"
		style="width:70px;display:none;z-index:2;" id="mySidenav"> <a
		class="w3-padding-16" href="#" onclick="w3_close()"><i
		class="fa fa-home w3-xxlarge w3-text-custom"></i></a> <a
		class="w3-padding-16" href="#" onclick="w3_close()"><i
		class="fa fa-user w3-xxlarge w3-text-custom"></i></a> </nav>
	<div class="w3-top">
		<div
			class="w3-xlarge w3-padding-xlarge w3-text-custom w3-inner-color ">
			<div class="w3-left w3-opennav fa fa-bars" onclick="w3_open()"></div>
			<div class="w3-center">Network</div>
		</div>
	</div>
	<div  class="container-fluid">
	
	<h1>contente</h1><br>
		<div class="row" >
			<div class="col-md-4">
				<center>
					<a href="#createnetwork"
						onclick="document.getElementById('createnetwork').style.display='block'">
						<span style="font-size: 75px;"><i
							class="glyphicon glyphicon-user  abcd"></i></span>
					</a>
					<h4 style="color: #FFCC00;">Create Network</h4>
				</center>
				<br> <br>
				
			</div>
			<div class="col-md-4">
				<center>
				<!-- onclick="document.getElementById('joinnetwork').style.display='block'"> -->
					<a href="#joinnetwork" onclick="openmanage();">
						<span style="font-size: 75px;"><i
							class="glyphicon glyphicon-globe  abcd"></i></span>
					</a>
					<h4 style="color: #FFCC00;">Join Networks</h4>
				</center>
				<br> <br>

			</div>
			<div class="col-md-4">
				<center>
					<a href="#managenetwork" onclick="openmanage();"> <span
						style="font-size: 75px;"><i
							class="glyphicon glyphicon-globe  abcd"></i></span>
					</a>
					<h4 style="color: #FFCC00;">Manage Networks</h4>
				</center>
				<br> <br>
				
			</div>
		</div>

		<!-- create Network -->	
		<div class="w3-modal w3-text-custom w3-animate-zoom"
			id="createnetwork" name="createnetwork"
			ng-controller="mainController">
			<div class="w3-modal-content w3-inner-color">
				<header class="w3-container  w3-hfcolor"> <span
					onclick="document.getElementById('createnetwork').style.display='none'"
					class="w3-closebtn">&times;</span>
				<center><h2>Create Network</h2></center></header>
				
				<div>
					<center>
						<h3>Enter Name</h3>
					</center>
					<br> <br>
					<form>
						<center>
							<input type="text" name="networkname" id="networkname" required />
							<br> <br> <input type="submit" value="Save"
								onclick="savenetwork();" class="w3-btn w3-theme-d54" style="color: black;"/><br> <br>
							<h4 class="w3-text-custom">
								<p id="err1"></p>
							</h4>
						</center>
					</form>
					<br><br><br><br>
				</div>

			</div>
		</div>
		<!-- create Network ended -->



		<!--  join network -->
		<div class="w3-modal w3-text-custom w3-animate-zoom" id="joinnetwork"
			name="joinnetwork" ng-controller="joinController">
			<div class="w3-modal-content w3-inner-color">
				<header class="w3-container  w3-hfcolor"> <span
					onclick="document.getElementById('joinnetwork').style.display='none'"
					class="w3-closebtn">&times;</span>
				<center><h2>Search And Join Network</h2></center>
				</header>
				<div>
					<center>
						<h3>Enter Name</h3>
						</center>
					<br><br>
						<form role="form" ng-controller="mainController" id="searchform">
							<center>
							<div class="col-sm-6">
								<table>
									<tr>
										<td><input type="text" class="form-control"
											placeholder="Search" id="nname" name="nname"
											style="margin: 20px;" /></td>
										<td><input type="button" class="btn btn-default"
											value="Search" onclick="showres();" /></td>
									</tr>
								</table>
							</div>
							<div id="abc"></div>
							<input type="hidden" value="${username}" id="uname" readonly />
							<br><br><br><br>
							<h4 class="w3-text-custom">
								<p id="err2"></p>
						</h4><br><br>
						</center>
					</form>
					</div>
				</div>
			</div>
		</div>

		<!-- join network ended -->



		<!-- Manage NEtwork -->
		<div class="w3-modal w3-text-custom w3-animate-zoom"
			id="managenetwork" name="managenetwork"
			ng-controller="manageController">
			<div class="w3-modal-content w3-inner-color">
				<header class="w3-container  w3-hfcolor" onclick="document.getElementById('managenetwork').style.display='none'">
					<span class="w3-closebtn">&times;</span>
				<center><h2>Manage Your Networks Here</h2></center>
				</header>
				<div>
					<button onclick="myFunction('section1')"
						class="w3-button w3-block w3-theme-d45 w3-left-align"><b>Owned Networks</b></button>
					<div id="section1" class="w3-hide w3-container">
					<form>
						<table id="mmynetworks" class="table table-bordered table-stripped table-hover table-responsive"	>
							<tr style="color: grey; font-weight: bold;">
								<th>Network Name</th>
								<th>Delete</th>
								<th>Change/Update Timer</th>
								<th>Enter Timer Value</th>
							</tr>
						</table>
						<br>
						<input type="button" class="w3-btn w3-theme-d54" style="color: black;" value="Delete Selected"  onclick="deleteselected();"/>
						<br><br>
						<h4 class="w3-text-custom">
								<p id="err3"></p></h4>
						</form>
					</div>
					<button onclick="myFunction('section2')"
						class="w3-button w3-block w3-theme-d45 w3-left-align"><b>Joined Networks</b></button>
					<div id="section2" class="w3-hide w3-container">
					<form>
						<table id="leave"
							class="table table-bordered table-stripped table-hover table-responsive">
							<tr style="color: grey; font-weight: bold;">
								<th>Network Name</th>
								<th>Leave Request</th>
							</tr>
						</table>
						<br>
						<input type="button" class="w3-btn w3-theme-d54" style="color: black;" value="Leave Selected"  onclick="leaveselected();"/>
						<br><br>
						<h4 class="w3-text-custom">
								<p id="err4"></p></h4>
						</form>
					</div>
					<button onclick="myFunction('section3')"
						class="w3-button w3-theme-d45 w3-block w3-left-align"><b>My Requests</b></button>
					<div id="section3" class="w3-hide w3-container">
						<table id="requests"
							class="table table-bordered table-stripped table-hover table-responsive">
							<tr style="color: grey; font-weight: bold;">
								<th>Network Name</th>
								<th>Requestee</th>
								<th>Select Your Action</th>
							</tr>
						</table>
					</div>
					<button onclick="myFunction('section4')"
						class="w3-button w3-block w3-theme-d45 w3-left-align"><b>Remove</b></button>
					<div id="section4" class="w3-hide w3-container">
						<table id="nmembers"
							class="table table-bordered table-stripped table-hover table-responsive">
							<tr style="color: grey; font-weight: bold;">
								<th>Network Name</th>
								<th>Members</th>
								<th>Remove</th>
							</tr>
						</table>
					</div>
				</div>
				<footer class="w3-container  w3-hfcolor">
				<h3></h3>
				</footer>
			</div>
		</div>



		<!-- manage network ended -->
	</div>
</body>
</html>