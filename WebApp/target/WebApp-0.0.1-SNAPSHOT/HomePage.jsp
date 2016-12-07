<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<META Http-Equiv="Expires" Content="0">
<title>Alarm Connect</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
<script src="${pageContext.request.contextPath}/org/staticcontent/jquery.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/angular.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/org/staticcontent/bootstrap-theme.min.css"/>
<script>
function disablebackbutton(){
	//window.history.forward();
	history.pushState(null,null,location.href);
	window.onpopstate = function(event){history.go(1);};
}
disablebackbutton();
</script>
<style type="text/css">

	#centertag{
		height:400px;
		border: 5px solid #FFE200;
		-webkit-border-radius: 12px; 
		background: #242316;
		background-repeat: no-repeat;
		background-size:100% 100%;
		border-spacing: 2px;
	}
	.carousel-control.right, .carousel-control.left {
		background-image: none;
		color: #BEB7B7;
	}
	.carousel-indicators li {
		border-color: #BEB7B7;
	}
	.carousel-indicators li.active {
		background-color: #BEB7B7;
	}
	.jumbotron{
		background-image:url("logo.jpg");
		background-size: 15% 100%;
		background-repeat: no-repeat;
		margin:0px 40px 0px 40px;
		border-radius:5px;
		border:5px solid #5B646D;
		background-color:#5B646D;
	}
	a:active{
		 text-decoration:none;
	}
	a:hover{
		 text-decoration:none;	
		}
	a:link{
		color:black;
		font-weight:bold;
				 text-decoration:none;
	}
	 .thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
  }
  .thumbnail img {
      width: 100%;
      height: 100%;
      margin-bottom: 10px;
  }
 .maincontent{
 	margin:10px;	
 }
 .container-fluid{
 	background-color:white;
 }
 .abc{
 width:100%;
 height:100%;
 margin-top:50%;
 margin-bottom:10%;
 margin-left:10%;
 border:1px solid black;

 }
 .rounded{
 	border:1px solid grey;
 	padding:60px;
 	margin:50px;
 	border-radius:60px;
 	background-color:grey;
 }
.abcd{
background-color:#1C1C18;
 color:#FFE200;
 padding:50px;
 font-size:50px;
}
.abcd:hover{
 background-color:#FFE200;
 color:white;
 transition-property:color;
 transition-duration:1s;
 transition-timing-function: ease-out;
 transition-delay:initial;
}
</style>

</head>
<body>
		<div class="container-fluid" style="background-color:#1C1C18;">
		<div class="maincontent">
	<!-- 	<div class="jumbotron">	
		</div> -->
			<div class="row">
					<!-- <div class="row" style="margin-top:50px;margin-bottom:50px;margin-left:50px;margin-right:50px;padding:150px;border:5px solid #FFE200;border-radius:10px;background-color:#242316;">
					<div class="col-sm-3"><center>
						<a href="#about"><i style="border:2px solid #1C1C18;border-radius:150px;" class="glyphicon glyphicon-bell abcd"></i></a>
							<br><br><br><br><br><h3 style="color:#FFE200;"><b>About</b></h3></center>
					</div>
					<div class="col-sm-3"><center>
					<a href="#login"><i style="border:2px solid #1C1C18;border-radius:150px;" class="glyphicon glyphicon-user abcd"></i></a>						
						<br><br><br><br><br><h3><b style="color:#FFE200;">Login</b></h3></center>
					</div>
					<div class="col-sm-3"><center>
					<a href="#products"><i style="border:2px solid #1C1C18;border-radius:150px;" class="glyphicon glyphicon-menu-hamburger abcd"></i></a>
						<br><br><br><br><br><h3><b style="color:#FFE200;">Products</b></h3></center>
					</div>
					<div class="col-sm-3"><center>
					<a href="#contactus"><i style="border:2px solid #1C1C18;border-radius:150px;" class="glyphicon glyphicon-earphone abcd"></i></a>
						<br><br><br><br><br><h3><b style="color:#FFE200;">Contact</b></h3></center>
					</div>
					
					</div> -->

			<div id="login" style="margin:50px 50px 100px 50px;background-color:#242316;border:5px solid #FFE200;padding:50px 200px 100px 150px;border-radius:15px;">
				<div id="logintag">
				<h1 style="color:#FFE200;"><span style="color:#FFE200;"><i class="glyphicon glyphicon-user" style="background-color:#242316;"></i></span>Login</h1>
				<table>
					<tr>
						<td><a data-toggle="tab" href="#menu1" class="abc1"><h2 style="padding:10px;color:#939393;padding-right:10px;">Customer</h2></a></td>
						<td><a data-toggle="tab" href="#menu2" class="abc1"><h2 style="padding:10px;color:#939393;padding-right:10px;">Admin</h2></a></li></td>
					</tr>
				</table>
			<s:if test="hasActionErrors()">
					<div class="errors">
						<s:actionerror/>
					</div>
				</s:if>
				<div class="tab-content">
				
					<div id="menu1" class="tab-pane fade in active">
					<h3 style="color:#FFE200;">Customer Login Here!!</h3>
						<form action="myaccount/user" role="form" method="post"> 
							<table>
								<tr style="padding:5px;">
									<td style="padding:5px;font-weight:bold;color:#FFE200;">User Name:</td>
									<td style="padding:5px;"><input type="email" class="form-control" placeholder="UserName" name="username" ng-model="myInput" required/></td>
								</tr><br>
								<tr style="padding:5px;">
									<td style="padding:5px;font-weight:bold;color:#FFE200;">Password:</td>
									<td style="padding:5px;"><input type="password" class="form-control"  placeholder="Password" name="password" label="Password:" id="pwd" required/></td>
								</tr>
							</table><br>
							<div class="col-sm-2"><input type="submit" class="form-control" style="font-weight:bold;color:#242316;margin-left:80px;font-size:20px;width:150px;height:50px;" value="Login"/></div>		
						</form>
					</div>
				
					<div id="menu2" class="tab-pane fade">
						<h3 style="color:#FFE200;">Admin Login Here!!</h3>
							<form action="myadmin/admin" name="myForm" method="post">
								<table>
									<tr style="padding:5px;">
										<td style="padding:5px;font-weight:bold;color:#FFE200;">User Name:</td>
										<td style="padding:5px;"><input type="email" class="form-control" placeholder="UserName" name="username" ng-model="myInput" required/></td>
									</tr><br>	
									<tr>
										<td style="padding:5px;font-weight:bold;color:#FFE200;">Password:</td>
										<td style="padding:5px;"><input type="password" class="form-control"  placeholder="Password" name="password" label="Password:" id="pwd" required/></td>
									</tr>
								</table><br>
								<div class="col-sm-2"><input type="submit" class="form-control" style="font-weight:bold;color:#FFE200;margin-left:80px;font-size:20px;width:150px;height:50px;" value="Login"/></div>
						</form> 
					</div>
				</div>
			</div>
			</div><br><br><br>
		 	<!-- <div id="about" style="margin:50px 50px 75px 50px;background-color:#242316;border:5px solid #FFE200;padding:50px 150px 100px 150px;border-radius:15px;">
				<div id="abouttag">
					<h1 style="color:#FFE200;"><span style="color:#FFE200;"><i class="glyphicon glyphicon-hand-right" style="background-color:#242316;" ></i></span>About</h1>
					<h4>A Device used in SOS situtaion to help people by raising alarm specific to their network.</h4>
				</div>
			</div>	 -->
			<!-- <div id="products" style="margin:100px 50px 100px 50px;background-color:#242316;border:5px solid #FFE200;padding:50px 150px 100px 150px;border-radius:15px;">
				<h1 style="color:#FFE200;"><span style="color:#FFE200;"><i class="glyphicon glyphicon-menu-hamburger" style="background-color:#242316;"></i></span>Products</h1><br>
				<div class="container-fluid text-center bg-grey" style="color:grey;">
 	 <h4>Our Products</h4>
  <div class="row text-center">
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="img2.jpg" alt="Wireless Mini Door" width="400" height="300">
        <p><strong>Wireless Mini Door</strong></p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="img3.jpg" alt="Wireless Smoke Detector" width="400" height="300">
        <p><strong>Wireless Smoke Detector</strong></p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="img4.jpg" alt="Wireless Flood Detector" width="400" height="300">
        <p><strong>Wireless Flood Detector</strong></p>
      </div>
    </div>
  </div>
</div></div> -->
			
	 	<!-- <div id="contactus" style="background-color:#242316;color:white; font-family:Tahoma, Geneva, sans-serif;border-radius:5px;padding:10px 50px 50px 50px;">
			<div class="row">
				<div class="col-sm-5">
					<h3>Contact us.</h3>
					<p style="padding-bottom:2px;padding-left:5px;"><span class="glyphicon glyphicon-map-marker"></span> Chicago, US</p>
					<p style="padding-bottom:2px;padding-left:5px;"><span class="glyphicon glyphicon-phone"></span> +00 1515151515</p>
					<p style="padding-bottom:2px;padding-left:5px;"><span class="glyphicon glyphicon-envelope"></span> myemail@something.com</p> 
				</div>
			</div>
		</div> -->
		</div>
</div>
		</div>
</body>
</html>