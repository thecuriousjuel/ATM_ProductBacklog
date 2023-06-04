<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Pin </title>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="DesignAtm.css">
	<script type="text/javascript">
		
		function only(e)
		{
			if(window.event)
			  keynum=e.keyCode
			keychar=String.fromCharCode(keynum);
			numcheck=/\d/
			
			return numcheck.test(keychar);
		}
		
		function check()
		{
			 a=document.pin.newPin.value;
			 b=document.pin.reEnterPin.value;
			 if(a.length!=4)
			 {
				 alert("Please Enter 4 digit PIN");
				 document.pin.newPin.focus();
			 }
			if(a==b && a.length==4)
				return true;
			else if(a.length!=4 || b.length!=4)
				{
				
				alert("Please Enter 4 digit PIN");
				document.pin.newPin.value="";
				document.pin.reEnterPin.value="";
				return false;
				}
			else if(a!=b){
				alert("PIN not matched!!");
				document.pin.newPin.value="";
				document.pin.reEnterPin.value="";
				return false;
			}
		}
	
	</script>
</head>
<body style="text-align: center;margin-top:80px;">

<br><br><br>
<form name="pin" class="form-1" action="ChangePassword.jsp" method="post"  >
	<h1 class="checker">Enter 4-digit New PIN</h1><br>
	<input type="password"  name="newPin" maxlength="4" size="4" onkeypress="return only(event)"  autofocus required="required" />
	<br>	
	<h1 class="checker">re-Enter 4-digit New PIN</h1><br>
	<input type="password" name="reEnterPin" maxlength="4" size="4" onkeypress="return only(event)" required="required"  autofocus />
	<br>
	<br>
	<input type="submit" class="inpset" value="Confirm" name="pinChanged" onclick="return check()">
</form>
	<div style="text-align: center;">
	<br><br><br>
	<a style="padding-right:15px; padding-left:15px; text-decoration:none;"  class="LogOut" href="AtmLogin.jsp" >Log Out</a> 
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
          }, 60000);
}
    
    $(function () {
        $(document).ready(function () {
            $.alert('Session Expires in', {
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