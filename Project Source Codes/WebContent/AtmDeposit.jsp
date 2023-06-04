<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%! %>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Deposit in ATM</title>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="DesignAtm.css">
<style>
input{
padding: 25px 10px 10px 15px;
}
input[type=number]{
width=70px;
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
var count=0;
function show()
{ 
    
    if(document.myform.amount.value=="")
    {
        amt=0;
    }
    else
    {
        amt=parseInt(document.myform.amount.value);
    }
    if(document.myform.r100.value=="")
        {
        a=0;
        }
        else
        {
            a=parseInt(document.myform.r100.value);
        }
    if(document.myform.r200.value=="")
    {
    b=0;
    }
    else
    {
    b=parseInt(document.myform.r200.value);
    }
    if(document.myform.r500.value=="")
    {
    c=0;
    }
    else
    {
        c=parseInt(document.myform.r500.value);
    }
    if(document.myform.r2000.value=="")
    {
    d=0;
    }
    else
    {
        d=parseInt(document.myform.r2000.value);
    }
    
    
    
    if(amt==0)
    {
    alert("Entered Trannsfer Amount can't be 0 !");
    count=count+1;        
    if(count>2){
        alert("YOU CANNOT EXCEED 3 ATTEMPTS!!");
        document.myform.action="TransactionError.jsp";
        document.myform.submit();
        return false;
    }
    }
    else if(amt%100==0)
        {
        if(amt==(2000*d + c*500 + b*200 + a*100))
        {
            //alert("Succesful!! Denominations equals Entered Amount!!");
            //document.myform.action="success.jsp";
            //document.myform.submit();
            return true;    
        }
    else 
        {
            alert("ENTER CORRECT DENOMINATIONS!!!" + (2-count)+ " More Attempts");
            count=count+1;        
            if(count>2){
                alert("YOU CANNOT EXCEED 3 ATTEMPTS!!");
                document.myform.action="TransactionError.jsp";
                document.myform.submit();
                return false;
            }
                
            }
        }
    else
        {
            
            
                alert("ENTER ONLY MULTIPLES OF 100!!!");
                document.myform.action="TransactionError.jsp";
                document.myform.submit();
            
        }
        return false;        
}

 

</script>

 

</head>
<body class="bg" style="text-align:center;margin-top:130px;">

 

<br>

 

<form method="get" action="AtmDepositServlet" name="myform" id="myform">
 <p style="color:#321E94; margin-top:0px; font-size:50px; font-weight:bold; text-shadow:2px 2px cyan; ">Enter Amount:  
<input type="number" min="0" max="20000" style="width:170px;"  name="amount"  autofocus required /></p>
<br>
<p style="color:#312663; font-size:40px;font-weight:bold;text-shadow:2px 2px brown; ">Input Denominations </p>
<table  align="center" style="padding:20px 20px 20px 20px;"> <br><br><br>
<tr ><td >
<p class="h">Rs. 2000
&nbsp; <input type="number" min="0"  max="10" style="width:150px;" name="r2000" autofocus /></p>
</td>
<td >
<p class="h"> Rs. 500 &nbsp;
&nbsp; <input type="number" min="0"  max="40" style="width:150px;" name="r500" autofocus /></p>
</td></tr>
<tr><td>
<p class="h"> Rs. 200 &nbsp;
&nbsp; <input type="number" min="0" max="100"  style="width:150px;" name="r200" autofocus/></p>
</td>
<td>
<p class="h"> Rs. 100 &nbsp;
&nbsp; <input type="number" min="0"   max="200" style="width:150px;" name="r100" autofocus/> </p>
</td></tr>
</table>
<br>
<input class="button" type="submit"   value="SUBMIT" name="submit" onclick="return show()">  
</form>
<div align="center">
<br><br><br><br>
<a style="padding-right:15px; padding-left:15px; text-decoration:none;"  class="LogOut" href="AtmLogin.jsp">Log Out</a>
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
          }, 90000);
}
    
    $(function () {
        $(document).ready(function () {
            $.alert('Session Expires in:', {
                title: '', //title
                closeTime: 90000,    //time
                autoClose: 'true',
                position: ['top-right'],
                withTime: 'true',
                type: 'danger',    //warning type
                isOnly: 'true'
            });
        });
    })

</script>
<script type = "text/javascript">  
    window.onload = function () {  
        document.onkeydown = function (e) {  
            return (e.which || e.keyCode) != 116;  
        };  
    }  
</script>

</body>
</html>