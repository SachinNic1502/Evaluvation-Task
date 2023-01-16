<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Add Employee</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/adminStyle.css" />
<style type="text/css">
.input-control input:focus {
    outline: 0;
}

.input-control.success input {
    border-color: #09c372;
}

.input-control.error input {
    border-color: #ff3860;
}

.input-control .error {
    color: #ff3860;
    font-size: 9px;
    height: 13px;
}
</style>
</head>
<body>

<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

	<div class="main" id="wrapper">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title second-text fs-4">Add Employee</h2>
					
						<form method="post" action="" class="register-form"
							id="register-form">
							<div class="form-group input-control">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Your Name" required/>
									<div class="error"></div>
							</div>
							<div class="form-group input-control">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" required/>
									<div class="error"></div>
							</div>
							<div class="form-group input-control">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password" required/>
									<div class="error"></div>
							</div>
							<div class="form-group input-control">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" required/>
									<div class="error"></div>
							</div>
							<div class="form-group input-control">
								<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="contact" id="contact"
									placeholder="Contact no" maxlength="10" required/>
									<div class="error"></div>
							</div>
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" required="required"/> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" onclick="console.log(submitted);" value="Register" />
									<a href="admin.jsp"><input type="button" 
									class="form-submit"  value="Back" /></a>
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup-image.jpg" alt="sing up image">
						</figure>
						
					</div>
				</div>
			</div>
		</section>
	

	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

<script type="text/javascript">

 var status = document.getElementById("status").value;
 if(status == "success"){
	 swal("Congrats","Account Created Successfully","success");
 }
 
	const form=document.getElementById('register-form');
	const username=document.getElementById('name');
	const email=document.getElementById('email');
	const password=document.getElementById('pass');
	const password2=document.getElementById('re_pass');
	const contact=document.getElementById('contact');
	
	form.addEventListener('keyup', e => {
		 e.preventDefault();

		 validateInputs();
		 });
	const isValidEmail = email => {
	    const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	    return re.test(String(email).toLowerCase());
	}
	const setError = (element, message) => {
		  const inputControl = element.parentElement;
		  const errorDisplay = inputControl.querySelector('.error');

		  errorDisplay.innerText = message;
		  inputControl.classList.add('error');
		  inputControl.classList.remove('success')
		}
		const setSuccess = element => {
		  const inputControl = element.parentElement;
		  const errorDisplay = inputControl.querySelector('.error');

		  errorDisplay.innerText = '';
		  inputControl.classList.add('success');
		  inputControl.classList.remove('error');
		};
		const validateInputs = () => {
			
			  const username_val = username.value.trim();
			  const email_val =email.value.trim();
			  const passwordValue=password.value.trim();
			  const password2Value= password2.value.trim();
			  const contact_val= contact.value.trim();
			  
			  if(true){
				    if(username_val === '') {
				      setError(username, 'Employee is required');
				  } else {
				      setSuccess(username);
				  }
				    if(email_val === '') {
			            setError(email, 'Email is required');
			        } else if (!isValidEmail(email_val)) {
			            setError(email, 'Provide a valid email address');
			        } else {
			            setSuccess(email)
;
			        }
				    
				    if(passwordValue === '') {
			            setError(password, 'Password is required');
			        } else if (passwordValue.length < 8 ) {
			            setError(password, 'Password must be at least 8 character.')
			        } else {
			            setSuccess(password);
			        }

			        if(password2Value === '') {
			            setError(password2, 'Please confirm your password');
			        } else if (password2Value !== passwordValue) {
			            setError(password2, "Passwords doesn't match");
			        } else {
			            setSuccess(password2);
			        }
				    
				   if(contact_val === '') {
				    setError(contact, 'Mobile is required');
				} else if (contact_val.length < 10  ) {
				    setError(contact, 'Mobile must be at least 10 number.')
				} else {
				    setSuccess(contact);
				}
				  
				
			}else{
				alert("Hello");
			}
		}
		
	 $("#register-form").submit(function(){
			var name = $("#name").val();
		    var email = $("#email").val();
		    var pass = $("#pass").val();
		    var contact = $("#contact").val();

			if(name !=  "DEFAULT" && name != null && name != ""){
				
				console.log("name :"+name+"<br>" + email+"<br>" +contact);
				
		   $.ajax({
						url : "registration",
						type: "POST",
						data: {
							"name" : name,
							"email": email,
							"pass" : pass,
							"contact":contact
						},
						success : function(data) {
							console.log("name :"+name);
							location.reload("registration.jsp");
						},
						  error:function(){
				              alert('error');
				            }
		   });
		   }
			else {
				alert("name error");
			}
			

		});

</script>

</body>

</html>