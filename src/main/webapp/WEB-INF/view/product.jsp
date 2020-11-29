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
<link
	href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
 <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.js"></script>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container-fluid">
			
		  <ol class="breadcrumb align-items-center justify-content-between mb-4">
			<li class="breadcrumb-item">
		       <h3>Products</h3>	
            </li>
           <a href="../addNewProduct" class="d-none d-sm-inline-block btn btn-left btn-md btn-danger shadow-md"> Add New Product</a>
         </ol>
         <div class="card mb-3">
			<div class="card-body">
				<form action="" method="GET">
					<div class="table-responsive">
						<table class="table table-bordered" id="productJsonData">
							<thead>
								<tr class="card-header" style="background: #1875e7; color: white">
									<th>Name</th>
									<th>Category</th>
									<th>Price</th>
									<th>Weight</th>
									<th>Status</th>
									<th>Action</th>
									
								</tr>
							</thead>
							
						</table>
					</div>
				</form>
			</div>
		</div>
        
          
	</div>	
		

	</div>
	<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
	
	//Plug-in to fetch page data 
	jQuery.fn.dataTableExt.oApi.fnPagingInfo = function(oSettings) {
		return {
			"iStart" : oSettings._iDisplayStart,
			"iEnd" : oSettings.fnDisplayEnd(),
			"iLength" : oSettings._iDisplayLength,
			"iTotal" : oSettings.fnRecordsTotal(),
			"iFilteredTotal" : oSettings.fnRecordsDisplay(),
			"iPage" : oSettings._iDisplayLength === -1 ? 0 : Math
					.ceil(oSettings._iDisplayStart / oSettings._iDisplayLength),
			"iTotalPages" : oSettings._iDisplayLength === -1 ? 0 : Math
					.ceil(oSettings.fnRecordsDisplay()
							/ oSettings._iDisplayLength)
		};
	}; 

	$(document)
			.ready(
					function() {
						var currentPageNumber;
						$("#productJsonData")
								.dataTable(
										{
											"page" : 0,
											"bPaginate" : true,
											"pagingType" : "full_numbers",
											"sort" : "productId",
											"bStateSave" : false,
											"iDisplayLength" : 10,
											"iDisplayStart" : 0,
											"fnDrawCallback" : function() {
											},
											"sAjaxSource" : "product.web", // action
											"aoColumns" : [
													{
														"mData" : "pro_name"
													},
													{
														"mData" : "categoryEntity.pro_category"
													},
													{
														"mData" : "pro_price"
													},
													{
														"mData" : "pro_weight"
													},
													{
														"mData" : "pro_status"
													},
													{
														"mData" : "productId",
														"render" : function(mData, type, row, meta) {
															if (type === 'display') {
																data = '&nbsp&nbsp&nbsp&nbsp<a style="color: red" href="../editProduct/'+ mData + '"><i title="Edit Product" class="fa fa-edit"></i></a>&nbsp&nbsp&nbsp&nbsp<a style="color: red" href="../deleteProduct/'+ mData + '"><i title="Delete Product" class="fa fa-trash"></i></a>&nbsp&nbsp&nbsp&nbsp<a style="color: red" href="../viewProduct/'+ mData + '"><i title="View Product" class="fa fa-eye"></i></a>';
															}
															return data;
														}
													}
													 ]
										});

					});
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


</body>
</html>
<!--  
                            <tbody>
							   <c:forEach var="var" items="${productEntities}">
   								  <tr>
							         <td><c:out value="${var.getProductId()}"></c:out></td>
							         <td><c:out value="${var.getPro_name()}"></c:out></td>
							         <td><c:out value="${var.getCategoryEntity().getPro_category()}"></c:out></td>
							         <td><c:out value="${var.getPro_price()}"></c:out></td>
							         <td><c:out value="${var.getPro_weight()}"></c:out></td>
							         <td><c:out value="${var.getPro_status()}"></c:out></td>
							         <td>&nbsp&nbsp&nbsp&nbsp
							         <a style="color: red" href="${pageContext.request.contextPath}editProduct/${var.getProductId()}"><i title="Edit Product" class="fa fa-edit"></i></a>&nbsp&nbsp&nbsp&nbsp
							         <a style="color: red" href="${pageContext.request.contextPath}deleteProduct/${var.getProductId()}"><i title="Delete Product" class="fa fa-trash"></i></a>&nbsp&nbsp&nbsp&nbsp
							         <a style="color: red" href="${pageContext.request.contextPath}viewProduct/${var.getProductId()}"><i title="View Product" class="fa fa-eye"></i></a>
							         </td>
							     </tr>
							   </c:forEach>        
							</tbody>
-->