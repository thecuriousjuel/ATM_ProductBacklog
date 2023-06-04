<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

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
 background-color: #FFFF6A;
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
background-repeat:no-repeat;
background-size:cover;
}
div
{
color:yellow;
text-shadow:0px 15px 20px rgba(46, 300, 500, 0.8);
font-size:25px
}
.inpt
{
background-color: #248CF3;
  border: none;
  color: white;
  text-align: center;
  padding: 12px 40px;
  text-decoration: none;
  border-radius: 40px;
  display: inline-block;
  font-size: 20px;
  cursor: pointer;
  box-shadow: 0px 15px 20px rgba(46, 120, 229, 0.4);
}
.inpt:hover{
	background-color: #2EE59D;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
</style>
<meta charset="ISO-8859-1">
<title>Mini Statement</title>

</head>
<body style="margin-top:120px;">
<div  class="container-fluid;" style="background-image:url('newtrans.png');background-repeat:no-repeat;background-size:cover;border: 4px solid cyan;margin:20px 250px 20px 250px;padding:0px 0px 120px 0px;border-radius:10px;border-style:inset; ">
<br><br><br><br><br>
<div>
<h1 align="center">Mini Statement:</h1>
</div>
<br><br>
<div align="center">
<form id="dform" action="AtmMiniStatementServlet" method="get">
  From Date: <input type="date" name="fromDate" id="fromDate" min="2019-01-01" max="" required> 
  
   To Date: <input type="date" name="toDate" id="toDate" min="2019-01-01" max="" required>
   <br><br>
   <input type="button" onclick='myFun()' class="inpt" name="miniStatement" value="submit">
	</form>
	</div>
	</div>
	<div style="text-align: center;">
	<br>
	<a style="padding-right:15px; padding-left:15px; text-decoration:none;"  class="LogOut" href="AtmLogin.jsp" >Log Out</a>
	&nbsp;&nbsp;&nbsp;
	<a style="padding-right:25px; padding-left:25px; text-decoration:none;"  class="LogOut" href="AtmMenu.jsp" >Home</a>
</div>
<script>
window.onload = function() {
    setInterval(function() {
        window.location.replace("AtmLogin.jsp");
          }, 500000);
}
</script>
<script>
myDate = document.getElementById('fromDate')
myDate2= document.getElementById('toDate')

var today = new Date(); 
var today = new Date();
var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();  
myDate.setAttribute('max', date)
myDate2.setAttribute('max', date)

function myFun()
{
	myForm = document.getElementById('dform')
	if(Date.parse(myDate.value)>Date.parse(myDate2.value))	
		alert("Invalid Range !!!");	
	else
		myForm.submit()
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