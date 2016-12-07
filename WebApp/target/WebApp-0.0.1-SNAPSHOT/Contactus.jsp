<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 
    response.setHeader("Cache-Control","no-cache");
                response.setHeader("Cache-Control","no-store");
                response.setHeader("Cache-Control","must-revalidate");
                response.setHeader("Pragma","no-cache");
              response.setDateHeader ("Expires", 0);
                 
%> 
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
				<a class="navbar-brand" href="#" style="color:white;font-weight:bold;hover:white;">Alarm Connect</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="#" style="color:white;font-weight:bold;" >Home</a></li>
				<li><a href="#" style="color:white;font-weight:bold;" >About</a></li>
				<li><a href="#" style="color:white;font-weight:bold;">Contact Us</a></li>
			</ul>
		</div>
	</nav>
	<div class="jumbotron">
		<div class="row" style="border:1px solid #993333;padding:10px;border-radius:5px;">
			<center><h1>Alarm Connect</h1><center>
		</div>
	</div>
	<div class="container-fluid bg-grey">
		<h2 class="text-center">CONTACT</h2>
		<div class="row">
			<div class="col-sm-5">
				<p>Contact us.</p>
				<p><span class="glyphicon glyphicon-map-marker"></span> Chicago, US</p>
				<p><span class="glyphicon glyphicon-phone"></span> +00 1515151515</p>
				<p><span class="glyphicon glyphicon-envelope"></span> myemail@something.com</p> 
			</div>
			<div class="col-sm-7">
				<div class="row">
					<div class="col-sm-6 form-group">
						<input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
					</div>
					<div class="col-sm-6 form-group">
						<input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
					</div>
				</div>
			<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
		<div class="row">
        <div class="col-sm-12 form-group">
          <button class="btn btn-default pull-right" type="submit">Send</button>
        </div>
      </div> 
    </div>
  </div>
</div>
</body>
</html>