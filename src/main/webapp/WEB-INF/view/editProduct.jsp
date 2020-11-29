
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Edit Product</title>
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
				
				
             
        <!-- Nested Row within Card Body -->
          <div class="row">
           <div class="col-4 ">
           <div class="p-4">
               <br><br><br>
                  <img src="../ProImages/${productForm.pro_image}" width="400" height="400">
             </div>
             </div>
              <div class="col-lg-8">
            <div class="p-5">
    
              <div class="text-center">
              
            <ol class="breadcrumb">
			    <li class="breadcrumb-item" ><h3>Edit Product</h3></li>	
			
			</ol>
                
              </div>
              <hr>
               <form:form class="user" modelAttribute="productForm" id="productForm" action="../changeProduct" method="post" enctype="multipart/form-data">
                
                 <div class="form-group">
                  <form:input type="text" path="pro_category" name="pro_category" class="form-control form-control-user" 
                  id="pro_category" aria-describedby="pro_category" placeholder="Product Category" readonly="true"/>     
			    </div>
			
                <div class="form-group">
                  <form:input type="hidden" path="pro_name" name="pro_name" class="form-control form-control-user" 
                  id="pro_name" aria-describedby="pro_name" placeholder="Product Name" readonly="true"/>
                </div>
                <div class="form-group">
                  <form:input type="text" path="pro_brandname" name="pro_brandname" class="form-control form-control-user"
                   id="pro_brandname" aria-describedby="pro_brandname" placeholder="Brand Name" readonly="true"/>
                </div>
                 <div class="form-group">
 				 <form:input type="hidden" path="pro_image" name="pro_image" class="custom-file-input form-control form-control-user" 
 				 id="pro_image" placeholder="Product Image"/>
				</div>
               <div class="form-group">
                  <form:input type="number" path="pro_price" name="pro_price" class="form-control form-control-user" 
                  id="pro_price" aria-describedby="pro_price" placeholder="Product Price" required="required"/>
                </div>
                 <div class="form-group">
                  <form:input type="text" path="pro_weight" name="pro_weight" class="form-control form-control-user" 
                  id="pro_weight" aria-describedby="pro_weight" placeholder="Product Weight" required="required"/>
                </div>
                <div class="form-group">
                  <form:input type="text" path="pro_status" name="pro_status" class="form-control form-control-user" 
                  id="pro_status" aria-describedby="pro_status" placeholder="Status" required="required"/> 
                </div>
                <div class="form-group">
                   <form:textarea rows="2" path="pro_description" name="pro_description" class="form-control form-control-user"
                    id="pro_description" placeholder="Description"/>
                </div>
                  <hr>
                  <div class="form-group row">
                  <div class="col-6">
                   <button type="submit" class="btn btn-primary btn-user btn-block">Save</button>
                   </div>
                   <div class="col-6">
                   <button type="reset" class="btn btn-danger btn-user btn-block">Reset</button>
                     </div>
                   </div>    
                <hr>
               
              </form:form>
                
              </div>
            </div>
           
          </div>
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
