package com.grocery.controller;


import java.io.ByteArrayInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.filter.OrderedRequestContextFilter;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.grocery.app.GeneratedPdfReport;
import com.grocery.entity.CustomerEntity;
import com.grocery.entity.DailyReport1;
import com.grocery.entity.MonthlyReport;
import com.grocery.entity.OrderEntity;
import com.grocery.entity.ShopEntity;
import com.grocery.entity.YearlyReport;
import com.grocery.form.MonthlyReportJsonMapper;
import com.grocery.form.ReportJsonForm;
import com.grocery.form.ReportJsonMapper;
import com.grocery.form.YearlyReportJsonMapper;
import com.grocery.repository.IOrderRepository;
import com.grocery.service.IOrderService;


@Controller
public class ReportController {

	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IOrderRepository orderRepository;
	
	@RequestMapping(method=RequestMethod.GET, value="/report")
	 public String report(Model m,HttpServletRequest request,HttpSession httpSession) {
		
		return "report";
	
	}
	@RequestMapping(value = "/currentGraph", method = RequestMethod.GET,produces = "application/json")
	public @ResponseBody 
	String graph(HttpSession httpSession){
		ShopEntity shopEntity=(ShopEntity)httpSession.getAttribute("vendor");
	    
		   System.out.println("In daily report");
		  
		   List<DailyReport1>  list=orderService.getReportByCurrent(shopEntity);
		
		   int day1[]=  new int[] {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30};
		   double amount1[]=  new double[] {0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};
		   
		   
		   for (DailyReport1 dailyReport11 : list) {
			   
			   for (int i = 1; i < day1.length; i++) 
			   {    
				   boolean b=false;
				   
				   if(day1[i]==dailyReport11.getDay())
					{
					    b=true;
						System.out.println(day1[i]+"="+b);
						 amount1[i]=(int) dailyReport11.getAmount();
						 System.out.println(i+"="+ amount1[i]);
						
					}
				   else
				   {
					  
				   }
				          
			    } 
			
		}
		   
		   
		 
		   System.out.println("daily report is="+list);
           JsonArray day=new JsonArray();
           JsonArray amount=new JsonArray();
           JsonArray total=new JsonArray();
           JsonArray date=new JsonArray();
           JsonArray dayList=new JsonArray();
           JsonArray amountList=new JsonArray();
        
           for (int i = 1; i < amount1.length; i++) 
		   {
		      day.add(day1[i]);
		      amount.add(amount1[i]);
		   }
           
           for (DailyReport1 dailyReport1 : list) {
        	   dayList.add(dailyReport1.getDay());
        	   amountList.add(dailyReport1.getAmount());
        	   total.add(dailyReport1.getCount());
        	   date.add(dailyReport1.getDate());
   			
   		}
           JsonObject json=new JsonObject();
           json.add("day", day);
           json.add("amount", amount);
           json.add("dayList", dayList);
           json.add("amountList", amountList);
           json.add("total", total);
           json.add("date", date);
           
           return json.toString();
           
        
	 
	}
	
	@RequestMapping(value = "/currentReport", method = RequestMethod.POST,produces = "application/json")
	public @ResponseBody 
	String CurrentReport(HttpSession httpSession){

		   System.out.println("In daily report");
		   ShopEntity shopEntity=(ShopEntity)httpSession.getAttribute("vendor");
		    
		   List<DailyReport1>  list=orderService.getReportByCurrent(shopEntity);
		   
		   ReportJsonMapper reportJsonMapper=new ReportJsonMapper();
	          reportJsonMapper.setReport(list);
	   
	          Gson gson = new GsonBuilder().setPrettyPrinting().create();
	          String jsonLoginData = gson.toJson(reportJsonMapper);
	          System.out.println("Converted Json : "+ jsonLoginData);
	          return jsonLoginData;
		  
        
	 
	}
	@RequestMapping(value = "/order", method = RequestMethod.POST,produces = "application/json")
	public @ResponseBody 
	String submitOrder(@RequestBody ReportJsonForm reportJsonForm,HttpSession httpSession){
		ShopEntity shopEntity=(ShopEntity)httpSession.getAttribute("vendor");
	   System.out.println("In ReportController    "+reportJsonForm.getDataType());
	   System.out.println(reportJsonForm.getMonth()+"  "+reportJsonForm.getYear());
	   
	   if(reportJsonForm.getDataType().equals("daily"))
	   {
		   
		   System.out.println("In daily report");
	          List<DailyReport1>  list = orderService.getReportBySearch(reportJsonForm,shopEntity);

	          ReportJsonMapper reportJsonMapper=new ReportJsonMapper();
	          reportJsonMapper.setReport(list);
	   
	          Gson gson = new GsonBuilder().setPrettyPrinting().create();
	          String jsonLoginData = gson.toJson(reportJsonMapper);
	          System.out.println("Converted Json : "+ jsonLoginData);
	          return jsonLoginData;
		  
	        
	   }
	   else
		if(reportJsonForm.getDataType().equals("monthly") )  
	   {
	           System.out.println("In monthly report");
	           List<MonthlyReport>  list=orderService.getReportByMonth(reportJsonForm.getYear(),shopEntity);
	           System.out.println("monthly report is="+list);
	           
	           MonthlyReportJsonMapper reportJsonMapper=new MonthlyReportJsonMapper();
		          reportJsonMapper.setReport(list);
		   
		          Gson gson = new GsonBuilder().setPrettyPrinting().create();
		          String jsonLoginData = gson.toJson(reportJsonMapper);
		          System.out.println("Converted Json : "+ jsonLoginData);
		          return jsonLoginData;

	   }
	  else
	    if(reportJsonForm.getDataType().equals("yearly") )  
		  {
		               System.out.println("In yearly report");
		               List<YearlyReport>  list=orderService.getReportByYear(reportJsonForm.getYear(),shopEntity);
			           System.out.println("Yearly report is="+list);
			           
			           YearlyReportJsonMapper reportJsonMapper=new YearlyReportJsonMapper();
				          reportJsonMapper.setReport(list);
				   
				          Gson gson = new GsonBuilder().setPrettyPrinting().create();
				          String jsonLoginData = gson.toJson(reportJsonMapper);
				          System.out.println("Converted Json : "+ jsonLoginData);
				          return jsonLoginData;

		  }
	return null;
	   
	}
	@RequestMapping(value = "/graph", method = RequestMethod.POST,produces = "application/json")
	public @ResponseBody 
	String submitGraph(@RequestBody ReportJsonForm reportJsonForm,HttpSession httpSession){
		ShopEntity shopEntity=(ShopEntity)httpSession.getAttribute("vendor");
	   System.out.println("In ReportController    "+reportJsonForm.getDataType());
	   System.out.println(reportJsonForm.getMonth()+"  "+reportJsonForm.getYear());
	   
	   if(reportJsonForm.getDataType().equals("daily"))
	   {
		   List<DailyReport1>  list = orderService.getReportBySearch(reportJsonForm,shopEntity);
		   int day1[]=  new int[] {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30};
		   double amount1[]=  new double[] {0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};
		   
		   
		   for (DailyReport1 dailyReport11 : list) {
			   
			   for (int i = 1; i < day1.length; i++) 
			   {    
				   boolean b=false;
				   
				   if(day1[i]==dailyReport11.getDay())
					{
					    b=true;
						System.out.println(day1[i]+"="+b);
						 amount1[i]=(int) dailyReport11.getAmount();
						 System.out.println(i+"="+ amount1[i]);
						
					}
				   else
				   {
					  
				   }
				          
			    } 
			
		}
		   
		   
		 
		   System.out.println("daily report is="+list);
           JsonArray day=new JsonArray();
           JsonArray amount=new JsonArray();
           JsonArray total=new JsonArray();
           JsonArray date=new JsonArray();
           JsonArray dayList=new JsonArray();
           JsonArray amountList=new JsonArray();
        
           for (int i = 1; i < amount1.length; i++) 
		   {
		      day.add(day1[i]);
		      amount.add(amount1[i]);
		   }
           
           for (DailyReport1 dailyReport1 : list) {
        	   dayList.add(dailyReport1.getDay());
        	   amountList.add(dailyReport1.getAmount());
        	   total.add(dailyReport1.getCount());
        	   date.add(dailyReport1.getDate());
   			
   		}
           JsonObject json=new JsonObject();
           json.add("day", day);
           json.add("amount", amount);
           json.add("dayList", dayList);
           json.add("amountList", amountList);
           json.add("total", total);
           json.add("date", date);
           
	           return json.toString();
	   }
	   else
			if(reportJsonForm.getDataType().equals("monthly") )  
		   {
		         
		           List<MonthlyReport>  list=orderService.getReportByMonth(reportJsonForm.getYear(),shopEntity);
		           System.out.println("monthly report is="+list);
		           
		           String month1[]=new String[] {"","January","February","March","April","May","June","July","August","September","October","November","December"};
		           double amount1[]=new double[] {0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};
		           
		           for (MonthlyReport monthlyReport : list) {
					   
					   for (int i = 1; i < month1.length; i++) 
					   {    
						   boolean b=false;
						   
						   if(month1[i].equals(monthlyReport.getMonth()))
							{
							    b=true;
								System.out.println(month1[i]+"="+b);
								 amount1[i]=(double) monthlyReport.getAmount();
								 System.out.println(i+"="+ amount1[i]);
								
							}
						   else
						   {
							  
						   }
						          
					    } 
					
				}
		           
		           JsonArray month=new JsonArray();
		           JsonArray amount=new JsonArray();
		           JsonArray monthList=new JsonArray();
		           JsonArray amountList=new JsonArray();
		           JsonArray total=new JsonArray();
		          
		           for (int i = 1; i < amount1.length; i++) 
				   {
		        	   month.add(month1[i]);
				      amount.add(amount1[i]);
				   }
		           
		           for (MonthlyReport monthlyReport : list) {
		        	   
		        	  monthList.add(monthlyReport.getMonth());
		        	  amountList.add(monthlyReport.getAmount());
		        	   total.add(monthlyReport.getCount());
		   			
		   		}
		           JsonObject json=new JsonObject();
		           json.add("month", month);
		           json.add("amount", amount);
		           json.add("monthList", monthList);
		           json.add("amountList", amountList);
		           json.add("total", total);
		           
		           return json.toString();
		           

		   }
		  else
		    if(reportJsonForm.getDataType().equals("yearly") )  
			  {
			               System.out.println("In yearly report");
			               List<YearlyReport>  list=orderService.getReportByYear(reportJsonForm.getYear(),shopEntity);
				           System.out.println("Yearly report is="+list);
				           
				           JsonArray year=new JsonArray();
				           JsonArray amount=new JsonArray();
				           JsonArray total=new JsonArray();
				           
				           for (YearlyReport yearlyReport : list) {
				        	   year.add(yearlyReport.getYear());
				        	   amount.add(yearlyReport.getAmount());
				        	   total.add(yearlyReport.getCount());
				   			
				   		}
				           JsonObject json=new JsonObject();
				           json.add("year", year);
				           json.add("amount", amount);
				           json.add("total", total);
				           
				           return json.toString();
				           
			  }
	  
	return null;
	   
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/viewOrder/{date1}")
	 public String report1(Model m,@PathVariable ("date1") String date1)throws Exception{
		
		  System.out.println("In view Order"+date1);
		    
		    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		    
		    Date date = formatter.parse(date1);
		
		    System.out.println("Date "+date);  
		    
			List<OrderEntity> orderEntity=orderService.viewReportBydate(date);
			
			m.addAttribute("orderEntity", orderEntity);
			
			return "viewReport";
		
		}
	
	@RequestMapping(value = "/pdfreport/{orderId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_PDF_VALUE)
	  public ResponseEntity<InputStreamResource> pdfReport(@PathVariable ("orderId") long orderId)
	  {
	            System.out.println("orderId="+orderId);
	            
	            Optional<OrderEntity> orderEntity=orderRepository.findById(orderId);
	            
	            
	            OrderEntity  list=orderEntity.get();
                
	            CustomerEntity c=list.getCustomerEntity();
	            
	            System.out.println(list.getProductEntities());
	            
	            List<OrderEntity> l=new ArrayList<OrderEntity>();
	            
	            l.add(list);
	            System.out.println(list);
	            
	            ByteArrayInputStream bis = GeneratedPdfReport.citiesReport(l);

	            HttpHeaders headers = new HttpHeaders();
		        headers.add("Content-Disposition", "inline; filename=citiesreport.pdf");

		        return ResponseEntity
		                .ok()
		                .headers(headers)
		                .contentType(MediaType.APPLICATION_PDF)
		                .body(new InputStreamResource(bis));
		    

	  } 
	            
	
}
