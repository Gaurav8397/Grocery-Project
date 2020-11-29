
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
<title>Add New Product</title>
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
			
			<div class="card mb-1">
				
				
             
        <!-- Nested Row within Card Body -->
                     
              <div class="row">
              <div class="col-lg-2">
              </div>
              <div class="col-lg-8">
             
               <div class="p-5">
    
              <div class="text-center">
              
           
			<ol class="breadcrumb">
			    <li class="breadcrumb-item" ><h3>Add New Product</h3></li>	
			
			</ol>
                
              </div>
              <hr>
               <form:form class="user" modelAttribute="productForm" id="productForm"  action="../addNewProduct" method="post"
                enctype="multipart/form-data">
               
                 <div class="form-group row">
                  
               <div class="col-sm-8 mb-3 mb-sm-0">
                    
     				 <select class="form-control" name="pro_category" id="pro_category"  aria-describedby="pro_category" required="required">
   					 <option value="">--Select category--</option>
   					 <c:forEach var="var" items="${categoryEntities}">
   					 <option value="${var.getPro_category()}"><c:out value="${var.getPro_category()}"></c:out>
   					 </c:forEach>
  					</select>
 					 </div>
					<div class="col-sm-1">
        				
                    </div>
					
		            <div class="col-sm-2">
        				<i data-toggle="modal" data-target="#myModal" title="Add New Category" class="btn btn-dark fa fa-plus-square"></i>
                    </div>
                     
			 </div>
			
                <div class="form-group">
                  <form:input type="text" path="pro_name" name="pro_name" class="form-control form-control-user" 
                  id="pro_name" aria-describedby="pro_name" placeholder="Product Name" required="required"/>
                </div>
                <div class="form-group">
                  <form:input type="text" path="pro_brandname" name="pro_brandname" class="form-control form-control-user"
                   id="pro_brandname" aria-describedby="pro_brandname" placeholder="Brand Name" required="required"/>
                </div>
                <div class="form-group">
                <div class="custom-file">
 				 <input type="file"  name="file"  class="custom-file-input form-control form-control-user" 
 				 id="file" placeholder="Product Image" required="required"/>
 				 <label class="custom-file-label" for="file" data-browse="Select Image">Image</label>
				</div>
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
                   <button type="submit" class="btn btn-primary btn-user btn-block">Add Product</button>
                   </div>
                   <div class="col-6">
                   <button type="reset" class="btn btn-danger btn-user btn-block">Reset</button>
                     </div>
                </div>     
             
                <hr>
              </form:form>
              
              </div>
            </div>
            <div class="col-lg-2">
              </div>
            </div>  
          </div>
        </div>
    </div>
   
   
   <jsp:include page="addCategory.jsp"></jsp:include>
    
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
 <script>
    $(document).ready(function(){
    $('[data-toggle="modal"]').tooltip();   
    });
</script>
</html>
