<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="s" uri="/struts-tags"%>
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

<style type="text/css">
h1 {
	display: inline;
	position: relative;
	font: 75px Helvetica, Sans-Serif;
	letter-spacing: -5px;
	color: rgba(192,192,192,0.8); 
}
.row{
	margin:20px 5px 30px 0px;
}
h1:after {
	content: "Products";
	position: absolute; left: 5px; top: 5px;
	color: rgba(255,226,0,0.4);   
}
.container-fluid{
 	background-color:#1C1C18;
 }
 .jumbotron{
 	background-color:#1C1C18;
 }label {
  position: absolute;
  -webkit-transform: translateY(6px);
          transform: translateY(6px);
		  
  left: 30px;
  color: rgba(255, 255, 255, 0.5);
  -webkit-transition: all 0.25s ease;
  transition: all 0.25s ease;
  -webkit-backface-visibility: hidden;
  pointer-events: none;
  font-size: 22px;
}
label .req {
  margin:2px;
  color: #FFE200;
}
label.active {
  -webkit-transform: translateY(50px);
          <!-- transform: translateY(50px); -->
  left: 10px;
  font-size: 14px;
}
label.active .req {
  opacity: 0;
}
label.highlight {
  color: #FFE200;
}
input, textarea {
  font-size: 22px;
  display: block;
  width: 100%;
  height: 100%;
  padding: 5px 10px 5px 10px;
  background: none;
  background-image: none;
  border: 1px solid #a0b3b0;
  color: #FFE200;
  border-radius: 5px;
  -webkit-transition: border-color .25s ease, box-shadow .25s ease;
  transition: border-color .25s ease, box-shadow .25s ease;
}
input:focus, textarea:focus {
  outline: 0;
  border-color: #FFE200;
}
 .abc{
color:#FFE200;
}
</style>
<script>
var productarr= [];
var app = angular.module('myApp', []);
app.controller('validateCtrl', function($scope,$http) {
		  $http.get("myadmin/fetchproducts").success(
			        function(data, status, headers, config) {
			        	productarr = data;
			        }).error(function(data, status, headers, config){});
}
);
app.controller('mainController',function($scope,$http){
	 $http.get("myadmin/fetchproducts").success(
		        function(data, status, headers, config) {
		        	$scope.itemsdata    = data;
		            $scope.sortType     = 'name'; // set the default sort type
		            $scope.sortReverse  = false;
		            
		        }).error(function(data, status, headers, config){});
});
var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
var charss="0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZ";
var cid='';
var cid_len=6;
function generatepid(){
	var t2=document.getElementById("pid");
	var t22=document.getElementById("tpid");
	t2.value="";
	t22.value="";
	cid="PD";
	for (var i=0; i<cid_len; i++) {
	    var rnum = Math.floor(Math.random() * chars.length);
	    cid += chars.substring(rnum,rnum+1);
	}
	t2.value=cid;
	t22.value=cid;
	 for(var t=0;t<productarr.length;t++){
		if(cid==productarr[t].pid){
			alert("generate again...key already exists");
			break;
		}		
	} 
}
function check(){	
	var t = document.getElementById("pid").value;
	//alert(t);
	var flag = false;
	for(var tx=0;tx<productarr.length;tx++){
		//alert(t+"  "+productarr[tx].productID);
		if(t==productarr[tx].productID){
			flag = true;
			alert(flag);
			break;
		}		
	} 
	if(t == null || t == "" || flag == true){
		$('#productAdd').submit(function (evt) {
		    evt.preventDefault();
		    $("#myModal").modal('show');
		});
	}else{
		if(flag == false){
			$.ajax({
				url:"myadmin/addaddAdminProduct",
				method:'GET',
				data:'pid='+document.getElementById("pid").value+'&pname='+document.getElementById("pname").value+'&pdesc='+document.getElementById("pdesc").value,
				success:function(response){
					$("#myModal2").modal('show');
				}
			});	
		}
	}
}
function showpop(x){
	$("#"+x).bind('click', function() {
		$("#"+x+"").closest('tr').hide();
		$.ajax({
			url: "myadmin/deleteproduct",
			method:'GET',
			data:'pid='+x,
			success:function(response){
				$("#myModal1").modal('show');
			},
			error: function(e){
			}
			});
	});
	$("#"+x).popConfirm({
		title: "Delete ?",
		content: "Are You Sure??",
		placement: "bottom"
	});
}
function setFieldsEmpty(){
	document.getElementById("pname").value  = "";
	document.getElementById("pdesc").value = "";
	document.getElementById("tpid").value = "";
}
</script>
</head>
<body ng-app="myApp" style="background: #1C1C18;">
<nav class="navbar navbar-inverse navbar-fixed-top" style="background: #1C1C18;">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/AdminPage.jsp" style="color:white;font-weight:bold;" >Home</a></li>
				<li><a href="myadmin/logout" style="color:white;font-weight:bold;">LogOut</a></li>
				</ul>
		</div>
	</nav>
	<div class="jumbotron">
		
	</div>
	
	<div class="container-fluid" style="background-color:#1C1C18;">
		<center><h1>Products</h1></center>
		<br><br><br>
		<ul class="nav nav-tabs">
			<li><a data-toggle="tab" href="#menu1" class="abc"><h2>Add Product</h2></a></li>
			<li><a data-toggle="tab" href="#menu2" class="abc"><h2>Delete Product</h2></a></li>
		</ul>
		
<div class="tab-content abc">	
<div id="menu1" class="tab-pane fade">
		<div class="form">
		<form id = "productAdd" name = "productAdd" ng-controller="validateCtrl" method="get" novalidate  >
			<div class="row">
				<div class="col-sm-10" style="padding-bottom:5px;">
					<table><tr>
				    	<td><label for="pwd" style="position: relative; -webkit-transform: translateY(0px);left: 0px;margin-right:10px;">Generate Product Id</label></td><td><input type="text" id="tpid" name="tpid" ng-model="pid" disabled/>
				    	<input type="hidden" class="form-control" id="pid" name="pid" /></td>
				    	<td><input type="button" class="form-control" style="background-color:#D13614;border:1px solid D13614;color:black;margin-left:10px;" value="Generate" onclick="generatepid();" /></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				  <div class="field-wrap col-sm-10" ng-class="{ 'has-error' : productAdd.pname.$invalid && !productAdd.pname.$pristine }">	
				  <table><tr><td>
		            <label style="position: relative; -webkit-transform: translateY(0px);left: 0px;">
		              Product Name<span class="req">*</span>
		            </label></td><td>
		            <input type="text" id="pname" name="pname" ng-model="pname" required/></td><td>
					<span ng-if="productAdd.pname.$error.required && !productAdd.pname.$pristine " style="margin-left:25px;color:#FFE200;">Product Name required.</span>
					</td></tr>
					</table>
		          </div>
			</div>
			<div class="row">
				  <div class="field-wrap col-sm-10" ng-class="{ 'has-error' : productAdd.pdesc.$invalid && !productAdd.pdesc.$pristine }">
		            <table><tr><td>
					<label style="position: relative; -webkit-transform: translateY(0px);left: 0px;">
		              Product Description<span class="req">*</span>
		            </label></td><td>
		            <input type="text" id="pdesc" name="pdesc" ng-model="pdesc" required/></td><td>
					<span ng-if="productAdd.pdesc.$error.required && !productAdd.pdesc.$pristine " style="margin-left:25px;color:#FFE200;"">Product Description required</span>
					</td></tr></table>
		          </div>
				</div>
				<br><br>
				<center><div class="col-sm-2">
							<input type="submit" class="btn btn-info" value="submit" id="submit" ng-disabled="productAdd.$invalid" onClick="check();"/>
						</div>
					</center>
			</form>
			</div>
	</div>
	<!-- menu 1 ends here -->
	
	<!--  menu 2 starts here -->
	<div id="menu2" class="tab-pane fade" ng-app="sortApp"  ng-controller="mainController">
	    		<form class="navbar-form navbar-left" role="search">
    			<div class="form-group">
    			  <div class="input-group">
        				<div class="input-group-addon"><i class="fa fa-search"></i></div>
        					<input type="text" class="form-control" placeholder="Search " ng-model="searchProduct">
      					</div>      
    			</div>
    			</form>
    <form role="form" >
    			<table class="table table-bordered table-stripped table-hover table-responsive" id="deletetable" style="background-color:#242316;">
    				<tr>
    					<th>
    						<a href="#" ng-click="sortType = 'productid'; sortReverse = !sortReverse"  data-toggle="tooltip" data-placement="top"  title="click to sort">
    							Product Id
    							  <span ng-show="sortType == 'productid' && !sortReverse" class="fa fa-caret-down"></span>
            					  <span ng-show="sortType == 'productid' && sortReverse" class="fa fa-caret-up"></span>
            				</a>
    					</th>
    					<th>
    						<a href="#" ng-click="sortType = 'productname'; sortReverse = !sortReverse"  data-toggle="tooltip" data-placement="top"  title="click to sort">
    							Product Name
    							<span ng-show="sortType == 'productname' && !sortReverse" class="fa fa-caret-down"></span>
            					<span ng-show="sortType == 'productname' && sortReverse" class="fa fa-caret-up"></span>
            				</a>
    					</th>
    					<th>
    						<a href="#" ng-click="sortType = 'productdesc'; sortReverse = !sortReverse"  data-toggle="tooltip" data-placement="top"  title="click to sort">
    							Product Description
    							<span ng-show="sortType == 'productdesc' && !sortReverse" class="fa fa-caret-down"></span>
            					<span ng-show="sortType == 'productdesc' && sortReverse" class="fa fa-caret-up"></span>
            				</a>
    					</th>
    					<th>
    						<a href="#">
    						Delete Products
    						</a>
    					</th>
						<tr  ng-repeat="x in itemsdata| orderBy:sortType:sortReverse |filter:searchProduct">
    					<td>{{x.productID}}</td>
    					<td>{{x.name}}</td>
    					<td>{{x.description}}</td>
						<td><input type="button" class="btn" style="height:50px;background-color:#FFE251;color:black;font-weight:bold;" id="{{x.productID}}" name="{{x.pname}}" onclick="showpop($(this).attr('id'));" value="Delete Product"/></td>
						</tr>
    			</table>
    		</form> 
    	</div>
	</div>
				<!-- image add pop up -->

<!--   pop up 3-->
 <div class="modal fade" id="myModal1" role="dialog">
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
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='myadmin/addproducts'">Close</button>
        </div>
      </div>
    </div>
  </div>
  
	
	
	
	<!--   pop up 2-->
 <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Success</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;">
          <p>Addition Done.</p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="setFieldsEmpty();">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  
	<!--   pop up 1-->
	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Field Empty</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;">
          <p>Product Id Empty Or already exists.</p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" style="background-color:#1C1C18;color:#FFE200;" data-dismiss="modal" onclick="window.location.href='myadmin/addproducts'">Close</button>
        </div>
      </div>
    </div>
	</div>
	
	<!-- additional scripts -->
<script type="text/javascript" src="${pageContext.request.contextPath}/org/staticcontent/jquery.popconfirm.js">
		</script>	
		<script type="text/javascript">
		</script>	
	
</body>
</html>