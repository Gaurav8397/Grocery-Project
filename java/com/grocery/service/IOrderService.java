package com.grocery.service;

import java.util.Date;
import java.util.List;

import com.grocery.entity.AddressEntity;
import com.grocery.entity.CartEntity;
import com.grocery.entity.CustomerEntity;
import com.grocery.entity.DailyReport1;
import com.grocery.entity.MonthlyReport;
import com.grocery.entity.OrderEntity;
import com.grocery.entity.OrderProductEntity;
import com.grocery.entity.ProfitEntity;
import com.grocery.entity.ShopEntity;
import com.grocery.entity.YearlyReport;
import com.grocery.form.CartForm;
import com.grocery.form.MyObject;
import com.grocery.form.ReportJsonForm;


public interface IOrderService {

	List<OrderEntity> getOrderList(ShopEntity shopEntity);
	
	List<OrderEntity> getOrderList();

	List<OrderEntity> getOrderById(long orderId);

	int updateOrderProduct(long productId, int quantity);

	int updateOrder(long orderId, double totalAmount);

	void updateOrder(long orderId, String status);

	List<DailyReport1> getReportByCurrent(ShopEntity shopEntity);

	List<DailyReport1> getReportBySearch(ReportJsonForm reportJsonForm, ShopEntity shopEntity);

	List<MonthlyReport> getReportByMonth(String year, ShopEntity shopEntity);

	List<YearlyReport> getReportByYear(String year, ShopEntity shopEntity);

	List<OrderEntity> viewReportBydate(Date date);

	List<OrderProductEntity> addOrderProducts(CartEntity cartEntity, List<MyObject> myObjects);

	void placeOrder(ShopEntity shopEntity, CustomerEntity customerEntity2, AddressEntity addressEntity,
			List<OrderProductEntity> orderProductEntities, CartForm cartForm);
	
	List<ProfitEntity> getProfitByShop(long shopId);

	void removeOrderProduct(long orderId, long orderProductId);



}
