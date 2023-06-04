<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
body
{
background-image:url("abstract.jpg");
background-repeat:no-repeat;
background-size:cover;
}
a:hover
{
background-color: #2EE59D;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
}
.LogOut
{
	background-color: #2EE59D;
	color:black;
	font-size: 21px;
	padding: 12px;
	padding-left:50px;
	padding-right:50px;
	border-radius: 40px;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br><br><br><br><br><br><br><br>
<h1 style="text-align:center; color: white; text-shadow: 1px 1px black; text-decoration:bold; font-family: sans-serif; Font-size:25px ">Transaction Error</h1>
<br><br><br><br>
<div align="center" style="margin-top: 200px;">
<a style="padding-right:15px; padding-left:15px; text-decoration:none;"  class="LogOut" href="AtmLogin.jsp" >Log Out</a>
&nbsp;&nbsp;&nbsp;
	<a style="padding-right:25px; padding-left:25px; text-decoration:none;"  class="LogOut" href="AtmMenu.jsp" >Home</a>
</div>
<script>
window.onload = function() {
    setInterval(function() {
        window.location.replace("AtmLogin.jsp");
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
</body>
</html>