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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<META Http-Equiv="Expires" Content="0">
<title>Alarm Connect</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style type="text/css">
.container-fluid{
 	background-color:#1C1C18;
 }
 .jumbotron{
 	background-color:#1C1C18;
 }
 .abcd{
 border:2px solid #FFE200;padding:150px;background-color:#242316;
 opacity:0.4;
 border-radius:10px;
 }
 .abcd:hover{
 	opacity:1.0;
 }
 h1 {
   color: #FFE200;
   -webkit-text-fill-color: #1C1C18;
   -webkit-text-stroke-width: 1px;
   -webkit-text-stroke-color:#FFE200;
   font-size: 30px;
   font-style: italic;
}
</style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" style="background: #1C1C18;">
		<div class="container-fluid" style="background: #1C1C18;"> 	
		<div class="navbar-header">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/AdminPage.jsp"><p style="color: white;font-weight:bold;">Home</p></a></li>
				<li><a href="myadmin/logout" style="color:white;font-weight:bold;" >Log Out</a></li>
			</ul>
		</div>
		</div>
	</nav>
<div class="container-fluid" style="background-color:#1C1C18;">
	<div class="jumbotron">
	</div>
	
		<center><h1>Welcome Admin</h1></center>
	<div class="row">
<div class="col-sm-6  " >
				<center><a href="myadmin/manageuser"><span style="font-size:75px;color:#FFE200;"><i class="glyphicon glyphicon-user abcd"></i></span></a>
				<br><br>
				<h4 style="color:#FFE200;">Manage User</h4>
				</center>
			</div>
			<div class="col-sm-6 ">
				<center><a href="myadmin/addproducts"><span style="font-size:75px;color:#FFE200;"><i class="glyphicon glyphicon-th-list  abcd"></i></span></a>
				<br><br>
				<h4 style="color:#FFE200;">Manage Products</h4>
				</center>
			</div>
		</div>
		<div class="row">
		<div class="col-sm-6">
				<center><a href="myadmin/networkDetails"><span style="font-size:75px;color:#FFE200;"><i class="glyphicon glyphicon-globe  abcd"></i></span></a>
				<br><br>
				<h4 style="color:#FFE200;">Network Details</h4>
				</center>
			</div>
			<div class="col-sm-6">
				<center><a href="myadmin/help"><span style="font-size:75px;color:#FFE200;"><i class="glyphicon glyphicon-question-sign  abcd"></i></span></a>
				<br><br>
				<h4 style="color:#FFE200;">Help</h4>
				</center>
			</div>
		</div>
	</div>
</body>
</html>