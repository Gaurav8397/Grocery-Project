package com.grocery.controller;

import java.util.Set;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.grocery.entity.LoginEntity;
import com.grocery.entity.RoleEntity;
import com.grocery.form.ChangePassForm;
import com.grocery.form.LoginForm;
import com.grocery.form.RegisterShopForm;
import com.grocery.service.ILoginService;

/**
 * @author Gaurav Mahajan
 *
 */
@Controller
public class LoginController {

	private static final Logger logger=LogManager.getLogger(LoginController.class);
	
	@Autowired
	private ILoginService loginService;
	
	/**
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String showLoginForm(Model model)
	{
		logger.info("Login page open");
		model.addAttribute("loginForm", new LoginForm());
		
		return "login";
		
	}
	
	/**
	 * @param model
	 * @param loginForm
	 * @return
	 */
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String postLoginForm(Model model, @ModelAttribute("loginForm") LoginForm loginForm,HttpSession httpSession)
	{
		System.out.println(loginForm.getUserName());
		LoginEntity loginEntity=loginService.login(loginForm);
		String status=null;
		String role=null;
		status=loginEntity.getStatus();
		Set<RoleEntity> roleEntities=loginEntity.getRoles();
		for (RoleEntity roleEntity : roleEntities) {
			System.out.println("-----------------------------------------------> " + roleEntity.getRoleId());
			System.out.println("-----------------------------------------------> " + roleEntity.getRoleName());
			role=roleEntity.getRoleName();
			//System.out.println("===================="+role);
		}
		//System.out.println(status);
		System.out.println("login status :"+status);
		if(status.equals("Active") && role.equals("VENDOR"))
		{
			logger.error("login success");
			httpSession.setAttribute("vendor", loginEntity.getShopEntity());//session
			
			
			return "vendorHome";
		}
		else if(status.equals("Active") && role.equals("USER"))
		{
			logger.error("login success");
			httpSession.setAttribute("user", loginEntity.getCustomerEntity());//session
			model.addAttribute("registerShopForm", new RegisterShopForm());
			return "serachShop";
		}
		else if(status.equals("Active") && role.equals("ADMIN"))
		{
			logger.error("login success");
			httpSession.setAttribute("admin","admin");
			return "adminHome";
		}
		else if (status.equals("New")) {
			logger.error("New login");
			ChangePassForm changePassForm= new ChangePassForm();
			changePassForm.setUserName(loginForm.getUserName());
			changePassForm.setStatus("Active");
			model.addAttribute("changePassForm",changePassForm);
			return "changePassword";
		}
		else {
			logger.error("login failed");
			return "redirect:/login";
		}
		
		
	}
}
