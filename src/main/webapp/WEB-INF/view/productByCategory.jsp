
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
<title>Products</title>
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
	<%-- <jsp:include page="viewShopProduct.jsp"></jsp:include> --%>
	<div class="content-wrapper">
		<div class="container-fluid">
			<%-- <div class="col-md-6">
			<form action="../categoryProduct" method="get" id="myForm">
				<select class="form-control" onchange="submitForm()" name=categoryId>
				
									<option value="">Select Category</option>
									<c:forEach var="category" items="${ categoryEntity }">
											
												<option value="${category.categoryId }">${ category.pro_category }</option>
					
									</c:forEach>
								</select>
								</form> --%>
			<c:forEach var="productEntities" items="${productEntities}">
			
			<div class="card-body">
			
			<div class="table-responsive">
			
				 <table class="table table-bordered" id="#">
				      <tr>
   						 <th class="card-header" style="color: blue;"><img src="../ProImages/${productEntities.pro_image}" width="300" height="200"></th>
   						 <td style="color: red;" ><b>Product Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <c:out value="${productEntities.pro_name}"></c:out><br><br>
   						 Brand:  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${productEntities.pro_brandname}"></c:out><br><br>
   						 Price:  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${productEntities.pro_price}"></c:out><br><br>
   						 Weight:  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${productEntities.pro_weight}"></c:out><br><br>
   						 Description:  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${productEntities.pro_description}"></c:out><br><br>
   						  <a href="../addToCart/${productEntities.productId}" 
   						   class="btn btn-primary btn- active" >Add To Cart</a></b></td>
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
<script type="text/javascript">
function submitForm()
{

	document.getElementById("myForm").submit();
			alert("Hello")
}
</script>
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
