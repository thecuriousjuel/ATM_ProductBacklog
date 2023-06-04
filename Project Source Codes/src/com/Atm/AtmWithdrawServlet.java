package com.Atm;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AtmDepositServlet
 */
@WebServlet("/AtmWithdrawServlet")
public class AtmWithdrawServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			DBConnect db=new DBConnect();
			Connection con=db.getConnection();
			HttpSession session=request.getSession();	
			
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
		
			if(request.getParameter("withdraw_num") != null) 
	        {     
				String str=request.getParameter("withdraw_num");
				for(int i=0;i<str.length();i++)
				{
					if(str.charAt(i)=='.')
					{
						str=str.substring(0,i);
						break;
					}
				}
	            int value = Integer.parseInt(str);
	            System.out.println("Withdraw amount ="+value);
	            if(value % 100 == 0)            	
	            {      
	            	String counter = withdraw(value);
	            	
	        		session.setAttribute("Data", counter);
	        		session.setAttribute("Amount", value);
	        		
	        		System.out.println("AtmWithdraw------"+session.getAttribute("task"));
	        		System.out.println(session.getAttribute("type")+"qqqqqqq");
	        		
	        		String type=(String)session.getAttribute("type");
	       	      int balance=db.getBalance(type);
	     	      
	      	      
	      	      //int amount=Integer.parseInt(request.getParameter("withdraw_num"));
	       	   int amount=value;
	      	     
	     	     
	     	      if(balance>=amount)
	     	      {
	     	    	 balance=balance-amount;
	     	    	
		            db.update(type,balance,amount,"D");
	      	          request.getRequestDispatcher("/AtmDenomination.jsp").forward(request, response);
	      	    
	     	      }
	      	      else
	     	      {
	     	    	out.println("<!DOCTYPE html>\r\n" + 
	     	    			"<html>\r\n" + 
	     	    			"   <head>\r\n" + 
	     	    			"      <link rel='stylesheet' type='text/css' href='myAlert.css'>\r\n" + 
	     	    			"      <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>\r\n" + 
	     	    			"      <script src='myAlert.js'></script> \r\n" + 
	     	    			"      <script type=\"text/javascript\"></script>     \r\n" + 
	     	    			"   </head>\r\n" + 
	     	    			"\r\n" + 
	     	    			"   <body>\r\n" + 
	     	    			"      <div id='confirm'>\r\n" + 
	     	    			"         <div class='message'>Insufficient balance in Account</div><br>\r\n" + 
	     	    			"         <button class='yes'>OK</button>\r\n" + 
	     	    			"      </div>\r\n" + 
	     	    			"      <script>functionAlert()</script>\r\n" + 
	     	    			"   </body>\r\n" + 
	     	    			" </html>");
		          	request.getRequestDispatcher("/AtmWithdraw.jsp").include(request, response); 
	     	      }
	             	
	            }
	    
	            else {
	            		            	
	            	out.println("<script> alert(\"Enter in multiples of 100 only !\"); </script> ");
	            	
	            	request.getRequestDispatcher("/AtmWithdraw.jsp").include(request, response);
	            }
	        }
	}

	public String withdraw(int amount) {
		System.out.println("Balanced received :: " + amount);
		int[] notes = new int[] { 2000, 500, 200, 100 };
		int[] noteCounter = new int[4];

		for (int i = 0; i < 4; i++) {
			if (amount >= notes[i]) {
				noteCounter[i] = amount / notes[i];
				amount = amount - noteCounter[i] * notes[i];
			}

		}
		String S = "";
		for (int i = 0; i < 4; i++) {
			if (noteCounter[i] != 0) {
				S = S + notes[i] + " : " + noteCounter[i] + "\n";
			}
		}
		return noteCounter[0] + "," + noteCounter[1] + "," + noteCounter[2] + "," + noteCounter[3] + ",";
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
