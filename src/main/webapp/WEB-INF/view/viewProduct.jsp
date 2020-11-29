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
<title>View Product</title>
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
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><h3>Product</h3></li>
                  
			</ol>
	      <div class="card mb-3">
			<div class="card-body">
			
			<div class="table-responsive">
				 <table class="table table-bordered" id="#">
				      <tr>
   						 <th class="card-header" style="color: blue;">Image:</th>
   						 <td style="color: red;"><img src="${image}" width="300" height="200"></td>
 					 </tr>
 					 <tr>
   						 <th class="card-header" style="color: blue;">Name:</th>
   						 <td style="color: red;"><c:out value="${productForm.pro_name}"></c:out></td>
 					 </tr>
  					 <tr>
    					 <th class="card-header" style="color: blue;">Category:</th>
   						 <td style="color: red;"><c:out value="${productForm.pro_category}"></c:out></td>
 					 </tr>
				     <tr>
   						 <th class="card-header" style="color: blue;">Brand:</th>
   						 <td style="color: red;"><c:out value="${productForm.pro_brandname}"></c:out></td>
 					 </tr>
 					 <tr>
   						 <th class="card-header" style="color: blue;">Price:</th>
   						 <td style="color: red;"><c:out value="${productForm.pro_price}"></c:out></td>
 					 </tr>
 					 <tr>
    					 <th class="card-header" style="color: blue;">Weight:</th>
   						 <td style="color: red;"><c:out value="${productForm.pro_weight}"></c:out></td>
 					 </tr>
  					 <tr>
    					 <th class="card-header" style="color: blue;">Status:</th>
   						 <td style="color: red;"><c:out value="${productForm.pro_status}"></c:out></td>
 					 </tr>
				     <tr>
   						 <th class="card-header" style="color: blue;">Description:</th>
   						 <td style="color: red;"><c:out value="${productForm.pro_description}"></c:out></td>
 					 </tr>
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
