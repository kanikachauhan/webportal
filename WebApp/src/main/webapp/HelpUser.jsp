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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
<link rel="${pageContext.request.contextPath}/org/staticcontent/fileinput.css"/>
<link rel="${pageContext.request.contextPath}/org/staticcontent/fileinput.min.css"/>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<script src="${pageContext.request.contextPath}/org/staticcontent/jquery.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/angular.min.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/fileinput.min.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/fileinput.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/org/staticcontent/bootstrap-theme.min.css"/>
<link href='https://fonts.googleapis.com/css?family=Courgette' rel='stylesheet' type='text/css'>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link href='https://fonts.googleapis.com/css?family=Shadows+Into+Light+Two' rel='stylesheet' type='text/css'>
<style type="text/css">
.jumbotron{
background-color:#1C1C18;
}
.fclass{
	font-family: 'Courgette', cursive;
	font-size:100px;
	color:#FFCC00;
}
.panel-default{
	border:solid 5px #FFCC00;
	color:black;
	font-weight:bold;
}
.panel-heading{
	font-family: 'Courgette', cursive;
	border:solid 5px #FFCC00;
}
.w3-inner-color {
	background-color: #242316 !important
}

.w3-text-custom {
	color: #FFCC00 !important
}

.abcd {
	border: 2px solid #FFCC00;
	padding: 150px;
	background-color: #242316;
	color: #FFCC00;
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
function w3_open() {
	document.getElementById("mySidenav").style.display = "block";
}

function w3_close() {
	document.getElementById("mySidenav").style.display = "none";
}
</script>
</head>
<body style="background: #1C1C18;">
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
				<div class="w3-center">User Help</div>
			</div>
		</div>

	<div class="container-fluid" style="background-color:#1C1C18;">
	<div><h1>
		<center>User Help</center></h1>
	</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">User Data</h3>
			</div>
			<div class="panel-body">
				This section simply contains user data. 
			</div>
		</div>
	<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Network Details</h3>
			</div>
			<div class="panel-body">
				This section comprises of four parts, namely :- Create A Network,Join A Network,My Networks,Members In A Network. 
				<br>
				For Create A Network:
				<ul>
					<li>Enter a network name.  **Use unique name.</li>
					<li>Click on save.</li>
				</ul>
				For Joining A Network:
				<ul>
					<li>You must know the name of the network you want to join.</li>
					<li> Once requested, you cannot change your option. It has to be cancelled by the owner only.</li>
				</ul>
				For My Networks:
				<ul>
					<li> You will have three sections, each section will give you a dropdown</li>
					<li>
					<ul>
						<li>First Section shows you owned networks.</li>
						<li> You can delete, change a timer.</li>
						<li> Once you click on change timer button, the text box will be enabled. </li>
						<li> You can enter your value and save the same.</li>
						<li> Please enter valid values only.</li>
					</ul>
					</li>
					<li>
					<ul>
						<li>Second section shows the networks joined by you.</li>
					</ul>
					</li>
					<li>
					<ul>
						<li> Your requests for your owned networks is shown in third section.</li>
						<li> You can cancel or approve the request.</li>
						<li>Once approved, you cannot cancel and vice-versa.</li>
					</ul>
					</li>
					<li>
						<ul>
						<li> Name of the network along with member is shown in the fourth section.</li>
						<li> You can remove a member from network.</li>
					</ul>
					</li>
				</ul>
				Messages will appear in case of any discrepencies.
				Users can join+create a maximum of 10 networks.
				Please Reload the page, If changes are not visible.
			</div>
	</div>
	<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Products</h3>
			</div>
			<div class="panel-body">
				This section will give you the names of all the products available.
			</div>
	</div>
</div>
</body>
</html>