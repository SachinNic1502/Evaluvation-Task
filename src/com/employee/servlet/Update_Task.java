package com.employee.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Update_Task
 */
@WebServlet("/Update_Task")
public class Update_Task extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_Task() {
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
	
	
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub  | 
//	    int taskid = Integer.parseInt(request.getParameter("taskid"));
		int taskid =Integer.parseInt(request.getParameter("taskId"));
		String task_feedback= request.getParameter("taskfeedback");
		String task_status = request.getParameter("taskstatus");
		RequestDispatcher dispatcher = null;
		System.out.println("data in servlet");
		System.out.println(taskid);
		
		System.out.println(task_feedback);
		System.out.println(task_status);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment?useSSL=false","root","Hacker@123.");
			PreparedStatement pst = con.prepareStatement("update task set feedback = ? , taskstatus= ? where taskid=?");
			pst.setString(1, task_feedback);
			pst.setString(2, task_status);
			pst.setInt(3, taskid);
		//System.out.println(taskid +" "+task_status);
			int rs = pst.executeUpdate();
			if(rs != 0) {
			    dispatcher = request.getRequestDispatcher("Employee/empHome.jsp");
			    
			}else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("Employee/empHome.jsp");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		/*dispatcher.forward(request,response);*/
		
	}
	}
