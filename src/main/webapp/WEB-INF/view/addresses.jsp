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
<title>Addresses</title>
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
		       <h3>Addresses</h3>	
            </li>
            <button class="d-none d-sm-inline-block btn btn-left btn-md btn-danger" data-toggle="modal" data-target="#address">
             Add New Address</button>
         </ol>
			<c:forEach var="var" items="${addressEntities}">
			   <div class="card mb-1">
			    <div class="row">
                  <div class="col-2"></div>
             
                  <div class="p-5">
                  <div class="row">
                   <div class="col-3"> 
				   <b><label>Address #<c:out value="${var.addressId}"></c:out> : 
				     </label></b>
				     </div>
				     <div class="col-3"></div>
				     <a style="color: red;" href="../removeAddress/${var.addressId}">
				     <i title="Remove" class="fa fa-times"></i>
				    </a>
				     <br><br>
				  </div>
				     <div class="row">
				     <div class="col-2"></div>
				     <div class="col-9">
					  <c:out value="${var.addressLine1}"></c:out>
					   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					   <c:out value="${var.addressLine2}"></c:out>
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				         
				        <c:out value="${var.city}"></c:out>
				       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				       <c:out value="${var.state}"></c:out>
				        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
				     <c:out value="${var.pincode}"></c:out>
				     </div>
			       </div>
			      </div>
			    </div>
		    </div>
          </c:forEach>
			</div>
		</div>		
	<jsp:include page="footer.jsp"></jsp:include>
   <jsp:include page="addNewAddress.jsp"></jsp:include>

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
