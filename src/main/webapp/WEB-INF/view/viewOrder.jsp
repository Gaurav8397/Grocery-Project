
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
				<h1>View Order Details</h1>
			</div>
			<c:forEach var="orderEntity" items="${orderEntity}">
				<p>
					<b><label>Order date : </label></b>&nbsp;&nbsp;
					<c:out value="${orderEntity.orderDate}"></c:out>
				</p>

				<p>
					<b><label>Order # </label></b>&nbsp;&nbsp;
					<c:out value="${orderEntity.orderId}"></c:out>
				</p>
				<p>
					<b><label>Order total# </label></b>&nbsp;&nbsp;
					<c:out value="${orderEntity.totalAmount}"></c:out>
				</p>

				<hr>
				<h4>Shipping Address</h4>
				<hr>
				<p>
					<b><label>Customer Name : </label></b>&nbsp;&nbsp;
					<c:out value="${orderEntity.customerEntity.firstName}"></c:out>
					&nbsp;&nbsp;
					<c:out value="${orderEntity.customerEntity.lastName}"></c:out>
				</p>
				<p>
					<b><label>Address : </label></b>&nbsp;&nbsp;
					<c:out value="${orderEntity.addressEntity.addressLine1}"></c:out>
					&nbsp;&nbsp;
					<c:out value="${orderEntity.addressEntity.addressLine2}"></c:out>
					&nbsp;&nbsp;
					<c:out value="${orderEntity.addressEntity.city}"></c:out>
				
				<br>
				<c:out value="${orderEntity.addressEntity.state}"></c:out>&nbsp;&nbsp;<c:out
					value="${orderEntity.addressEntity.pincode}"></c:out>
			    </p>
				<p>
					<b><label>Phone : </label></b>&nbsp;&nbsp;
					<c:out value="${orderEntity.customerEntity.mobile}"></c:out>
				</p>
				<hr>
				<h4>Payment Information</h4>
				<h6>Payment Method</h6>
				<c:out value="${orderEntity.paymentMode}"></c:out>
				
	  </c:forEach>
			<hr>
			<h4>Order Summary</h4>
			<div class="table-responsive" style="overflow: auto">
				<table class="table table-bordered">
					<thead class="thead">
						<tr class="card-header" style="background: #1875e7; color: white">


							<th scope="col">Name</th>
							<th scope="col">Brand Name</th>
							<th scope="col">Price</th>
							<th scope="col">Quantity</th>
							<th scope="col">Total Price</th>
							<th scope="col">Packed</th>
							<th scope="col">Remove</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="productAmount" value="${0}"></c:set>

						<c:forEach var="orderEntities" items="${orderEntity}">

							<c:forEach var="productEntities"
								items="${orderEntities.productEntities}">
								<c:set var="productAmount"
									value="${productEntities.productQuantity*productEntities.productPrice}"></c:set>
								
								<tr>
								
								
								
									<td><input class="form-control" id="productName"
										name="productName" type="text" aria-describedby="productName"
										value="${productEntities.productName}" disabled="disabled" /></td>
									<td><input class="form-control" id="productBrandName"
										name="productBrandName" type="text"
										value=" ${productEntities.productBrandName}"
										disabled="disabled" /></td>

									<td><input class="form-control"
										id="productPrice${productEntities.orderProductId}"
										name="productPrice" type="text"
										value=" ${productEntities.productPrice}" disabled="disabled" /></td>
									<td>
										
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"><input type="button"
													class="btn btn-success" value="+" id="plusBtn"
													disabled="disabled"
													onclick="getQuantity(${productEntities.orderProductId},this.value)" />
												</span>
												
											</div>
											<input class="form-control" id="productQuantity${productEntities.orderProductId}"
											type="text" value=" ${productEntities.productQuantity}" name="productQuantity"> 
												<div class="input-group-append">
													<span class="input-group-text"><input type="button"
														class="btn btn-danger" value="-" id="minusBtn"
														onclick="getQuantity(${productEntities.orderProductId},this.value)" /></span>
												</div>
										</div>
									</td>
									<td><input class="form-control"
										id="productTotalPrice${productEntities.orderProductId}"
										name="productTotalPrice" type="text" disabled="disabled"
										value="${productAmount}" /></td>

									<td><button  class="btn btn-primary btn- active"   onclick="updateProduct(${productEntities.orderProductId})">Packed</button></td>

									<td>&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: red" onclick="getTotalOrderAmt()" href="../removeOrderProduct/${productEntities.orderProductId}/${orderEntities.orderId}"><i title="Remove" class="fa fa-times"></i></a></td>

								</tr>
								
							</c:forEach>
							
					</table>
					
							<b><label>Delivery Charge</label>:</b>
							<input id="deliveryCharge" name="deliveryCharge" type="text"
								value="${orderEntities.deliveryCharge}" disabled="disabled" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<b><label>Total Amount</label></b>
							<input id="orderTotalAmount" name="productOrderTotalPrice"
								type="text" value="${orderEntities.totalAmount}"
								disabled="disabled" />
								<hr>
							<%-- <button class="btn" onclick="updateOrder(${orderEntities.orderId})">Process</button> --%>
							<button type="button"  class="btn btn-primary btn-lg btn-block" onclick="updateOrder(${orderEntities.orderId})">Process</button>
							
					</c:forEach>
					
				<hr>
					 <a class="btn btn-primary btn-lg active" href="../orders.web">Back</a>
								
						
			</div>
		</div>

</div>


	<jsp:include page="footer.jsp"></jsp:include>

<script>
function getTotalOrderAmt(){
	var totalAmt=0;
	$.each($("input[name='productTotalPrice']"), function(){
		totalAmt +=parseInt($(this).val());
    });
    $("#orderTotalAmount").val(totalAmt);
	
}
function updateOrder(id){

	var total = $('#orderTotalAmount').val();
	//var quantity = $('#productQuantity'+id).val();
	
	var inputs = [];	
	inputs.push('total=' + total);
	inputs.push('orderId=' + id);

	var str = inputs.join('&');
	jQuery.ajax({
		type : "POST",
		url : "../updateOrder",
		data	: str + "&reqType=AJAX",
		success : function(response) {
			alert(response);
			}
	});		
}
function updateProduct(id){
	
	var total = $('#productTotalPrice'+id).val();
	var quantity = $('#productQuantity'+id).val();
	
	var inputs = [];	
	inputs.push('total=' + total);
	inputs.push('productId=' + id);
	inputs.push('quantity=' + quantity);

	var str = inputs.join('&');
	jQuery.ajax({
		type : "POST",
		url : "../packedOrder",
		data	: str + "&reqType=AJAX",
		success : function(response) {
			alert(response);
			}
	});	
}

   function getQuantity(id, value) {
		var quantity = 0;
		if (value == "+") {
			quantity = parseInt($("#productQuantity" + id).val());
			quantity = quantity + 1;
		} else if (value == "-") {
		
			quantity = parseInt($("#productQuantity" + id).val());
			
			if (quantity > 1) {
				
				quantity = quantity - 1;
				var price = $("#productPrice" + id).val();
				var total = price * quantity;
				var totalOrder = $("#orderTotalAmount").val();
				totalOrder = totalOrder - price;
				<c:set var="quantity" value="quantity" scope="session"/>

				$("#productQuantity" + id).val(quantity);
				$("#productTotalPrice" + id).val(total);
				$("#orderTotalAmount").val(totalOrder);
				
			} else {
				alert("You have must 1 Product Quntity");
			}

		}

		
		/*  getTotalOrderAmt();
		
		
		}

		function getTotalOrderAmt(){
		var totalAmt=0;
		$.each($("input[name='productTotalPrice']"), function(){
		totalAmt +=parseInt($(this).val());
		});
		$("#orderTotalAmount").val(totalAmt);
		 */
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
</body>
</html>
