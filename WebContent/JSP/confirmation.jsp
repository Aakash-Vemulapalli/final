<%@page import="DTO.dto.e_book"%>
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
td >input
{
width:80px;
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
	
	margin-left:320px;
	margin-top:-200px;
	width:300px;
	height:auto;
	test-align:"center";
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
<div class="logout"><form name="f3"  method="post" action="http://localhost:8081/final/mainservlet" >
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
		
	<%
	eventdao e1 = new eventdao();
   	
	
	ArrayList<e_book> arl=(ArrayList<e_book>) session.getAttribute("obj");
	e_book dtva;
	eventdao dtva1;
	for(int i=0;i<arl.size();i++)
	{
		dtva =arl.get(i);
		String order=dtva.getOrder();
		String eid=dtva.getEventid();
		
		String ename=dtva.getEname();
		String evenue=dtva.getUname();
		String edate=dtva.getEtb();
		
		
		
		%>
		<tr><td colspan="2" align="center"><font size="4">order confirmation</font></td><tr>
		<tr><td>order Id</td><td><input type="text" value="<%=order%>" name ="eid"readonly></td><tr>
		<tr><td>Event Id</td><td><input type="text" value="<%=eid%>" name ="eid"readonly></td><tr>
		<tr><td>Event Name</td><td align="left"><input type="text" value="<%=ename %>" readonly name="ename"></td></tr>
		<tr><td>booked by</td><td><input type="text" value="<%=evenue %>" readonly name="evenue"></td></tr>
		<tr><td>no of tickets</td><td><input type="text" value="<%=edate %>" readonly name="edate"></td></tr>
		<tr><td colspan="2" align="center"><b><font size="4">Thanks for the order</font></b></td></tr>
		
		
		<tr><td><input type="hidden" name="cb" id="cb" value="<%=S%>"></td></tr>
		
	
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