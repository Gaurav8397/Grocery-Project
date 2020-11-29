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
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.grocery.entity.ProfitEntity;
import com.grocery.entity.ShopEntity;
import com.grocery.repository.ShopRepository;
import com.grocery.service.IOrderService;

@Controller 
public class ProfitController {
	
	
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private ShopRepository shopRepo;
	
	
	@RequestMapping(value = "/profit/{shopId}", method = RequestMethod.GET)
    String editProductForm(Model model,@PathVariable ("shopId") long shopId) throws Exception{
		double commission=0.0,amount;
		
		List<ProfitEntity> list=orderService.getProfitByShop(shopId);
		ShopEntity shopEntity=shopRepo.getOne(shopId);
		
		for (ProfitEntity profitEntity : list) {
			 //System.out.println(profitEntities.getTotalAmount());
			  amount=profitEntity.getAmount();
			  
			  if((amount<5000) ||  (amount>10000))
			  {
				  commission=amount*2/100;
				  }
			  
			  if((amount<10000) ||  (amount>20000)) 
			  {
				  commission= amount * 2 / 100;
				  }
			  if(amount>20000){ 
				  commission= amount * 1 / 100;
				  }
			  }
			  
		model.addAttribute("profitEntities",list);
		model.addAttribute("commission", commission);
		model.addAttribute("shopName",shopEntity.getShopName());
		model.addAttribute("moblie",shopEntity.getMobile());
		
		
		//model.addAttribute("productForm",  productForm);
		//model.addAttribute("image",new File(productForm.getPro_image()));
		return "profit";
    }
	
	
	
	/*
	 * @RequestMapping(value = "/profit", method = RequestMethod.GET) public String
	 * customers(Model model){
	 * 
	 * return "profit"; }
	 */

	 //Get all Oder
	//@RequestMapping(value = "/profit.web", method = RequestMethod.GET, produces = "application/json")
	//public @ResponseBody String loandTableDataFromDB(HttpServletRequest request, Model model,HttpSession httpSession) throws Exception {
		//ShopEntity shopEntity=(ShopEntity) httpSession.getAttribute("vendor");		
	//    List<OrderEntity> orderEntities =orderService.getAllOrder(); // all Data 
				
	  //  OrderJsonMapper orderJsonMapper= new OrderJsonMapper();
	    //orderJsonMapper.setAaData(orderEntities);
	    //orderJsonMapper.setiTotalDisplayRecords(orderEntities.size());
	    //orderJsonMapper.setiTotalRecords(orderEntities.size());
				
		//Gson gson = new GsonBuilder().setPrettyPrinting().create();
		//String jsonOderData = gson.toJson(orderJsonMapper);
		//System.out.println("Converted Json : "+ jsonOderData);
		//return jsonOderData;
	//}
}
