<%@page import="java.sql.Connection"%>
<%@page import="com.Atm.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Withdrawal</title>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<style>
.LogOut
{
	background-color: #75FF5B;
	color:black;
	font-size: 21px;
	padding: 12px;
	padding-left:60px;
	padding-right:60px;
	border-radius:40px;
}
a
{
 background-color: #75FF5B;
  border: none;
  color: red;
  text-shadow: 1px 1px black;
  text-align: center;
  text-decoration: none;
  border-radius: 10px;
  display: inline-block;
  font-size: 20px;
  cursor: pointer;
padding: 12px 40px;
}
a:hover
{
background-color: #2EE59D;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
}
body
{
background-image:url("abstract.jpg");
background-size:cover;
background-repeat:no-repeat;
}
.text1
{
color:CYAN;
text-shadow:2px 2px #355F7C;
margin-top:200px;
font-size:36px;
font-weight:bold;
}
.text2
{
color:#7A2F3B;
font-weight:bold;
margin-top:240px;
font-size:16px;
padding:18px 0px 16px 40px;
}
.button1 {
background-color:#312663;
font-size: 16px;
color:white;
font-weight:bold;
padding:15px 15px 15px 15px;
}
</style>
</head>
<body style='text-align: center'>
    <form action="AtmWithdrawServlet" name='form1' method='post'>
        <label  class='text1'  >ENTER WITHDRAWAL AMOUNT &nbsp; </label>
        <input   class='text2' type='number' name='withdraw_num' min=100 max=20000 required/> <BR><br>
        <input class = 'button1' type='submit' value='SUBMIT'>
    </form>     
    <div align="center" style="margin-top: 280px;">
	<a style="padding-right:10px; padding-left:10px; text-decoration:none; background-color: #75FF5B; border: none;  color: black;  text-shadow: 1px 1px black;  text-align: center;  border-radius: 40px;  font-size: 20px;  cursor: pointer;padding: 12px 40px;"  class="LogOut" href="AtmLogin.jsp" >Log Out</a>
	&nbsp;&nbsp;&nbsp;
	<a style="padding-right:15px; padding-left:15px; text-decoration:none; background-color: #75FF5B; border: none;  color: black;  text-shadow: 1px 1px black;  text-align: center;  border-radius: 40px;  font-size: 20px;  cursor: pointer;padding: 12px 40px;"  class="LogOut" href="AtmMenu.jsp" >Home</a>
	</div>
 <script>

</script>  
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
          }, 60000);
}
    
    $(function () {
        $(document).ready(function () {
            $.alert('Session Expires in:', {
                title: '', //title
                closeTime: 60000,    //time
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