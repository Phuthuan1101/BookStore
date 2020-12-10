<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="fontawesome/css/all.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<!-- css của mình phải để sau cùng fuck that -->
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/product.css">
</head>
<body>
								<form action="SignUpController" method="post" >
								    <div class="modal-content">
								      <div class="modal-header text-center">
								        <h4 class="modal-title w-30 font-weight-bold"> Sign up</h4>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          								<span aria-hidden="true">&times;</span>
	          							</button>
								      </div>
								        <div class="md-form mb-3">
								          <i class="fas fa-user prefix grey-text"></i>
								          <input type="text" id="orangeForm-name" class="form-control validate" name="yourname" placeholder="Your Name">
								        </div>
								        
								        <div class="md-form mb-3">
								          <i class="fas fa-user prefix grey-text"></i>
								          <input type="username" id="orangeForm-pass" class="form-control validate" name="username" placeholder="User Name">
								        </div>
								
								        <div class="md-form mb-3">
								          <i class="fas fa-envelope prefix grey-text"></i>
								          <input type="email" id="orangeForm-email" class="form-control validate" name="email" placeholder="Email">
								        </div>
								
								        <div class="md-form mb-3">
								          <i class="fas fa-lock prefix grey-text"></i>
								          <input type="password" id="orangeForm-pass" class="form-control validate" name="password" placeholder="Password">
								        </div>
								
								        <div class="md-form mb-3">
								          <i class="fas fa-phone-rotary prefix grey-text "></i>
								          <input type="numberphone" id="orangeForm-pass" class="form-control validate" name="phone" placeholder="Number Phone">
								        </div>
								
								        <div class="md-form mb-3">
								          <i class="fas fa-address-card prefix grey-text "></i>
								          <input type="address" id="orangeForm-pass" class="form-control validate" name="address" placeholder="Address">
								        </div>
								
								      </div>
								      <div class="text-center mb-3">
								          <button type="submit" class="btn blue-gradient btn-block btn-rounded z-depth-1a">Sign Up</button>
								       </div>
								    </div>	
							</form>
</body>
</html>