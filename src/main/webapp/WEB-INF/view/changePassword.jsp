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
<title>Change Password</title>
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
		<div class="view" style="background-image: url('images/grocery.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center; position: absulate">
			<div class="container">
				<div class="card card-login mx-auto mt-5">
					<div class="card-header" style="background: #1875e7; color: white;">
						<h2>Reset Password</h2>
					</div>
      <div class="card-body">
        <div class="text-center mt-4 mb-5">
          <h4>Forgot your password?</h4>
          <p>Enter old password and new password to reset your password.</p>
        </div>
        <form:form modelAttribute="changePassForm" action="../changePassword" method="POST">
                            
                             <div class="form-group">
								
								<div class="col-sm-15">
									<form:input class="form-control" id="userName" name="userName"
										path="userName" type="hidden" value="${changePassForm.getUserName()}" />
									<form:input class="form-control" id="status" name="status"
										path="status" type="hidden" value="${changePassForm.getStatus()}" />
								</div>
								</div>
								<div class="form-group">
								<label class="col-sm-15 control-label" for=oldPass>Old Password
								</label>
								<div class="col-sm-15">
									<form:input class="form-control" id="oldPass" name="oldPass"
										path="oldPass" type="password" aria-describedby="oldPass"
										placeholder="Enter Old Password" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-15 control-label" for="newPass1">New Password</label>
								<div class="col-sm-15">
									<form:input class="form-control" id="newPass1" name="newPass1"
										path="newPass1" type="password" placeholder="Enter New Password" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-15 control-label" for="newPass">Confirmed Password</label>
								<div class="col-sm-15">
									<form:input class="form-control" id="newPass" name="newPass"
										path="newPass" type="password" placeholder="Confirmed Password" />
								</div>
							</div>
          <button type="submit" class="btn btn-block"
								style="background-color: #1875e7;">Reset Password</button>
        </form:form>
      </div>
    </div>
    </div>
  </div>
  </header>
  
</body>

</html>