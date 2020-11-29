
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
<body>

<header>
<jsp:include page="header.jsp"></jsp:include>
		
	<div class="content-wrapper">
		<div class="container-fluid">
			
			<div class="card mb-3">
				
				
             
        <!-- Nested Row within Card Body -->
              <div class="row">
          
              <div class="col-lg-7">
            <div class="p-5">
    
					 
			<form:form  modelAttribute="shopEntity" id="vendorEdit" action="../vendorEdit" method="post" enctype="multipart/form-data">
               
              
			    <div class="form-group">			
                  <form:input type="hidden" path="shopId" name="shopId" class="form-control form-control-user" 
                  id="shopId" aria-describedby="shopId" placeholder="shopId" />
                </div>
                
			    <div class="form-group">
			        <img name="photo" src="../ProImages/${shopEntity.image}"  width="300" height="200">

               </div>
               
              
                <div class="form-group">
                <label class="col-sm-15 control-label" for="firstName">FirstName</label>
								
                  <form:input type="text" path="firstName" name="firstName" class="form-control form-control-user" 
                  id="firstName" aria-describedby="firstName" placeholder="firstName" />
                </div>
                
                <div class="form-group">
                <label class="col-sm-15 control-label" for="vendorLastName">LastName
								</label>
                  <form:input type="text" path="lastName" name="lastName" class="form-control form-control-user"
                   id="lastName" aria-describedby="lastName" placeholder="lastName" />
                </div>
                
                
               <div class="form-group">
               <label class="col-sm-15 control-label" for="mobile">Mobile
								</label>
                  <form:input type="text" path="mobile" name="mobile" class="form-control form-control-user" 
                  id="mobile" aria-describedby="mobile" placeholder="mobile" required="required"/>
                </div>
                
                 <div class="form-group">
                 <label class="col-sm-15 control-label" for="email">Email
								</label>
                  <form:input type="text" path="email" name="email" class="form-control form-control-user" 
                  id="email" aria-describedby="email" placeholder="email" required="required" readonly="true"/>
                </div>
                
                 <div class="form-group">
                 <label class="col-sm-15 control-label" for="shopName">Shop Name
								</label>
                  <form:input type="text" path="shopName" name="shopName" class="form-control form-control-user" 
                  id="shopName" aria-describedby="shopName" placeholder="shopName" required="required"/>
                </div>
                
                               
                	
                <div class="form-group">
               <label class="col-sm-15 control-label" for="addressLine1">Address Line 1
								</label>
                  <form:input type="text" path="addressLine1" name="addressLine1" class="form-control form-control-user" 
                  id="addressLine1" aria-describedby="addressLine1" placeholder="addressLine1" required="required"/>
                </div>
                
                 <div class="form-group">
               <label class="col-sm-15 control-label" for="addressLine2">Address Line 2
								</label>
                  <form:input type="text" path="addressLine2" name="addressLine2" class="form-control form-control-user" 
                  id="addressLine2" aria-describedby="addressLine2" placeholder="addressLine2" required="required"/>
                </div>
                
                <div class="form-group">
               <label class="col-sm-15 control-label" for="city">City
								</label>
                  <form:input type="text" path="city" name="city" class="form-control form-control-user" 
                  id="city" aria-describedby="city" placeholder="city" required="required"/>
                </div>
                
                <div class="form-group">
               <label class="col-sm-15 control-label" for="state">State</label>
                  <form:input type="text" path="state" name="state" class="form-control form-control-user" 
                  id="state" aria-describedby="state" placeholder="state" required="required"/>
                </div>
                
                <div class="form-group">
               <label class="col-sm-15 control-label" for="pincode">Pincode
								</label>
                  <form:input type="text" path="pincode" name="pincode" class="form-control form-control-user" 
                  id="pincode" aria-describedby="pincode" placeholder="pincode" required="required"/>
                </div>
               
                <div class="form-group">			
                  <form:input type="hidden" path="regDate" name="regDate" class="form-control form-control-user" 
                  id="regDate" aria-describedby="regDate" placeholder="regDate" />
                </div>
               
               <div class="form-group">			
                  <form:input type="hidden" path="recordStatus" name="recordStatus" class="form-control form-control-user" 
                  id="recordStatus" aria-describedby="recordStatus" placeholder="recordStatus" />
                </div>
                
                 <div class="form-group">			
                  <form:input type="hidden" path="image" name="image" class="form-control form-control-user" 
                  id="image" aria-describedby="image" placeholder="image" />
                </div>
                
                <div class="form-group">			
                  <form:input type="hidden" path="registrationType" name="registrationType" class="form-control form-control-user" 
                  id="registrationType" aria-describedby="registrationType" placeholder="registrationType" />
                </div>
               
                
                <button type="submit" class="btn btn-primary btn-user btn-block">Save</button>
                       
                <hr>
         
              </form:form>
	        </div>
            </div>
          </div>
        </div>
    </div>
    </div>
   

</header>
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