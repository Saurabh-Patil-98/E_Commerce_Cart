package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DBUtil;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("LoginController2 called");

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		out.println("Welcome to LoginController");

		out.println("Today " + new Date().toString());
		out.println(getServletConfig());
		out.println(getServletInfo());

		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String post = request.getParameter("post");
		String area = request.getParameter("area");
		String password = request.getParameter("password");

		System.out.println(firstname);
		System.out.println(lastname);
		System.out.println(email);
		System.out.println(phone);
		System.out.println(address);
		System.out.println(state);
		System.out.println(country);
		System.out.println(post);
		System.out.println(area);
		System.out.println(password);

		try {
			Connection con = DBUtil.getMySQLConnection();
			PreparedStatement ps = con.prepareStatement("Select * FROM ecommerce_cart.users where email = ? AND password = ? ;");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			// RequestDispatcher rd = null;

			// step 3 : navigate data
			if (rs.next()) {
				System.out.println("User Already Exist!");
				response.sendRedirect("login.jsp");
			} else {
				try {
					con = DBUtil.getMySQLConnection();
					ps = con.prepareStatement
							("INSERT INTO  ecommerce_cart.users (`email`,`password`) VALUES (?,?);");

					ps.setString(1, email);

					ps.setString(2, password);

					int a = ps.executeUpdate();
					System.out.println(a);

					if (a == 1) {
						System.out.println(" email and pass stored to the login table");
						 response.sendRedirect("login.jsp");
					}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("1 Error while storing email and in login");
				}
			

				try {
					con = DBUtil.getMySQLConnection();
					ps = con.prepareStatement

					("INSERT INTO  registration ( `firstname`, `lastname`, `email`,`phone`, `address`, `state`,`country`, `post`, `area`, `password`) VALUES (?,?,?,?,?,?,?,?,?,?);");

					ps.setString(1, firstname);
					ps.setString(2, lastname);
					ps.setString(3, email);
					ps.setString(4, phone);
					ps.setString(5, address);
					ps.setString(6, state);
					ps.setString(7, country);
					ps.setString(8, post);
					ps.setString(9, area);
					ps.setString(10, password);

					int a = ps.executeUpdate();
					System.out.println(a);

					if (a == 1) {
						System.out.println("User registered succesfully");
						//response.sendRedirect("login.jsp");
					}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("Error while execute query1");
				}
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error while execute query2");
		}

	}

}
