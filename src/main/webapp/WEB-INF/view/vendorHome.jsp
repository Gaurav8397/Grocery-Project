
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
<link
	href="${pageContext.request.contextPath}/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/sb-admin.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/esp-style.css"
	rel="stylesheet">
  <!-- Custom styles for this template-->
 
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
  
$(document).ready(function() {
	
					
	   $.ajax({
			url:'../currentGraph',
			method: 'GET',
			  context: document.body,
			 success:function(result){
				 
				 
	               
				 
				 	drawLineChart(result.day,result.amount,'Days'); 
				 	
			 		$('#displayOrders').show()
			 		
			 		$('#displaySales').show()

			 		var a={};
			 		a=result.date;
			 		var b={};
			 		b=result.total;
			 		var c={};
			 		c=result.amountList;
			 		
			 			 for (var i = 0; i < a.length; i++) {
				 				 
				        	var eachrow = "<tr>" 
				        		 + "<td>" + a[i]+ "</td>"
				        		 + "<td>" + b[i] + "</td>"
				        		 + "</tr>";
				        		 
	                     		$('#tbody').append(eachrow);
			        		
			        	 }
			 			 
			 			 for (var j = 0; j < a.length; j++) {
					 				
				        	 var eachrow = "<tr>" 
				        		 + "<td>" + a[j]+ "</td>"
				        		 + "<td>" + c[j] + "</td>"
				        		 + "</tr>";
				        		 
		                 		$('#tbody1').append(eachrow);
				        		
		        	    }
			       
			 }
	     });
			
			function drawLineChart(day,amount,day1)
			{
				
			
			Highcharts.chart('container', {
			   chart: {
			       type: 'line',
			       width: 400
			   },
			   
			   title: {
			       text: 'Sales chart'
			   },
			
			   xAxis: {
				   title: {
					   text:  day1
			        },
			       categories:day
			   },
			   yAxis : [ {
                   className : 'highcharts-color-0',
                   title : {
                       text : 'Sales'
                   }
               } ],
			   
			   tooltip: {
			       formatter: function() {
			         return '<strong>'+this.x+': </strong>'+ this.y;
			       }
			   },
			
			   series: [{
				  
			       data:amount
			   }]
			});
			
			}


$("#view").click(function() {
	
	var graph = {};
	graph["dataType"] = $('#dataType').val();
	graph["month"] = $('#month').val();
	graph["year"] = $('#year').val();
	
  
     $.ajax({
         url: '../../graph',
         method: 'POST',
         data: JSON.stringify(graph),
         contentType: "application/json; charset=utf-8",
         success: function(data) 
     	            {
        	 
                       
                        if($('#dataType').val()=='daily')
                        {
		                          
		                          
		                         
		                          drawLineChart(data.day,data.amount,'Days');
		                          $("#tbody").empty();
		                          $("#tbody1").empty();
		                       

		                         
		                         
		      			 		var a={};
		      			 		a=data.date;
		      			 		var b={};
		      			 		b=data.total;
		      			 		var c={};
		      			 		c=data.amountList;
		      			 	
		      			 			 for (var i = 0; i < a.length; i++) {
		      				 				 
		      				        	var eachrow = "<tr>" 
		      				        		 + "<td>" + a[i]+ "</td>"
		      				        		 + "<td>" + b[i] + "</td>"
		      				        		 + "</tr>";
		      				        		 
		      	                     		$('#tbody').append(eachrow);
		      			        		
		      			        	 }
		      			 			 
		      			 			 for (var j = 0; j < a.length; j++) {
		      					 				
		      				        	 var eachrow = "<tr>" 
		      				        		 + "<td>" + a[j]+ "</td>"
		      				        		 + "<td>" + c[j] + "</td>"
		      				        		 + "</tr>";
		      				        		 
		      		                 		$('#tbody1').append(eachrow);
		      				        		
		      		        	    }
		      			       
                        }
                        else
                        	if($('#dataType').val()=='monthly')
                            {
    		                          
    		                          
    		                        
    		                          
    		                          drawLineChart(data.month,data.amount,'Months');
    		                      
    		      			 		$("#tbody").empty();
		                          $("#tbody1").empty();
		                         
    		      			 		var a={};
    		      			 		a=data.monthList;
    		      			 		var b={};
    		      			 		b=data.total;
    		      			 		var c={};
    		      			 		c=data.amountList;
    		      			 	
    		      			 			 for (var i = 0; i < a.length; i++) {
    		      				 				 
    		      				        	var eachrow = "<tr>" 
    		      				        		 + "<td>" + a[i]+ "</td>"
    		      				        		 + "<td>" + b[i] + "</td>"
    		      				        		 + "</tr>";
    		      				        		 
    		      	                     		$('#tbody').append(eachrow);
    		      			        		
    		      			        	 }
    		      			 			 
    		      			 			 for (var j = 0; j < a.length; j++) {
    		      					 				
    		      				        	 var eachrow = "<tr>" 
    		      				        		 + "<td>" + a[j]+ "</td>"
    		      				        		 + "<td>" + c[j] + "</td>"
    		      				        		 + "</tr>";
    		      				        		 
    		      		                 		$('#tbody1').append(eachrow);
    		      				        		
    		      		        	    }
    		      			       
                            }
                        	else
                        		if($('#dataType').val()=='yearly')
                                {
        		                          
        		                          
        		                        
        		                          
        		                          drawLineChart(data.year,data.amount,'Years');
        		                        
        		      			 		$("#tbody").empty();
		                                $("#tbody1").empty();

        		      			 		var a={};
        		      			 		a=data.year;
        		      			 		var b={};
        		      			 		b=data.total;
        		      			 		var c={};
        		      			 		c=data.amount;
        		      			 		
        		      			 			 for (var i = 0; i < a.length; i++) {
        		      				 				 
        		      				        	var eachrow = "<tr>" 
        		      				        		 + "<td>" + a[i]+ "</td>"
        		      				        		 + "<td>" + b[i] + "</td>"
        		      				        		 + "</tr>";
        		      				        		 
        		      	                     		$('#tbody').append(eachrow);
        		      			        		
        		      			        	 }
        		      			 			 
        		      			 			 for (var j = 0; j < a.length; j++) {
        		      					 				
        		      				        	 var eachrow = "<tr>" 
        		      				        		 + "<td>" + a[j]+ "</td>"
        		      				        		 + "<td>" + c[j] + "</td>"
        		      				        		 + "</tr>";
        		      				        		 
        		      		                 		$('#tbody1').append(eachrow);
        		      				        		
        		      		        	    }
        		      			       
                                }
                        
     	            }
             });
     
     function drawLineChart(month,amount,day1)
		{
			
		
		Highcharts.chart('container', {
		   chart: {
		       type: 'line',
		       width: 500
		   },
		   title: {
		       text: 'Sales chart'
		   },
		  
		   xAxis: {
			   title: {
				   text:  day1
		        },
		       categories:month
		   },
		   yAxis : [ {
               className : 'highcharts-color-0',
               title : {
                   text : 'Sales'
               }
           } ],
		   
		   tooltip: {
		       formatter: function() {
		         return '<strong>'+this.x+': </strong>'+ this.y;
		       }
		   },
		
		   series: [{
		       data:amount
		   }]
		});
		
		}

     
     
     
     
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
                  
                    </div>
                  
	                    <!-- Content Row -->
	      <div class="container">
          <div class="row" >

		               <div class="col">
		
		               <!-- Area Chart -->
		                     <div class="card shadow mb-4">
		                           <div class="card-header py-3">
		                             <h6 class="m-0 font-weight-bold text-primary">Line Chart</h6>
		                           </div>
		                          <div class="card-body">
		                
					                   <div class="chart-area">
					                
						                   <div id="container" style="height: 400px"></div>
					                
					                   </div>
		                  
		                           </div>
		                       </div>
		                </div>
		                <div class="col col-lg-2">
		                 <div class="card shadow mb-4">
		                
		                </div>
		                </div>
		                
            </div>
             <div class="row" >
                          <div class="col">
			                           <div class="card shadow mb-4">
			                           <div class="card-body">
					                   <h5 style="text-align: center"> Orders</h5>
					                    <div class="card mb-3">
									<table class="table table-bordered" id="displayOrders" style="display:none" style="height: 400px">
										<thead>
											<tr class="card-header" style="background: green; color: white">
												
												<th>Date</th>
												<th>Total Order</th>
												
											</tr>
										</thead>
										 <tbody id="tbody">
					                     </tbody>
									</table>
                            </div>
					                </div>
					                </div>
		               	 </div>
		                 <div class="col">
			                  <div class="card shadow mb-4">
			                  <div class="card-body">
			                  <h5 style="text-align: center"> Sales</h5>
					                    <div class="card mb-3">
									<table class="table table-bordered" id="displaySales" style="display:none" style="height: 400px">
										<thead>
											<tr class="card-header" style="background: green; color: white">
												
												<th>Date</th>
												<th>Total Sale</th>
												
											</tr>
										</thead>
										 <tbody id="tbody1">
					                     </tbody>
									</table>
			                </div>
			                </div>
		                </div>
		      </div> 
		      </div>         
                
       </div> 
</div>
</div>

	
	<script src="../../js/highcharts.js"></script>
	<script src="../../js/jquery.js"></script>
	
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