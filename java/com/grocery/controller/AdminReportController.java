package com.grocery.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.grocery.entity.DailyReport1;
import com.grocery.entity.MonthlyReport;
import com.grocery.entity.OrderEntity;
import com.grocery.entity.YearlyReport;
import com.grocery.form.MonthlyReportJsonMapper;
import com.grocery.form.ReportJsonForm;
import com.grocery.form.ReportJsonMapper;
import com.grocery.form.YearlyReportJsonMapper;
import com.grocery.repository.IOrderRepository;
import com.grocery.service.IAdminReportService;


@Controller
public class AdminReportController {
	
	@Autowired
	IAdminReportService adminReportService;
	
	@Autowired
	IOrderRepository orderRepository;
	
	@RequestMapping(method=RequestMethod.GET, value="/adminReport")
	 public String report(Model m,HttpServletRequest request) {
		return "adminReport";
	
	}

	
	
	@RequestMapping(value = "/currentReport1", method = RequestMethod.POST,produces = "application/json")
	public @ResponseBody 
	String CurrentReport(){

		   System.out.println("In daily report");
		  
		   List<DailyReport1>  list=adminReportService.getReportByCurrent();
		   
		   ReportJsonMapper reportJsonMapper=new ReportJsonMapper();
	          reportJsonMapper.setReport(list);
	   
	          Gson gson = new GsonBuilder().setPrettyPrinting().create();
	          String jsonLoginData = gson.toJson(reportJsonMapper);
	          System.out.println("Converted Json : "+ jsonLoginData);
	          return jsonLoginData;
		  
        
	 
	}
	@RequestMapping(value = "/order1", method = RequestMethod.POST,produces = "application/json")
	public @ResponseBody 
	String submitOrder(@RequestBody ReportJsonForm reportJsonForm){
	   System.out.println("In ReportController    "+reportJsonForm.getDataType());
	   System.out.println(reportJsonForm.getMonth()+"  "+reportJsonForm.getYear());
	   
	   if(reportJsonForm.getDataType().equals("daily"))
	   {
		   
		   System.out.println("In daily report");
	          List<DailyReport1>  list = adminReportService.getReportBySearch(reportJsonForm);

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
	           List<MonthlyReport>  list=adminReportService.getReportByMonth(reportJsonForm.getYear());
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
		               List<YearlyReport>  list=adminReportService.getReportByYear(reportJsonForm.getYear());
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
	
	
	@RequestMapping(method=RequestMethod.GET, value="/viewOrder1/{date1}")
	 public String report1(Model m,@PathVariable ("date1") String date1)throws Exception{
		
		  System.out.println("In view Order"+date1);
		    
		    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		    
		    Date date = formatter.parse(date1);
		
		    System.out.println("Date "+date);  
		    
		List<OrderEntity> orderEntity=adminReportService.viewReportBydate(date);
		
		m.addAttribute("orderEntity", orderEntity);
		
		return "viewAdminReport";
	
	}
	
	
/*	  @RequestMapping(value = "/pdfreport/{orderId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_PDF_VALUE)
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
		    

	  }*/
	 

}
