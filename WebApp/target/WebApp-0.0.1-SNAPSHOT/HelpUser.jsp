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
	color:#FFE200;
}
.panel-default{
	border:solid 5px #FFE200;
	color:black;
	font-weight:bold;
}
.panel-heading{
	font-family: 'Courgette', cursive;
	border:solid 5px #FFE200;
}
</style>
</head>
<body style="background: #1C1C18;">

	<nav class="navbar navbar-inverse navbar-fixed-top" style="background: #1C1C18;">	
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/UserPage.jsp" style="color:white;font-weight:bold;" >Home</a></li>
				<li><a href="myaccount/logout" style="color:white;font-weight:bold;" >Log Out</a></li>
			</ul>
		</div>
	</nav>
	<div class="jumbotron">
		
	</div>
	<div class="container-fluid" style="background-color:#1C1C18;">
	<div class="fclass">
		<center>User Help</center>
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
				This section comprises of three parts, namely :- Create A Network,Join A Network,My Networks. 
				<br>
				For Create A Network:
				<ul>
					<li>Enter a network name.  **Use unique name and avoid white-space.</li>
					<li>Click on save.</li>
				</ul>
				For Join A Network:
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
						<li> You can delete, change a timer or view the members in you network using 'Network-Info'.</li>
						<li> Once you click on change timer button, the text box will be enabled. </li>
						<li> You can enter your value and save the same.</li>
						<li> Please enter valid values only.</li>
					</ul>
					</li>
					<li>
					<ul>
						<li>Second section shows the networks joined by you.</li>
						<li>You can leave a network by clicking on leave button.</li>
					</ul>
					</li>
					<li>
					<ul>
						<li> Your requests for your owned networks is shown in third section.</li>
						<li> You can cancel or approve the request.</li>
						<li>Once approved, you cannot cancel and vice-versa.</li>
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