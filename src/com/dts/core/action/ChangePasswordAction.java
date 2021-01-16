package com.dts.core.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dts.dae.dao.SecurityDAO;
import com.dts.dae.model.Profile;

public class ChangePasswordAction extends HttpServlet {	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doPost(request, response);
	}	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session =request.getSession();
		
	  	if((String)session.getAttribute("user")==null)
	       response.sendRedirect("LoginForm.jsp?status=Session Expired");
	 
	 String page="";
	
	    	
	       		Profile rb=new Profile(); 
	       		boolean flag=false;
	            rb.setPassword(request.getParameter("oldpassword")); 
	            rb.setLoginID(request.getParameter("username")); 
	            rb.setNewPassword(request.getParameter("newpassword")); 
	            String target="";
	            
	            String role=(String)session.getAttribute("role");
	            if((request.getParameter("oldpassword").equals(request.getParameter("newpassword"))))
	            {
	            	target="Changepassword.jsp?status=Oldpassword and Newpassword are same..";
	            }
	            else
	            {
	            	flag=new SecurityDAO().changePassword(rb);
		             
		            if(flag) 
		                target="Changepassword.jsp?status=Password Changed Successfully"; 
		            else 
		                target="Changepassword.jsp?status=Password Change Failed"; 
	            }
	            
	            RequestDispatcher rd = request.getRequestDispatcher(target);
	            rd.forward(request,response);
	}

}
