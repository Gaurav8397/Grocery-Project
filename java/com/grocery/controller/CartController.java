/**
 * 
 */
package com.grocery.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.grocery.entity.AddressEntity;
import com.grocery.entity.CartEntity;
import com.grocery.entity.CustomerEntity;
import com.grocery.entity.OrderProductEntity;
import com.grocery.entity.ProductEntity;
import com.grocery.entity.ShopEntity;
import com.grocery.form.CartForm;
import com.grocery.form.MyObject;
import com.grocery.service.ICustomerService;
import com.grocery.service.IOrderService;
import com.grocery.service.IProductService;


/**
 * @author Gaurav Mahajan
 *
 */
@Controller
public class CartController {
	
	
	
	@Autowired
	private ICustomerService customerService;
	
	@Autowired
	private IProductService productService;
	
	@Autowired
	private IOrderService orderService;
	
	//List<MyObject> myObjects1=null;
	
	@RequestMapping(value = "/checkOut", method = RequestMethod.GET)
    public String viewOrder(Model model,HttpSession httpSession) throws Exception
	{
		
        CustomerEntity customerEntity=(CustomerEntity)httpSession.getAttribute("user");
        ShopEntity shopEntity=(ShopEntity)httpSession.getAttribute("shop");
        CustomerEntity customerEntity2=customerService.getCustomerById(customerEntity.getCustomerId());
        CartEntity cartEntity=customerService.getCartEntity(shopEntity,customerEntity2);
        httpSession.setAttribute("cart", cartEntity);
       
		List<AddressEntity> addressEntities=customerService.getAddresses(customerEntity);
		//List<CartEntity> cartEntities=cartService.getCart();
		
		
		model.addAttribute("addressEntities", addressEntities);
		model.addAttribute("cartEntity", cartEntity);
		model.addAttribute("cartForm", new CartForm());
		
		return "checkout";
	}
	
	@RequestMapping(value = "/removeCartItem/{cartProductId}", method = RequestMethod.GET)
    String deleteProduct(Model model,@PathVariable ("cartProductId") long cartProductId,
    		HttpSession httpSession) throws Exception{
		
		ProductEntity productEntity=productService.getProduct(cartProductId);
		
		CustomerEntity customerEntity=(CustomerEntity)httpSession.getAttribute("user");
        ShopEntity shopEntity=(ShopEntity)httpSession.getAttribute("shop");
        CustomerEntity customerEntity2=customerService.getCustomerById(customerEntity.getCustomerId());
       
        CartEntity cartEntity=customerService.getCartEntity(shopEntity,customerEntity2);
		
		cartEntity.getProductEntities().remove(productEntity);
		
	    cartEntity=customerService.addCart(cartEntity);
		
		httpSession.setAttribute("cart", cartEntity);
		  
		
		return "redirect:/checkOut";
    }
	
	
	@RequestMapping(value = "/updateCart", method = RequestMethod.POST)
	public String addProduct(@RequestBody List<MyObject> myObjects, Model model,HttpSession httpSession) throws Exception{
		
		
		/*if(myObjects1 != null && myObjects1.size() != 0){
			myObjects1=null;
			myObjects1=myObjects;
		}
		else {
		   myObjects1=myObjects;
		} */ 
		
	//	myObjects1=myObjects;
		
		
		
	    httpSession.setAttribute("updateCart", myObjects);
		
		return null;
		
	}
	
	@RequestMapping(value = "/placeOrder",method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("cartForm") CartForm cartForm, Model model, HttpServletRequest httpRequest,  
			 @RequestParam("address") Long address,  HttpSession httpSession) throws Exception{

		List<MyObject> myObjects1=(List)httpSession.getAttribute("updateCart");
		
		 
		ShopEntity shopEntity=(ShopEntity)httpSession.getAttribute("shop");
		CustomerEntity customerEntity=(CustomerEntity)httpSession.getAttribute("user");
		
		AddressEntity addressEntity=customerService.getAddressById(address);
		
	    CustomerEntity customerEntity2=customerService.getCustomerById(customerEntity.getCustomerId());
	       
	    CartEntity cartEntity=customerService.getCartEntity(shopEntity,customerEntity2);
		
	    shopEntity=cartEntity.getShopEntity();
	    
	    
	    List<OrderProductEntity> orderProductEntities=orderService.addOrderProducts(cartEntity,myObjects1);
	  
	    for (OrderProductEntity orderProductEntity : orderProductEntities) {
			System.out.println(orderProductEntity);
		}
	    
	    orderService.placeOrder(shopEntity,customerEntity2,addressEntity,orderProductEntities,cartForm);
	    
		
	
	    customerService.removeCart(cartEntity);
		
		return "redirect:/userHome";
		
	}

	
	
}
