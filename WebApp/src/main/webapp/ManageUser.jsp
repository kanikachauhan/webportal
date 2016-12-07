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
label {
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
select{
	font-size: 22px;
	padding: 5px 10px 5px 10px;
	background-color:#1C1C18;
	border: 1px solid #a0b3b0;
	border-radius: 5px;
	color: #a0b3b0;
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
#msgs{
	font-size:25px;
	font-weight:bold;
	color: #a0b3b0;
}
input:focus, textarea:focus {
  outline: 0;
  border-color: #FFE200;
}
.jumbotron{
background-color:#1C1C18;
}
.abc{
color:#FFE200;
}
.table-hover{
	border:1px solid grey;
	color:grey;
	font-weight:bold;
}
.test{
position:relative;
    margin-right:20px;
}
.inputstl { 
    padding: 5px 22px 10px 10px;
    border: solid 1px #a0b3b0; 
    outline: 0; 
    background: #1C1C18;
    font-size:20px;
    border-radius: 5px;
    } 

.test:after{
    position:absolute;
    content:'*';
    color:red;
    right:-10px;
    top:0;
}	
.row{
	margin:20px 5px 30px 0px;
}
.pqr .active a {
  background: #FFE200;
  color: white;
}
.help-block{
	 display: inline-block;
	font-weight:bold;
	color:red;
}
.wrapper span {
    left: 2px;
}
.glyphicon-warning-sign{
	margin-top:5px;
	margin-right:0px;	
}
.mybtn{
	background: #FFE200;
  	color: white;
}
</style>
<script>
$(document).ready(function(){
	$("#fillform").hide();
	$("#fillformmac").hide();
	$("#udpatemodel").modal('hide');
});
var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
var charss="0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZ";
var cid='';
var string_length = 8;
var randomstring = '';
var jsonres;
var prodres;
var maddress;
var deletepid;
var sensorres;
var formvalid = false;
var cid_len=6;
var unameForManage;
var deletionid='',macaddress='';
var app = angular.module('myApp', []);
var productarr= [];
var serverpass = '';
var macaddresses = [];
var noOfproducts = 0;
app.controller('validateCtrl', function($scope,$http) {
	  $scope.submitForm = function() {
		  if($scope.userAdd.$valid)
				formvalid = true;
			else
			  	formvalid =false;
		  check();
		  };
		  $scope.role = function(){
				if(($scope.roles === "admin" || $scope.roles === "user"))
					$scope.val = false;
				else
					$scope.val = true;
			};
			$http.get("myadmin/fetchproducts").success(
			        function(data, status, headers, config) {
			        	productarr = data;
			        	$scope.itemsdata    = data;
						
			        }).error(function(data, status, headers, config){});
}
);
app.controller('modalCtrl',function($scope){});
app.controller('mainController',function($scope,$http){
$http.get("myadmin/tabledata").success(
	        function(data, status, headers, config) {
		        //alert("ttt");
	            $scope.itemsdata    = data;
	            $scope.sortType     = 'name'; // set the default sort type
	            $scope.sortReverse  = false;  // set the default sort order
	            jsonres             = data;
	        }).error(function(data, status, headers, config){});
$http.get("myadmin/getmacaddress").success(
        function(data, status, headers, config) {
            maddress             = data;
           
        }).error(function(data, status, headers, config){});
});
function generatepwd(){
	var t1=document.getElementById("pwd");
	var t11=document.getElementById("tpwd");
	t1.value="";
	t11.value="";
	randomstring="";
	for (var i=0; i<string_length; i++) {
    var rnum = Math.floor(Math.random() * chars.length);
    randomstring += chars.substring(rnum,rnum+1);
	}
	t1.value=randomstring;
	t11.value=randomstring;
}
function generateServerPassword(){
	var t1=document.getElementById("spwd");
	var t11=document.getElementById("stpwd");
	t1.value="";
	t11.value="";
	randomstring="";
	for (var i=0; i<string_length; i++) {
    var rnum = Math.floor(Math.random() * chars.length);
    randomstring += chars.substring(rnum,rnum+1);
	}
	t1.value=randomstring;
	t11.value=randomstring;
	
}
function populate(x){
	$("#selectProductPop").modal('hide');
	document.getElementById("pid").value=x;
	document.getElementById("modalpid").value=x;
}
function generatecid(){
	var t2=document.getElementById("cid");
	var t22=document.getElementById("tcid");
	t2.value="";
	t22.value="";
	cid="AC";
	for (var i=0; i<cid_len; i++) {
	    var rnum = Math.floor(Math.random() * chars.length);
	    cid += chars.substring(rnum,rnum+1);
	}
	t2.value=cid;
	t22.value=cid;
	if(typeof jsonres != 'undefined'){
		for(var t=0;t<jsonres.length;t++){
			if(cid==jsonres[t].customerid){
				alert("generate again key already exists");
				break;
			}		
		}
	}
}
$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip();  
		$("#submit").click(function(){
			
		});
});
function setid(){
	var tt=document.getElementById("modalcustid");
	var x=tt.value;
	//alert(x);
	deletionid=""+x+"";
	//macaddress=""+y+"";
	$("#del").bind('click', function() {
		//alert("xxxx");
		$("#"+x+"").closest('tr').hide();
		$.ajax({
			url: "myadmin/deletedata",
			method:'GET',
			data:'customerid='+deletionid,
			success:function(response){
			
				$("#udpatemodel").modal('hide');
				$("#myModal1").modal('show');
			},
			error: function(e){
				$("#myModal2").modal('show'); 
			}
			});
		
	});
	$("#del").popConfirm({
		title: "Delete ?",
		content: "Are You Sure??",
		placement: "bottom"
	});
	
	 	$("input:disabled").mouseover(function() {
		// 	alert("as");
		    $(this).find("input:disabled").attr("disabled", false).focus();
		  });
					
}
function checkmac(){
	/* var macaddr=document.getElementById("modalmacaddress");
	var vl=macaddr.value; */
	var tpid = document.getElementById("modalpid");
	var tpidval = tpid.value;
	var mty="false";
	/*for(var t=0;t<maddress.length;t++){
		if(v1===maddress[t].macaddress){
			mty="true";
			break;
		}
	}

	if(mty==="true" ){
		$("#productaddpop").submit(function(e){
			e.preventDefault();
			$("#macmsg").modal('show');
		});
	}
	else*/ if(tpidval==="Show Products"){
		$("#productaddpop").submit(function(e){
			e.preventDefault();
			$("#macmsg1").modal('show');
		});
	}
	else{
		$.ajax({
			url:"myadmin/useraddproduct",
			method:'GET',
			data:'modalmacaddress= '/*+document.getElementById("modalmacaddress").value+*/+'&uname='+unameForManage+'&productid='+document.getElementById("modalpid").value,
			success:function(response){
				//document.getElementById("added").disabled = true;
				$("#successModal").modal('show');	
			}
		});			
	}
}
function check(){	
	var productsArrAdded = [];
	var tcid=document.getElementById("emailid");
	//alert(tcid);
	//var tmadd=document.getElementById("macaddress");
	
	var tt=tcid.value.trim();
	//alert(tt);
	//var tmad=tmadd.value.trim();
	//alert(tmad);
	var tty="fault";
		for(var ty=0;ty<jsonres.length;ty++){
		//	alert(jsonres[ty].emailid);
		if(tt===jsonres[ty].emailid){
			tty="nfault";
			break;
		}
	}
		var mty="fault";
		/*for(var t=0;t<maddress.length;t++){
			if(tmad===maddress[t].macaddress){
				mty="nfault";
				//alert(tmad+" "+maddress[t].macaddress);
				break;
			}
		}*/
		//alert(formvalid);
	if(formvalid){
		//var ut = document.getElementById("pid").value;
		var t1=document.getElementById("pwd");
		var t11=document.getElementById("tpwd");
		var t2=document.getElementById("cid");
		var t22=document.getElementById("tcid");
		var t33 = document.getElementById("stpwd");
		var yu=0;
		var maarr=[];
		for(var nott=0;nott<noOfproducts;nott++){
			yu = yu+1;
			var pval = document.getElementById('selectprod'+yu).value;
			var mval = document.getElementById('macaddress'+yu).value;
			productsArrAdded[nott] = "{pval:"+pval+"=mval:"+mval+"}";
			for(var tcount=0;tcount<maddress.length;tcount++){
				//alert(maddress[tcount].macaddress);
				maarr[tcount] = maddress[tcount].macaddress;
				if(maddress[tcount].macaddress===mval&&maddress[tcount].macaddress!==""){
					mty="nfault";
					break;
				}
			}
			if(mty==="nfault")
				break;
		}
		/*var fbool = "true";
		for(var tcount = 0;tcount<maarr.length;tcount++){
			alert(Boolean(maarr[tcount]));
			if(Boolean(maarr[tcount])){
				
				if(!(maarr[tcount].match("/[a-zA-Z0-9]{2}\:[a-zA-Z0-9]{2}\:[a-zA-Z0-9]{2}\:[a-zA-Z0-9]{2}\:[a-zA-Z0-9]{2}\:[a-zA-Z0-9]{2}/"))){
					fbool = "false";
					break;
				}
			}
		}*/
		//alert(ut+"  "+t11.value+" "+t22.value);
		/*if(ut === "Show Products"){
						$("#userAdd").submit(function(e){
							e.preventDefault();
							$("#msgs").text("Choose A Valid Product");
						});		
					}else{*/
						
						if(tty === "nfault"){
							$("#userAdd").submit(function(e){
								e.preventDefault();
								//alert("Email Id exists.");
								$("#msgs").text("Email Id exists.");
							});
						}else{
							if(mty==="nfault"){
								$("#userAdd").submit(function(e){
									e.preventDefault();
									//alert("Mac Address exists.");
									$("#msgs").text("Mac Address exists.");
								});			
							}
							/*else
								if(fbool ==="false"){
									$("#userAdd").submit(function(e){
										e.preventDefault();
										//alert("Mac Address exists.");
										$("#msgs").text("One Or More Mac Address Is Invalid");
									});	
								}*/
							else{
								if(t11.value === ''|| t22.value === ''||t33.value === ''){
									$("#userAdd").submit(function(e){
										e.preventDefault();
										//alert("Customer Id or Password Field is Empty.");
										$("#msgs").text("Customer Id or Password Field is Empty.");
									});			
								}else{
									$.ajax({
										url:"myadmin/savedata",
										method:'GET',
										//data:'cid='+document.getElementById("cid").value+'&fname='+document.getElementById("fname").value+'&mname='+document.getElementById("mname").value+'&lname='+document.getElementById("lname").value+'&emailid='+document.getElementById("emailid").value+'&password='+document.getElementById("pwd").value+'&contactno='+document.getElementById("contactno").value+'&address='+document.getElementById("address").value+'&macaddress='+document.getElementById("macaddress").value+'&prodid='+ut+'&role='+document.getElementById("role").value+'&spwd='+document.getElementById("spwd").value+'&arr='+productsArrAdded+'&noarr='+noOfproducts
										data:'cid='+document.getElementById("cid").value+'&fname='+document.getElementById("fname").value+'&mname='+document.getElementById("mname").value+'&lname='+document.getElementById("lname").value+'&emailid='+document.getElementById("emailid").value+'&password='+document.getElementById("pwd").value+'&contactno='+document.getElementById("contactno").value+'&address='+document.getElementById("address").value+'&role='+document.getElementById("role").value+'&spwd='+document.getElementById("spwd").value+'&arr='+productsArrAdded+'&noarr='+noOfproducts,
										success: function(){  
											$("#msgs").text("Details Saved");
										}
									});				
								}
							}
						}
					//}
	}
	else{
		$("#invalidform").modal('show');
	}
}
function showpop(x){
	//alert(tt);
	var tt=""+x;
	var v1=document.getElementById("modalcustid");
	var v2=document.getElementById("modalfname");
	var v3=document.getElementById("modalmname");
	var v4=document.getElementById("modallname");
	var v5=document.getElementById("modalemailid");
	var v6=document.getElementById("modaladdress");
	var v7=document.getElementById("modalcontactno");
	for(var i=0;i<jsonres.length;i++){
		if(jsonres[i].customerid==tt){
			//alert(jsonres[i].customerid+" "+jsonres[i].emailid);
			v1.value=jsonres[i].customerid;
			v2.value=jsonres[i].firstname;
			v3.value=jsonres[i].middlename;
			v4.value=jsonres[i].lastname;
			v5.value=jsonres[i].emailid;
			v6.value=jsonres[i].address;
			v7.value=jsonres[i].contactno;
		}
	}
	v1.disabled=true;
	v2.disabled=true;
	v3.disabled=true;
	v4.disabled=true;
	v5.disabled=true;
	v6.disabled=true;
	v7.disabled=true;
	$("#udpatemodel").modal('show');
}
function showProdPop(){
	$("#selectProductPop").modal('show');
}
function showProdPopOne(){
	$("#selectProductPop").modal('show');
}
function abc(){
	//alert($("#modalfname").val()+" "+$('#modallname').val()+" "+$('#modalemailid').val()+" "+$('#modaladdress').val()+" "+$('#modalcontactno').val()+" "+$('#modalmacaddress').val());
	var test1=/^[a-zA-Z]+$/;
	var test2=/^[0-9]{10}/;
	var test3=/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/;
	if($("#modalfname").val()==''||$('#modallname').val()==''||$('#modalemailid').val()==''||$('#modaladdress').val()==''||$('#modalcontactno').val()=='')
		alert("one or more fields is empty");
	else if((!($("#modalfname").val()=='') && !($('#modallname').val()=='') && !($('#modalemailid').val()=='') && !($('#modaladdress').val()=='') && !($('#modalcontactno').val()=='')))
	{
//		alert("SDSD");
		if(!test1.test($("#modalfname").val()))
			alert("invalid first name");
		else if(!test1.test($("#modallname").val()))
			alert("invalid last name");
		else if(!test1.test($("#modalmname").val())&&($("#modalmname").val()!=''))
			alert("invalid middle name");
		else if(!test2.test($("#modalcontactno").val()))
			alert("invalid contact number");
		else{
			//alert("done");
			$.ajax({
				url: "myadmin/updatedata",
				method:'GET',
				data:'customerid='+$('#modalcustid').val()+'&firstname='+$('#modalfname').val()+'&middlename='+$('#modalmname').val()+'&lastname='+$('#modallname').val()+'&emailid='+$('#modalemailid').val()+'&address='+$('#modaladdress').val()+'&contactno='+$('#modalcontactno').val(),
				success:function(response){
					$("#udpatemodel").modal('hide');
					$("#successModal").modal('show');
				},
				error: function(e){
					$("#myModal2").modal('show'); 
				}
			});
		}
	}	
}
function del(x){
	//var tt=document.getElementById("macaddr");
	//var x=tt.value;
	//alert(x);
	$("#pdeleteModal").modal('show');
	deletepid = x;
//$("#"+x).bind('click', function() {
	//alert("here");
	/*$.ajax({
		url:"myadmin/userproductdelete",
		data:"macaddress="+x+"&uname="+unameForManage,
		method:'GET',
		success:function(response){
		$("#myModal1").modal('show');
	}
		});*/
//});
}
function delsensor(x){
	$("#sdeleteModal").modal('show');
	
}
function deletep(){
	$.ajax({
		url:"myadmin/userproductdelete",
		data:"macaddress="+deletepid+"&uname="+unameForManage,
		method:'GET',
		success:function(response){
		$("#myModal1").modal('show');
	}
		});
}
function addProducts(){
		noOfproducts = noOfproducts+1;
		var html = '<div class=\"row\"><div class=\"field-wrap col-sm-10\"><div class=\"col-sm-4\"><select id=\"selectprod'+noOfproducts+'\" name=\"selectprod'+noOfproducts+'\">';
		for(var i=0;i<productarr.length;i++){
			html = html + '<option value=\"'+productarr[i].pid+'\" >'+productarr[i].name+'</option>';
		}html = html+ '</select>';
		html = html + '</div><div class=\"col-sm-4\">';
		html = html + '<input type=\"text\" data-toggle=\"tooltip\" id=\"macaddress'+noOfproducts+'\" data-placement=\"bottom\"  title=\"Mac Address fields should be separated by : It should have a length of 12 characters. \" name=\"macaddress\" ng-model=\"macaddress\" ng-pattern=\"/[a-zA-Z0-9]{2}\:[a-zA-Z0-9]{2}\:[a-zA-Z0-9]{2}\:[a-zA-Z0-9]{2}\:[a-zA-Z0-9]{2}\:[a-zA-Z0-9]{2}/\" />';
		html = html + '</div></div></div>';
		//alert(html);
		$("#lrow").after(html);
}
function manageproduct(x,y){
	$("#addproduct").modal('show');
	//alert(x);
	$.ajax({
		url:"myadmin/productid",
		data:"customerid="+x,
		method:'GET',
		dataType:'json',
		success:function(response){
		prodres = response;
		//alert(prodres);
		$("#producttb td").parent().remove();
		//alert(prodres.length);
		for(var i=0;i<prodres.length;i++)
			$("#producttb").append("<tr><td>"+prodres[i].pid+"</td><td>"+prodres[i].name+"</td></tr>");
		//+"</td><td>"+prodres[i].description+"</td><td>"+prodres[i].name+"</td>
		unameForManage=y;
		}
	});
	
	$.ajax({
		url:"myadmin/sensortb",
		data:"customerid="+x,
		method:'GET',
		dataType:'json',
		success:function(response){
			sensorres = response;
			//alert(sensorres.length);
			$("#sensortb td").parent().remove();
			for(var i=0;i<sensorres.length;i++){
				//alert(sensorres[i].productid);
				$("#sensortb").append("<tr><td>"+sensorres[i].pid+"</td><td><button type='button'  class='btn btn-danger' id='"+sensorres[i].pid+"' style='font-weight:bold' onclick='delsensor(this.id);'>Delete</button></td></tr>");
			}
		}
	});
}
</script>
<style type="text/css">
.jumbotron{
background-color:#1C1C18;
}
.abc{
color:#FFE200;
}
.table-hover{
	border:1px solid grey;
	color:grey;
	font-weight:bold;
}
</style>
</head>
<body ng-app="myApp" style="background: #1C1C18;">
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
		<s:if test="hasActionMessages()">
		      <s:actionmessage/>
			</s:if>
		<ul class="nav nav-tabs">
			<li><a data-toggle="tab" href="#menu1" class="abc"><h2>New Customer</h2></a></li>
			<li><a data-toggle="tab" href="#menu2" class="abc"><h2>Existing Customer</h2></a></li>
		</ul>
<!-- Menu 1 -->
<div class="tab-content abc">
<div id="menu1" class="tab-pane fade">
 <div class="form">
	<form id="userAdd" name="userAdd" ng-controller="validateCtrl" method="post" novalidate  ng-submit="submitForm()">
	<div class="row">
	<div class="col-sm-10" style="padding-bottom:5px;">
	<div class="col-sm-4">
	<label for="pwd" style="position: relative; -webkit-transform: translateY(0px);left: 0px;margin-right:10px;">Generate Customer Id</label></div>
	<div class="col-sm-4"><input type="text" id="tcid" name="tcid" ng-model="cid" disabled/>
    	<input type="hidden" class="form-control" id="cid" name="cid" /></div>
    	<div class="col-sm-4"><input type="button" class="form-control" style="background-color:#D13614;border:1px solid D13614;color:black;margin-left:10px;" value="Generate" onclick="generatecid();" />
    	</div>
  	</div>
	</div>
	<!-- server password -->
	 <div class="row">
	<div class="col-sm-10" style="padding-bottom:5px;">
	<div class="col-sm-4">
    	<label for="pwd" style="position: relative; -webkit-transform: translateY(0px);left: 0px;">Generate Server Password</label></div>
    	<div class="col-sm-4"><input type="text" id="stpwd" name="password" required disabled/><input type="hidden" class="form-control" id="spwd" name="password"/></div>
    	<div class="col-sm-4"><input type="button" class="form-control" style="background-color:#D13614;border:1px solid D13614;color:black;margin-left:10px;" value="Generate" onclick="generateServerPassword();" /></div>
  	</div>
	</div> 
	<div class="row">
	<div class="col-sm-10" style="padding-bottom:5px;">
	<div class="col-sm-4"><label for="pwd" style="position: relative; -webkit-transform: translateY(0px);left: 0px;">Generate One Time Password</label></div>
	<div class="col-sm-4">
    	<input type="text" id="tpwd" name="password" required disabled/><input type="hidden" class="form-control" id="pwd" name="password"/></div>
    	<div class="col-sm-4"><input type="button" class="form-control" style="background-color:#D13614;border:1px solid D13614;color:black;margin-left:10px;" value="Generate" onclick="generatepwd();" /></div>
  	</div>
	</div>
		<div class="row">
		<div class="field-wrap col-sm-10 " ng-class="{ 'has-error' : userAdd.fname.$error.required ||userAdd.fname.$error.pattern && !userAdd.fname.$pristine}">
            <div class="col-sm-4">
			<label style="position: relative; -webkit-transform: translateY(0px);left: 0px;">
              First Name<span class="req">*</span>
            </label>
            </div>
            <div class="col-sm-4">
            <input type="text" id="fname" name="fname" ng-model="fname" ng-pattern="/^[a-zA-Z]+$/" required /></div>
            <div class="col-sm-4">
			<span ng-show="userAdd.fname.$error.required && !userAdd.fname.$pristine" style="margin-left:25px;">First Name required.</span>
			<span ng-show="userAdd.fname.$error.pattern && !userAdd.fname.$pristine && !userAdd.fname.$error.required" style="margin-left:25px;">First Name must contain only letters.</span>	
			</div>
        </div>
		</div>
		<div class="row">
		<div class="field-wrap col-sm-10" ng-class="{ 'has-error' : userAdd.mname.$invalid && !userAdd.mname.$pristine }">
            <div class="col-sm-4">
			<label style="position: relative; -webkit-transform: translateY(0px);left: 0px;">
              Middle Name
            </label></div>
            <div class="col-sm-4">
            <input type="text" id="mname" name="mname" ng-model="mname" ng-pattern="/^[a-zA-Z]+$/" /></div>
            <div class="col-sm-4">
			<span ng-show="userAdd.mname.$error.pattern && !userAdd.mname.$pristine">Middle Name must contain only letters.</span>
			</div>
        </div>
		</div>
		<div class="row">
		  <div class="field-wrap col-sm-10" ng-class="{ 'has-error' : userAdd.lname.$invalid ||userAdd.lname.$error.pattern  && !userAdd.lname.$pristine }">
            <div class="col-sm-4">
			<label style="position: relative; -webkit-transform: translateY(0px);left: 0px;">
              Last Name<span class="req">*</span>
            </label></div>
            <div class="col-sm-4">
            <input type="text" id="lname" name="lname" ng-model="lname" ng-pattern="/^[a-zA-Z]+$/" required/>
            </div>
            <div class="col-sm-4">
			<span ng-show="userAdd.lname.$error.required && !userAdd.lname.$pristine" style="margin-left:25px;">Last Name required.</span>
    		<span ng-show="userAdd.lname.$error.pattern && !userAdd.lname.$pristine && !userAdd.lname.$error.required" style="margin-left:25px;">Last Name must contain only letters.</span>
			</div>
          </div>
		</div>	 
		<div class="row">
		  <div class="field-wrap col-sm-10" ng-class="{ 'has-error' : userAdd.emailid.$invalid && !userAdd.emailid.$pristine }">
            <div class="col-sm-4">
			<label style="position: relative; -webkit-transform: translateY(0px);left: 0px;">
              Email Address<span class="req">*</span>
            </label></div>
            <div class="col-sm-4">
            <input type="email" id="emailid" ng-model="email" name="emailid" required/>
			</div>
			<div class="col-sm-4">
			<span ng-show="userAdd.emailid.$error.required && !userAdd.emailid.$pristine" style="margin-left:25px;">Email Address required.</span>
    		<span ng-show="userAdd.emailid.$error.email && !userAdd.emailid.$pristine " style="margin-left:25px;">Invalid Email Address</span>
			</div>
          </div>
		</div>
		<div class="row">
		  <div class="field-wrap col-sm-10" ng-class="{ 'has-error' : userAdd.contactno.$invalid || userAdd.contactno.$error.pattern && !userAdd.contactno.$pristine }">
		  <div class="col-sm-4">
            <label style="position: relative; -webkit-transform: translateY(0px);left: 0px;">
              Contact No<span class="req">*</span>
            </label></div>
            <div class="col-sm-4">
            <input type="text" id="contactno" name="contactno" ng-model="contact" ng-pattern="/^[0-9]{10}/" required/>
            </div>
            <div class="col-sm-4">
			<span ng-if="userAdd.contactno.$error.required && !userAdd.contactno.$pristine" style="margin-left:25px;">Contact No. required.</span>
    		<span ng-if="userAdd.contactno.$error.pattern && !userAdd.contactno.$pristine" style="margin-left:25px;">Invalid Contact No.</span>
			</div>
          </div>
		</div>
		<div class="row">
		  <div class="field-wrap col-sm-10" ng-class="{ 'has-error' : userAdd.address.$error.required && !userAdd.address.$pristine }">
            <div class="col-sm-4">
			<label style="position: relative; -webkit-transform: translateY(0px);left: 0px;">
              Address<span class="req">*</span>
            </label></div>
            <div class="col-sm-4">
            <input type="text" id="address" name="address" ng-model="address" required/></div>
			<div class="col-sm-4">
			<span ng-if="userAdd.address.$error.required && !userAdd.address.$pristine ">Address required</span>
			</div>
          </div>
		</div>
		<div class="row">
		  <div class="field-wrap col-sm-10" ng-class="{ 'has-error' : userAdd.lname.$invalid ||userAdd.lname.$error.pattern  && !userAdd.lname.$pristine }">
            <div class="col-sm-4">
			<label style="position: relative; -webkit-transform: translateY(0px);left: 0px;">
              Role<span class="req">*</span>
            </label></div><div class="col-sm-4">
            <input type="text" id="role" name="role" ng-model="roles" ng-Mouseleave= "role()" ng-Keyup = "role()" required/></div>
            <div class="col-sm-4">

			<span ng-show="userAdd.role.$error.required && !userAdd.role.$pristine" style="margin-left:25px;">Role required.</span>
    		<span ng-show="val && !userAdd.role.$pristine && !userAdd.role.$error.required" style="margin-left:25px;">Role must be admin or user.</span>
			</div>
          </div>
		</div>	
		<div class = "row" id="lrow">
			<div class="field-wrap col-sm-10" >
	   			<div class="col-sm-4">
	   			<label style="position: relative; -webkit-transform: translateY(0px);left: 0px;">
	              Select Product
	            </label></div>
	            <div class="col-sm-4">
	   			<input type="button" id="pidbtn" name="pidbtn" class="btn" style="background-color:#1C1C18;color:#a0b3b0;font-size:20px;width:300px;height:45px;margin-left:15px;border:solid 1px #a0b3b0;"  value="Add Products" onClick="addProducts()"></input>
				</div>
			</div>
		</div>
  		
	</div><br><br><br>
  <center>
  		<div class="col-sm-2" style="padding-top:20px;;">
				<input type="submit" class="btn btn-info" value="submit" id="submit"/>
		</div>
	</center><br><br><br><br>
			<div id="msgs"></div>
			</form>
</div>

	
	 <!--  first menu ends here -->
<!--    Menu 2 -->	
    	<div id="menu2" class="tab-pane fade" ng-app="sortApp"  ng-controller="mainController">
    		
    		<form class="navbar-form navbar-left" role="search">
    			<div class="form-group">
    			  <div class="input-group">
        				<div class="input-group-addon"><i class="fa fa-search"></i></div>
        					<input type="text" class="form-control" placeholder="Search " ng-model="searchCustomer">
      					</div>      
    			</div>
    			</form>
    <form role="form" >
    			<table class="table table-bordered table-stripped table-hover table-responsive" id="deletetable" style="background-color:#242316;">
    				<tr>
    					<th>
    						<a href="#" ng-click="sortType = 'customerid'; sortReverse = !sortReverse"  data-toggle="tooltip" data-placement="top"  title="click to sort">
    							Customer Id
    							  <span ng-show="sortType == 'customerid' && !sortReverse" class="fa fa-caret-down"></span>
            					  <span ng-show="sortType == 'customerid' && sortReverse" class="fa fa-caret-up"></span>
            				</a>
    					</th>
    					<th>
    						<a href="#" ng-click="sortType = 'firstname'; sortReverse = !sortReverse"  data-toggle="tooltip" data-placement="top"  title="click to sort">
    							First Name
    							<span ng-show="sortType == 'firstname' && !sortReverse" class="fa fa-caret-down"></span>
            					<span ng-show="sortType == 'firstname' && sortReverse" class="fa fa-caret-up"></span>
            				</a>
    					</th>
    					<th>
    						<a href="#" ng-click="sortType = 'middlename'; sortReverse = !sortReverse"  data-toggle="tooltip" data-placement="top"  title="click to sort">
    							Middle Name
    							<span ng-show="sortType == 'middlename' && !sortReverse" class="fa fa-caret-down"></span>
            					<span ng-show="sortType == 'middlename' && sortReverse" class="fa fa-caret-up"></span>
            				</a>
    					</th>
    					<th>
    						<a href="#" ng-click="sortType = 'lastname'; sortReverse = !sortReverse"  data-toggle="tooltip" data-placement="top"  title="click to sort">
    							Last Name
    							<span ng-show="sortType == 'lastname' && !sortReverse" class="fa fa-caret-down"></span>
            					<span ng-show="sortType == 'lastname' && sortReverse" class="fa fa-caret-up"></span>
            				</a>
    					</th>
    					<th>
    						<a href="#" ng-click="sortType = 'emailid'; sortReverse = !sortReverse"  data-toggle="tooltip" data-placement="top"  title="click to sort">
    							Email Id
    							<span ng-show="sortType == 'emailid' && !sortReverse" class="fa fa-caret-down"></span>
            					<span ng-show="sortType == 'emailid' && sortReverse" class="fa fa-caret-up"></span>
            				</a>
    					</th>
    					<th>
							<a href="#" ng-click="sortType = 'contactno'; sortReverse = !sortReverse"  data-toggle="tooltip" data-placement="top"  title="click to sort">
    							Contact No
    							<span ng-show="sortType == 'contactno' && !sortReverse" class="fa fa-caret-down"></span>
            					<span ng-show="sortType == 'contactno' && sortReverse" class="fa fa-caret-up"></span>
            				</a>
    					</th>
    					<th>
    						<a href="#" ng-click="sortType = 'address'; sortReverse = !sortReverse"  data-toggle="tooltip" data-placement="top"  title="click to sort">
    							Address
    							<span ng-show="sortType == 'address' && !sortReverse" class="fa fa-caret-down"></span>
            					<span ng-show="sortType == 'address' && sortReverse" class="fa fa-caret-up"></span>
            				</a>
    					</th>
    					 <th>
    						<a href="#" ng-click="sortType = 'client_password'; sortReverse = !sortReverse"  data-toggle="tooltip" data-placement="top"  title="click to sort">
    							Client Password
    							<span ng-show="sortType == 'client_password' && !sortReverse" class="fa fa-caret-down"></span>
            					<span ng-show="sortType == 'client_password' && sortReverse" class="fa fa-caret-up"></span>
            				</a>
    					</th> 
    					<th>
    						<a href="#">
    						Edit User
    						</a>
    					</th>
    					<th>
    						<a href="#">
    						Manage Products
    						</a>
    					</th>
    				</tr>
    				<tr  ng-repeat="x in itemsdata| orderBy:sortType:sortReverse |filter:searchCustomer">
    					<div ng-if ="x.role === 'user'">
    					<td>{{x.customerid}}</td>
    					<td>{{x.firstname}}</td>
    					<td>{{x.middlename}}</td>
    					<td>{{x.lastname}}</td>
    					<td>{{x.emailid}}</td>
    					<td>{{x.contactno}}</td>
    					<td>{{x.address}}</td>
    					<td>{{x.password}}</td>
    					<td><input type="button" class="btn" style="height:50px;background-color:#FFE251;color:black;font-weight:bold;" id="{{x.customerid}}" name="{{x.emailid}}" onclick="showpop($(this).attr('id'));" value="Manager User"/></td>
    					<td><input type="button" class="btn" style="height:50px;background-color:#4B8211;color:black;font-weight:bold;" id="{{x.customerid}}" name="{{x.emailid}}" onclick="manageproduct($(this).attr('id'),$(this).attr('name'));" value="Manage Products"/></td> 
    					</div>
    					<!-- 	<td><button type="button" class="btn btn-default" id="{{x.customerid}}" name="{{x.macaddress}}" onclick="setid($(this).attr('id'),$(this).attr('name'));">Delete</button></td>-->
    				</tr>
    			</table>
    		</form> 
    	</div>
    	</div>
 <!-- update pop up model -->
<div class="modal fade" id="udpatemodel" role="dialog">
	<div class="modal-content">
		<div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
			 <button type="button" class="close" data-dismiss="modal">&times;</button>
			 <h4 class="modal-title">Edit Info</h4>
		</div>
		<form role="form" name="useraddpop" id="useraddpop" ng-controller="validateCtrl" method="post" novalidate >
		<div class="modal-body" style="background-color:#242316;color:#FFE200;font-weight:bold;">
		<center><table>
						<tr> <div class="form-group required">
							<td>Customer Id:</td>
							<td><input type="text" class="form-control" readonly="readonly" id="modalcustid"/></td></div>
						</tr>
						<tr> <div class="form-group required" >
							<td>First Name:</td>
							<td>
								<input type="text" class="form-control" id="modalfname" name="fname" ng-model="fname" ng-pattern="/^[a-zA-Z]+$/" />
    							<span ng-if="useraddpop.fname.$error.pattern && !useraddpop.fname.$pristine">First Name must contain only letters.</span>
							</td>
						 <td>
								<input type="button" class="form-control" style="background-color:#AE6CC5;" value="Edit" onclick="$('#modalfname').attr('disabled',false);"/>
							</td> </div>
						</tr>
						<tr> <div class="form-group required">
							<td>Middle Name:</td>
							<td>
								<input type="text" class="form-control" id="modalmname" name="mname" ng-model="mname" ng-pattern="/^[a-zA-Z]+$/"  disabled/>
    							<span ng-if="useraddpop.mname.$error.pattern">Middle Name must contain only letters.</span>
							</td>
						 	<td>
								<input type="button" class="form-control" style="background-color:#AE6CC5;"  value="Edit" onclick="$('#modalmname').attr('disabled',false);"/>
							</td></div>
						</tr>
						<tr> <div class="form-group required">
							<td>Last Name:</td>
							<td>
								<input type="text" class="form-control" id="modallname" name="lname" ng-model="lname" ng-pattern="/^[a-zA-Z]+$/" required  disabled/>
    						  <span ng-if="useraddpop.lname.$error.pattern">Last Name must contain only letters.</span>
							</td>
						 <td>
								<input type="button" class="form-control" style="background-color:#AE6CC5;" value="Edit" onclick="$('#modallname').attr('disabled',false);"/>
							</td></div>
						</tr>
						<tr> <div class="form-group required">
							<td>Email Id:</td>
							 <td>
								<input type="email" class="form-control" id="modalemailid" ng-model="email" name="emailid" required  disabled/>
    						 <span ng-if="useraddpop.emailid.$error.email">Invalid Email Address</span>
    						</td> 
							<td>
								
							</td></div>
						</tr>
						<tr> <div class="form-group required">
							<td>Address:</td>
							<td>
								<textarea class="form-control" id="modaladdress" rows="5" name="address" ng-model="address" required  disabled></textarea>
    							<span ng-if="useraddpop.address.$error.required"></span>
							</td>
							 <td>
								<input type="button" class="form-control" style="background-color:#AE6CC5;" value="Edit" onclick="$('#modaladdress').attr('disabled',false);"/>
							</td></div>
						</tr>
						<tr> <div class="form-group required">
							<td>Contact No:</td>
							<td>
								<input type="tel" class="form-control" id="modalcontactno" name="contactno" ng-model="contact" ng-pattern="/^[0-9]{10}/" required  disabled/>
    						  	<span ng-if="useraddpop.contactno.$error.required"></span>
    						  <span ng-if="useraddpop.contactno.$error.pattern">Invalid Contact No.</span>
							</td>
							<td>
								<input type="submit" class="form-control" style="background-color:#AE6CC5;" value="Edit" onclick="$('#modalcontactno').attr('disabled',false);"/>
							</td> </div>
						</tr>
					</table>	
			</center>
		</div>
		<div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<input type="button" class="btn btn-success" style="width:100px;" value="OK" id="popupsubmit" onclick="abc()"/>
			<button type="button" class="btn btn-danger" onclick="setid();" id="del">Delete</button>
		</div>
		</form>
	</div>
</div>

 <!-- manage products -->
<div class="modal fade" id="addproduct" role="dialog" >
    <div class="modal-dialog" role="document"> 
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Products</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;font-weight:bold;">
        <center>
         <div id="addprd">
         	<ul class="nav nav-tabs">
         		<li><a data-toggle="tab" href="#mn1" class="abc"><h2>Products Enrolled</h2></a></li>
				<li><a data-toggle="tab" href="#mn2" class="abc"><h2>Add Products</h2></a></li>
				<!-- <li><a data-toggle="tab" href="#mn3" class="abc"><h2>Sensors Purchased</h2></a> -->
         	</ul>
         	<div class="tab-content">
         		<div id="mn1" class="tab-pane fade in active" >
         		
         			<h1>Products</h1>
         			<center>
         			<table class="table table-bordered table-stripped table-hover table-responsive" style="padding:20px;" id="producttb">
         			<tr>
         				<th>Product Id</th>
         				<th>Product Name</th>
         				
         			</tr>	
         			</table>
         			</center>
         		</div>
         		<div id="mn2" class="tab-pane fade">
         			<h1>Add</h1>
		<form role="form" name="productaddpop" id="productaddpop" ng-controller="modalCtrl" ng-app="myApp" method="post" novalidate>         			
         		
         			<table>
         		<tr><div class="form-group required">
         					<td>Click Here</td>
         					<td><input type="button" id="modalpid" name="pid" class="btn" style="background-color:white;color:#FFE200;font-size:18px;width:250px;height:40px;" onClick="showProdPopOne();" value="Show Products"></input></td>
         				</div>
         				</tr>
         				<%-- <tr><div class="form-group required">
         					<td>Mac Address</td>
         					<td>
         						<input type="text"  data-toggle="tooltip" data-placement="bottom"  title="Mac Address fields should be separated by '.' It should have a length of 12 characters. " name="modalmacaddress" id="modalmacaddress" class="form-control" ng-model="modalmacaddress" ng-pattern="/b8\.27\.eb\.[a-zA-Z0-9]{2}\.[a-zA-Z0-9]{2}\.[a-zA-Z0-9]{2}/" >
    						<!--<span ng-if="productaddpop.modalmacaddress.$error.required && !productaddpop.modalmacaddress.$pristine">Mac Address required.</span>-->
    						  <span ng-if="productaddpop.modalmacaddress.$error.pattern && !productaddpop.modalmacaddress.$error.required && !productaddpop.modalmacaddress.$pristine">Invalid Mac Address</span>
         					</td></div>
         				</tr> --%>
         	
         			</table><br><br>
         			 <button id="added" type="button" class="btn btn-success" ng-disabled="!productaddpop.$valid" onclick="checkmac();">Add</button>
         			 </form>
         	</div>
         	<!-- <div id="mn3" class="tab-pane fade" >
         			<h1>Sensors</h1>
         			<center>
         			<table class="table table-bordered table-stripped table-hover table-responsive" style="padding:20px;" id="sensortb">
         			<tr>
         				<th>Id</th>
         				<th>Delete</th>
         			</tr>	
         			</table>
         			</center>
         		</div> -->
         		</div>
         		 
         </div>
		  </center>
        </div>
        
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='myadmin/manageuser'">Close</button>
        </div>
      </div>
     </div>
</div>	
<!--  select product pop up -->
<div class="modal fade"id="selectProductPop" role="dialog"  ng-controller="validateCtrl" ng-app="myApp" >
    <div class="modal-dialog" role="document">
      <div class="modal-content">
	        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Select Product</h4>
	        </div>
	 	<!-- 	<div class="modal-body" style="background-color:#242316;color:#FFE200;">
	 			<table>
			 		 <tr ng-repeat="x in itemsdata"> 
			 		 	<td>
			 		 	<div class="checkbox">
  <label><input type="checkbox" value="">{{x.pname}}</label>
</div>
			 		 	</td>
			 		</tr>
	 			</table>-->
	 			
	 			
	 		<!-- 	<ul>
  <li ng-repeat="x in itemsdata">
    <input type="checkbox" ng-checked="x.checked"> {{x.name}}
  </li>
  
</ul>-->




			</div>
			<div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
	          <button type="button" class="btn btn-default" style="background-color:#1C1C18;color:#FFE200;" data-dismiss="modal">Close</button>
	        </div>
        </div>
</div>
</div>


<!-- pidpop -->
<div class="modal fade" id="pidpop" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Message</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;">
          <p>Select A Valid Product Id.</p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" style="background-color:#1C1C18;color:#FFE200;" data-dismiss="modal">Close</button>
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
          <p>Your Customer or password field is empty.</p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" style="background-color:#1C1C18;color:#FFE200;" data-dismiss="modal">Close</button>
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
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='myadmin/manageuser'">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  <!-- invalid form pop up -->
  <div class="modal fade" id="invalidform" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Fatal Error</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;">
          <p>Invalid Fields. Please Check.</p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
        </div>
      </div>
    </div>
  </div>
   <!--   empty field pop up -->
<div class="modal fade" id="fielderror" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Fatal Error</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;">
          <p>Field Error.</p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

   <!--  Success pop up --> 
<div class="modal fade" id="successModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Success</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;">
          <p>
          	Success
          </p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='myadmin/manageuser'">Close</button>
        </div>
      </div>
    </div>
  </div>
	
	<!--Product Deletion confirmation -->
		<div class="modal fade" id="pdeleteModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Delete</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;">
          <p>
          	Are You Sure??
          </p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
        	<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="deletep()">Yes</button>
        </div>
      </div>
    </div>
  </div>
  
 <!--   message for registered user -->
<div class="modal fade" id="msg" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">User Exist</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;">
          <p>User Already Present..Go to Edit User tab..</p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='myadmin/manageuser'">Close</button>
        </div>
      </div>
    </div>
  </div>		

<!-- mac address exist message -->
<div class="modal fade" id="macmsg" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Mac Address Exist</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;">
          <p>Mac Address Already Present... Can't Register with this address... </p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='myadmin/manageuser'">Close</button>
        </div>
      </div>
    </div>
  </div>		


<div class="modal fade" id="macmsg1" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Error</h4>
        </div>
        <div class="modal-body" style="background-color:#242316;color:#FFE200;">
          <p>Select A Valid Product </p>
        </div>
        <div class="modal-footer" style="background-color:#1C1C18;color:#FFE200;">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.href='myadmin/manageuser'">Close</button>
        </div>
      </div>
    </div>
  </div>


</div>

<!-- additional scripts -->
<script type="text/javascript" src="${pageContext.request.contextPath}/org/staticcontent/jquery.popconfirm.js">
		</script>	
		<script type="text/javascript">
	/*		$('.form').find('input, textarea').on('keyup blur focus', function (e) {
  var $this = $(this),
      label = $this.prev('label');

	  if (e.type === 'keyup') {
			if ($this.val() === '') {
          label.removeClass('active highlight');
        } else {
          label.addClass('active highlight');
        }
    } else if (e.type === 'blur') {
    	if( $this.val() === '' ) {
    		label.removeClass('active highlight'); 
			} else {
		    label.removeClass('highlight');   
			}   
    } else if (e.type === 'focus') {
      
      if( $this.val() === '' ) {
    		label.removeClass('highlight'); 
			} 
      else if( $this.val() !== '' ) {
		    label.addClass('highlight');
			}
    }

});*/
		</script>	
</body>
</html>