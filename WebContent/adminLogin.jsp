<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Admin login</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.js"></script>
 	<script>
$(document).ready(function(){
	$('#loginForm').submit(function(event){	
		event.preventDefault();
		var username = $('#username').val();
		var password = $('#password').val();
		var status = $('#status').val();
		if(username == "admin" && password =="admin"){
			console.log("login successful");
			window.location.href = "admin.jsp";
		} 
		else{
				 console.log("login unsuccessful");
				 swal("Sorry","Wrong Username or Password","failed");}
});
});
</script>
<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/adminStyle.css">
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">


	<div class="main" id="wrapper">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/signin-image.jpg" alt="sing up image">
						</figure>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Admin login</h2>
						<form method="post" action="" class="register-form"
							id="loginForm">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="username"
									placeholder="username" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Password" />
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit"  value="Log in" />
							</div>
						</form>

					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
</body>
</html>