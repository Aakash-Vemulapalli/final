<%@page import="DTO.dto.maindto"%>
<%@page import="DTO.dto.eventdto"%>
<%@page import="DAO.dao.eventdao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="DTO.*" %>
    <%@ page import="DAO.*" %>
    <%@ page import= "DAO.dao.eventdao" %>
    <%@ page import="UTILITY.*" %>
    <%@page import="java.util.*" %>
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
td >input
{
widht:"100px";
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
</table></form></div>
</div>
<div class="login">
<form name="f1"  method="post" action="http://localhost:8081/final/mainservlet" method="post">
<table >
<tr><td><input type="hidden" name="cb" id="cb" value="<%=S%>"></td></tr>
<tr><td><input type="submit" name="C_event" value="create event " id="b3"> </td></tr>
<tr><td><input type="submit" name="S_event" value="show all event" id="b3"> </td></tr>
<tr><td><input type="submit" name="D_event" value="delete event" id="b3"> </td></tr>
</table>
</form>
<div class="prof"><p> Action performed successfully</p></div>

	
	</div>
</div>
</body>
<%
}
%>
</html>