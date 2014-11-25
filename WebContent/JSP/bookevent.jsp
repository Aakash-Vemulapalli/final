
<%@page import="DTO.dto.maindto"%>
<%@page import="DTO.dto.eventdto"%>
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
	
    width:210px;
	height:12%;
	font-family:"harrypotter7";
	padding-left:40px;
	font-size:75;
	color:rgb(1,177,214);
	border:1px thin black;
	scroll:no-scroll;
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
</table></form></div></div>

<div class="login">
<form name="f1"  method="post" action="http://localhost:8081/final/mainservlet" >
<table >
<tr><td><input type="hidden" name="cb" id="cb" value="<%=S%>"></td></tr>
<tr><td><input type="submit" name="Up_event" value="user profile" id="b1"> </td></tr>
<tr><td><input type="submit" name="Us_event" value="show all event" id="b2"> </td></tr>
<tr><td><input type="submit" name="Db_event" value="book an event" id="b3"> </td></tr>
</table>
</form>

<form>
<%
eventdao e1 = new eventdao();
	

ArrayList<eventdto> arl=(ArrayList<eventdto>) session.getAttribute("obj");
eventdto dtva;
eventdao dtva1;




	for(int i=0;i<arl.size();i++)
	{
		dtva =arl.get(i);
		
		String eid=dtva.getEid();
		
		String ename=dtva.getEname();
		String etickets=dtva.getEtickets();
		%>
<table >
<tr><td>Event id</td><td><input type="text" readonly value="<%=eid %>" name="eid"></td></tr>
<tr><td>Event name</td><td><input type="text" readonly value="<%=ename %>" name="E_name"></td></tr>
<tr><td>tickets available </td><td><input type="text" readonly value="<%=etickets%>"name="E_tickets"></td></tr>
<tr><td>order ticket </td><td><input type="text"  name="Btic" id="txt4"></td></tr>
<tr><td><input type="hidden" name="cb" id="cb" value="<%=S%>"></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="book now" name="book"></td></tr>
</table>
<%
}
	%>

</form>
</div>
</div>
</body>
<%
}
%>
</html>