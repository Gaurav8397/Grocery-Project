
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
<title>Shop Listing</title>
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
	<jsp:include page="userHeader1.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="card mb-3">
			<c:forEach var="shopEntities" items="${shopEntities}">
			
			<div class="card-body">
			
			<div class="table-responsive">
			
				 <table class="table table-bordered" id="#">
				      <tr>
   						 <th class="card-header" style="color: blue;"><img src="../ProImages/${shopEntities.image}" width="300" height="200"></th>
   						 <td style="color: red;"><b>Shop Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${shopEntities.shopName}"></c:out><br><br>
   						 Address: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${shopEntities.addressLine1}"></c:out><br><br>
   						 <c:out value="${shopEntities.addressLine2}"></c:out><br><br>
   						  Mobile: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${shopEntities.mobile}"></c:out><br><br>
   						   <a class="btn btn-primary btn- active"
											href="../viewShopProduct/${shopEntities.shopId}">View</a></b></td>
 					 </tr>
			   </table>
		     
           </div>
          </div>
          </c:forEach>
	    </div>
				
			</div>
				
		</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
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

</html>
