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
.button{
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
}
.button:hover{
    background-color: #2EE59D;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
}
.btn1 {padding: 12px 40px;}
.btn2 {padding: 12px 40px;}
.btn3 {padding: 12px 60px;}
.btn4 {padding: 12px 55px;}
.btn5 {padding: 12px 28px;}
.btn6 {padding: 12px 35px;}
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
</style>                                                                                                                                                                                                                                                                                                                                                                                           
<meta charset="ISO-8859-1">
<title>Atm Menu Page</title>
</head>
<body>
<br><br>
<div id="demotext">
<h1 style="text-align:center; text-shadow:4px 3px black; color:white; font-size:40px; margin-top:100px;">CDC BANK</h1></div>
<br><br><br><br>
<form action="AtmSelectAccount.jsp" method="get">
<div>

    <div style="padding: 25px;">
    <a style="padding-left:45px; padding-right:45px; text-decoration:none;" class="button b1" href="AtmInputPin.jsp" >Change Pin</a>
    
    <div style="margin-left:850px; display: inline-block; padding:2px;">
    <button type="submit" name="AtmMenu" class="button btn2" value="viewBalance">View Balance</button>
    </div>
    
	</div>
	
    <div style="padding: 25px;">
    <button type="submit" name="AtmMenu" class="button btn3" value="deposit">Deposit</button>
    <div style="margin-left:850px; display: inline-block; padding:2px;">
    <button type="submit" name="AtmMenu" value="withdraw" class="button btn4">Withdraw</button>
    </div>
</div>
    <div style="padding: 25px;">
    <a style="padding-left:28px; padding-right:40px; text-decoration:none;" class="AtmMiniStatement" href="AtmMiniStatement.jsp" >Mini Statement</a>
    <div style="margin-left:850px; display: inline-block; padding:2px;">
    <button type="submit" name="AtmMenu" value="fundTransfer" class="button btn6">Fund Transfer</button>
    </div>
</div>
</div>
    <div style="text-align: center;">
    <a style="padding-right:15px; padding-left:15px; text-decoration:none;"  class="LogOut" href="AtmLogin.jsp" >Log Out</a>
</div>
   
</form>
<script>
window.onload = function() {
    setInterval(function() {
        window.location.replace("AtmLogin.jsp");
          }, 90000);
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