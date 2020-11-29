<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <div class="modal fade" id="myModal" role="dialog">
    				<div class="modal-dialog">
    
      					<!-- Modal content-->
    				  <div class="modal-content">
     				   <div class="modal-header">
     				   <h4 class="modal-title">Add New Category</h4>
       				   <button type="button" class="close" data-dismiss="modal">&times;</button>
        				  
       					 </div>
       					 <form:form modelAttribute="categoryForm" id="categoryForm"	action="../category" method="POST">
       					 <div class="modal-body">
	         			   <form:input type="text" path="pro_category" name="pro_category" class="form-control form-control-user" id="pro_category" aria-describedby="pro_category" placeholder="Insert category" required="required"/>	 
	                      </div>
	                      <div class="modal-body text-center">
	                      <button type="submit" class="btn btn-primary btn-user btn-block">Add</button>                 				     
	   				     </div>
	               </form:form>
      					  <div class="modal-footer">
       					   <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
        					</div>
      						</div>
      </div>
    					</div>
</body>
</html>