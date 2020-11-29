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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Login</title>
<link href="css/mdb.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/sb-admin.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script src="vendor/jquery/jquery.validate.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
</head>
<body>
<header>
<jsp:include page="header.jsp"></jsp:include>
		
		<div class="view"
			style="background-image: url('images/banana1.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center; position: absulate">
			<div class="container">
				<div class="card card-login mx-auto mt-5">
					 
					 
		<form:form  modelAttribute="bankEntity" id="productForm" action="../bankAccountEdit" method="post" >
               
                 <div class="form-group">
                
                  <form:input type="hidden" path="bankId" name="bankId" class="form-control form-control-user" 
                  id="bankId" aria-describedby="bankId" placeholder="vendorId "/>     
			    </div>
			
                <div class="form-group">
                <label class="col-sm-15 control-label" for="bankName">Bank Name</label>
								
                  <form:input type="text" path="bankName" name="bankName" class="form-control form-control-user" 
                  id="bankName" aria-describedby="bankName" placeholder="bankName" />
                </div>
                <div class="form-group">
                <label class="col-sm-15 control-label" for="accountNo">Account No
								</label>
                  <form:input type="text" path="accountNo" name="accountNo" class="form-control form-control-user"
                   id="accountNo" aria-describedby="accountNo" placeholder="accountNo" />
                </div>
                 <div class="form-group">
                
				</div>
               <div class="form-group">
               <label class="col-sm-15 control-label" for="ifscCode">Ifsc Code
								</label>
                  <form:input type="text" path="ifscCode" name="ifscCode" class="form-control form-control-user" 
                  id="ifscCode" aria-describedby="ifscCode" placeholder="ifscCode" required="required"/>
                </div>
                
                <button type="submit" class="btn btn-primary btn-user btn-block">Save</button>
                       
                <hr>
         
              </form:form>
			
					</div>
					</div></div>



</header>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>