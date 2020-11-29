
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
<title>Order Details</title>
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
	<jsp:include page="header.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container-fluid">

			<div class="card mb-3">
				<h5>View Order Details</h5>
			</div>
			<table class="table table-bordered">
					<thead class="thead">
						<tr class="card-header" style="background: #1875e7; color: white">

                             <th scope="col">Customer</th>
							<th scope="col">Total Amount</th>
							<th scope="col">Total Quantity</th>
							<th scope="col">Payment Mode</th>
						    <th scope="col">Action</th>
						</tr>
					</thead>
			<c:forEach var="orderEntity" items="${orderEntity}">
			
					<tbody>
					<td>${orderEntity.customerEntity.firstName}</td>
					<td>${orderEntity.orderAmount}</td>
					<td>${orderEntity.totalQuantity}</td>
					<td>${orderEntity.paymentMode}</td>
					<td> <a class="btn btn-primary" href="../pdfreport/<c:out value="${orderEntity.orderId}"></c:out>">PdfReport</a></td>
					</tbody>
			
			</c:forEach>
			</table>
			</div>
		</div>




	<jsp:include page="footer.jsp"></jsp:include>

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
