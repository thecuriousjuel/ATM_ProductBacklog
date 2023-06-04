<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transaction Successful</title>
<link rel="stylesheet" href="DesignAtm.css">
</head>
<body>
<div align="center" style="margin-top:150px;">
<p style="font-size:30px;color:yellow;text-shadow:2px 2px black;">Transaction successful!! </p>
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
</body>
</html>