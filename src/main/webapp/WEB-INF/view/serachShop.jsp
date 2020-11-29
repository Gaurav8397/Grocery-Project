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
<title>Home</title>
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
				<a class="navbar-brand" href="/"> <strong><b>Grocery Application
							 </b></strong>
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent-7"
					aria-controls="navbarSupportedContent-7" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent-7">
					 <ul class="navbar-nav mr-auto">
						<li class="nav-item active" title="Home"><a class="nav-link" href="../userHome"><i class="fa fa-home" aria-hidden="true"></i>
								<span class="sr-only">(current)</span>
						</a></li>
					</ul>
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" data-toggle="modal"
						data-target="#logoutModal" style="color:#fff;"> ${loggedUser} <i class="fa fa-fw fa-sign-out"></i>Logout
						</a></li>
					</ul>
				</div>
			</div>
		</nav>
		
		<br>
		<div class="view"
			style="background-image: url('images/grocery.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center; position: absulate">
			<br><br>
			<div class="container">
				<div class="card card-serach mx-auto mt-5">
					<div class="card-header" style="background: black; color: white;">
						<h2>Search</h2>
					</div>
					<div class="card-body">
							<form:form  modelAttribute="registerShopForm" id="registerShopForm" action="../searchShop" method="POST">
		                 	 Search: <input type="text" name="pincode" id="pincode" size="50" placeholder="Enter Your Pincode" />
                                     &nbsp;
                               <input type="submit" value="Search" />
							
							</form:form>
         
     
					</div>
				</div>
			</div>
		</div>
	</header>

<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>