package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DBUtil;
import com.dao.UserDao;
import com.modules.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charse=UTF-8;");
		try (PrintWriter out = response.getWriter()) {
			/* out.print("Login Servlet"); */
			/*
			 * String email = request.getParameter("login-email"); String password =
			 * request.getParameter("login-password");
			 */
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			try {
				UserDao udao = new UserDao(DBUtil.getMySQLConnection());
				User user = udao.userLogin(email, password);
				
				if (user != null) {
					/* out.print("User log-In"); */
					request.getSession().setAttribute("auth", user);
					response.sendRedirect("index.jsp");
				} else {
					out.print("User failed to log-In");
				}
			} catch (Exception e) {
				
			} 
			/* out.print(email+ " "+password); */
		} catch (Exception e) {
			
		}
	}

}
