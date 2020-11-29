package com.grocery.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.grocery.entity.CustomerEntity;
import com.grocery.entity.ShopEntity;
import com.grocery.mapper.CustomerJsonMapper;
import com.grocery.mapper.ShopJsonMapper;
import com.grocery.service.ICustomerService;
import com.grocery.service.IShopService;

@Controller
public class AdminController 
{
	@Autowired
	IShopService shopService;
	
	@Autowired
	ICustomerService customerService;
	
	@RequestMapping(value = "/customers.web", method = RequestMethod.GET)
	public String customers(Model model){
		
		return "adminCustomer";	
	}
	
	@RequestMapping(value = "/customers.web", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String loandCustomersDataFromDB(HttpServletRequest request, Model model) throws Exception {
				
		 List<CustomerEntity> customerEntities =customerService.getCustomers(); // all Data 
				
		CustomerJsonMapper customerJsonMapper = new CustomerJsonMapper();
		customerJsonMapper.setAaData(customerEntities);
		customerJsonMapper.setiTotalDisplayRecords(customerEntities.size());
		customerJsonMapper.setiTotalRecords(customerEntities.size());
				
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonCustomerData = gson.toJson(customerJsonMapper);
		System.out.println("Converted Json : "+ jsonCustomerData);
		return jsonCustomerData;
	}
	
	// view shop

		@RequestMapping(value = "/shop.web", method = RequestMethod.GET)
		public String shops(Model model) {

			return "viewShop";
		}

	// this method will help jsp to load the data from DB using ajax call using json format
		/**
		 * @param request
		 * @param model
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value = "/shop.web", method = RequestMethod.GET, produces = "application/json")
		public @ResponseBody String loandTableDataFromDB(HttpServletRequest request, Model model) throws Exception {
			List<ShopEntity> ShopEntities = shopService.getAllshop(); // all Data
			ShopJsonMapper shopJsonMapper = new ShopJsonMapper();
			shopJsonMapper.setAaData(ShopEntities);
			shopJsonMapper.setiTotalDisplayRecords(ShopEntities.size());
			shopJsonMapper.setiTotalRecords(ShopEntities.size());

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String jsonShopData = gson.toJson(shopJsonMapper);
			System.out.println("Converted Json : " + jsonShopData);
			return jsonShopData;
		}
	
}
