package com.voidmain.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.voidmain.dao.HibernateDAO;
import com.voidmain.dao.HibernateTemplate;
import com.voidmain.pojo.Food;
import com.voidmain.pojo.Login;
import com.voidmain.pojo.User;
import com.voidmain.service.MailService;

@WebServlet("/VoidmainServlet")
public class VoidmainServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	HttpServletRequest request;
	HttpServletResponse response;

	Object obj=null;
	String redirect=null;
	String type;
	String operation=null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.request=request;
		this.response=response;

		try {
			
			type=request.getParameter("type");
			redirect=request.getParameter("redirect");
			operation=request.getParameter("operation");
			
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);

			if(isMultipart) 
			{
				Object obj=new Food();
				
				Map<Object,List<String>> map=HttpRequestParser.parseMultiPartRequest(request,obj);
				
				List<String> list=map.get(obj);
				
				Food food=(Food)obj;
				food.setImage(list.get(0));
				
				User user=HibernateDAO.getUserById(food.getPostedby());
				
				for(User u : HibernateDAO.getUsers())
				{
					if(u.getUsertype().equals("agent"))
					{
						if(user.getAddress().toLowerCase().equals(u.getAddress().toLowerCase()))
						{
							 try {
					                String subject = "New Food Available for Pickup";
					                String body = "Dear Agent,\n\nNew food is available from a donor in your area. "
					                              + "Please log in to the system to view details and connect with the donor.\n\n"
					                              + "Donor Contact: " + user.getMobile() + "\n\nThank you for your support.\nFood Rescue Network Team";
					                MailService.mailsend(subject, body, u.getEmail());
					            } catch (Exception e) {
								e.printStackTrace();
							}
						}
					}
				}
				
				if(HibernateTemplate.addObject(food)==1)
				{
					response.sendRedirect("viewfood.jsp?status=success");
				}
				else
				{
					response.sendRedirect("viewfood.jsp?status=failed");
				}
			}
			else if(type!=null && redirect!=null && operation!=null)
			{
				obj=Class.forName(type).newInstance();
				Object object=HttpRequestParser.parseRequest(request, obj);

				if(type.equals("com.voidmain.pojo.User"))
				{
					Login login=new Login();
					login.setUsername(request.getParameter("username"));
					login.setPassword(request.getParameter("password"));
					login.setRole(request.getParameter("usertype"));
					
					System.out.println("user:"+object);
					System.out.println("Login:"+login);
					
					if(!HibernateDAO.isUserRegistred(request.getParameter("username")))
					{
						if(HibernateTemplate.addObject(object)==1 && HibernateTemplate.addObject(login)==1)
						{
							response.sendRedirect(redirect+"?status=success");
						}
						else
						{
							response.sendRedirect(redirect+"?status=failed");
						}
					}
					else
					{
						response.sendRedirect(redirect+"?status=User All ready Registred");
					}

				}
				else if(type.equals("com.voidmain.pojo.Message"))
				{
					String postedTo=request.getParameter("postedto");
					String message=request.getParameter("message");
					
					User user=HibernateDAO.getUserById(postedTo);
					
					try {
						
						MailService.mailsend("Food Donation Management",message,user.getEmail());
						
					} catch (Exception e) {
						e.printStackTrace();
					}
					
					if(HibernateTemplate.addObject(object)==1)
					{
						response.sendRedirect(redirect+"?status=success");
					}
					else
					{
						response.sendRedirect(redirect+"?status=failed");
					}

				}
				else
				{
					if(operation.equals("add"))
					{
						if(HibernateTemplate.addObject(object)==1)
						{
							response.sendRedirect(redirect+"?status=success");
						}
						else
						{
							response.sendRedirect(redirect+"?status=failed");
						}					
					}
					else if(operation.equals("update"))
					{
						if(HibernateTemplate.updateObject(object)==1)
						{
							response.sendRedirect(redirect+"?status=success");
						}
						else
						{
							response.sendRedirect(redirect+"?status=failed");
						}
					}
				}
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}
