<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*;" %>
<%-- <%
    if(session.getAttribute("name")==null){
    	response.sendRedirect("adminLogin.jsp");
    }
%>  --%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="css/adminStyle.css" />
    <title>Admin Dashboard</title>
</head>

<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar -->
        <div class="bg-white" id="sidebar-wrapper">
            <div class="sidebar-heading text-center py-4 primary-text fs-4 fw-bold text-uppercase border-bottom"><i
                    class="fas fa-user-secret me-2"></i>Admin</div>
            <div class="list-group list-group-flush my-3">
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text active" id="dashboard"><i
                        class="fas fa-tachometer-alt me-2" ></i>Dashboard</a>
                <a href="registration.jsp" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-project-diagram me-2"></i>Add Employees</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold" id="hide"><i
                        class="fas fa-chart-line me-2"></i>Tasks</a>
<!--                 <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-paperclip me-2"></i>Reports</a> -->
                <a href="adminLogout" class="list-group-item list-group-item-action bg-transparent text-danger fw-bold"><i
                        class="fas fa-power-off me-2"></i>Logout</a>
            </div>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                <div class="d-flex align-items-center">
                    <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                    <h2 class="fs-2 m-0" >Dashboard</h2>
                </div>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle second-text fw-bold" href="#" id="navbarDropdown"
                                role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-user me-2"></i>Admin
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
<!--                                 <li><a class="dropdown-item" href="#">Profile</a></li>
                                <li><a class="dropdown-item" href="#">Settings</a></li> -->
                                <li><a class="dropdown-item" href="adminLogout">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <%
					    Connection connection;
					    Class.forName("com.mysql.jdbc.Driver");
						connection = DriverManager.getConnection("jdbc:mysql://localhost/assignment","root","Hacker@123.");
					    	Statement stmt = connection.createStatement(); 
					    	String qry = "select count(taskid) from task;";
					    	String qry1 = "select count(*) from task where taskstatus ='Completed';";
					    	String qry2 = "select count(*) from task where taskstatus ='Pending';";

					    	ResultSet res = stmt.executeQuery(qry);

					    	int ttask=0;
					    	int ctask=0;
					    	int ptask=0;
					    	while(res.next()){
					    		ttask = res.getInt(1);
					    	
					    %>

            <div class="container-fluid px-4">
                <div class="row g-3 my-2">
                    <div class="col-md-3">
                        <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                            <div>
                                <h3 class="fs-2"><%= ttask %></h3>
                                <p class="fs-5">Tasks</p>
                            </div>
                            <i class="fas fa-gift fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                            <div>
                                <h3 class="fs-2"><%}
					    	ResultSet res1 = stmt.executeQuery(qry1);
					    	while(res1.next()){
					    		ctask = res1.getInt(1);%><%= ctask %></h3>
                                <p class="fs-5">Completed</p>
                            </div>
                            <i
                                class="fas fa-hand-holding-usd fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                            <div>
                                <h3 class="fs-2"><%}
					    	ResultSet res2 = stmt.executeQuery(qry2);

					    	while(res2.next()){
					    		ptask = res2.getInt(1);%><%= ptask %><%} %></h3>
                                <p class="fs-5">Pending</p>
                            </div>
                            <i class="fas fa-truck fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                            <div>
                                <h3 class="fs-2"><%!
float calculatePercentage(float a,float b)
{
 float result=a/b * 100;
 return result;
}
%><%=(int)calculatePercentage(ctask,ttask) %>%</h3>
                                <p class="fs-5">Progress</p>
                            </div>
                            <i class="fas fa-chart-line fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                        </div>
                    </div>
                </div>

                <div class="row my-5" id="emptable">
                    <h3 class="fs-4 mb-3">Employees</h3>
                    <div class="col">
                        <table class="table bg-white rounded shadow-sm  table-hover">
                            <thead>
                                <tr>
                                    <th scope="col" width="50">#</th>
                                    <th scope="col">Employee</th>
                                    <th scope="col">Completed Task</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                  
					    <%
					    
					    Class.forName("com.mysql.jdbc.Driver");
						connection = DriverManager.getConnection("jdbc:mysql://localhost/assignment","root","Hacker@123.");
					    	Statement stmt0 = connection.createStatement(); 
					    	String query0 = "SELECT * FROM employee ";
					    	
					    	ResultSet rs0 = stmt.executeQuery(query0);
					    while (rs0.next()) 
			             { 
					    	 int empid=rs0.getInt("empid");
			                 String name = rs0.getString("empname");   
			                 Statement stmt1 = connection.createStatement(); 
						     String qury1 = "select count(*) from task where taskstatus ='Completed' and empid ='"+empid+"';";
						     ResultSet rs1 = stmt1.executeQuery(qury1);
						     while(rs1.next()){
						    		
					    %>
					    
					      <tr>
					      <th scope="row"><%= empid %> <input type="hidden" name="eid" value="<%= empid %>" id="ids" class="eid"></th>
					      <td><%= name %></td>
					     <td><%= rs1.getInt(1)%><%} }%></td>	
					    <%--  <%
					    	Statement stm = connection.createStatement(); 
					    	String q0 = "SELECT * FROM employee ";
					    	
					    	ResultSet r0 = stm.executeQuery(q0);
					    while (r0.next()) 
			             { 
					    	 int epid = r0.getInt("empid");   
			                 Statement smt1 = connection.createStatement(); 
						     String q2 = "select count(*) from task where taskstatus ='Pending' and empid ='"+epid+"';";
						     ResultSet re2 = smt1.executeQuery(q2);
						     while(re2.next()){
						    		
					    %><td><%= re2.getInt(1)%>
					    </td> --%>			        
					      </tr>
					 
					    </tbody>
                        </table>
                    </div>
                </div>
			 	<div class="form-row"" id="task" style="display:none;">

					 <!-- Button trigger modal -->
<button type="button" class="btn btn-primary m-3" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Add Task
</button>
                <div class="row my-5" id="emptable">
                    <h3 class="fs-4 mb-3">Employees</h3>
                    <div class="col">
                        <table class="table bg-white rounded shadow-sm  table-hover">
                            <thead>
                                <tr>
                                    <th scope="col" width="50">#</th>
                                  <th scope="col">Employee Task</th>
                                    <th scope="col">Task Discription</th>
                                    <th scope="col">Employee Feedback</th>
                                     <th scope="col">Task Status</th>
                                </tr>
                            </thead>
                            <tbody>
                  
					    <% 
					    	String query3 = "SELECT * FROM task";
					    	ResultSet rs3 = stmt.executeQuery(query3);
					    	
					    %>
					    <tbody>
					    <%
					    while (rs3.next()) 
			             { 
					    	 int empid=rs3.getInt("empid");
					    	 int taskid=rs3.getInt("taskid");
			                 String taskname = rs3.getString("taskname");     
			                 String taskdesc = rs3.getString("taskdsc");
			                 String feedback = rs3.getString("feedback");
			                 String taskStatus = rs3.getString("taskstatus");
					    %>
					    
					      <tr>
					      <th scope="row"><%= taskid %> <input type="hidden" name="eid" id="ids" class="eid"></th>
					      <td><%= taskname %></td>
					      <td><%= taskdesc %></td>
					      <td><%= feedback %></td>
					      <td><%= taskStatus %></td>				        
					      </tr>
					     <%
					     	} 
					     %>
					    </tbody>
                        </table>
                    </div>
                </div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Task</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="form">
                    <div class="form-group">
					    <label for="employeeIdSelect" class="fs-4 mb-3">Select Employee</label>
						<%
					    	stmt = connection.createStatement(); 
					    	String query2 = "SELECT * FROM employee";
					    	ResultSet rs2 = stmt.executeQuery(query2);
					    	
					    %>
					    <select class="form-control h-50" id="employeeIdSelect">
					      <option value="DEFAULT"  hidden>Choose the employee you want to add the task for</option>
					      <%
					    while (rs2.next()) 
				             {  
				                 int empId = rs2.getInt("empid"); 
				                 String empName = rs2.getString("empname");
					    %>
					      <option id="currentEmpId" value="<%= empId %>"> <%= empId %> &nbsp;&nbsp;&nbsp; <%= empName %></option>
					       <%
					     	} 
					     %>
					    </select>
					  </div>
                    <!-- Email input -->
                    <div class="form-outline mb-4">
                        <label class="form-label" for="email4" >Name of Task</label>
                        <input type="text" id="taskName" class="form-control" />
                    </div>

                    <!-- textarea input -->
                    <div class="form-outline mb-4">
                        <label class="form-label" for="textarea4" >Add task discription</label>
                        <textarea rows="4" id="taskDesc" class="form-control"></textarea>
                    </div>
                    <!-- Submit button -->

      				
      			<div class="modal-footer">
       			 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        		<button type="submit" class="btn btn-primary btn-block">Send</button>
     		 </div>
       	</form>
     	 </div>
    </div>
  </div>
</div>
			 	</div>
            </div>
        </div>
    </div>
    <!-- /#page-content-wrapper -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        var el = document.getElementById("wrapper");
        var toggleButton = document.getElementById("menu-toggle");
        toggleButton.onclick = function () {
            el.classList.toggle("toggled");
        };
        $(document).ready(function(){
        	  $("#hide").click(function(){
        	    $("#emptable").hide();
            	    $("#task").show();
             $("#dashboard").click(function(){
        		    $("#task").hide();
        		    $("#emptable").show();
        		  });
        	  });
        	  
        	  $("#form").submit(function(){
        			var currentEmpId = $("#employeeIdSelect").val();
        			//var str = "Choose the employee you want to add the task for ";
        		    var taskName = $("#taskName").val();
        		    var taskDesc = $("#taskDesc").val();

        			if(currentEmpId !=  "DEFAULT" && currentEmpId != null && currentEmpId != ""){
        				
        				console.log("empid :"+currentEmpId);
        			$.ajax({
        						url : "admin",
        						type: "POST",
        						data: {
        							"currentEmpId" : currentEmpId,
        							"taskName" : taskName,
        							"taskDesc": taskDesc
        						},
        						success : function(data) {
        							console.log("taskName :"+taskName);
        						},
        						  error:function(){
        				              alert('error');
        				            }
        					});
        				}
        			else {
        				alert("Please choose the employee for whom the task is to be alloted");
        			}
        			

        		});
        	  
        	});
    </script>
</body>

</html>