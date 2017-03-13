<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 
try{
    response.setHeader("Cache-Control","no-cache");
                response.setHeader("Cache-Control","no-store");
                response.setHeader("Cache-Control","must-revalidate");
             response.setHeader("Pragma","no-cache");
              response.setDateHeader ("Expires", 0);
}catch(Exception e){
	response.sendRedirect("/Error.jsp");
}
%> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
.w3-inner-color {
	background-color: #242316 !important;
}
</style>
<script>
	// Script to open and close sidenav
	function w3_open() {
		document.getElementById("mySidenav").style.display = "block";
	}

	function w3_close() {
		document.getElementById("mySidenav").style.display = "none";
	}
</script>
</head>
<body style="background-color: #1C1C18;">
<nav class="w3-sidenav w3-inner-color  w3-animate-left"
		style="width:70px;display:none;z-index:2;" id="mySidenav"> <a
		class="w3-padding-16" href="#" onclick="w3_close()"><i
		class="fa fa-home w3-xxlarge w3-text-custom"></i></a> <a
		class="w3-padding-16" href="#" onclick="w3_close()"><i
		class="fa fa-user w3-xxlarge w3-text-custom"></i></a> </nav>
<div class="container-fluid" style="background-color:#1C1C18;">
		<center><h1>Welcome Admin</h1></center>
	<div>
		<div class="w3-top">
			<div class="w3-white w3-xlarge w3-padding-xlarge w3-text-custom w3-inner-color "
				>
				<div class="w3-left w3-opennav fa fa-bars"
					onclick="w3_open()"></div>
				<div class="w3-center">Menu</div>
			</div>
		</div>
		<div class="w3-center container-fluid" >
			<div class="row" style="margin-top:10%;">
				<div class="col-md-6">
					<center><a href="myadmin/manageuser">
						<span style="font-size: 75px;"><i
							class="glyphicon glyphicon-user  abcd"></i></span></a>
					</center>
					<br><br>
				<h4 style="color:#FFE200;">Manage User</h4>
				</div>
				<div class="col-md-6">
					<center><a href="myadmin/addproducts">
						<span style="font-size: 75px;"><i
							class="glyphicon glyphicon-globe  abcd"></i></span></a>
					</center>
					<br><br>
				<h4 style="color:#FFE200;">Manage Products</h4>
				</div>
			</div>
			<br> <br>
			<div class="row">
				<div class="col-md-6">
					<center><a href="myadmin/networkDetails">
						<span style="font-size: 75px;"><i
							class="glyphicon glyphicon-th-list  abcd"></i></span></a>
					</center>
					<br><br>
				<h4 style="color:#FFE200;">Network Details</h4>
				</div>
				<div class="col-md-6">
					<center><a href="myadmin/help">
						<span style="font-size: 75px;"><i
							class="glyphicon glyphicon-question-sign  abcd"></i></span></a>
					</center>
					<br><br>
				<h4 style="color:#FFE200;">Help</h4>
				</div>
			</div>
		</div>
	</div>
</body>
</html>