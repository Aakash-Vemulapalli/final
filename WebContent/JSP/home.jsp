<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="DTO.*" %>
    <%@ page import="DAO.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.main
{
	margin:auto;
    width:960px;
	height:530px;;
	font-family:"harrypotter7";
	background-color:rgb(239,237,237);
	font-size:20px;
	border:1px thin black;
	scroll:no-scroll;
}
.main1
{	
	position:relative;
	left:50px;
	top:40px;
    width:640px;
	height:80px;
	font-family:"harrypotter7";
	padding-left:40px;
	font-size:40;
	color:rgb(129,129,129);
	border:1px thin black;
	scroll:no-scroll;
}
.login
{	
	
	margin-left:590px;
	margin-top:50px;
	width:390px;
	height:500px;
	padding-left:10px;
	font-family:"harrypotter7";
	font-size:12px;
}
p> input
{
font-size:4px;
font-family:"harryppotter7";
}
</style>
<script>

var c=0;
function noBack()
{
	window.history.forward();
}

		function test()
	
		{
			 var y = document.f1.upass.value;
			 var x = document.f1.uname.value;
			 var z = document.f1.upass1.value;
			 var onlychar = /^[A-Za-z]+$/;
			 var atpos = x.indexOf("@");
			 var dotpos = x.lastIndexOf(".");
			if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=x.length)
			  {
				 alert("Not a valid e-mail address");
			        return false;
			    }
			  
			if((x=="") && (y=="") && (z==""))
			{
		       	alert("All fields marked with * are mandatory")
		      	document.f1.uname.focus();   	
				return false;
			}
			if(x=="")
			{
			  alert("Please enter email id");
			  document.f1.uname.focus();
			  return false;
			}
			if(y=="")
			{
			  alert("Please enter a password ");
			  document.f1.upass.focus();
			  return(false);
			}
		if(y.length()<7)
			{
			  alert("Please enter valid password");
			  document.f1.uname.focus();
			  return(false);
			}
		
	
		 	
					 
		 	if (z.length()<7)
		 		{
		 		  alert("Please enter a valid 8 or above digit passpord");
				  document.f1.upass1.focus();
				  return false;
					
		 		}
			if(z=="")
			{
			  alert("Please enter password");
			  document.f1.upass1.focus();
			  return false;
			}
			if(z!=y);
				{
				alert("Passwords dont match , please enter password");
	    		document.f1.upass1.focus();
	    		return false;
				}
		return true;
		}
	  
  
</script>
</head>
<body onload="noBack()">
<div class="main">
	<div class="main1">EtiXketing<br><p>a solution to event management</p></div>
	<div class="login">
<form name="f1"  method="post" action="http://localhost:8081/final/mainservlet" onsubmit="return test()">
<table>
<tr><td align="center" colspan='2'>Register Now</td></tr>
<tr><td>user name:</td><td><input type="text" name="uname" id="sname" ></td></tr>
<tr><td>password:</td><td><input type="password" name="upass" id="p1" ></td></tr>
<tr><td>Confirm password:</td><td><input type="password" name="upass1" id="p2" ></td></tr>
<tr><td colspan="2" align="center"><input type="submit"  name="insert" id="b1"  value="register" onblur="test()" ></td></tr>
</table>
</form>
</div>
</div>
</body>
</html>