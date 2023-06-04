<%@page import="java.sql.Connection"%>
<%@page import="com.Atm.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View||Balance @ATM</title>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="DesignAtm.css">
<style>
.text1
{
color:#414180;
text-shadow:1px 1px;
margin-top:180px;
FONT-WEIGHT:BOLD;
FONT-SIZE:30px;
}
</style>
</head>
<body style="text-align: center; margin-top:80px;">
<%
		String atype=request.getParameter("type");
		DBConnect dbc=new DBConnect();
		Connection con=dbc.getConnection();
		int balance=dbc.getBalance(atype); 
		
		if(atype.equals("SAV"))
			atype="SAVINGS";
		else atype="CURRENT";
%>
<div  class="container-fluid;" style="background-image:url('newtrans.png');background-repeat:no-repeat;background-size:cover;border: 4px solid cyan;margin:20px 250px 20px 250px;padding:0px 0px 200px 0px;border-radius:10px;border-style:inset; ">

<h2 class="text1">BALANCE IN  <%=atype %> ACCOUNT IS :</h2>
<br>
<h1 class="text1" style="border: 2px solid;border-style:inset;display:inline;background-color:#312663;color:white; padding: 10px 40px 10px 40px;"> <%=balance %></h1> 
</div>
<br><br><br><br>
<div align="center">
<a style="padding-right:15px; padding-left:15px; text-decoration:none;"  class="LogOut" href="AtmLogin.jsp" >Log Out</a>
&nbsp;&nbsp;&nbsp;
	<a style="padding-right:25px; padding-left:25px; text-decoration:none;"  class="LogOut" href="AtmMenu.jsp" >Home</a>
</div>

<script type="text/javascript">
        window.history.forward();
        function noBack()
        {
            window.history.forward();
        }
</script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="alert.js" type="text/javascript"></script>
<script type="text/javascript">
window.onload = function() {
    setInterval(function() {
        window.location.replace("AtmLogin.jsp");
          }, 50000);
}
    
    $(function () {
        $(document).ready(function () {
            $.alert('Session Expires in:', {
                title: '', //title
                closeTime: 50000,    //time
                autoClose: 'true',
                position: ['top-right'],
                withTime: 'true',
                type: 'danger',    //warning type
                isOnly: 'true'
            });
        });
    })
</script>
</body>
</html>