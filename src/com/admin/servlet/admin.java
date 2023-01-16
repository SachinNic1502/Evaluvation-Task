package com.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class admin
 */
@WebServlet("/admin")
public class admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/assignment","root","Hacker@123.");
			int currentEmpId = Integer.parseInt(request.getParameter("currentEmpId"));
			String taskname= request.getParameter("taskName");
			String taskDescription= request.getParameter("taskDesc");
			String  query = "INSERT INTO task(empid,taskname,taskdsc,feedback,taskstatus) VALUES(?,?,?,'','Pending')";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, currentEmpId);
			pstmt.setString(2, taskname);
			pstmt.setString(3, taskDescription);
			
			int rs = pstmt.executeUpdate();
			
			response.sendRedirect("admin.jsp");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("inside add task servlet");
		}
	}

	}
