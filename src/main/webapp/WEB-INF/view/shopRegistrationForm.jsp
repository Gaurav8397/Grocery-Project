<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Login</title>
<link href="css/mdb.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/sb-admin.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script src="vendor/jquery/jquery.validate.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
</head>

<body>

	<header>
		<!-- Navbar -->
		<nav
			class="navbar navbar-expand-lg navbar-dark fixed-top scrolling-navbar">
			<div class="container">
				<a class="navbar-brand" href="/"> <strong><b>Grocery Application</b></strong>
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent-7"
					aria-controls="navbarSupportedContent-7" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent-7">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item "><a class="nav-link" href="index"><i
								class="fa fa-home" aria-hidden="true"></i> <span class="sr-only">(current)</span>
						</a></li>
					</ul>
					<div class="form-inline">
						<div class="md-form my-0">
							<ul class="navbar-nav mr-auto">
								<li class="nav-item active"><a class="nav-link"
									href="login">Login <span class="sr-only">(current)</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<div><br></br></div>
		
		<div class="view"
			style="background-image: url('images/grocery.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center; position: absulate">
			<div class="container">
				<div class="card card-register mx-auto mt-5">
					<div class="card-header" style="background: #1875e7; color: white;">
						<h2 style="text-align: center;">Shop Registration</h2>
					</div>
					<div class="card-body">
						<form:form modelAttribute="registerShopForm" id="registerShopForm" action="../registerShop"
					     method="POST" enctype="multipart/form-data">
					    
									<form:input class="form-control" id="registrationType" name="registrationType"
										path="registrationType" type="hidden" aria-describedby="registrationType"
										placeholder="Enter First Name" required="required"/>
						
					      <div class="form-group row">
					            <div class="col-6">
								<label class="control-label" for="firstName">First name
								</label>
									<form:input class="form-control" id="firstName" name="firstName"
										path="firstName" type="text" aria-describedby="firstName"
										placeholder="Enter First Name" required="required"/>
								</div>
							<div class="col-6">
								<label class="control-label" for="lastName">Last name
								</label>
								<form:input class="form-control" id="lastName" name="lastName"
										path="lastName" type="text" aria-describedby="lastName"
										placeholder="Enter Last Name" required="required"/>
								</div>
							</div>
							
							<div class="form-group row">
							<div class="col-6">
							  <label class="control-label" for="mobile">Mobile
								</label>
								
									<form:input class="form-control" id="mobile" name="mobile"
										path="mobile" type="text" aria-describedby="mobile"
										placeholder="Enter Mobile No." required="required"/>
								</div>
								<div class="col-6">
								<label class="control-label" for="email">Email address
								</label>
								
									<form:input class="form-control" id="email" name="email"
										path="email" type="email" aria-describedby="email"
										placeholder="Enter Email ID" required="required"/>
								</div>
							</div>
							
					        <div class="form-group row">
					        <div class="col-6">
								<label class="control-label" for="shopName">Shop name
								</label>
								
									<form:input class="form-control" id="shopName" name="shopName"
										path="shopName" type="text" aria-describedby="shopName"
										placeholder="Enter Shop Name" required="required"/>
								</div>
								 <div class="col-6">
								 <label class="control-label" for="image">Shop Image
								</label>
               						 <div class="custom-file">
 										 <input type="file"  name="file"  class="custom-file-input form-control form-control-user" 
 				 							id="file"  required="required"/>
 										 <label class="custom-file-label" for="file" data-browse="Select Image">Image</label>
									</div>
									</div>	
							    </div>
						
							 <div class="form-group row">
							 <div class="col-6">
								<label class="control-label" for="addressLine1">Address line 1
								</label>
								
									<form:input class="form-control" id="addressLine1" name="addressLine1"
										path="addressLine1" type="text" aria-describedby="addressLine1"
										placeholder="House no and street name" required="required"/>
								</div>
								<div class="col-6">
								<label class="control-label" for="addressLine2">Address line 2
								</label>
								
									<form:input class="form-control" id="addressLine2" name="addressLine2"
										path="addressLine2" type="text" aria-describedby="addressLine2"
										placeholder="Appartment, suit, unit, etc.." required="required"/>
								</div>
							</div>
							
							
							 <div class="form-group row">
							 <div class="col-6">
								<label class="control-label" for="city">City
								</label>
								
									<form:input class="form-control" id="city" name="city"
										path="city" type="text" aria-describedby="city"
										placeholder="Enter City" required="required"/>
								</div>
								<div class="col-6">
								<label class="control-label" for="state">State
								</label>
								
									<form:input class="form-control" id="state" name="state"
										path="state" type="text" aria-describedby="state"
										placeholder="Enter State" required="required"/>
								</div>
							</div>
					       <div class="form-group row">
				             <div class="col-6">
								<label class="control-label" for="pincode">Pincode
								</label>
								
									<form:input class="form-control" id="pincode" name="pincode"
										path="pincode" type="text" aria-describedby="pincode"
										placeholder="Enter Pincode" required="required"/>
								</div>
							</div>	
					 <button type="submit" class="btn btn-block"
								style="background-color: #1875e7;">Register</button>
				</form:form>
						
					</div>
				</div>
			</div>
      
      </div>
      
	</header>


</body>
</html>