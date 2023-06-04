package com.Atm;

import java.io.IOException;
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
@WebServlet("/AtmDepositServlet")
public class AtmDepositServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   
    
    
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			DBConnect db=new DBConnect();
			Connection con=db.getConnection();
			
			HttpSession session=request.getSession();
			String type=(String)session.getAttribute("type");
			System.out.println(type+"00000000000");
			
			int balance=db.getBalance(type);		
			
			
			//int amount=Integer.parseInt(request.getParameter("amount"));
			
			    
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
			
			
			balance=balance+amount;
			
			if(db.update(type,balance,amount,"C"))
			{
				request.getRequestDispatcher("/success.jsp").forward(request, response);
			}
			else request.getRequestDispatcher("/TransactionError.jsp").forward(request, response);
			
			
		}

		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			doGet(request, response);
		}

	}
