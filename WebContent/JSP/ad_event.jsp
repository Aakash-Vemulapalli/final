<%@page import="DTO.dto.maindto"%>
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
.logout
{
	margin-left:500px;
	margin-top:-100px;
	width:100px;
	height:500px;
	padding-left:10px;
	font-family:"harrypotter7";
	font-size:12px;
}
td> input
{
width:150px;
}
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
	
	margin-left:100px;
	margin-top:100px;
	width:100px;
	height:500px;
	padding-left:10px;
	font-family:"harrypotter7";
	font-size:12px;
}
.prof
{	
	
	margin-left:200px;
	margin-top:-90px;
	width:300px;
	height:auto;
	padding-left:10px;
	font-family:"harrypotter7";
	font-size:12px;
}
</style>
<script>
function test()
	{
	windows.location="http://localhost:8081/final/JSP/admin.jsp";
	return true;
	}
	function check()
	{
		var a =-document.getElementsByName("Did");
		var b =document.getElementsByName("E_name");
		if(a=="" && b=="")
			{
			alert("please enter the values ");
			return false
			}
		if(a=="")
			{
			alert("please enter a event id");
			return false;
			}
		if(b=="")
			{
			alert("please enter a event name");
			return false;
			}
		 return true
	}
</script>
<%   
if((session.getAttribute("username"))==null)
{
	RequestDispatcher rd= request.getRequestDispatcher("elogin.jsp");
	rd.forward(request,response);
	
}
else
{ 	String S=(String)(session.getAttribute("username"));
	request.setAttribute("uname", S);
	maindto dt=new maindto();
	dt.setName(S);

%>

</head>
<body>
<div class="main">
<div class="main1">EtiXketing <br><p> A solution to event ticketing</p>
<div class="logout"><form name="f3"  method="post" action="http://localhost:8081/final/mainservlet" >
<table>
<tr><td><input type="hidden" name="cb" id="cb" value="<%=S%>"></td></tr>
<tr><td><input type="submit" name="Logout" value="logout" id="b3"> </td></tr>
</table></form></div></div>
<div class="login">
<form name="f1"  method="post" action="http://localhost:8081/final/mainservlet" method="post">
<table >
<tr><td><input type="hidden" name="cb" id="cb" value="<%=S%>"></td></tr>
<tr><td><input type="submit" name="C_event" value="create event" id="b3"> </td></tr>
<tr><td><input type="submit" name="S_event" value="show all event" id="b3"> </td></tr>
<tr><td><input type="submit" name="D_event" value="delete event" id="b3"> </td></tr>
</table>
</form>
<div class="prof">
<form name="f2" action ="http://localhost:8081/final/mainservlet" method="post" onSubmit="return check()">
	<table>
	<tr><td>Event id* :</td><td><input type="text" name="Did"  id="txt1"></input></td></tr>
	<tr><td>Event Name* :</td><td><input type="text" name="E_name" id="txt2"></input></td></tr>
	<tr><td><input type="hidden" name="cb" id="cb" value="<%=S%>"></td></tr>
	
	<tr><td ><input type="submit" name="devent" value="delete event" onclick="check()"></td><td><input type="reset" value="cancel" onclick="test"></td></tr>
	</table>
</form>
</div>
</div>
</div>
</body>
<%
}
%>
</html>
