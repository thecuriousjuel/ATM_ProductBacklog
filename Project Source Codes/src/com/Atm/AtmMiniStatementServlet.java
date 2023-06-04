package com.Atm;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/AtmMiniStatementServlet")
public class AtmMiniStatementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AtmMiniStatementServlet() {
        super();
       
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String result="";
		//RequestDispatcher rd= null;
		String fromDate=request.getParameter("fromDate");
		String toDate = request.getParameter("toDate");
		String newDate="";
		String newDate1="";
		
		System.out.println(fromDate);
		System.out.println(toDate);
		
		java.util.Date jDate=null;
		java.sql.Date sqlDate=null;
		java.util.Date jDate2=null;
		java.sql.Date sqlDate2=null;
		//Date nDate=Date.valueOf(fromDate);
		
		//Date nDate2=Date.valueOf(toDate);
		
		DBConnect dbc=new DBConnect();
		String cardDigits=dbc.miniDate();
		
		try
		{
			/*try {
				SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
				jDate = sdf1.parse(fromDate);
				sqlDate = new java.sql.Date(jDate.getTime()); 
				
				SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy");
				jDate2 = sdf2.parse(toDate);
				sqlDate2 = new java.sql.Date(jDate2.getTime());
				System.out.println(jDate);
				System.out.println(jDate2);
		
			} catch (ParseException e) {
			
				e.printStackTrace();
			} */
			Connection con = dbc.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from AtmTransaction where card=? and tdate >=TO_DATE('"+fromDate+"','YYYY-MM-DD') and tdate <=TO_DATE('"+toDate+"','YYYY-MM-DD') order by tid desc");
			   ps.setString(1,cardDigits);
			  // ps.setString(2,"04-06-2001");
			   //ps.setString(3,"04-11-2019");
			   ResultSet rs=ps.executeQuery();
			   PrintWriter out = response.getWriter();
			  if(rs.next()==false)
			  {
				 out.println("<!DOCTYPE html>\r\n" + 
				 		"<html>\r\n" + 
				 		"<head>\r\n" + 
				 		"<style>\r\n" + 
				 		"body\r\n" + 
				 		"{\r\n" + 
				 		"background-image:url(\"abstract.jpg\");\r\n" + 
				 		"background-repeat:no-repeat;\r\n" + 
				 		"background-size:cover;\r\n" + 
				 		"}\r\n" + 
				 		"a:hover\r\n" + 
				 		"{\r\n" + 
				 		"background-color: #2EE59D;\r\n" + 
				 		"  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);\r\n" + 
				 		"  color: #fff;\r\n" + 
				 		"  transform: translateY(-7px);\r\n" + 
				 		"}\r\n" + 
				 		".LogOut\r\n" + 
				 		"{\r\n" + 
				 		"	background-color: #2EE59D;\r\n" + 
				 		"	color:black;\r\n" + 
				 		"	font-size: 21px;\r\n" + 
				 		"	padding: 12px;\r\n" + 
				 		"	padding-left:50px;\r\n" + 
				 		"	padding-right:50px;\r\n" + 
				 		"	border-radius: 40px;\r\n" + 
				 		"}\r\n" + 
				 		"</style>\r\n" + 
				 		"<meta charset=\"ISO-8859-1\">\r\n" + 
				 		"<title>Insert title here</title>\r\n" + 
				 		"<link rel=\"stylesheet\" href=\"DesignAtm.css\">\r\n" + 
				 		"</head>\r\n" + 
				 		"<body>\r\n" + 
				 		"<div align=\"center\" style=\"margin-top:150px;\">\r\n" + 
				 		"<p style=\"font-size:40px;color:yellow;text-shadow:2px 2px black;\">No Transaction available!!! </p>\r\n" + 
				 		"	<div align=\"center\">\r\n" + 
				 		"	<br><br>\r\n" + 
				 		"	<img src=\"NoTrans.gif\" width=\"70\" height=\"250\" style=\"border-radius:10px;\"/><br>\r\n" + 
				 		"	</div></div>\r\n" + 
				 		"	<br><br><br><br>\r\n" + 
				 		"<script>\r\n" + 
				 		"window.onload = function() {\r\n" + 
				 		"    setInterval(function() {\r\n" + 
				 		"        window.location.replace(\"AtmLogin.jsp\");\r\n" + 
				 		"          }, 3000);\r\n" + 
				 		"}\r\n" + 
				 		"</script>\r\n" + 
				 		"<script type=\"text/javascript\">\r\n" + 
				 		"        window.history.forward();\r\n" + 
				 		"        function noBack()\r\n" + 
				 		"        {\r\n" + 
				 		"            window.history.forward();\r\n" + 
				 		"        }\r\n" + 
				 		"</script>\r\n" + 
				 		"</body>\r\n" + 
				 		"</html>");
				  
			  }
			  else
			  {
			   
			   out.println("<!DOCTYPE html>");
			   out.println("<html>");
			   out.println("<head>");
			   out.println("<style type=\"text/css\">");
			   out.println(".LogOut{");
			   out.println("background-color: #2EE59D;");
			   out.println("color:black;");
			   out.println("font-size: 21px;");
			   out.println("padding: 12px;");
			   out.println("padding-left:50px;");
			   out.println("padding-right:50px;");
			   out.println("border-radius:40px;}");
			   out.println("body{");
			   out.println("background-image:url(\"abstract.jpg\");");
			   out.println("background-repeat:no-repeat;");
			   out.println("background-size:cover;}");
			   out.println("table.greenTable {");
			   out.println("font-family:\"Arial Black\", Gadget, sans-serif;");
			   out.println("border: 6px solid #24943A;");
			   out.println("background-color: #D4EED1;");
			   out.println("width: 80%;");
			   out.println("text-align: center;}");
			   out.println("table.greenTable td, table.greenTable th {");
			   out.println("border: 1px solid #24943A;");
			   out.println("padding: 3px 2px;}");
			   out.println("table.greenTable tbody td {");
			   out.println("font-size: 13px;}");
			   out.println("table.greenTable thead {");
			   out.println("background: #24943A;");
			   out.println("background: -moz-linear-gradient(top, #5baf6b 0%, #3a9e4d 66%, #24943A 100%);");
			   out.println("background: -webkit-linear-gradient(top, #5baf6b 0%, #3a9e4d 66%, #24943A 100%);");
			   out.println("background: linear-gradient(to bottom, #5baf6b 0%, #3a9e4d 66%, #24943A 100%);");
			   out.println("border-bottom: 0px solid #444444;}");
			   out.println("table.greenTable thead th {");
			   out.println("font-size: 19px;");
			   out.println("font-weight: bold;");
			   out.println("color: #F0F0F0;");
			   out.println("text-align: center;");
			   out.println("border-left: 2px solid #24943A;}");
			   out.println("table.greenTable thead th:first-child {");
			   out.println("border-left: none;}");
			   out.println("table.greenTable tfoot td {");
			   out.println("font-size: 13px;}");
			   out.println("table.greenTable tfoot .links {");
			   out.println("text-align: right;}");
			   out.println("table.greenTable tfoot .links a{");
			   out.println("display: inline-block;");
			   out.println("background: #FFFFFF;");
			   out.println("color: #24943A;");
			   out.println("padding: 2px 8px;");
			   out.println("border-radius: 5px;}");
			   out.println("</style>");
			   out.println("</head>");
			   out.println("<body style=\" margin-top:100px\">");
			   out.println("<h1 style=\"text-align:center; text-shadow:4px 3px black; color:white; font-size:30px; font-family: sans-serif;\">MINI STATEMENT</h1>");
			   out.println("<br><br>");
			   out.println("<div align=\"center\">");
			   out.println("<table class=\"greenTable\">");
			   out.println("<thead>");
			   out.println("<tr>");
			   out.println("<th>CARD NUMBER</th>");
			   out.println("<th>ACCOUNT TYPE</th>");
			   out.println("<th>AMOUNT</th>");
			   out.println("<th>TRANS. DATE</th>");
			   out.println("<th>STATUS</th>");
			   out.println("</tr>");
			   out.println("</thead>");
			   out.println("<tbody>");
			   do
			   {
				   out.println("<tr>");
				   out.println("<td>"+rs.getString(2)+"</td>");
				   out.println("<td>"+rs.getString(3)+"</td>");
				   out.println("<td>"+rs.getString(4)+"</td>");
				   out.println("<td>"+formatter(rs.getDate(5))+"</td>");
				   out.println("<td>"+rs.getString(6)+"</td>");
				   out.println("</tr>");
			   }while(rs.next());
			   out.println("</tbody>");
			   out.println("</table>");
			   out.println("</div>");
			   out.println("<div align=\"center\">");
			   out.println("<br>");
			   out.println("<a style=\"padding-right:15px; padding-left:15px; text-decoration:none;\"  class=\"LogOut\" href=\"AtmLogin.jsp\" >Log Out</a>");
			   out.println("&nbsp;&nbsp;&nbsp;");			   
			   out.println("<a style=\"padding-right:25px; padding-left:25px; text-decoration:none;\"  class=\"LogOut\" href=\"AtmMenu.jsp\" >Home</a>");
			   out.println("</div>");
			   out.println("<script>");
			   out.println("window.onload = function() {");
			   out.println(" setInterval(function() {");
			   out.println(" window.location.replace(\"AtmLogin.jsp\");");
			   out.println("}, 50000);}");
			   out.println("</script>");
			   out.println("</body>");
			   out.println("</html>");
			  }
			    
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	String formatter(Date tdate)
	{
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		String dt=dateFormat.format(tdate);
		return dt;  
		
	}
		
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
