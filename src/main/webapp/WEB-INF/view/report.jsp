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
<title>Dashboard</title>
<link
	href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
	

<link href="../../css/sb-admin.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/esp-style.css"
	rel="stylesheet">
	
	<link
	href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
 <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.js"></script>
	
	<!-- Custom fonts for this template-->
 
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  
  <script type="text/javascript">
  
$(document).ready(function() {
	



	  $.ajax({
			url:'currentReport',
			method: 'POST',
			 context: document.body,
			 contentType: "application/json; charset=utf-8",
			 success:function(data){
				 $('#tbody').empty();
				 $('#displayReport').show()
				

         		$.each(data, function (index, item) {
         	
         		 for (var i = 0; i < item.length; i++) {
         		 var j=i+1;
         		
         		var date1=item[i].date;
            		var eachrow = "<tr>"
                          + "<td>" + j + "</td>"
                          + "<td>" + item[i].date+ "</td>"
                          + "<td>" + item[i].count + "</td>"
                          + "<td>" + item[i].quantity + "</td>"
                          + "<td>" + item[i].amount + "</td>"
                           + "<td>" +      
                         " <a class='red-text' style='color: red' href='../../viewOrder/"+date1+"' ><i class='fa fa-fw fa-eye'></i>&nbsp;&nbsp;&nbsp;</a>"
							+ "</td>"
                          + "</tr>";
              		$('#tbody').append(eachrow);
         	 	}
         		});
				 $('#displayReport').dataTable()
			 }
	     });
			
		
					$("#view").click(function() {
							
								var order = {};
								order["dataType"] = $('#dataType').val();
								order["month"] = $('#month').val();
								order["year"] = $('#year').val();
								
				              
				                 $.ajax({
				                     url: 'order',
				                     method: 'POST',
				                     data: JSON.stringify(order),
				                     contentType: "application/json; charset=utf-8",
				                     success: function(data) 
				                 	            {
				                    	 
				                                    
				                                  
				                                    if($('#dataType').val()=='daily')
				                                    {
				                                    	$('#tbody').empty();
				                                    	$('#displayReportMonthly').hide()
				                                    		$('#displayReportMonthly').dataTable( {
				                                    			 "bProcessing": true,
				                                    			    "sAutoWidth": false,
				                                    			    "bDestroy":true,
				                                    			    "sPaginationType": "bootstrap", // full_numbers
				                                    			    "iDisplayStart ": 10,
				                                    			    "iDisplayLength": 10,
				                                    			    "bPaginate": false, //hide pagination
				                                    			    "bFilter": false, //hide Search bar
				                                    			    "bInfo": false, // hide showing entries
															});
			                                    		$('#displayReportYearly').hide()
			                                    		$('#displayReportYearly').dataTable( {
			                                    			 "bProcessing": true,
			                                    			    "sAutoWidth": false,
			                                    			    "bDestroy":true,
			                                    			    "sPaginationType": "bootstrap", // full_numbers
			                                    			    "iDisplayStart ": 10,
			                                    			    "iDisplayLength": 10,
			                                    			    "bPaginate": false, //hide pagination
			                                    			    "bFilter": false, //hide Search bar
			                                    			    "bInfo": false, // hide showing entries
														});
			                                    		
				                                    		$('#displayReport').show()

				                                    		$.each(data, function (index, item) {
				                                    	
				                                    		 for (var i = 0; i < item.length; i++) {
				                                    		 var j=i+1;
				                                         		var eachrow = "<tr>"
				                                                     + "<td>" + j + "</td>"
	                                                                 + "<td>" + item[i].date+ "</td>"
				                                                     + "<td>" + item[i].count + "</td>"
				                                                     + "<td>" + item[i].quantity + "</td>"
				                                                     + "<td>" + item[i].amount + "</td>"
				                                                     + "<td>" +      
				                                                     " <a class='red-text' style='color: red' href='../../viewOrder/ "+item[i].date +"' ><i class='fa fa-fw fa-eye'></i>&nbsp;&nbsp;&nbsp;</a>"
				                            							+ "</td>"
				                                                      + "</tr>";
				                                         		$('#tbody').append(eachrow);
				                                    	 	}
				                                    		});
				                                    	$('#displayReport').dataTable()
				                                    }
				                                    else
				                                    	if($('#dataType').val()=='monthly')
					                                    {
				                                    		 $('#displayReport').hide()
				                                    		 $('#displayReport').dataTable({
				                                    			 "bProcessing": true,
				                                    			    "sAutoWidth": false,
				                                    			    "bDestroy":true,
				                                    			    "sPaginationType": "bootstrap", // full_numbers
				                                    			    "iDisplayStart ": 10,
				                                    			    "iDisplayLength": 10,
				                                    			    "bPaginate": false, //hide pagination
				                                    			    "bFilter": false, //hide Search bar
				                                    			    "bInfo": false, // hide showing entries
															});
				                                    		 $('#displayReportYearly').hide()
				                                    		  $('#displayReportYearly').dataTable({
					                                    			 "bProcessing": true,
					                                    			    "sAutoWidth": false,
					                                    			    "bDestroy":true,
					                                    			    "sPaginationType": "bootstrap", // full_numbers
					                                    			    "iDisplayStart ": 10,
					                                    			    "iDisplayLength": 10,
					                                    			    "bPaginate": false, //hide pagination
					                                    			    "bFilter": false, //hide Search bar
					                                    			    "bInfo": false, // hide showing entries
																});
				                                    		    $('#tbody1').empty();
					                                    		$('#displayReportMonthly').show()

					                                    		$.each(data, function (index, item) {
					                                    	
					                                    			
					                                    		 for (var i = 0; i < item.length; i++) {
					                                    		 var j=i+1;
					                                         		var eachrow = "<tr>"
					                                                     + "<td>" + j + "</td>"
		                                                                 + "<td>" + item[i].month+ "</td>"
					                                                     + "<td>" + item[i].count + "</td>"
					                                                     + "<td>" + item[i].quantity + "</td>"
					                                                     + "<td>" + item[i].amount + "</td>"
					                                                     + "</tr>";
					                                         		$('#tbody1').append(eachrow);
					                                    	 	}
					                                    		
					                                    		});
					                                    		 $('#displayReportMonthly').dataTable()
					                                    }	
				                                    	else
					                                    	if($('#dataType').val()=='yearly')
						                                    {
					                                    		 $('#displayReport').hide()
					                                    		$('#displayReportMonthly').hide()
					                                    		 $('#displayReport').dataTable({
					                                    			 "bProcessing": true,
					                                    			    "sAutoWidth": false,
					                                    			    "bDestroy":true,
					                                    			    "sPaginationType": "bootstrap", // full_numbers
					                                    			    "iDisplayStart ": 10,
					                                    			    "iDisplayLength": 10,
					                                    			    "bPaginate": false, //hide pagination
					                                    			    "bFilter": false, //hide Search bar
					                                    			    "bInfo": false, // hide showing entries
																});
					                                    		$('#displayReportMonthly').dataTable({
					                                    			 "bProcessing": true,
					                                    			    "sAutoWidth": false,
					                                    			    "bDestroy":true,
					                                    			    "sPaginationType": "bootstrap", // full_numbers
					                                    			    "iDisplayStart ": 10,
					                                    			    "iDisplayLength": 10,
					                                    			    "bPaginate": false, //hide pagination
					                                    			    "bFilter": false, //hide Search bar
					                                    			    "bInfo": false, // hide showing entries
																});
					                                    		
					                                    		    $('#tbody2').empty();
						                                    		$('#displayReportYearly').show()

						                                    		$.each(data, function (index, item) {
						                                    	
						                                    			
						                                    		 for (var i = 0; i < item.length; i++) {
						                                    		 var j=i+1;
						                                         		var eachrow = "<tr>"
						                                                     + "<td>" + j + "</td>"
			                                                                 + "<td>" + item[i].year+ "</td>"
						                                                     + "<td>" + item[i].count + "</td>"
						                                                     + "<td>" + item[i].quantity + "</td>"
						                                                     + "<td>" + item[i].amount + "</td>"
						                                                     + "</tr>";
						                                         		$('#tbody2').append(eachrow);
						                                    	 	}
						                                    		
						                                    		});
						                                    		 $('#displayReportYearly').dataTable();
						                                    }	
				                                	
				                                  },
				                     error: function (error) {
				                                  alert(error);
				                                  }
				                          })  
				
					});
					
});
</script>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container-fluid">
			<ol class="breadcrumb">
				
				<li class="breadcrumb-item active">Home</li>
			</ol>
			<div class="container">
				<div class="card card-register mx-auto mt-5">
				 <div class="form-group">
                   <div class="form-row">
					<div class="col-md-3">
						<label for="farmId">Select Report</label>
						<select id="dataType" onchange='CheckColors(this.value);'>
							<option>Select</option>
							<option value="daily">Daily</option>
							<option value="monthly">Monthly</option>
							<option value="yearly">Yearly</option>
						</select>
                    </div>
                    <div class="col-md-3">
 						<select id="month" style='display:none;'>
							<option>select month</option>
    						<option value="1">January</option>
    						<option value="2">February</option>
    						<option value="3">March</option>
    						<option value="4">April</option>
    						<option value="5">May</option>
    						<option value="6">June</option>
    						<option value="7">July</option>
    						<option value="8">August</option>
   						    <option value="9">September</option>
   							 <option value="10">October</option>
   							 <option value="11">November</option>
   							 <option value="12">December</option>
						</select>
					</div>
					<div class="col-md-3">
						<select id="year" style='display:none;'>
							<option>select year</option>
    						<option value="2015">2015</option>
    						<option value="2016">2016</option>
    						<option value="2017">2017</option>
    						<option value="2018">2018</option>
    						<option value="2019">2019</option>
    						<option value="2020">2020</option>
						</select>
						</div>
						<div class="col-md-3">
						<button type="button" id="view" class="btn btn-info btn-sm" style='display:none;'>view</button>
						</div>
					</div>
                  </div>
                  </div>

<div id="displayReport1" style="display:none">
	<h3>Report:</h3>
	Day    - <b><span id="day"></span></b><br/>
	Month  - <b><span id="Month"></span></b><br/>
	Year     - <b><span id="Year"></span></b><br/>
</div>

<div class="card mb-3">
				<table class="table table-bordered" id="displayReport" style="display:none">
					<thead>
						<tr class="card-header" style="background: green; color: white">
							<th>Sr.No.</th>
							<th>Date</th>
							<th>No. Of Order</th>
							<th>Quantity</th>
							<th>Net Amount</th>
							<th>View</th>
						</tr>
					</thead>
					 <tbody id="tbody">
                     </tbody>
				</table>
</div>

</div>

<div class="card mb-3">
				<table class="table table-bordered" id="displayReportMonthly" style="display:none">
					<thead>
						<tr class="card-header" style="background: green; color: white">
							<th>Sr.No.</th>
							<th>Month</th>
							<th>No. Of Order</th>
							<th>Quantity</th>
							<th>Net Amount</th>
						</tr>
					</thead>
					 <tbody id="tbody1">
                     </tbody>
				</table>
</div>

<div class="card mb-3">
				<table class="table table-bordered" id="displayReportYearly" style="display:none">
					<thead>
						<tr class="card-header" style="background: green; color: white">
							<th>Sr.No.</th>
							<th>Year</th>
							<th>No. Of Order</th>
							<th>Quantity</th>
							<th>Net Amount</th>
						</tr>
					</thead>
					 <tbody id="tbody2">
                     </tbody>
				</table>
</div>

</div>
</div>
              
			
</div>

	 
  
	 
	<jsp:include page="footer.jsp"></jsp:include>
	
	
<script type="text/javascript">
function CheckColors(val){
	 var element=document.getElementById('dataType');
	 var month=document.getElementById('month');
	 var year=document.getElementById('year');
	 
	 
	 if(val=='Select')
		 {
		 
		 
	   element1.style.display='none';
		 }
	 else 
		 {
		
		    if(val=='daily')
			 {
			 month.style.display='block';
			 year.style.display='block';
			 view.style.display='block';
	           
			 }
		    else
		    if(val=='monthly')
			 {
			 month.style.display='none';
			 year.style.display='block';
			 view.style.display='block';
			 
	           
			 }
		    else
			 if(val=='yearly')
				 {
				 month.style.display='none';
				 year.style.display='block';
				 view.style.display='block';
				 }
		 }
	}

</script>
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