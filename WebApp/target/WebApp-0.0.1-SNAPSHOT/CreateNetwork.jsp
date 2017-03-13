<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="s" uri="/struts-tags"%>
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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Chewy' rel='stylesheet' type='text/css'>
<script type="text/javascript">
var jsonarr=[];
var jsonarr1=[];
var checknum;
var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
var charss="0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZ";
var app = angular.module('myApp', []);
app.controller('validateController',function($scope,$http){
	});
app.controller('mainController',function($scope,$http){
	$http.get("myaccount/checknetworkid").success(
			function(data, status, headers, config) {
			       jsonarr      = data;
		        }).error(function(data, status, headers, config){});
    $http.get("myaccount/checknetworknumber").success(
    	    function(data,status,headers,config){
    	    	
        	 	checknum   = data;
    	    }).error(function(data,status,headers,config){});
    $http.get("myaccount/checknetworknames").success(
			function(data, status, headers, config) {
			       jsonarr1      = data;
		        }).error(function(data, status, headers, config){});
	});
$(document).ready(function(){
		$("#save").click(function() {
			var u=document.getElementById("nname");
			var tt=u.value;
			//alert(tt);
			var count=0;
			var nid = '';
			var idflag = '';
			nid="NI";
			var cid_len =6;
			for (var i=0; i<cid_len; i++) {
			    var rnum = Math.floor(Math.random() * chars.length);
			    nid += chars.substring(rnum,rnum+1);
			}
			for(var t=0;t<jsonarr.length;t++){
				if(nid==jsonarr[t].networkID){
					idflag = true;
					break;
				}		
			}
			var y="";
			if(typeof jsonarr1[0]!=='undefined'){
			for(var t=0;t<jsonarr1.length;t++){
				if((tt.toUpperCase()===jsonarr1[t].networkName.toUpperCase())){
						y="fault";
						break;
					}
				}
			}
			if(y==="fault"){
				alert("Network name taken... Try other name");
				location.reload();
			}else if(idflag === true){
				alert("Try Again");
				location.reload();
			}
			else{
				if(/\s/.test(tt)){
					alert("Please remove spaces");
				}else{
					if(checknum.length <10){
						//alert(checknum.length);
						$.ajax({
							url: "myaccount/networkcreate",
							method:'GET',
							data:'nname='+tt+'&networkid='+nid,
							success:function(response){
								$("#myModal1").modal('show');
							},
							error: function(e){
								$("#myModal2").modal('show'); 
							}
						});
					}
					else{
						$("#checkcount").modal('show');
					}		
				}
			}
		});
});

</script>
<style type="text/css">
.jumbotron{
 	background-color:#1C1C18;
 }
</style>
</head>
<body ng-app="myApp"  style="background-color:#1C1C18;">
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
	<div class="jumbotron">
	</div>
	
	<nav>
		<ul class="pager">
			<li class="previous"><a href="myaccount/network"><span aria-hidden="true">&larr;</span> Previous</a></li>
			<li class="next disabled"><a href="#">Next <span aria-hidden="true">&rarr;</span></a></li>
		</ul>
	</nav>
	<div class="container-fluid" style="color:#FFE200;background-color:#242316;">

<div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Error</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;">
          <p>
          	Error
          </p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
	</div>
	
	
	
	<div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Success</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;">
          <p>
          	Details Saved
          </p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='myaccount/createnetwork'">Close</button>
        </div>
      </div>
    </div>
  </div>
	</div>
	
	
<div class="modal fade" id="checkcount" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Message</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;">
          <p>
          	Cannot Create More Networks.
          </p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
	</div>

	
	
	
		<center>
				<form role="form" name="savenetwork" ng-controller="mainController" novalidate style="color:#FFE200;">
					<table>
						<tr>
							<div class="form-group">
								<td><label for="name" class="col-sm-12"><h1 style="font-family: 'Chewy', cursive;">Network Name</h1></label></td>
							</div>
						</tr>
						<tr>
							<div class="form-group">
								<td>
								<input type="text" class="form-control" id="nname" placeholder="Network Name" name="nname" ng-model="nname" required/>
								&nbsp;<span ng-if="savenetwork.nname.$error.required && !savenetwork.nname.$pristine">Network Name Required</span>
								</td>
							</div>
						</tr><br>
						<tr>
							<div class="form-group">
								<td><center><button type="button" class="btn" style="font-weight:bold;color:white;width:100px;height:50px;" id="save" ng-disabled="!savenetwork.$valid">Save</button></center></td>
							</div>
						</tr>
					</table>
				</form>
		</center>
	</div>
</body>
</html>