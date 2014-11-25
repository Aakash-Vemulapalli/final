<%@page import="DTO.dto.eventdto"%>
<%@page import="DAO.dao.eventdao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="DTO.*" %>
    <%@ page import="DAO.*" %>
    <%@ page import= "DAO.dao.maindao" %>
    <%@ page import= "DTO.dto.maindto" %>
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
width:240px;
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
	
	margin-left:20px;
	margin-top:50px;
	width:390px;
	height:500px;
	padding-left:10px;
	font-family:"harrypotter7";
	font-size:12px;
}

.prof
{	
	
	margin-left:250px;
	margin-top:-80px;
	width:500px;
	height:450px;
	padding-left:10px;
	font-family:"harrypotter7";
	font-size:12px;
}
.prof1
{	
	
	margin-left:380px;
	margin-top:-120px;
	width:450px;
	height:450px;
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
<div class="main" >
<div class="main1">EtiXketing <br><p> A solution to event ticketing</p>
<div class="logout"><form name="f3"  method="post" action="http://localhost:8081/final/mainservlet" >
<table>
<tr><td><input type="hidden" name="cb" id="cb" value="<%=S%>"></td></tr>
<tr><td><input type="submit" name="Logout" value="logout" id="b3"> </td></tr>
</table></form></div>
</div>
<div class="login">
<form name="f1"  method="post" action="http://localhost:8081/final/mainservlet" >
<table >
<tr><td><input type="hidden" name="cb" id="cb" value="<%=S%>"></td></tr>
<tr><td><input type="submit" name="Up_event" value="user profile" id="b1"> </td></tr>
<tr><td><input type="submit" name="Us_event" value="show all event" id="b2"> </td></tr>
<tr><td><input type="submit" name="Db_event" value="book an event" id="b3"> </td></tr>
</table>
</form>

<div class="prof">
	<form name="form1" method="get" action="http://localhost:8081/final/mainservlet">
	<table border=1 style="text-align:left;">
	
	<%
	eventdao e1 = new eventdao();
   	
	
	   ArrayList<maindto> arl=(ArrayList<maindto>) session.getAttribute("obj");
	maindto dtva;
	maindao dtva1;
	for(int i=0;i<arl.size();i++)
	{
		dtva =arl.get(i);
		
		
		
		String eid=dtva.getId();
		
		String ename=dtva.getName();
		String pass=dtva.getPass();
		String type=dtva.getType();
		String user=dtva.getUimage();
	
		
		
		%>
		<tr><td>user Id</td>		<td><input type="text" value="<%=eid%>" readonly></td></tr>
		<tr><td>Email id </td>	<td align="left"><input type="text" value="<%=ename %>" readonly></td></tr>
		<tr><td>Encrypted pass </td>	<td><input type="text" value="<%=pass %>" readonly></td></tr>
		<tr><td>user Type</td>	<td><input type="text" value="<%=type %>" readonly></td></tr>
		<tr><td><img height="240" width="240" src="<%=user%>"></img></td></tr>
		<tr><td><input type="hidden" name="cb" id="cb" value="<%=S%>"></td></tr>
		<tr height="20px" ><td width="15px"><input type="file" name="uimage" value="browse"></td><td><input type="Submit" name="uib" value="Upload image"></td></tr>
		</table>
	</form>
	<%
	}
	%></div>
	</div>
	</div>


</body>
	<%
		}
	%>
</html>