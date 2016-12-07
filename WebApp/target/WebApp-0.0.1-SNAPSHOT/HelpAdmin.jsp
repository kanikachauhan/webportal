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
				<li><a href="${pageContext.request.contextPath}/AdminPage.jsp" style="color:white;font-weight:bold;" >Home</a></li>
				<li><a href="myadmin/logout" style="color:white;font-weight:bold;" >Log Out</a></li>
			</ul>
		</div>
	</nav>
	<div class="jumbotron">
		
	</div>
	
	<div class="container-fluid" style="background-color:#1C1C18;">
	<div class="fclass">
		<center>Admin Help</center>
	</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Manage User</h3>
			</div>
			<div class="panel-body">
				This section comprises of two parts, namely :- New Customer,Existing Customer. 
				<br>
				For New Customer:
				<ul>
					<li>Generate a Customer Id.</li>
					<li>Generate a temporary password.</li>
					<li>Fill all the mandatory fields.</li>
					<li>Click on 'Show Products' to select a product from the list.</li>
					<li>Once the fields are full, click on submit. If your details are saved, a message will appear 'Details Saved'.</li>
					<li>Make sure that email id doesnot exist.</li>
					<li>Reload the page, in order to see the updated details of the customers.</li>
				</ul>
				For Existing Customer:
				<ul>
					<li>You will have a list of customers already registered.</li>
					<li>You can search for any thing. Just start typing in the search field and the results will appear.</li>
					<li>Click on the headers of the table, you will be able to sort the table data as per the click you have made.</li>
					<li>You can manage the user details by clicking on 'Manage User' button.
						<ul>
							<li>In the popup, you can either, delete or update the customer.</li>
							<li>Before deletion a confirmation pop up will appear.</li>
						</ul>
					</li>
					<li>You can manage user productsby clicking on 'Manage Products' button.
						<ul>
							<li>In the popup, click on Products Enrolled to see the products owned by the customer. You can delete any existing product from there.</li>
							<li>By clicking on add products tab, you can add more products corresponding to a specific customer.</li>
						</ul>
					</li>
				</ul>
				Messages will appear in case of any discrepencies.
			</div>
		</div>
	<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Manage Products</h3>
			</div>
			<div class="panel-body">
				This section comprises of two parts, namely :- Add Product,Delete Product. 
				<br>
				For Add Product:
				<ul>
					<li>Generate a Product Id.</li>
					<li>Fill all the mandatory fields.</li>
					<li>Submit button will be active,once all fields are valid.</li>
				</ul>
				For Delete Product:
				<ul>
					<li>You will have a list of products.</li>
					<li>You can search for any thing. Just start typing in the search field and the results will appear.</li>
					<li>Click on the headers of the table, you will be able to sort the table data as per the click you have made.</li>
					<li>You can delete a product by double clicking on the button.</li>
					<li> A pop up will appear and ask you the confirmation.</li>
				</ul>
				Messages will appear in case of any discrepencies.
				Please Reload the page, If changes are not visible.
			</div>
	</div>
	<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Network Details</h3>
			</div>
			<div class="panel-body">
				This section will give you the names of all the networks available.
			</div>
	</div>
</div>
</body>
</html>