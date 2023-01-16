<%--  <%
    if(session.getAttribute("name")==null){
    	response.sendRedirect("login.jsp");
    }
%> --%> 

<%@ page import="java.sql.*,java.util.*, java.io.*;"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet" href="css/adminStyle.css" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>Employee Dashboard</title>
</head>

<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->
		<div class="bg-white" id="sidebar-wrapper">
			<div
				class="sidebar-heading text-center py-4 primary-text fs-4 fw-bold text-uppercase border-bottom">
				<i class="bi bi-person-bounding-box"> </i><%=session.getAttribute("name") %>
			</div>
			<div class="list-group list-group-flush my-3">
				<a href="#"
					class="list-group-item list-group-item-action bg-transparent second-text active"><i
					class="fas fa-tachometer-alt me-2"></i>Dashboard</a>
				
				<a href="logout"
					class="list-group-item list-group-item-action bg-transparent text-danger fw-bold"><i
					class="fas fa-power-off me-2"></i>Logout</a>
			</div>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<nav
				class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
				<div class="d-flex align-items-center">
					<i class="fas fa-align-left primary-text fs-4 me-3"
						id="menu-toggle"></i>
					<h2 class="fs-2 m-0">Dashboard</h2>
				</div>

				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle second-text fw-bold" href="#"
							id="navbarDropdown" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"> <i class="fas fa-user me-2"></i><%=session.getAttribute("name") %>
							
						</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="logout">Logout</a></li>
							</ul></li>
					</ul>
				</div>
			</nav>
<%
                        /* int eid = (int)session.getAttribute("empid"); */
					    Connection conn;
					    Class.forName("com.mysql.jdbc.Driver");
						conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment","root","Hacker@123.");
					    	Statement stmt1 = conn.createStatement(); 
					    	String qry = "select count(taskid) from task where empid='"+session.getAttribute("empid")+"';";
					    	String qry1 = "select count(*) from task where taskstatus ='Completed' and empid='"+session.getAttribute("empid")+"'";
					    	String qry2 = "select count(*) from task where taskstatus ='Pending' and empid='"+session.getAttribute("empid")+"'";

					    	ResultSet res = stmt1.executeQuery(qry);

					    	int ttask=0;
					    	int ctask=0;
					    	int ptask=0;
					    	while(res.next()){
					    		ttask = res.getInt(1);
					    	
					    %>
			<div class="container-fluid px-4">
				<div class="row g-3 my-2">
					<div class="col-md-4">
						<div
							class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
							<div>
								<h3 class="fs-2"><%= ttask %></h3>
								<p class="fs-5">Total Task</p>
							</div>

							<!--<i class="fa-solid fa-list-check fs-1 primary-text border rounded-full secondary-bg p-3"></i> -->
							<i
								class="fa-solid fa-bars-progress fs-1 primary-text border  rounded-circle secondary-bg p-3"></i>

						</div>
					</div>

					<div class="col-md-4">
						<div
							class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
							<div>
								<h3 class="fs-2"><%}
					    	ResultSet res1 = stmt1.executeQuery(qry1);
					    	while(res1.next()){
					    		ctask = res1.getInt(1);%><%= ctask %></h3>
								<p class="fs-5">Complete Task</p>
							</div>
							<i
								class="bi bi-list-check fs-1 primary-text border  rounded-circle secondary-bg p-3"></i>

							<!-- <i class="bi bi-check-circle fs-1 primary-text border rounded-full secondary-bg p-3"></i> -->
						</div>
					</div>

					<div class="col-md-4">
						<div
							class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
							<div>
								<h3 class="fs-2"><%}
					    	ResultSet res2 = stmt1.executeQuery(qry2);

					    	while(res2.next()){
					    		ptask = res2.getInt(1);%><%= ptask %><%} %></h3>
								<p class="fs-5">Pending Task</p>
							</div>
							<i
								class="bi bi-list fs-1 primary-text border  secondary-bg p-3"
								style="border-radius: 52%;"></i>
						</div>
					</div>

					<!-- <div class="col-md-3">
						<div
							class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
							<div>
								<h3 class="fs-2">%25</h3>
								<p class="fs-5">Increase</p>
							</div>
							<i
								class="fas fa-chart-line fs-1 primary-text border rounded-full secondary-bg p-3"></i>
						</div>
					</div> -->
				</div>

				<div class="row my-5">
					<h3 class="fs-4 mb-3">Recent Orders</h3>
					<div class="col">
						<table class="table bg-white rounded shadow-sm  table-hover"
							id="myTable">
							<thead>
								<tr>
									<!-- <th scope="col" width="50"></th> -->
									<th scope="col" width="100">Task Name</th>
									<th scope="col">Task Desciption</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>

							<%
								Connection connection;
								Class.forName("com.mysql.jdbc.Driver");
								Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment?useSSL=false","root","Hacker@123.");

								Statement stmt = con.createStatement();
								String query = "SELECT * FROM task where empid='"+session.getAttribute("empid")+"'";
								ResultSet rs = stmt.executeQuery(query);
								int taskid =0;
								
							%>
							<tbody>
								<%
									while (rs.next()) {
										 taskid = rs.getInt("taskid");
										String name = rs.getString("taskname");
										String taskDec = rs.getString("taskdsc");
										String taskstatus = rs.getString("taskstatus");
								%>

								<tr>
									<td style=display:none;><%=taskid%><input type="hidden" name="tid" ></td>
									<td><%=name%></td>
									<td><%=taskDec%></td>
									<td id="employee-tasks"><%=taskstatus%></td>
									<td><input type="button" value="Action"
										class="btn btn-primary transfer-button" data-bs-toggle="modal"
										data-bs-target="#exampleModal"></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!--Model  -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
	
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Task</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<form action="" method="POST" id="form">
					<div class="mb-3" style=display:none;>
						<label for="Taskid" class="form-label">Task
							ID</label> 
							<input type="text" class="form-control" id="Taskid" name="taskid">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">Task
							Name</label> <input type="text" class="form-control"
							id="taskname"
							name="taskname" disabled="disabled">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label">Feedback</label>
						<textarea class="form-control" id="taskfeedback" name="taskfeedback"
							rows="3"></textarea>
					</div>
					<div>
						<select class="form-control" aria-label="Default select example" name="taskstatus" id="taskstatus">

							<option selected >Pending</option>
							<option >Completed</option>

						</select>
					</div>
				<%-- <%
					     	} 
				%> --%>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				
					<input type="submit"  class="btn btn-primary"/>
				</div>
</form>
				
					
				</div>
			</div>
		</div>
	</div>
	<!--End Model  -->
	<!-- /#page-content-wrapper -->


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		var el = document.getElementById("wrapper");
		var toggleButton = document.getElementById("menu-toggle");

		toggleButton.onclick = function() {
			el.classList.toggle("toggled");
		};
	</script>
	<script>
	$(document).ready(function(){
		$(".transfer-button").click(function(){
			
			var row = $(this).closest("tr");
		var column1 = row.find("td:nth-child(1)").text();
		   var column2 = row.find("td:nth-child(2)").text(); 

		 $("#Taskid").val(column1);
		  $("#taskname").val(column2); 
		  var tid=$("#Taskid").val();
		  console.log(tid);
		  });
		
		$("#form").submit(function(){
			var taskId = $("#Taskid").val();
		    var taskname = $("#taskname").val();
		    var feedback = $("#taskfeedback").val();
		    var taskstatus = $("#taskstatus").val();

			if(taskId !=  "DEFAULT" && taskId != null && taskId != ""){
				
				console.log("taskid :"+taskId+"<br>" + taskname+"<br>" +feedback+"<br>" + taskstatus);
				
		   $.ajax({
						url : "Update_Task",
						type: "POST",
						data: {
							"taskId" : taskId,
							"taskfeedback": feedback,
							"taskstatus" : taskstatus
						},
						success : function(data) {
							console.log("feedback :"+feedback);
							location.reload("Employee/empHome.jsp");
						},
						  error:function(){
				              alert('error');
				            }
		   });
		   }
			else {
				alert("Which task is to be alloted");
			}
			

		});
	});
		
	</script>
<!-- 	<script>
	$(document).on("click", ".transfer-button", function() {
		var row = $(this).closest("tr");
		var column1 = row.find("td:nth-child(1)").text();
		   var column2 = row.find("td:nth-child(2)").text(); 

		$("#Taskid").val(column1);
		  $("#taskname").val(column2); 
	});
	</script> -->
	
<!-- 	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
</body>

</html>