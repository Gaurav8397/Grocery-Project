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
<title>Check Out</title>
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

		 
			<hr>
			<h4 style="align-items: center;">Check Out</h4>
			<div class="table-responsive" style="overflow: auto">
				<table class="table table-bordered">
					<thead class="thead">
						<tr class="card-header" style="background: #1875e7; color: white">
							<th scope="col">Product Name</th>
							<th scope="col">Price</th>
							<th scope="col">Quantity</th>
							<th scope="col">Total Price</th>
							<th scope="col">Remove</th>
						</tr>
					</thead>
					
					<tbody id="b">
						<c:set var="productAmount" value="${0}"></c:set>

						<c:set var="productQuntity" value="${1}"></c:set>

							<c:forEach var="productEntities" items="${cartEntity.getProductEntities()}">
								<c:set var="productAmount"
									value="${productQuntity*productEntities.pro_price}"></c:set>
								<c:set var="totalAmount"
									value="${totalAmount+productAmount}"></c:set>
								<tr>
								
								   
								
									<td><input class="form-control" id="productName"
										name="productName"  type="text" aria-describedby="productName"
										value="${productEntities.pro_name}" readonly="true"/></td>
									

									<td><input class="form-control"
										id="productPrice${productEntities.productId}"
										name="productPrice" type="text"
										value=" ${productEntities.pro_price}" readonly="true" /></td>
									<td>
										
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"><input type="button"
													class="btn btn-success" value="-" id="minusBtn"
													onclick="getQuantity(${productEntities.productId},this.value)" />
												</span>
												
											</div>
											
											<input class="form-control" id="productQuantity${productEntities.productId}"
											  type="text" value=" ${productQuntity}" name="productQuantity" readonly="true"/> 
											
												<div class="input-group-append">
													<span class="input-group-text"><input type="button"
														class="btn btn-danger" value="+" id="plusBtn"
														onclick="getQuantity(${productEntities.productId},this.value)" />
													</span>
												</div>
										</div>
									</td>
									<td><input class="form-control"
										id="productTotalPrice${productEntities.productId}"
										name="productTotalPrice" type="text" readonly="true"
										value="${productAmount}" /></td>

									<td>&nbsp&nbsp&nbsp&nbsp<a style="color: red" href="../removeCartItem/${productEntities.productId}"><i title="Remove" class="fa fa-times"></i></a></td>
                                    
                                     <td hidden="hidden"><input class="form-control" id="productId"
										name="productId"  type="hidden" aria-describedby="productId"
										value="${productEntities.productId}" readonly="true"/></td>
								</tr>
								</c:forEach>
			      
				</table>
		<hr>
		<form:form class="user" modelAttribute="cartForm" id="cartForm" action="../placeOrder" method="post">
					<br> <c:forEach var="var" items="${addressEntities}">
					     <div class="card mb-1">
					      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					       <div class="form-check">
					       
                            <label class="form-check-label">&nbsp;&nbsp;&nbsp;
                            <input type="radio" class="form-check-input" name="address" value="${var.addressId}" required="required">
                           
                               <div class="row"> 
                 					<div class="row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  					 <div class="col-3"> 
				   					<b><label>Address # :</label></b>
				   					
				    				 </div>
				     			   </div>
				     				<div class="row">
				                     
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
								
                             </label>
                           
                          </div>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          </div>
						 </c:forEach>
                            	
				        <hr>
				        
				        <c:set var="deliveryCharge"
									value="40"></c:set>
										
						<c:set var="orderTotalAmount"
							value="${totalAmount+deliveryCharge}"></c:set>	
							<div class="row">
							<div class="col-3"></div>
							<div class="col-3">
							<b><label>Total Amount</label></b>
							<form:input path="productOrderTotalPrice" class="form-control" id="totalAmount" name="productOrderTotalPrice"
								type="text" value="${totalAmount}"
								readonly="true" />
								</div>
								<div class="col-3">	
				            <b><label>Delivery Charge</label>:</b>
							<form:input path="deliveryCharge" class="form-control" id="deliveryCharge" name="deliveryCharge" type="text"
								value="40" readonly="true"/>
								</div>
									<div class="col-3">
							<b><label>Order Total Amount</label></b>
							<form:input path="OrderTotalPrice" class="form-control" id="orderTotalAmount" name="OrderTotalPrice"
								type="text" value="${orderTotalAmount}"
								readonly="true" />
								</div>
								</div>
								<hr>
			<div class="row">
				<div class="col-9">
				</div>
				<div class="col-3">
				<button type="submit" class="btn btn-danger btn-user btn-block float-right" onclick="update()">Place Order</button>
				</div>
	  	  </div>
				<hr>
				</form:form>
			</div>
		 </div>
    </div>

   

	<jsp:include page="footer.jsp"></jsp:include>

<script>


	function getQuantity(id, value) {
		var quantity = 0;
	    if (value == "-") {
		
			quantity = parseInt($("#productQuantity" + id).val());
			
			if (quantity > 1) {
				
				quantity = quantity - 1;
				var price = $("#productPrice" + id).val();
				var total = price * quantity;
				var totalOrder = $("#totalAmount").val();
				var orderTotalAmount= $("#orderTotalAmount").val();
				orderTotalAmount=parseInt(orderTotalAmount) - parseInt(price);
				totalOrder = totalOrder - price;
				<c:set var="quantity" value="quantity" scope="session"/>

				$("#productQuantity" + id).val(quantity);
				$("#productTotalPrice" + id).val(total);
				$("#totalAmount").val(totalOrder);
				$("#orderTotalAmount").val(orderTotalAmount);
				//updateProduct(id,total,quantity);
				
			} else {
				alert("You must have at least 1 Product");
			}

		}

	    if (value == "+") {
			
			quantity = parseInt($("#productQuantity" + id).val());
	
				quantity = quantity + 1;
				var price = $("#productPrice" + id).val();
				var total = price * quantity;
				var totalOrder = $("#totalAmount").val();
				var orderTotalAmount= $("#orderTotalAmount").val();
				orderTotalAmount=parseInt(orderTotalAmount) + parseInt(price);
			    var amount = parseInt(totalOrder) + parseInt(price);
				<c:set var="quantity" value="quantity" scope="session"/>

				$("#productQuantity" + id).val(quantity);
				$("#productTotalPrice" + id).val(total);
				$("#totalAmount").val(amount);
				$("#orderTotalAmount").val(orderTotalAmount);
				//updateProduct(id,total,quantity);
		}
	    
	}
/*function placeOrder(id){


	
	var obj;
	obj.proId=id;
	obj.total=$('#productTotalPrice'+id).val();
	obj.quantity = $('#productQuantity'+id).val();
	//var total = $('#productTotalPrice'+id).val();
	//var quantity = $('#productQuantity'+id).val();
	
	var inputs = [];	
	/*inputs.push('total=' + total);
	inputs.push('productId=' + id);
	inputs.push('quantity=' + quantity);
	inputs.push('product='+obj);
	//var str = inputs.join('&');
	jQuery.ajax({
		type : "POST",
		url : "../packedOrder",
		data	: str + "&reqType=AJAX",
		success : function(response) {
			alert(response);
			}
	});	
}*/
	
	
	
	function update(){
			alert('In data');
		var myObjects = [];
	    $('#b tr').each(function(index, item) {
	        var $item = $(item);
	        myObjects.push({
	        	productId: $item.find("td input[name='productId']").val(),
	        	productQuantity: $item.find("td input[name='productQuantity']").val(),
	        	productTotalPrice: $item.find("td input[name='productTotalPrice']").val(),
	        });
	    });
	   
	   $.ajax({
	        url: '/updateCart',
	        method: 'POST',
	        contentType : 'application/json; charset=utf-16',
	        data: JSON.stringify(myObjects)
	    })
	    .done(function(myObjects) {
	        // handle success
	    })
	    .fail(function() {
	        // handle fail
	    });
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
