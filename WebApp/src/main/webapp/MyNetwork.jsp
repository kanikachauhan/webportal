<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Pacifico" />
<script>
var flag1="";
var flag2="";
var flag3="";
var flag4="";
var nname = "";
var networktb,networkjoin,networkdata,myreq,mymembers;
var removenname;
var uname="";
var app = angular.module('myApp', []);
app.controller('mainController',function($scope,$http){
	$http.get("myaccount/networktb").success(
				function(data, status, headers, config) {
			       $scope.networktb      = data;
			       networktb = data;
			   	   if(networktb.length >0 )
			   		 uname = networktb[0].email;

		        }).error(function(data, status, headers, config){});	
	$http.get("myaccount/networkdata").success(
			function(data, status, headers, config) {
		       $scope.networkdata     = data;
		       networkdata = data;
		   }).error(function(data, status, headers, config){});
	});
app.controller('networkController',function($scope,$http){
			$http.get("myaccount/networkjoin").success(
			function(data, status, headers, config) {
			       $scope.networkjoin     = data;
			       networkjoin = data;
			       $("#pending td").parent().remove();
			       $(document).ready(function(){
						for(var t=0;t<networkjoin.length;t++){
									var ut="'"+networkjoin[t].networkName+"'"
									//alert(networkjoin[t].networkName);
									var userarr = networkjoin[t].users;
									if(userarr !== undefined){
										//if(userarr !== ""){
											if(userarr.length!=0){
													//	alert("1");
														for(var l=0;l<userarr.length;l++){
														//	alert(userarr[l].status);
															if(userarr[l].status === "false")
															{
																	$("#pending").append("<input type='hidden' id='nname' value='"+networkjoin[t].networkName+"' />");
									      							$("#pending").append("<input type='hidden' id='requestee' value='"+userarr[l].email+"' />");
																	$("#pending").append("<tr style='color:#FFE200;'><td>"+networkjoin[t].networkName+"</td><td>"+userarr[l].email+"</td><td><input type='button' class='btn btn-success ' id='"+userarr[l].email+" "+networkjoin[t].networkName+"' value='Approve' onclick='approve();'/>&nbsp;&nbsp;<input type='button' class='btn btn-danger ' id='c"+userarr[l].email+" "+networkjoin[t].networkName+"' value='Cancel' onclick='cancel();' /></td></tr>");
															}
														}
										//			}
										}
									}
						}$("#pending").hide();
				       });
				    }).error(function(data, status, headers, config){});
		   /* $http.get("myaccount/reqstatus").success(
				    function(data,status,headers,config){
				    	$scope.myreq = data;
				    	
				    }).error(function(data,status,headers,config){});*/
});

app.controller('memberNetwork',function($scope,$http){
	$http.get("myaccount/members").success(
			function(data,status,headers,config){
				$scope.mymembers = data;
				mymembers = data;
			}).error(function(data,status,headers,config){});
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	$("#mmynetworks").hide();
	$("#nnetworkjoined").hide();
	$("#myrequests").hide();
	$("#pending").hide();
	$("#reqstatustable").hide();
	flag1="hide";
	flag2="hide";
	flag3="hide";
	flag4="hide";
});
	function deletedata(x){
		var xt=document.getElementById("tdd");
		var nname=x.substring(1);
	$.ajax({
			url:"myaccount/deletenetwork",
			type:'GET',
			data:'nname='+nname,
			success:function(response){
			$("#myModal").modal('show');
		},
		error:function(e){
		}
			});
		}
	function approve(){
		var x="",y="";
		var e = window.event;
		var btn = e.target || e.srcElement;
		var t=btn.id;
		var arr = t.split(" ");
		x = arr[0];
		y = arr[1];
		var tt=document.getElementById(t);
		var tt2=document.getElementById("c"+t);
		var xt="";
		if(tt.value==="Approve"){
			tt.value="Approved";
			tt.disabled = true;
			tt2.disabled = true;
			xt="true";
		}
		$.ajax({
			url:"myaccount/changestatus",
			type:'GET',
			data:'status='+xt+"&nname="+y+"&requestee="+x,
			success : function(response){
		},
			error : function(e){
		}
		});
	}
	function changetimer(x){
		var nname=x.substring(1);
		document.getElementById("tb"+nname+"").disabled=false;
		$("#c"+nname+"").hide();
		//alert(nname);
		$("#s"+nname+"").show();
	}
	function savetimer(x){
		var nname=x.substring(1);
		var val=$("#tb"+nname+"").val();
		$.ajax({
			url:"myaccount/timer",
			type:'GET',
			data:'nname='+nname+'&timer='+val,
			success : function(response){
			$("#myModal1").modal('show');
		},
			error:function(e){
		}
		});
	}
	function cancel(){
		var u='';
		var x="",y="";
		var e = window.event;
		var btn = e.target || e.srcElement;
		var t=btn.id;
		var arr = t.split(" ");
		x = arr[0].substring(1);
		y = arr[1];
		var tt=document.getElementById("c"+x+"");
		var xt="";
		var u=document.getElementById(""+t+"").value;
		var str = x+" "+y;
		if(u==="Cancel"){
			document.getElementById(""+t+"").value="Cancelled";
			document.getElementById(""+t+"").disabled = true;
			document.getElementById(""+str+"").disabled = true;
			xt="false";
			$.ajax({
				url:"myaccount/changestatus",
				type:'GET',
				data:'status='+xt+"&nname="+y+"&requestee="+x,
				success : function(response){
						},
				error : function(e){
				}
			});
		}
	}
	function leavenetwork(x){
		$.ajax({
			url : "myaccount/leavenetwork",
			type : 'GET',
			data : 'nname='+x,
			success : function(response){
			 $("#leavemodal").modal('show');
		},
		error : function(e){
		}
		});
	}
	function removeit(){
		var e = window.event;
		var btn = e.target || e.srcElement;
		var t=btn.id;
		var stat='joinee';
		$.ajax({
			url : "myaccount/removeuser",
			type: 'GET',
			data : 'joinee='+t+'&nname='+removenname+'&ustatus='+stat,
			success : function(response){
			$("#removeModal").modal('show');
		},
		error : function(e){
		}
		});
	}
	function check(){
		var e = window.event;
		var btn = e.target || e.srcElement;
		var t=btn.id;
		var xy=t.substring(2);
		var arr = xy.split(" ");
		var count =0 ;
			for(var t=0;t<networkdata.length;t++){
			if(networkdata[t].name === arr[1])
				count++;
		}
		if(count<10){
			document.getElementById(""+xy+"").disabled = false;
			document.getElementById("c"+xy+"").disabled = false;
		}
		else{
			document.getElementById("c"+xy+"").disabled = false;
			$("#msg").modal('show');	
		}
	}
	function showdetails(x){
		nname=x.substring(1);
		removenname = nname;
		$("#tbb td").parent().remove();
		$("#viewmembers").modal('show');
		for(var t=0;t<mymembers.length;t++){
			if(mymembers[t].networkName===nname){
				var userarr = mymembers[t].users;
				if(userarr !== undefined){
				 if(userarr.length!=0){
						 for(var y=0;y<userarr.length;y++){
							$("#tbb").append("<tr><td>"+userarr[y].name+"</td><td><input type='button' class='btn btn-warning' value='remove' id='"+userarr[y].email+"' onclick='removeit();'/></tr>");						
					 }
					}
				}
				
			}
		}
	}
	function showmynetworks(){
		if(flag1==="hide"){ 
			flag1="show";
			$("#mmynetworks").show();
			$("#onemmynetworks").removeClass('glyphicon glyphicon-plus-sign');
			$("#onemmynetworks").addClass('glyphicon glyphicon-minus-sign');
		}
		else{
			flag1="hide";
			$("#mmynetworks").hide();
			$("#onemmynetworks").removeClass('glyphicon glyphicon-minus-sign');
			$("#onemmynetworks").addClass('glyphicon glyphicon-plus-sign');
		}
	}
	function shownnetworkjoined(){
		if(flag2==="hide"){
			flag2="show";
			$("#nnetworkjoined").show();
			$("#onennetworkjoined").removeClass('glyphicon glyphicon-plus-sign');
			$("#onennetworkjoined").addClass('glyphicon glyphicon-minus-sign');
		}
		else{
			flag2="hide";
			$("#nnetworkjoined").hide();
			$("#onennetworkjoined").removeClass('glyphicon glyphicon-minus-sign');
			$("#onennetworkjoined").addClass('glyphicon glyphicon-plus-sign');
		}
	}
	function shownnetworkrequests(){
		if(flag3==="hide"){
			flag3="show";
			$("#myrequests").show();
			$("#pending").show();
			$("#onemyrequests").removeClass('glyphicon glyphicon-plus-sign');
			$("#onemyrequests").addClass('glyphicon glyphicon-minus-sign');
		}
		else{
			flag3="hide";
			$("#myrequests").hide();
			$("#pending").hide();
			$("#onemyrequests").removeClass('glyphicon glyphicon-minus-sign');
			$("#onemyrequests").addClass('glyphicon glyphicon-plus-sign');
		}
	}
	/* function myreqstatus(){
		if(flag4==="hide"){
			flag4="show";
			$("#reqstat").show();
			$("#reqstatustable").show();
			$("#onemyreqstatustable").removeClass('glyphicon glyphicon-plus-sign');
			$("#onemyreqstatustable").addClass('glyphicon glyphicon-minus-sign');
		}
		else{
			flag4="hide";
			$("#reqstat").hide();
			$("#reqstatustable").hide();
			$("#onemyreqstatustable").removeClass('glyphicon glyphicon-minus-sign');
			$("#onemyreqstatustable").addClass('glyphicon glyphicon-plus-sign');
		}
	} */
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
	
	<div class="container-fluid" style="background-color:#1C1C18;">
	<center><h1 style="font-family: Pacifico;font-color: #FFE200;">My Networks</h1></center>
	
	<table>
	<tr>
		<div id="mynetworks" style="margin-left:10px;">
			
			<a href="#" class="btn btn-info btn-lg" style="border:2px solid #242316;width:375px;height:60px;border-radius:5px;background-color:#FFE200;;color:white;font-weight:bold;font-size:25px;" onclick="showmynetworks();" >Owned Network&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-plus-sign" id="onemmynetworks"></span></a>
		
			<table  id="mmynetworks" ng-controller="mainController" class="table table-bordered table-stripped table-hover table-responsive" >
			<tr style="color:grey;font-weight:bold;"><th>Network Name</th><th>Delete</th><th>Change Timer/Update Timer</th><th>Enter Timer Value</th><th>Show Network Members</th></tr>
			<tr ng-repeat="x in networktb" style="color:#FFE200;">
				    <c:set var="a" value="{{x.networkName}}"/>
				   
					<td id="delbtn">{{x.networkName}}
					<input type="hidden" value="{{x.networkName}}" id="tdd"/></td>
					<td><input type="button" class="btn btn-danger" onclick="deletedata($(this).attr('id'));" id="d${a}" value="delete"/></td>
					<td><input type="button" class="btn btn-default" onclick="changetimer($(this).attr('id'));" id="c${a}" value="Change Timer"/>
					<input type="button" class="btn btn-success" onclick="savetimer($(this).attr('id'));" id="s${a}" value="Save" style="display:none;"/>
					</td>
					<td><input type="number" min="0" class="form-control" id="tb${a}" disabled/></td>
					<td><input type="button" class="btn btn-info" onclick="showdetails($(this).attr('id'));" id="i${a}" value="Network Info"/></td>
					</tr>
			</table>
		</div>
		</tr>
		<tr>
		<div id="networksjoined" style="margin-top:100px;margin-left:20px;">
		<a href="#" class="btn btn-info btn-lg" style="border:2px solid #242316;width:375px;height:60px;border-radius:5px;background-color:#FFE200;color:white;font-weight:bold;font-size:25px;" onclick="shownnetworkjoined();" >Joined Networks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-plus-sign" id="onennetworkjoined"></span></a>
			
			<table  id="nnetworkjoined" class="table table-bordered table-stripped table-hover table-responsive" ng-controller="mainController"  >
				<tr style="color:grey;font-weight:bold;"><th>Network Name</th><th>Leave Request</th></tr>
				<tr ng-repeat="x in networkdata" style="color:#FFE200;">
					
					<td>{{x.networkName}}</td>
					<td><input type="button" class="btn btn-primary" id="{{x.networkName}}" value="Leave Network" onclick="leavenetwork($(this).attr('id'));	"/></td>
					
				</tr>
			</table>
		</div>
		</tr>
		<tr>
		<div id="reqests" ng-controller="networkController" style="margin-top:100px;margin-left:20px;">
			<a href="#" class="btn btn-info btn-lg" style="border:2px solid #242316;width:375px;height:60px;border-radius:5px;background-color:#FFE200;color:white;font-weight:bold;font-size:25px;" onclick="shownnetworkrequests();" >Requests&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-plus-sign" id="onemyrequests"></span></a>
			<div id="myrequests">
			<table id="pending" class="table table-bordered table-stripped table-hover table-responsive" >
			<tr style="color:grey;font-weight:bold;"><th>Network Name</th><th>Requestee</th><th>Select Your Action</th></tr>
			</table>
			</div>
		</div>
		</tr>
		<tr>
		<!-- <div id="reqstat" ng-controller="networkController" style="margin-top:100px;margin-left:20px;">
			<a href="#" class="btn btn-info btn-lg" style="border:2px solid #242316;width:375px;height:60px;border-radius:5px;background-color:#FFE200;color:white;font-weight:bold;font-size:25px;" onclick="myreqstatus();" >Requests Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-plus-sign" id="onemyreqstatustable"></span></a>
			<div id="requeststatus">
			<table id="reqstatustable" class="table table-bordered table-stripped table-hover table-responsive" ng-controller="networkController" >
			<tr style="color:grey;font-weight:bold;">
						<th>Network Name</th><th>Owned By</th><th>Your Status</th>
					</tr>
					<tr ng-repeat="x in myreq" style="color:#FFE200;">
						<td>{{x.networkname}}</td><td>{{x.creatername}}</td><td>{{x.userstatus}}</td>
					</tr>
			</table>
			</div>
		</div>
		</tr>
	</table>  -->
	
	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Success</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;">
          <p>Deletion Done.</p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='myaccount/mynetwork'">Close</button>
        </div>
      </div>
    </div>
	</div>

<div class="modal fade" id="leavemodal" roel="dialog">
<div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Success</h4>
        </div>
        <div class="modal-body"  style="background-color:#242316;color:#FFE200;">
          <p>Network Left</p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='myaccount/mynetwork'">Close</button>
        </div>
      </div>
    </div>

</div>

<div class="modal fade" id="viewmembers" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Members in Your Network</h4>
        </div>
        <div class="modal-body" id="tbbdiv" style="background-color:#242316;color:#FFE200;">
          <table class="table table-bordered table-stripped table-hover table-responsive" ng-controller="memberNetwork" id="tbb">
          	<tr><th>Member Name</th><th>Remove Member</th></tr>
          	
          </table>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='myaccount/mynetwork'">Close</button>
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
          <p>Timer changed.</p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='myaccount/mynetwork'">Close</button>
        </div>
      </div>
    </div>
	</div>
	
	
	
<div class="modal fade" id="removeModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Success</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;">
          <p>Removed.</p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='myaccount/mynetwork'">Close</button>
        </div>
      </div>
    </div>
	</div>	
	
	
	<div class="modal fade" id="removeModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Message</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;">
          <p>Already 10 members present.. Kindly,cancel the request..</p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='myaccount/mynetwork'">Close</button>
        </div>
      </div>
    </div>
	</div>	
	
	
	</div>
</body>
</html>