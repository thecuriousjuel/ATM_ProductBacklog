<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transfer Money</title>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="DesignAtm.css">
<style>
input{
padding: 25px 10px 10px 15px;
}
.h
{
color:purple;
text-shadow:1px 1px;
font-size:30px;
padding-right:100px;
font-weight:bold;
}
.g{
padding: 10px 10px 10px 10px;
}
.button {
  background-color: blue;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}

 

</style>
<script type="text/javascript">
var c=0,amt;
function show()
{
    amt=document.transferBal.amount.value;
     if((amt%100)!=0)
        {
            alert("Amount Must be MULTIPLE of 100 ! And in Range Rs.100 to Rs.100000 " + (2-c)+ " More Attempts");
            c=c+1;        
            if(c>2)
            {
                document.transferBal.action="TransactionError.jsp";
                document.transferBal.submit();
                
            }
            return false;
        }
         else if(amt==0)
        {
            alert("Amount CANNOT be 0");
            c=c+1;        
            if(c>2)
            {
                document.transferBal.action="TransactionError.jsp";
                document.transferBal.submit();
                
            }
            return false;
        }
     return true;
}

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
</head>
<body class="bg" style="text-align:center">
<br>
<form method="get" action="AtmTransferServlet" name="transferBal">
<br>
 <p style="color:blue;margin-top:138px; font-size:50px; font-weight:bold; text-shadow:2px 2px cyan; ">TRANSFER MONEY </p> <br>
<p style="color:CYAN; font-size:35px;text-shadow:2px 2px blue;font-weight:bold; ">ENTER AMOUNT :</p>
    <input type="number" min=1 max=100000 name="amount"  required="required"/>
<br><br><br>
<input class="button" type="submit" value="SUBMIT" name="submit" onclick="return show()"/>  
</form>
<div style="text-align: center;">
	<br><br><br><br>
	<a style="padding-right:15px; padding-left:15px; text-decoration:none;"  class="LogOut" href="AtmLogin.jsp" >Log Out</a>
	&nbsp;&nbsp;&nbsp;
	<a style="padding-right:25px; padding-left:25px; text-decoration:none;"  class="LogOut" href="AtmMenu.jsp" >Home</a>
</div>
</body>
</html>