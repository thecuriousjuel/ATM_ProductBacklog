package com.Atm;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/AtmSelectAccountServlet")
public class AtmSelectAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
		HttpSession session=request.getSession();
		String task=(String)session.getAttribute("task");
		String type=request.getParameter("type");
		session.setAttribute("type",type);
		session.setAttribute("abc","ABC");
		System.out.println(task+"ATMSelect"+type+"<----------type");
		
			switch(task)
			{
				case "viewBalance": request.getRequestDispatcher("/AtmViewBalance.jsp").forward(request, response);
					break;
				case "deposit":	request.getRequestDispatcher("/AtmDeposit.jsp").forward(request, response);
					break;
				case "withdraw": 	request.getRequestDispatcher("/AtmWithdraw.jsp").forward(request, response);									
					break;
				case "miniStatement":	request.getRequestDispatcher("/AtmMiniStatement.jsp").forward(request, response);
					break;
				case "fundTransfer":	request.getRequestDispatcher("/AtmTransfer.jsp").forward(request, response);
					break;
				default : System.out.print("Error in menu getting");
			}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
	}

