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
<title>Add New Address</title>
</head>
<body>
  <div class="modal fade" id="address" role="dialog">
    				<div class="modal-dialog">
    
      					<!-- Modal content-->
    				  <div class="modal-content">
     				   <div class="modal-header">
     				   <h4 class="modal-title">Add New Address</h4>
       				   <button type="button" class="close" data-dismiss="modal">&times;</button>
        				  
       					 </div>
       					 <form:form modelAttribute="addressFrom" id="addressFrom" action="../addAddress" method="POST">
       					 <div class="modal-body">
	         			   <div class="form-group row">
							 <div class="col-6">
								<label class="control-label" for="addressLine1">Address line 1
								</label>
								
									<form:input class="form-control" id="addressLine1" name="addressLine1"
										path="addressLine1" type="text" aria-describedby="addressLine1"
										placeholder="House no and street name" required="required"/>
								</div>
								<div class="col-6">
								<label class="control-label" for="addressLine2">Address line 2
								</label>
								
									<form:input class="form-control" id="addressLine2" name="addressLine2"
										path="addressLine2" type="text" aria-describedby="addressLine2"
										placeholder="Appartment, suit, unit, etc.." required="required"/>
								</div>
							</div>
							
							
							 <div class="form-group row">
							 <div class="col-6">
								<label class="control-label" for="city">City
								</label>
								
									<form:input class="form-control" id="city" name="city"
										path="city" type="text" aria-describedby="city"
										placeholder="Enter City" required="required"/>
								</div>
								<div class="col-6">
								<label class="control-label" for="state">State
								</label>
								
									<form:input class="form-control" id="state" name="state"
										path="state" type="text" aria-describedby="state"
										placeholder="Enter State" required="required"/>
								</div>
							</div>
					
				            <div class="form-group row">
					        
								<div class="col-6">
								<label class="control-label" for="pincode">Pincode	
								</label>
									<form:input class="form-control" id="pincode" name="pincode"
										path="pincode" type="text" aria-describedby="pincode"
										placeholder="Enter Pincode" required="required"/>
								</div>
							</div>
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