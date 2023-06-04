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
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class AtmTransferServlet
 */
@WebServlet("/AtmTransferServlet")
public class AtmTransferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	   


	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		 	HttpSession session=request.getSession();
		 	String type=(String)session.getAttribute("type");
		 //	int amount=Integer.parseInt(request.getParameter("amount"));
		     
				String str=request.getParameter("amount");
				for(int i=0;i<str.length();i++)
				{
					if(str.charAt(i)=='.')
					{
						str=str.substring(0,i);
						break;
					}
				}
	            int amount = Integer.parseInt(str);
		 	
		 	
		 	response.setContentType("text/html");
			PrintWriter out=response.getWriter();
		 	//Calling database class 
		 	DBConnect db=new DBConnect();
			Connection con=db.getConnection();
		 	int balance=db.getBalance(type);	
		 	
			
			if(amount < balance)
			{
				//Updating balance of source account
				balance=balance-amount;
				db.update(type,balance,amount,"D");
				
				//Changing type of account to destination account
				if(type.equals("CUR"))
					type="SAV";
				else type="CUR";
				
				//Updating balance of destination account
				
				balance=db.getBalance(type);
				balance=balance + amount;
				if(db.update(type,balance,amount,"C"))
					request.getRequestDispatcher("/success.jsp").forward(request,response);
				else System.out.println("Data updation problem");
			}
			else 
			{
				out.println("<!DOCTYPE html>\r\n" + 
						"						<html>\r\n" + 
						"						   <head>\r\n" + 
						"						      <link rel='stylesheet' type='text/css' href='myAlert.css'>\r\n" + 
						"						      <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>\r\n" + 
						"						      <script src='myAlert.js'></script>      \r\n" + 
						"						   </head>\r\n" + 
						"\r\n" + 
						"						   <body>\r\n" + 
						"						      <div id='confirm'>\r\n" + 
						"						         <div class='message'>Insufficient balance in Account</div><br>\r\n" + 
						"						         <button class='yes'>OK</button>\r\n" + 
						"						      </div>\r\n" + 
						"						      <script>functionAlert()</script>\r\n" + 
						"						   </body>\r\n" + 
						"						 </html>");
               	request.getRequestDispatcher("/AtmTransfer.jsp").include(request, response);
			}
			
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
		}
		
	}
