package com.grocery.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.grocery.entity.CustomerEntity;
import com.grocery.entity.OrderEntity;
import com.grocery.entity.ShopEntity;
import com.grocery.mapper.OrderJsonMapper;
import com.grocery.service.IOrderService;

@Controller
public class OrderController 
{
	@Autowired
	private IOrderService orderService;
	
	
	
	@RequestMapping(value="/orders.web",method=RequestMethod.GET)
	public String getOrdersList(Model model)
	{
		/*System.out.println("ordersList controller");
		List<OrderEntity> orderEntity=orderService.getOrderList();
		model.addAttribute("orderEntity", orderEntity);
		*/
	
		return "ordersList";
	}
	
	// this method will help jsp to load the data from DB using ajax call using json format
		@RequestMapping(value = "/orders.web", method = RequestMethod.GET, produces = "application/json")
		public @ResponseBody String loandTableDataFromDB(HttpServletRequest request, Model model,
				HttpSession httpSession) throws Exception {
			
		    ShopEntity shopEntity=(ShopEntity)httpSession.getAttribute("vendor");
			  System.out.println(shopEntity.getFirstName());
			  System.out.println(shopEntity.getShopId());
				     
		    List<OrderEntity> orderEntities=orderService.getOrderList(shopEntity);// all Data 
				
			//List<OrderEntity> orderEntities=orderService.getOrderList();// all Data 
					
			OrderJsonMapper orderJsonMapper = new OrderJsonMapper();
			orderJsonMapper.setAaData(orderEntities);
			orderJsonMapper.setiTotalDisplayRecords(orderEntities.size());
			orderJsonMapper.setiTotalRecords(orderEntities.size());
					
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String jsonOrderData = gson.toJson(orderJsonMapper);
			System.out.println("Converted Json : "+ jsonOrderData);
			return jsonOrderData;
		}
		
		
	@RequestMapping(value = "/viewOrderProducts/{orderId}", method = RequestMethod.GET)
    public String viewOrder(Model model,@PathVariable ("orderId") long orderId) throws Exception
	{
		System.out.println("OrderId is "+orderId);
		List<OrderEntity> orderEntities=orderService.getOrderById(orderId);
		for (OrderEntity orderEntity : orderEntities) 
			
		{
			System.out.println(orderEntity.getAddressEntity().getCity());
			System.out.println(orderEntity.getCustomerEntity().getFirstName());
			/*for (OrderProductEntity orderProductEntity : orderEntity.getProductEntities()) {
				//System.out.println(quantity=(int) porderProductEntity.getProductQuantity());
				
			}*/
		}
		model.addAttribute("orderEntity", orderEntities);
		
		return "viewOrder";
	}
	@RequestMapping(value = "/packedOrder", method = RequestMethod.POST)
	   public @ResponseBody String orderStatus(Model model,@RequestParam ("productId") long productId ,
			   @RequestParam ("total") double prodctTotalPrice ,@RequestParam ("quantity") int quantity) throws Exception
		{
		System.out.println("Product StatusId"+productId);
		System.out.println("Product Quantity"+quantity);
		System.out.println("Product productPrice"+prodctTotalPrice);
		int status=orderService.updateOrderProduct(productId,quantity);
		if(status>0)
		{
			System.out.println("Product Successfully");
		}
			return "Product Packed Successfully";
		
	
		}
	@RequestMapping(value = "/updateOrder", method = RequestMethod.POST)
	   public @ResponseBody String orderStatus(Model model,@RequestParam ("orderId") long orderId ,
			   @RequestParam ("total") double totalAmount) throws Exception
		{
			System.out.println("Product StatusId"+orderId);
			System.out.println("Product Quantity"+totalAmount);
			int status=orderService.updateOrder(orderId,totalAmount);
			if(status>0)
			{
				System.out.println("Order Successfully");
			}
			//return "redirect:/ordersList";
		return "Order Process Successfully...";
	
		}
	
	@RequestMapping(value = "/deliveredOrder/{orderId}", method = RequestMethod.GET)
	   public String deliveredOrder(Model model,@PathVariable ("orderId") long orderId) throws Exception
		{
		String status="Delivered";
			System.out.println("OrderId is "+orderId);
			orderService.updateOrder(orderId,status);
			return "redirect:/orders.web";
		}
	
	//customer's orders only
	@RequestMapping(value = "/orders", method = RequestMethod.GET)
	public String customerOrders(Model model,HttpSession httpSession) {
		CustomerEntity customerEntity=(CustomerEntity) httpSession.getAttribute("user");
	    
		List<OrderEntity> orderEntities=orderService.getOrderList();
		
		orderEntities.removeIf(OrderEntity -> (OrderEntity.getCustomerEntity().getCustomerId() != customerEntity.getCustomerId()));//Session wise data
	   
	    
	    System.out.println(customerEntity.getCustomerId());
		for (OrderEntity orderEntity : orderEntities) {
			System.out.println(orderEntity.getTotalAmount()+" "+orderEntity.getAddressEntity().getCity());
		}
		
		model.addAttribute("orderEntities", orderEntities);
		return "customerOrders";
	}
	
	
	@RequestMapping(value = "/removeOrderProduct/{orderProductId}/{orderId}", method = RequestMethod.GET)
	   public String removeProduct(Model model,@PathVariable ("orderProductId") long orderProductId,@PathVariable ("orderId") long orderId) throws Exception
		{
		String status="Delivered";
			System.out.println("orderProductId is "+orderProductId);
			System.out.println("orderId is "+orderId);
			orderService.removeOrderProduct(orderId,orderProductId);
			List<OrderEntity> orderEntities=orderService.getOrderById(orderId);
			
			model.addAttribute("orderEntity", orderEntities);
			return "redirect:/viewOrderProducts/"+orderId;
		}
			
}
