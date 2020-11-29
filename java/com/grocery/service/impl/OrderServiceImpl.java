package com.grocery.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.persistence.EntityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.grocery.entity.AddressEntity;
import com.grocery.entity.CartEntity;
import com.grocery.entity.CustomerEntity;
import com.grocery.entity.DailyReport1;
import com.grocery.entity.MonthlyReport;
import com.grocery.entity.OrderEntity;
import com.grocery.entity.OrderProductEntity;
import com.grocery.entity.ProductEntity;
import com.grocery.entity.ProfitEntity;
import com.grocery.entity.ShopEntity;
import com.grocery.entity.YearlyReport;
import com.grocery.form.CartForm;
import com.grocery.form.MyObject;
import com.grocery.form.ReportJsonForm;
import com.grocery.repository.IOrderRepository;
import com.grocery.repository.OrderProductRepository;
import com.grocery.service.IOrderService;

@Service
@Transactional
public class OrderServiceImpl implements IOrderService 
{
	@Autowired
	IOrderRepository orderRepo;
	
	@Autowired
	OrderProductRepository orderProductRepo;
	
	@Autowired
	EntityManager entityManager;
	
	long millis=System.currentTimeMillis();  
	
	 Date orderDate=new Date(millis); 

	public List<OrderEntity> getOrderList() 
	{
		
		return orderRepo.findAll();
	}

	@Override
	public List<OrderEntity> getOrderById(long orderId) {
		List<OrderEntity>  list=orderRepo.getOrderlistById(orderId);
		return list;
	}

	@Override
	public int updateOrderProduct(long productId, int quantity)
	{
		String status="packed";
		orderRepo.updateOrderProduct(productId,quantity,status);
		return 1;
	}

	@Override
	public int updateOrder(long orderId, double totalAmount) 
	{
		String status="Process";
		orderRepo.updateOrder(orderId, totalAmount,status);
		return 1;
	}

	@Override
	public void updateOrder(long orderId, String status) {
		orderRepo.updateOrder( orderId,status);
	}

	
	@Override
	public List<DailyReport1> getReportBySearch(ReportJsonForm reportJsonForm, ShopEntity shopEntity) {
		// TODO Auto-generated method stub
		//String searchBy=reportJsonForm.getDataType();
		long shopId=shopEntity.getShopId();
		String month=reportJsonForm.getMonth();
		String year=reportJsonForm.getYear();
		
	String query1="SELECT COUNT(order_id) as count, DAY(order_date) as 'day', SUM(total_Quantity) as 'quantity',SUM(total_amount) as 'amount',Date(order_date) as 'date'" + 
				"FROM order_entity " + 
				"WHERE MONTH(order_date) = '" + month +"'"  + 
				"AND YEAR(order_date) = '" + year + "' " + 
				"AND shop_entity_shop_id='"+shopId+
				"'GROUP BY DAY(order_date)"	;

		javax.persistence.Query q=entityManager.createNativeQuery(query1,DailyReport1.class);
		
		
		
		List<DailyReport1> list=q.getResultList();
		
		System.out.println(q.getResultList());
		for (DailyReport1 dailyReport : list) {
		
			
		
			    System.out.println("count"+dailyReport.getCount()+"  "+dailyReport.getDay());
		}
		
			return list;
	}

	@Override
	public List<MonthlyReport> getReportByMonth(String year,ShopEntity shopEntity) {
		// TODO Auto-generated method stub
		long shopId=shopEntity.getShopId();
		String query1="\r\n" + 
				"SELECT COUNT(order_id) as 'count',SUM(total_Quantity) as 'quantity',SUM(total_amount) as 'amount',MONTHNAME(order_date) as 'month'" + 
				"FROM order_entity " + 
				"WHERE YEAR(order_date) = '" + year + "' " + 
				"AND shop_entity_shop_id='"+shopId+
				"'GROUP BY MONTHNAME(order_date)"	;

		javax.persistence.Query q=entityManager.createNativeQuery(query1,MonthlyReport.class);
		
		
		List<MonthlyReport> list=q.getResultList();
		
		System.out.println(q.getResultList());
		for (MonthlyReport monthlyReport : list) {
			System.out.println(monthlyReport.getMonth()+"  "+monthlyReport.getAmount());
		}
		
			return list;
	}

	@Override
	public List<YearlyReport> getReportByYear(String year,ShopEntity shopEntity) {
		// TODO Auto-generated method stub
		long shopId=shopEntity.getShopId();
		String query1="SELECT COUNT(order_id) as 'count',SUM(total_Quantity) as 'quantity',SUM(total_amount) as 'amount',Year(order_date) as 'year'" +
				"FROM order_entity " + 
				"WHERE YEAR(order_date) between ' " + year + "'  and YEAR(CURDATE())"+
				"AND shop_entity_shop_id='"+shopId+
				 "'GROUP BY Year(order_date)";	

		javax.persistence.Query q=entityManager.createNativeQuery(query1,YearlyReport.class);
		
		
		List<YearlyReport> list=q.getResultList();
		
		System.out.println(q.getResultList());
		for (YearlyReport yearlyReport : list) {
			System.out.println(yearlyReport.getYear()+"  "+yearlyReport.getAmount());
		}
		
			return list;
	}

	@Override
	public List<DailyReport1> getReportByCurrent(ShopEntity shopEntity) {
		// TODO Auto-generated method stub
		
		long shopId=shopEntity.getShopId();
	   String query1="SELECT COUNT(order_id) as count, DAY(order_date) as 'day', SUM(total_Quantity) as 'quantity',SUM(total_amount) as 'amount',Date(order_date) as 'date'" + 
				"FROM order_entity " + 
				"WHERE MONTH(order_date) = MONTH(CURDATE())"  + 
				"AND YEAR(order_date) = YEAR(CURDATE()) " + 
				"AND shop_entity_shop_id='"+shopId+
				"'GROUP BY DAY(order_date)"	;

		javax.persistence.Query q=entityManager.createNativeQuery(query1,DailyReport1.class);
		
		
		List<DailyReport1> list=q.getResultList();
		
		System.out.println(q.getResultList());
		for (DailyReport1 dailyReport : list) {
			System.out.println(dailyReport.getCount()+"  "+dailyReport.getDay());
		}
		
			return list;
	}

	@Override
	public List<OrderEntity> viewReportBydate(Date date) {
		// TODO Auto-generated method stub
		List<OrderEntity> list=orderRepo.viewByDate(date);
		//System.out.println("Order is"+list);
		return list;
	}

	@Override
	public List<OrderProductEntity> addOrderProducts(CartEntity cartEntity, List<MyObject> myObjects1) {
		// TODO Auto-generated method stub
		
		List<OrderProductEntity> orderProductEntities=new ArrayList<OrderProductEntity>();
		int i=0;
		Set<ProductEntity> entities=cartEntity.getProductEntities();
	    
		for (MyObject myObject : myObjects1) {
			System.out.println(myObject.getProductQuantity());
		}
		
		for (ProductEntity productEntity : entities) {
	    	
	    	 OrderProductEntity orderProductEntities1=new OrderProductEntity();
				orderProductEntities1.setProductName(productEntity.getPro_name());
				orderProductEntities1.setProductBrandName(productEntity.getPro_brandname());
				orderProductEntities1.setProductPrice(productEntity.getPro_price());
				orderProductEntities1.setProductDescription(productEntity.getPro_description());
				orderProductEntities1.setProductImage(productEntity.getPro_image());
				orderProductEntities1.setProductStatus(productEntity.getPro_status());
				System.out.println(myObjects1.get(i).getProductQuantity());
				orderProductEntities1.setProductQuantity(myObjects1.get(i).getProductQuantity());
			orderProductEntities.add(orderProductEntities1);
			i++;
		 }
	    
	   return orderProductEntities;
	}

	@Override
	public void placeOrder(ShopEntity shopEntity, CustomerEntity customerEntity2, AddressEntity addressEntity,
			List<OrderProductEntity> orderProductEntities, CartForm cartForm) {
		// TODO Auto-generated method stub
		int totalQuantity=0;
		for (OrderProductEntity orderProductEntity : orderProductEntities) {
			totalQuantity=totalQuantity+orderProductEntity.getProductQuantity();
		}
		
        OrderEntity orderEntity=new OrderEntity();
		
		orderEntity.setAddressEntity(addressEntity);
		orderEntity.setCustomerEntity(customerEntity2);
		orderEntity.setShopEntity(shopEntity);
		orderEntity.getProductEntities().addAll(orderProductEntities);
		orderEntity.setDeliveryCharge(cartForm.getDeliveryCharge());
        orderEntity.setOrderAmount(cartForm.getProductOrderTotalPrice());
        orderEntity.setTotalAmount(cartForm.getOrderTotalPrice());
        orderEntity.setOrderDate(orderDate);
        orderEntity.setOrderStatus("pending");
        orderEntity.setPaymentMode("Cash On Delivery");
        
        
        orderEntity.setTotalQuantity(totalQuantity); 
        
        orderRepo.save(orderEntity);
        
        
	}

	@Override
	public List<ProfitEntity> getProfitByShop(long shopId) {
		// TODO Auto-generated method stub
		long shopid=shopId;
		
		  String query1="SELECT COUNT(order_Id) as count,SUM(order_Amount) as amount FROM order_entity a WHERE shop_entity_shop_id='"+shopid+"'";

			javax.persistence.Query q=entityManager.createNativeQuery(query1,ProfitEntity.class);
			
			
			List<ProfitEntity> list=q.getResultList();
			
			System.out.println(q.getResultList());
			

			  for (ProfitEntity profitEntity : list) {
			  System.out.println(profitEntity.getAmount());
			  }
			  
			 
			  return list; 
		
		
	}

	@Override
	public List<OrderEntity> getOrderList(ShopEntity shopEntity) {
		// TODO Auto-generated method stub
		return orderRepo.findById(shopEntity);
	}

	@Override
	public void removeOrderProduct(long orderId, long orderProductId) {
		// TODO Auto-generated method stub
	   	
	   OrderEntity orderEntity=orderRepo.getOne(orderId);
	   OrderProductEntity orderProductEntity=orderProductRepo.getOne(orderProductId);
	   int productQuantity=orderProductEntity.getProductQuantity();
	   double productPrice=orderProductEntity.getProductPrice();
	   double totalProductPrice=productPrice * productQuantity;
	   
	   double orderTotalPrice=orderEntity.getTotalAmount();
	   orderTotalPrice=orderTotalPrice - totalProductPrice;
	   
	   orderEntity.setTotalAmount(orderTotalPrice);
	   
	   
	   
	   orderEntity.getProductEntities().remove(orderProductEntity);
	   
	   orderRepo.save(orderEntity);
	   
	   orderProductRepo.save(orderProductEntity);
	   
		
		
	}
	

	
	
	
	


	
	
	

}
