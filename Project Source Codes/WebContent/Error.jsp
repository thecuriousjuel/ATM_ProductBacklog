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
<link rel="stylesheet" href="DesignAtm.css">
</head>
<body>
<div align="center" style="margin-top:150px;">
<p style="font-size:40px;color:yellow;text-shadow:2px 2px black;">Invalid Credentials !! </p>
	<div align="center">
	<br><br>
	<img src="wrong.gif" width="150" height="150" style="border-radius:10px;"/><br>
	</div></div>
	<br><br><br><br>
<script>
window.onload = function() {
    setInterval(function() {
        window.location.replace("AtmLogin.jsp");
          }, 3000);
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