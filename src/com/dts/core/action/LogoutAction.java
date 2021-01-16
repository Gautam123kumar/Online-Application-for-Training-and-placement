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

public class LogoutAction extends HttpServlet {
	public LogoutAction()
	{
		System.out.println("in logout action cons.........");
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session=request.getSession();
		System.out.println("in logout user="+session.getAttribute("user"));
		new SecurityDAO().loginaudit((String)session.getAttribute("user"));
		session.setAttribute("user",null);
		session.setAttribute("role", null);
		session.invalidate();
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp?status=logout successfull");
					rd.forward(request, response);	
	}

}
