package com.Atm;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/AtmLoginServlet")
public class AtmLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		String cardDigits=request.getParameter("cardDigits");
		String pin=request.getParameter("pin");
		RequestDispatcher rd=null;
		DBConnect dbc=new DBConnect();
		boolean status=dbc.validateUser(cardDigits,pin);
		if(status)
		{
		
			rd=request.getRequestDispatcher("AtmMenu.jsp");
			rd.forward(request, response);
		}
		else
		{
			rd=request.getRequestDispatcher("Error.jsp");
			rd.forward(request, response);
		}	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
