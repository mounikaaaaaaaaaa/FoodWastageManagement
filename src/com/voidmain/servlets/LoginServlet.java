package com.voidmain.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.voidmain.dao.HibernateDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username=request.getParameter("username").trim();
		String password=request.getParameter("password").trim();
		
		String role=HibernateDAO.isValidUser(username, password);
		
		if(role.equals("admin"))
		{
			request.getSession().setAttribute("username",username.toLowerCase());
			request.getSession().setAttribute("role",role);
			response.sendRedirect("viewdonors.jsp");
		}
		else if(role.equals("orphanage"))
		{
			request.getSession().setAttribute("username",username.toLowerCase());
			request.getSession().setAttribute("role",role);
			response.sendRedirect("viewagents.jsp");
		}
		else if(role.equals("donor"))
		{
			request.getSession().setAttribute("username",username.toLowerCase());
			request.getSession().setAttribute("role",role);
			response.sendRedirect("addfood.jsp");
		}
		else if(role.equals("agent"))
		{
			request.getSession().setAttribute("username",username.toLowerCase());
			request.getSession().setAttribute("role",role);
			response.sendRedirect("viewfood.jsp");
		}
		else
		{
			response.sendRedirect("login.jsp?status=Invalid Username and Password");
		}
	}
}
