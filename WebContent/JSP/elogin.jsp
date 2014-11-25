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
function test()
  {
	 var x = document.f1.uname.value;
	 var onlychar = /^[A-Za-z]+$/;
	 var atpos = x.indexOf("@");
	 var dotpos = x.lastIndexOf(".");
	if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=x.length)
	  {
	confrim("Not a valid e-mail address");
	        return false;
	    }
	  
	if((document.f1.uname.value=="") && (document.f1.upass.value=="") && (document.f1.upass1.value==""))
	{
       alert("All fields marked with * are mandatory")
         	
		return false;
	}
	if(document.f1.uname.value=="")
	{
	  alert("Please enter email id");
	  document.f1.uname.focus();
	  return false;
	}
	if(document.f1.upass.value=="")
	{
	  alert("Please enter a password ");
	  document.f1.upass.focus();
	  return(false);
	}
if(document.f1.upass.value.length()<7)
	{
	  alert("Please enter confirm password");
	  document.f1.uname.focus();
	  return(false);
	}

	  return(true);
	}


</script>
</head>
<body>
<div class="main">

<div class="main1">
ETiXketing <br>
<p>where the show life begins</p></div>
<div class="login"><form name="f1"  method="post" action="http://localhost:8081/final/mainservlet" onsubmit="test()">
<table>
<tr><td colspan="2"> <font color="red">please enter valid user</font></td></tr>
<tr><td align="center" colspan='2'>login Now</td></tr>
<tr><td>user name:</td><td><input type="text" name="uname" id="sname"></td></tr>
<tr><td>password:</td><td><input type="password" name="upass" maxlength="15" id="p1"></td></tr>
<tr><td ><input type="submit" name="login" id="b1"  value="login" onclick="test()"></td><td><input type="submit" value="register now" name="reg" ></tr>
</table>
</form>
</div>
</div>
</body>
</html>