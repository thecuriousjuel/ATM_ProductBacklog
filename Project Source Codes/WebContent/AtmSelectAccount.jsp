
--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select Account || ATM</title>
<link rel="stylesheet" href="DesignAtm.css">
<style>
.text1
{
text-shadow: 0 1px 0 #CCCCCC, 0 2px 0 #c9c9c9, 0 3px 0 #bbb, 0 4px 0 #b9b9b9, 0 5px 0 #aaa, 0 6px 1px rgba(0,0,0,.1), 0 0 5px rgba(0,0,0,.1), 0 1px 3px rgba(0,0,0,.3), 0 3px 5px rgba(0,0,0,.2), 0 5px 10px rgba(0,0,0,.25), 0 10px 10px rgba(0,0,0,.2), 0 20px 20px rgba(0,0,0,.15);
color: #FFFFFF;
text-shadow:2px 2px black;
margin-top:200px;
font-weight:bold;
}
.button1 {
background-color:#312663;
font-size: 16px;
color:white;
font-weight:bold;
padding:15px 15px 15px 15px;
}
.button1:hover
{
	background-color: #FFF93C;
  box-shadow: 20px 10px 20px rgba(46, 229, 157, 0.4);
  color: red;
  transform: translateY(-4px);
}
</style>
</head>
<body style="text-align:center;margin-top:80px;">
<div  class="container-fluid;" style="background-image:url('newtrans.png');background-repeat:no-repeat;background-size:cover;border: 4px solid cyan;margin:20px 250px 20px 250px;padding:0px 0px 200px 0px;border-radius:10px;border-style:inset; ">
<h1 class="text1">SELECT DEBIT ACCOUNT</h1>
<form action="AtmSelectAccountServlet" method="post">
<TABLE align="center"><tr ><td>
	<button class="button1" size="35" type="submit" value="SAV" name="type">SAVINGS</button></td>
<td></td><td>
	<button class="button1" size="35" type="submit" value="CUR" name="type">CURRENT</button></td></tr>
</TABLE>
</form>
</div>
<%
	String task=(String)request.getParameter("AtmMenu");
	System.out.println("AtmSelectAccount : task : " + task);
	session.setAttribute("task", task);
%>
<div align="center">
<br>
<a style="padding-right:15px; padding-left:15px; text-decoration:none;"  class="LogOut" href="AtmLogin.jsp" >Log Out</a>
&nbsp;&nbsp;&nbsp;
	<a style="padding-right:25px; padding-left:25px; text-decoration:none;"  class="LogOut" href="AtmMenu.jsp" >Home</a>
</div>
<script>
window.onload = function() {
    setInterval(function() {
        window.location.replace("AtmLogin.jsp");
          }, 50000);
}
</script>
<script type="text/javascript">
        window.history.forward();
        function noBack()
        {
            window.history.forward();
        }
</script>
</body>
</html>