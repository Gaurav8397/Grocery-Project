
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
<title>Change Password</title>
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

		 <ol class="breadcrumb align-items-center justify-content-between mb-4">
			<li class="breadcrumb-item">
		       <h3>Change Your Password</h3>	
            </li>
         </ol> 
          <div class="card mb-1">
				
				
             
        <!-- Nested Row within Card Body -->
                     
              <div class="row">
              <div class="col-lg-2">
              </div>
              <div class="col-lg-8">
             
               <div class="p-5">
    
              <div class="text-center">
              
       					 <form:form modelAttribute="changePassForm" action="../resetPassword" method="POST">
                            
                             <div class="form-group row">
                                 <div class="col-1">
                                       <form:input class="form-control" id="status" name="status"
										path="status" type="hidden" value="${changePassForm.getStatus()}" />
							    </div>
								<label class="control-label" for=userName>User Name
								</label>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="col-8">
									<form:input class="form-control" id="userName" name="userName"
										path="userName" type="text" value="${changePassForm.getUserName()}" readonly="true"/>
								</div>
								</div>
								<div class="form-group row">
								<div class="col-1"></div>
								<label class="control-label" for=oldPass>Old Password
								</label>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="col-8">
									<form:input class="form-control" id="oldPass" name="oldPass"
										path="oldPass" type="password" aria-describedby="oldPass"
										placeholder="Enter Old Password" />
								</div>
							</div>
							<div class="form-group row">
							   <div class="col-1"></div>
								<label class="control-label" for="newPass1">New Password</label>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="col-8">
									<form:input class="form-control" id="newPass1" name="newPass1"
										path="newPass1" type="password" placeholder="Enter New Password" />
								</div>
							</div>
							<div class="form-group row">
							     <div class="col-1"></div>
								<label class="control-label" for="newPass">Confirmed Password</label>
								
								<div class="col-8">
									<form:input class="form-control" id="newPass" name="newPass"
										path="newPass" type="password" placeholder="Confirmed Password" />
								</div>
							</div>
                            <button type="submit" class="btn btn-block"
								style="background-color: #1875e7;">Reset Password</button>
                         </form:form>
      				</div>
      			</div>		  
            </div>
            <div class="col-lg-2">
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
