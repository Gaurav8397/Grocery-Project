
package com.grocery.controller;


import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.grocery.entity.AddressEntity;
import com.grocery.entity.CartEntity;
import com.grocery.entity.CategoryEntity;
import com.grocery.entity.CustomerEntity;
import com.grocery.entity.ProductEntity;
import com.grocery.entity.ShopEntity;
import com.grocery.form.AddressFrom;
import com.grocery.form.RegisterShopForm;
import com.grocery.form.RegisterUserForm;
import com.grocery.mapper.CustomerJsonMapper;
import com.grocery.service.ICustomerService;
import com.grocery.service.ILoginService;
import com.grocery.service.IProductService;



@Controller
public class CustomerController {

	
	@Autowired
	private ILoginService loginService;
	
	@Autowired
	private ICustomerService customerService;
	
	@Autowired
	private IProductService productService;

	// Set<ProductEntity> set=new HashSet<ProductEntity>();
	
    private static final Logger logger=LogManager.getLogger(CustomerController.class);
	
	/**
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/registerUser", method = RequestMethod.GET)
	public String viewRegisterForm(Model model) {
		model.addAttribute("registerUserForm", new RegisterUserForm());
		return "userRegistrationForm";
	}

	/**
	 * @param registerUserForm
	 * @return
	 */
	@RequestMapping( value = "/registerUser", method = RequestMethod.POST)
	public String submitRegisterForm(@ModelAttribute("registerUserForm") RegisterUserForm registerUserForm) {

		CustomerEntity customerEntity=customerService.addNewUser(registerUserForm);
		if(customerEntity!=null && customerEntity.getCustomerId() > 0) {
			logger.error("Customer entity added");
		    loginService.addNewLogin(customerEntity);
			logger.error("Customer regitered");
		}
		return "redirect:/login";

	}
	
	/**
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/customer.web", method = RequestMethod.GET)
	public String customers(Model model){
		
		return "viewCustomers";	
	}

	// this method will help jsp to load the data from DB using ajax call using json format
	/**
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/customer.web", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String loandTableDataFromDB(HttpServletRequest request, Model model,HttpSession httpSession) throws Exception {
		//ShopEntity shopEntity=(ShopEntity) httpSession.getAttribute("vendor");		
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
			
	/**
	 * @param model
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Model model,HttpSession httpSession){
		CustomerEntity customerEntity=(CustomerEntity)httpSession.getAttribute("user");
		//customerEntity=customerService.getCustomerById(customerEntity.getCustomerId());
		
		model.addAttribute("customerEntity", customerEntity);
		return "customerProfile";	
	}		
		
	/**
	 * @param model
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value = "/addresses", method = RequestMethod.GET)
	public String addresses(Model model,HttpSession httpSession){
		CustomerEntity customerEntity=(CustomerEntity)httpSession.getAttribute("user");
		
		List<AddressEntity> addressEntities=customerService.getAddresses(customerEntity);
		
		model.addAttribute("addressFrom", new AddressFrom());
		model.addAttribute("addressEntities", addressEntities);
		return "addresses";	
	}	
	
	/**
	 * @param model
	 * @param httpSession
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping(value = "/changeMobile", method = RequestMethod.POST)
	public String changeMobile(Model model,HttpSession httpSession, HttpServletRequest httpServletRequest){
		CustomerEntity customerEntity=(CustomerEntity)httpSession.getAttribute("user");
	    customerEntity.setMobile(Long.parseLong(httpServletRequest.getParameter("mobile")));
	    System.out.println("Mobile========:"+customerEntity.getMobile());
	    
	    customerService.editMobileNo(customerEntity);
		
		return "redirect:/profile";	
	}

	/**
	 * @param model
	 * @param addressId
	 * @param httpSession
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping(value = "/removeAddress/{addressId}", method = RequestMethod.GET)
	public String removeAddress(Model model, @PathVariable ("addressId") long addressId,
			HttpSession httpSession, HttpServletRequest httpServletRequest){
		CustomerEntity customerEntity=(CustomerEntity)httpSession.getAttribute("user");
		List<AddressEntity> addressEntities=customerService.getAddresses(customerEntity);
		
		addressEntities.removeIf(AddressEntity -> (AddressEntity.getAddressId() == addressId));//Remove address
		
	     for (AddressEntity addressEntity : addressEntities) {
			System.out.println("Id========:"+addressEntity.getAddressId());
		}
	     
	     customerService.removeAddress(customerEntity);
		
		return "redirect:/addresses";	
	}
	
	/**
	 * @param addressFrom
	 * @param model
	 * @param httpSession
	 * @return
	 */
	@RequestMapping( value = "/addAddress", method = RequestMethod.POST)
	public String addAddress(@ModelAttribute("addressFrom") AddressFrom addressFrom,Model model,HttpSession httpSession) {
         AddressEntity addressEntity=new AddressEntity();
         addressEntity.setAddressLine1(addressFrom.getAddressLine1());
         addressEntity.setAddressLine2(addressFrom.getAddressLine2());
         addressEntity.setCity(addressFrom.getCity());
         addressEntity.setState(addressFrom.getState());
         addressEntity.setPincode(addressFrom.getPincode());
         
         CustomerEntity customerEntity=(CustomerEntity)httpSession.getAttribute("user");
         
         List<AddressEntity> addressEntities=customerService.getAddresses(customerEntity);
         addressEntities.add(addressEntity);
         
		customerService.addAddress(customerEntity);
		
		return "redirect:/addresses";

	}
	
	/**
	 * @param registerShopForm
	 * @param model
	 * @return
	 */
	@RequestMapping( value = "/searchShop", method = RequestMethod.POST)
	public String searchShop(@ModelAttribute("registerShopForm") RegisterShopForm registerShopForm,Model model,
			HttpSession httpSession) 
	{
		Long shopPincode=registerShopForm.getPincode();
		List<ShopEntity> shopEntity=customerService.getShopByPincode(shopPincode);
		
		model.addAttribute("shopEntities", shopEntity);
		
		return "userHome";
		
		
	}
	/**
	 * @param model
	 * @param shopId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/viewShopProduct/{shopId}", method = RequestMethod.GET)
    public String viewShopProduct(Model model,@PathVariable ("shopId") long shopId,
    		HttpSession httpSession) throws Exception
	{
		ShopEntity shopEntity=customerService.getShopById(shopId);
		httpSession.setAttribute("shop", shopEntity);
		CustomerEntity customerEntity=(CustomerEntity)httpSession.getAttribute("user");
		CustomerEntity customerEntity2=customerService.getCustomerById(customerEntity.getCustomerId());
		CartEntity cartEntity=customerService.getCartEntity(shopEntity,customerEntity2);
		if(cartEntity==null)
		{
		   CartEntity cartEntity1=new CartEntity();
		   cartEntity1.setCustomerEntity(customerEntity2);
		   cartEntity1.setShopEntity(shopEntity);
		   cartEntity=customerService.addCart(cartEntity1);
		}
		httpSession.setAttribute("cart", cartEntity);
		
		List<CategoryEntity> categoryEntity=customerService.getAllCategory();
		model.addAttribute("categoryEntity", categoryEntity);
		
		/*String cart=shopEntity.getShopName();
		
		httpSession.setAttribute(cart, set);
		*/
		List<ProductEntity> productEntity=customerService.getProductByShop(shopEntity);
		
		model.addAttribute("productEntities", productEntity);
		return "viewShopProduct";
		
	}
	 
	@RequestMapping(value = "/addToCart/{productId}", method = RequestMethod.GET)
    public String addToCart(Model model,@PathVariable ("productId") long productId,
    		HttpSession httpSession) throws Exception
	{
		ShopEntity shopEntity=(ShopEntity)httpSession.getAttribute("shop");
		//CustomerEntity customerEntity=(CustomerEntity)httpSession.getAttribute("user");
		CartEntity cartEntity=(CartEntity)httpSession.getAttribute("cart");
		ProductEntity productEntity=productService.getProduct(productId);
		
		cartEntity.getProductEntities().add(productEntity);
		cartEntity=customerService.addCart(cartEntity);
		httpSession.setAttribute("cart", cartEntity);
		/*Set<ProductEntity> productEntities=new HashSet<ProductEntity>();
		productEntities=(Set)httpSession.getAttribute(cart);
		productEntities.add(productEntity);  
		httpSession.setAttribute(cart, productEntities);
		
		for (ProductEntity productEntity2 : productEntities) {
			System.out.println(productEntity2.getProductId()+"  "+productEntity2.getPro_name());
		}
		*/
		List<CategoryEntity> categoryEntity=customerService.getAllCategory();
		
		
        List<ProductEntity> productEntity1=customerService.getProductByShop(shopEntity);
		
		model.addAttribute("productEntities", productEntity1);
		model.addAttribute("categoryEntity", categoryEntity);
		
		return "viewShopProduct";
		
	}
	
	@RequestMapping(value = "/categoryProduct", method = RequestMethod.GET)
	   public String categoryProdcut(Model model,@RequestParam ("categoryId") long categoryId,HttpSession httpSession) throws Exception
		{
		ShopEntity shopEntity=(ShopEntity)httpSession.getAttribute("shop");
		
		Optional<CategoryEntity> categoryEntity=customerService.getCategoryById(categoryId);
		//System.out.println(categoryEntity);
		 List<ProductEntity> productEntity1=customerService.getProductCategory(shopEntity,categoryEntity);
		 model.addAttribute("productEntities", productEntity1);
		 
		 System.out.println("Hello");
			return "productByCategory";
		
		}
	
	
}

