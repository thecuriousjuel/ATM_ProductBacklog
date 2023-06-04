<%@page import="java.sql.Connection"%>
<%@page import="com.Atm.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Password Updated</title>
<link rel="stylesheet" href="DesignAtm.css">
</head>
<body>
<%
	int newPin=Integer.parseInt(request.getParameter("newPin"));
	DBConnect db=new DBConnect();
	Connection con=db.getConnection();
	if(db.updatePin(newPin))
	{
		%>
		<div align="center" style="margin-top:150px;">
<p style="font-size:30px;color:yellow;text-shadow:2px 2px black;">Pin Changed Successfully !</p>
	<div align="center">
	<img src="check.gif" width="150" height="150" style="border-radius:10px; box-shadow:3px 3px 2px #357BE6;"/><br>
	</div></div>
	<br><br><br><br>
<div align="center" style="margin-top: 200px;">
<a style="padding-right:15px; padding-left:15px; text-decoration:none;"  class="LogOut" href="AtmLogin.jsp" >Log Out</a>
&nbsp;&nbsp;&nbsp;
	<a style="padding-right:25px; padding-left:25px; text-decoration:none;"  class="LogOut" href="AtmMenu.jsp" >Home</a>
</div>
<script>
window.onload = function() {
    setInterval(function() {
        window.location.replace("AtmMenu.jsp");
          }, 10000);
}
</script>
<script type="text/javascript">
        window.history.forward();
        function noBack()
        {
            window.history.forward();
        }
</script>
		<%
	}
	else System.out.println("DB problem");
%>

</body>
</html>