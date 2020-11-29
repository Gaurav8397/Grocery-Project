
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
</head>

<nav class="navbar navbar-expand-lg navbar-dark  fixed-top" id="mainNav" style="background:#6b63a7">
	<a class="navbar-brand" href="#">Grocery Application</a>
	<button class="navbar-toggler navbar-toggler-right" type="button"
		data-toggle="collapse" data-target="#navbarResponsive"
		aria-controls="navbarResponsive" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarResponsive" >
	               <ul class="navbar-nav mr-auto">
						<li class="nav-item active" title="Home"><a class="nav-link" href="../userHome"><i class="fa fa-home" aria-hidden="true"></i>
								<span class="sr-only">(current)</span>
						</a></li>
					</ul>
					
					
					
		<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
			<li><br></li>
			<li class="nav-item " data-toggle="tooltip" data-placement="right"
				title="My Orders"><a class="nav-link" href="${pageContext.request.contextPath}/orders">
				<i class="fa fa-fw fa-list-alt"></i> <span class="nav-link-text">My Orders</span>
			</a></li>
			
			
			<li class="nav-item " data-toggle="tooltip" data-placement="right"
				title="My Account"><a class="nav-link" href="${pageContext.request.contextPath}/profile">
				<i class="fa fa-fw fa-user"></i> <span class="nav-link-text">My Account</span>
			</a></li>
			
			<li class="nav-item " data-toggle="tooltip" data-placement="right"
				title="Addresses"><a class="nav-link" href="${pageContext.request.contextPath}/addresses">
				<i class="fa fa-fw  fa-address-book-o"></i> <span class="nav-link-text">Addresses</span>
			</a></li>
			
			<li class="nav-item " data-toggle="tooltip" data-placement="right"
				title="Change Password"><a class="nav-link" href="${pageContext.request.contextPath}/changePassword">
				<i class="fa fa-fw fa-unlock-alt"></i> <span class="nav-link-text">Change Password</span>
			</a></li>
			
			<li class="nav-item " data-toggle="tooltip" data-placement="right"
				title="Change Password"><a class="nav-link" href="${pageContext.request.contextPath}/checkOut">
				<i class="fa fa-fw fa-unlock-alt"></i> <span class="nav-link-text">Check Out</span>
			</a></li>
			
		</ul>
		<ul class="navbar-nav sidenav-toggler" >
			<li class="nav-item"><a class="nav-link text-center"
				id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
			</a></li>
		</ul>
		<ul class="navbar-nav ml-auto">
		    
			<li class="nav-item"><a class="nav-link" data-toggle="modal"
				data-target="#logoutModal" style="color:#fff;"> ${loggedUser} <i class="fa fa-fw fa-sign-out"></i>Logout
			</a></li>
			<li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</li>
		</ul>
	</div>
</nav>