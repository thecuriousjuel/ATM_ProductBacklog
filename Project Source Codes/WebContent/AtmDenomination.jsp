<%@page import="com.Atm.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Denomination</title>

<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" href="DesignAtm.css">
	<style>
	a:hover
{
background-color: #2EE59D;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
}
	</style>

</head>

<body style="text-align: center ; font-size:50px; ">
<div class="limiter">
<div class="container-table100">
	<div class="wrap-table100">
	<div style="color:yellow; text-shadow:2px 2px black; font-size:40px;">Please collect your cash !</div>
	<div align="center">
	<img src="atmcash.gif" width="220" height="100" style="border-radius:10px; box-shadow:3px 3px 2px #357BE6;"/><br>
	</div>
	<div class="table">
	<div class="row header">
					<div class="cell">
						Notes
					</div>
					<div class="cell">
						x
					</div>
					<div class="cell">
						Denomination
					</div>
					
				</div>

	<%
	System.out.println("AtmDenomination Running");
	
	String s =  (String)session.getAttribute("Data"), w="";
	int amt =(Integer)session.getAttribute("Amount");
	char ch;
	int i, l = s.length(), c = 0;	
	int num_of_notes = 0;
	
		//out.println("Total Withdrawal Amount");
	//	out.println(amount);
	
		
		for(i = 0; i < l; i++)
		{
			ch = s.charAt(i);
			
			if(ch != ',')
			{
				w = w + ch;
				num_of_notes = num_of_notes + Integer.parseInt(w);
				
			}
			else if(c == 0)
			{
				%>
				<div class="row">
				<div class="cell">
					<%= 2000 %>
				</div>
				<div class="cell">
					<%= "x" %>
				</div>
				<div class="cell">
					<%= w %>
				</div>				
				</div>
				<%
				w="";
				c++;
			}
			else if(c == 1)
			{
				%>
					<div class="row">
					<div class="cell">
						<%= 500 %>
					</div>
					<div class="cell">
					<%= "x" %>
				</div>
					<div class="cell">
						<%= w %>
					</div>				
					</div>
				
				<%
				
				w="";
				c++;
			}
			else if(c == 2)
			{
				%>
				<div class="row">
				<div class="cell">
					<%= 200 %>
				</div>
				<div class="cell">
					<%= "x" %>
				</div>
				<div class="cell">
					<%= w %>
				</div>				
				</div>
				<%
				w="";
				c++;
			}
			else if(c == 3)
			{
				%>
				<div class="row">
					<div class="cell">
						<%= 100 %>
					</div>
					<div class="cell">
					<%= "x" %>
				</div>
					<div class="cell">
						<%= w %>
					</div>		
							
				</div>
				<%
				w="";
				c++;
			}
			
		}
		out.println("</table>");
		 %>
		 
		 
<div class="row">
<div class="cell">

	 <%= "Total Amount Withdrawn : Rs. " %> <strong> <%= amt %> </strong>
	
</div>
<div class="cell">
	
</div>
	<div class="cell">
		 <%= "Total Number of Notes : "%>  <strong> <%= num_of_notes %> </strong>

</div>				
</div>
</div>
</div>
   <div align="center" style="margin-top: 10px;">
	<a style="padding-right:15px; padding-left:15px; text-decoration:none; background-color: #75FF5B; border: none;  color: black;  text-shadow: 1px 1px black;  text-align: center;  border-radius: 40px;  font-size: 20px;  cursor: pointer;padding: 12px 40px;"  class="LogOut" href="AtmLogin.jsp" >Log Out</a>
	&nbsp;&nbsp;&nbsp;
	<a style="padding-right:15px; padding-left:15px; text-decoration:none; background-color: #75FF5B; border: none;  color: black;  text-shadow: 1px 1px black;  text-align: center;  border-radius: 40px;  font-size: 20px;  cursor: pointer;padding: 12px 40px;"  class="LogOut" href="AtmMenu.jsp" >Home</a>
	</div>
</div>
</div>
<audio controls autoplay>
  <source src="CashOut.mp3" type="audio/mpeg">
</audio>
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