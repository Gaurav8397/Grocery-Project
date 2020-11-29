<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div class="modal fade" id="mobile" role="dialog">
    				<div class="modal-dialog">
    
      					<!-- Modal content-->
    				  <div class="modal-content">
     				   <div class="modal-header">
     				   <h4 class="modal-title">Change Mobile No.</h4>
       				   <button type="button" class="close" data-dismiss="modal">&times;</button>
        				  
       					 </div>
       					 <form action="../changeMobile" method="POST">
       					 <div class="modal-body">
	         			   <input type="text" name="mobile" class="form-control form-control-user" id="mobile" aria-describedby="mobile" placeholder="Insert New Number" required="required"/>	 
	                      </div>
	                      <div class="modal-body text-center">
	                      <button type="submit" class="btn btn-primary btn-user btn-block">Save</button>                 				     
	   				     </div>
	                    </form>
      					  <div class="modal-footer">
       					   <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
        					</div>
      						</div>
                   </div>
    		</div>
</body>
</html>