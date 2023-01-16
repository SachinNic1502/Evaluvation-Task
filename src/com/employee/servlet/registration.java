package com.employee.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class registration
 */
@WebServlet("/registration")
public class registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String emp_name = request.getParameter("name");
		String emp_email = request.getParameter("email");
		String emp_pwd = request.getParameter("pass");
		String emp_mob = request.getParameter("contact");
		RequestDispatcher dispatcher;
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			 con = DriverManager.getConnection("jdbc:mysql://localhost/assignment","root","Hacker@123.");
			PreparedStatement pst = con.prepareStatement("insert into employee(empname,emppwd,empemail,empmob) values(?,?,?,?) ");
	 	    pst.setString(1, emp_name);
	 	   pst.setString(2, emp_pwd);
	 	  pst.setString(3, emp_email);
	 	 pst.setString(4, emp_mob);
	 	 System.out.println("data send");
	 	 int rowCount = pst.executeUpdate();
	 	 dispatcher = request.getRequestDispatcher("registration.jsp");
	 	 if(rowCount > 0) {
	 		 request.setAttribute("status", "success");
	 	 }else {
	 		 request.setAttribute("status", "failed");
	 	 }
	 	 dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
				System.out.print("connection close");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}

