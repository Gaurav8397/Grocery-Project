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
<title>My Orders</title>
<link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/esp-style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
 <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.js"></script>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<jsp:include page="userHeader.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container-fluid">
			
		  <ol class="breadcrumb align-items-center justify-content-between mb-4">
			<li class="breadcrumb-item">
		       <h3>My Orders</h3>	
            </li>
         </ol>
         <div class="card mb-3">
			<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="#">
							<thead>
								<tr class="card-header" style="background: #1875e7; color: white">
									<th>#</th>
									<th>Date</th>
									<th>Status</th>
									<th>Amount</th>
									<th>Payment Mode</th>
								</tr>
							</thead>
							<tbody>
							   <c:forEach var="var" items="${orderEntities}">
   								  <tr>
   								     <td><c:out value="${var.getOrderId()}"></c:out></td>
							         <td><c:out value="${var.getOrderDate()}"></c:out></td>
							         <td><c:out value="${var.getOrderStatus()}"></c:out></td>
							         <td><c:out value="${var.getTotalAmount()}"></c:out></td>
							         <td><c:out value="${var.getPaymentMode()}"></c:out></td>
							     </tr>
							   </c:forEach>        
							</tbody>
						</table>
					</div>
				
			</div>
		</div>
        
          
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
<!--  
     
							         &nbsp&nbsp&nbsp&nbsp
							         
							                               
-->