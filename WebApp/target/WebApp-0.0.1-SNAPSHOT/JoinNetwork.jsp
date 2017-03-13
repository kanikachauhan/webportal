<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet" href="style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/org/staticcontent/jquery.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/org/staticcontent/angular.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/org/staticcontent/bootstrap-theme.min.css"/>
<link href='https://fonts.googleapis.com/css?family=Cinzel' rel='stylesheet' type='text/css'>
<script type="text/javascript">
var jsonarr1,jsonarr2,uname;
var nname;
var reqflag = "";
var app = angular.module('myApp', []);
app.controller('mainController',function($scope,$http){
	$http.get("myaccount/networknames").success(
		        function(data, status, headers, config) {
			       $scope.arr      = data;
			       jsonarr1 = data;
		        }).error(function(data, status, headers, config){});
	$http.get("myaccount/allnetworkdata").success(
	        function(data, status, headers, config) {
		       $scope.arr      = data;
		       jsonarr2 = data;
		      // alert(jsonarr2);
	        }).error(function(data, status, headers, config){});
	});
function request(){
	var count=0;
	var stat="";
	var statusowned = "";
	var xt=document.getElementById("nname");	
	nname=xt.value;
	var un=document.getElementById("uname");
	uname = un.value;
	var oflag = '',jflag ='';
	for(var i=0;i<jsonarr1.length;i++){
		if(jsonarr1[i].networkName === nname && jsonarr1[i].admin === uname){
			statusowned = "owned";
			break;
		}
	}
	if(statusowned !== "owned"){
	for(var i=0;i<jsonarr2.length;i++){
		var usearr = jsonarr2[i].users;
		var flag = "";
		if(usearr !== undefined) {
		for(var j=0;j<usearr.length;j++){
			//alert(jsonarr2[i].users[j].email+" "+uname+" "+jsonarr1[i].networkName+" "+nname);
			if((jsonarr2[i].users[j].email === uname) && (jsonarr1[i].networkName === nname))
			{
				flag = "j";
				
				break;
			}
		}
		if(flag=="j")
			{
					statusowned = "joined";
					break;
				}
			}
		}
	}
	for(var j=0;j<jsonarr2.length;j++){
		if(jsonarr2[j].admin === uname)
		{	
			count++;
		}
		var usearr = jsonarr2[j].users;
		if(usearr !== undefined){
		for(var i=0;i<usearr.length;i++){
				if((jsonarr2[j].users[i].email === uname))
				{
					count++;
				}
			}
		}
	}
	if(statusowned === "owned" ||statusowned === "joined"){
		if(statusowned === "owned")
			$("#owned").modal('show');
		else if(statusowned === "joined") 
			$("#joined").modal('show');
	}
	else{
		//alert(count);
		if(count<=10){
			///alert("here");
						if($("#req").val()==="Join"){
							reqflag = "true";
							$("#req").val("Requested");
							document.getElementById("req").disabled = true;
						}
						else{
							oflag = '';
							jflag =''; 
							$("#req").val("Join");
						}
						$.ajax({
							url:"myaccount/request",
							type:'GET',
							data:'reqflag='+reqflag+'&nname='+nname,
							success : function(response){
								
						},
						error : function(e){
					}
					});
			}else{
				$("#countexceed").modal('show');	
			}
	}
}
function showres(){
	$("#ntb").remove();
	var tt=document.getElementById("nname");
	var v=tt.value;
	for(var t=0;t<jsonarr2.length;t++)
	{
		if(v.toUpperCase() === jsonarr2[t].networkName.toUpperCase()){
			$("#abc").after().append(
					"<table class='table table-bordered table-stripped table-hover table-responsive' id='ntb'><tr><th>Network Name</th><th>Request</th></tr><tr><td>"+jsonarr2[t].networkName+
					"</td><td><input type='hidden' value='"+jsonarr2[t].networkName+"'/><input type='button' class='btn btn-info' value='Join' onclick='request();' id='req'/></td></tr></table>");
			break;
		}
	}
}
</script>
</head>
<body ng-app="myApp" style="background-color:#1C1C18;color:grey;font-weight:bold;">
<nav class="navbar navbar-inverse navbar-fixed-top" style="background: #993333;">
		<div class="container-fluid" style="background-color:#1C1C18;"> 	
		<div class="navbar-header">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/UserPage.jsp"><p style="color: white;font-weight:bold;">Home</p></a></li>
				<li><a href="myaccount/logout" style="color:white;font-weight:bold;" >Log Out</a></li>
			</ul>
		</div>
		</div>
	</nav>
	<div class="jumbotron" style="background-color:#1C1C18;">
	</div>
	
	<div class="container-fluid" style="background-color:#1C1C18;">
	<center>
	<h1 style="color:#FFE200;font-family: 'Cinzel', serif;">Search And Join Network</h1>
	<form role="form" ng-controller="mainController" id="searchform">
		<div class="col-sm-4">
		<table>
		<tr><td>
		<input type="text" class="form-control" placeholder="Search" id="nname" name="nname" style="margin:20px;"/></td>
		<td><input type="button" class="btn btn-default" value="Search" onclick="showres();"/></td></tr>
	
		</table>
		</div>
		<div id="abc"></div>
		<input type="hidden" value="${username}" id="uname" readonly/>
	</form>
	</center>
	
	<div class="modal fade" id="owned" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Message</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;">
          <p>You Own The Network..Try with some other name..</p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='myaccount/joinnetwork'">Close</button>
        </div>
      </div>
    </div>
    </div>
    
    <div class="modal fade" id="joined" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Message</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;">
          <p>Network Already Joined</p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='myaccount/joinnetwork'">Close</button>
        </div>
      </div>
    </div>
	</div>
	
	<div class="modal fade" id="countexceed" role="dialog">
	<div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Message</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;">
          <p>Your limit to joining + creation limit reached.</p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='myaccount/joinnetwork'">Close</button>
        </div>
      </div>
    </div>
	
	</div>
	</div>
</body>
</html>	