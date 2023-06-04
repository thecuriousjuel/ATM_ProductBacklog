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
input
{
padding:13px 80px;
Font-size:15px;
Font-style:bold;
}
input[type=submit]:hover {
background-color:#ffb347;
  box-shadow: 0px 15px 20px rgba(46, 350, 157, 0.4);
  color: #fff;
  transform: translateY(-6px);
}
input[type=submit]:hover,
.form-2{
    box-shadow: 
        inset 0 1px rgba(255,255,255,0.3), 
        inset 0 20px 40px rgba(255,255,255,0.15);
}

.inpset
{
background-color: #2EE59D;
color:black;
text-decoration:bold;
font-size: 21px;
padding: 10px;
padding-left:40px;
padding-right:40px;
border-radius: 45px;
}
.form-1 {
    /* Size and position */
    width: 380px;
    margin: 60px auto 30px;
    padding: 25px;
    position: relative;

    /* Styles */
    background: #fffaf6;
    border-radius: 4px;
    color: #7e7975;
    box-shadow:
        0 2px 2px rgba(0,0,0,0.2),        
        0 1px 5px rgba(0,0,0,0.2),        
        0 0 0 12px rgba(255,255,255,0.4); 
}
#demotext {
color: #FFFFFF;
text-shadow: 0 1px 0 #CCCCCC, 0 2px 0 #c9c9c9, 0 3px 0 #bbb, 0 4px 0 #b9b9b9, 0 5px 0 #aaa, 0 6px 1px rgba(0,0,0,.1), 0 0 5px rgba(0,0,0,.1), 0 1px 3px rgba(0,0,0,.3), 0 3px 5px rgba(0,0,0,.2), 0 5px 10px rgba(0,0,0,.25), 0 10px 10px rgba(0,0,0,.2), 0 20px 20px rgba(0,0,0,.15);
color: #FFFFFF;
font-size:40px;
text-decoration:bold;
}
#demo {
font-family: "Arial Black", Gadget, sans-serif;
font-size: 22px;
letter-spacing: 2px;
word-spacing: 2px;
color: #D9200A ;
text-shadow: 1px 1px yellow;
}
</style>
<meta charset="ISO-8859-1">
<title>Atm Login Page</title>
<script type="text/javascript">

function only(e) // Validating Card Number Digits
{
	if(window.event)
	  keynum=e.keyCode
	keychar=String.fromCharCode(keynum);
	numcheck=/\d/     //every card number entered is a digit or not
	
	return numcheck.test(keychar);
}
</script>
<script type="text/javascript">
    function submitOnEnter(inputElement, event) {
        if (event.keyCode == 13) // 13 - ascii value of return key
        {
            return inputElement.form.submit();
        }
        if(window.event)
      	  keynum=event.keyCode
      	keychar=String.fromCharCode(keynum);
      	numcheck=/\d/  //every pin number entered is a digit or not
      	return numcheck.test(keychar);
    }
</script>
<script type="text/javascript">
        window.history.forward(); // disable back button
        function noBack()
        {
            window.history.forward();
        }
</script>
</head>
<body>
<div align="center">
<br>
<img src="wipro.gif" width="140" height="100" style="border-top-left-radius:20px; border-bottom-right-radius:20px; box-shadow:5px 5px 3px #920FA6; margin-top:80px;"/>
</div>
<div style="text-align:center;">
<div id="demotext">CDC BANK</div>
<form class="form-1" action="AtmLoginServlet" method="post">
<div id="demo"><h4>CARD NUMBER</h4><input type="text" name="cardDigits" maxlength="5" onkeypress="return only(event)"  autofocus required="required" style="text-align:center;"><br>
</div>
<div  id="demo"><h4>PIN</h4><input type="password" name="pin" maxlength="4" onkeypress=" return submitOnEnter(this, event);"  autofocus required="required" style="text-align:center;"><br>
<br/></div>
<input type="submit" class="inpset" value="Login" name="login">
</form>
</div>
</body>
</html>