
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>My Account</title>
<link
	href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/sb-admin.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/esp-style.css"
	rel="stylesheet">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<jsp:include page="userHeader.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container-fluid">

		 <ol class="breadcrumb align-items-center justify-content-between mb-4">
			<li class="breadcrumb-item">
		       <h3>My Account</h3>	
            </li>
         </ol>
         <div class="card mb-1">
			<div class="row">
              
               <div class="p-5">
				<p>
					<b><label>First Name : </label></b>&nbsp;&nbsp;
					<c:out value="${customerEntity.firstName}"></c:out>
				</p>

				<p>
					<b><label>Last Name : </label></b>&nbsp;&nbsp;
					<c:out value="${customerEntity.lastName}"></c:out>
				</p>
				
				<p>
					<b><label>Mobile No. : </label></b>&nbsp;&nbsp;
					<c:out value="${customerEntity.mobile}"></c:out>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<i style="color: red" data-toggle="modal" data-target="#mobile" title="Edit Mobile No." class="fa fa-edit"></i>
				</p>
				
				<p>
					<b><label>Email Id : </label></b>&nbsp;&nbsp;
					<c:out value="${customerEntity.email}"></c:out>
				</p>
				</div>
			</div>
          </div>
	    </div>
	</div>	
		
	<jsp:include page="footer.jsp"></jsp:include>

     <jsp:include page="changeMobile.jsp"></jsp:include>
     
<script
	src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.js"></script>
<script src="${pageContext.request.contextPath}/js/sb-admin.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/sb-admin-datatables.min.js"></script>
</body>
</html>
