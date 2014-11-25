<%@page import="DTO.dto.maindto"%>
<%@page import="DTO.dto.eventdto"%>
<%@page import="DAO.dao.eventdao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="DTO.*" %>
    <%@ page import="DAO.*" %>
   <%@ page import="UTILITY.*" %>
    <%@page import="java.util.*" %>
    <%@ page import="DTO.dto.maindto.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
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
width:120px;
}
tr >input
{
width:600px;
}
.main
{
	margin:auto;
    width:960px;
	min-height:530px;
	height:auto;
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
	
	margin-left:80px;
	margin-top:50px;
	width:390px;
	height:200px;
	padding-left:10px;
	font-family:"harrypotter7";
	font-size:12px;
}

.prof
{	
	
	margin-left:80px;
	margin-top:-20px;
	width:200px;
	height:auto;
	padding-left:10px;
	font-family:"harrypotter7";
	font-size:12px;
}
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
<div class="logout">
<form name="f3"  method="post" action="http://localhost:8081/final/mainservlet" >
<table>
<tr><td><input type="hidden" name="cb" id="cb" value="<%=S%>"></td></tr>
<tr><td><input type="submit" name="Logout" value="logout" id="b3"> </td></tr>
</table></form></div></div>

<div class="login">
<form name="f1"  method="post" action="http://localhost:8081/final/mainservlet">
<table >
<tr><td colspan="2"> Welcome <%=S %></td></tr>
<tr><td><input type="hidden" name="cb" id="cb" value="<%=S%>"></td></tr>
<tr><td><input type="submit" name="Up_event" value="&nbsp;user profile&nbsp;&nbsp;&nbsp;&nbsp;" id="b1" > </td></tr>
<tr><td><input type="submit" name="Us_event" value="show all event" id="b2"> </td></tr>
<tr><td><input type="submit" name="Db_event" value="book an event" id="b3"> </td></tr>
</table>
</form>
</div>
<div class="prof">

	<form name="form1" method="get" action="http://localhost:8081/final/mainservlet">
	<table  style="text-align:left;">
			<tr><th>Event Id</th>
			<th>Event Name</th>
			<th>Venue</th>
			<th>Date of event</th>
			<th>No of tickets</th>		
	</tr>
	<%
	eventdao e1 = new eventdao();
   	
	
	   ArrayList<eventdto> arl=(ArrayList<eventdto>) session.getAttribute("obj");
	eventdto dtva;
	eventdao dtva1;
	for(int i=0;i<arl.size();i++)
	{
		dtva =arl.get(i);
		
		String eid=dtva.getEid();
		String eimage;
		String ename=dtva.getEname();
		String evenue=dtva.getEvenue();
		String edate=dtva.getEdate();
		
		String etickets=dtva.getEtickets();
		
		%><tr>
		
		<td><input type="text" value="<%=eid%>" name ="eid"readonly></td>
		<td align="left"><input type="text" value="<%=ename %>" readonly name="ename"></td>
		<td><input type="text" value="<%=evenue %>" readonly name="evenue"></td>
		<td><input type="text" value="<%=edate %>" readonly name="edate"></td>
		
		<td align="left"><input type="text" value="<%=etickets %>" readonly name="etick"></td>
		<td><input type="hidden" name="cb" id="cb" value="<%=S%>">
		 <input type="submit" value="Book Now" name="book"></td>
	</tr>
	<%
	}
	%>	
	
	
	</table>
	</form>
	</div>
</div>

	</body>
	<%
	}
	%>

</html>