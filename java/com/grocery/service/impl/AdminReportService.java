/**
 * 
 */
package com.grocery.service.impl;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grocery.entity.DailyReport1;
import com.grocery.entity.MonthlyReport;
import com.grocery.entity.OrderEntity;
import com.grocery.entity.YearlyReport;
import com.grocery.form.ReportJsonForm;
import com.grocery.repository.IOrderRepository;
import com.grocery.service.IAdminReportService;

/**
 * @author Gaurav Mahajan
 *
 */
@Service
public class AdminReportService implements IAdminReportService {

	@Autowired
	IOrderRepository orderRepository;
	
	@Autowired
	EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<DailyReport1> getReportBySearch(ReportJsonForm reportJsonForm) {
		// TODO Auto-generated method stub
		String searchBy=reportJsonForm.getDataType();
		String month=reportJsonForm.getMonth();
		String year=reportJsonForm.getYear();
		
	String query1="SELECT COUNT(order_id) as count, DAY(order_date) as 'day', SUM(total_Quantity) as 'quantity',SUM(total_amount) as 'amount',Date(order_date) as 'date'" + 
				"FROM order_entity " + 
				"WHERE MONTH(order_date) = '" + month +"'"  + 
				"AND YEAR(order_date) = '" + year + "' " + 
				"GROUP BY DAY(order_date)"	;

		javax.persistence.Query q=entityManager.createNativeQuery(query1,DailyReport1.class);
		
		
		
		List<DailyReport1> list=q.getResultList();
		
		System.out.println(q.getResultList());
		for (DailyReport1 dailyReport : list) {
		
			
		
			    System.out.println("count"+dailyReport.getCount()+"  "+dailyReport.getDay());
		}
		
			return list;
	}

	@Override
	public List<MonthlyReport> getReportByMonth(String year) {
		// TODO Auto-generated method stub
		String query1="\r\n" + 
				"SELECT COUNT(order_id) as 'count',SUM(total_Quantity) as 'quantity',SUM(total_amount) as 'amount',MONTHNAME(order_date) as 'month'" + 
				"FROM order_entity " + 
				"WHERE YEAR(order_date) = '" + year + "' " + 
				"GROUP BY MONTHNAME(order_date)"	;

		javax.persistence.Query q=entityManager.createNativeQuery(query1,MonthlyReport.class);
		
		
		List<MonthlyReport> list=q.getResultList();
		
		System.out.println(q.getResultList());
		for (MonthlyReport monthlyReport : list) {
			System.out.println(monthlyReport.getMonth()+"  "+monthlyReport.getAmount());
		}
		
			return list;
	}

	@Override
	public List<YearlyReport> getReportByYear(String year) {
		// TODO Auto-generated method stub
		String query1="SELECT COUNT(order_id) as 'count',SUM(total_Quantity) as 'quantity',SUM(total_amount) as 'amount',Year(order_date) as 'year'" +
				"FROM order_entity " + 
				"WHERE YEAR(order_date) between ' " + year + "'  and YEAR(CURDATE())"+
				 "GROUP BY Year(order_date)";	

		javax.persistence.Query q=entityManager.createNativeQuery(query1,YearlyReport.class);
		
		
		List<YearlyReport> list=q.getResultList();
		
		System.out.println(q.getResultList());
		for (YearlyReport yearlyReport : list) {
			System.out.println(yearlyReport.getYear()+"  "+yearlyReport.getAmount());
		}
		
			return list;
	}

	@Override
	public List<DailyReport1> getReportByCurrent() {
		// TODO Auto-generated method stub
		
		
	String query1="SELECT COUNT(order_id) as count, DAY(order_date) as 'day', SUM(total_Quantity) as 'quantity',SUM(total_amount) as 'amount',Date(order_date) as 'date'" + 
				"FROM order_entity " + 
				"WHERE MONTH(order_date) = MONTH(CURDATE())"  + 
				"AND YEAR(order_date) = YEAR(CURDATE()) " + 
				"GROUP BY DAY(order_date)"	;

		javax.persistence.Query q=entityManager.createNativeQuery(query1,DailyReport1.class);
		
		
		List<DailyReport1> list=q.getResultList();
		
		System.out.println(q.getResultList());
		for (DailyReport1 dailyReport : list) {
			System.out.println(dailyReport.getCount()+"  "+dailyReport.getDay());
		}
		
			return list;
	}

	@Override
	public List<OrderEntity> viewReportBydate(Date date1) {
		// TODO Auto-generated method stub
	
		List<OrderEntity> list=orderRepository.viewByDate(date1);
		//System.out.println("Order is"+list);
		return list;
	}	
			
}
