/**
 * 
 */
package com.grocery.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.grocery.entity.CustomerEntity;
import com.grocery.form.ChangePassForm;
import com.grocery.form.ForgotPassForm;
import com.grocery.service.ILoginService;


/**
 * @author Gaurav Mahajan
 *
 */
@Controller
public class ForgotPassController {
	
	@Autowired
	private ILoginService loginService;
	
	/**
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/forgotpassword", method = RequestMethod.GET)
    String showForgotPasswordForm(Model model){
		model.addAttribute("forgotPassForm", new ForgotPassForm());
        return "forgotpassword";
    }
	
	/**
	 * @param forgotPasswordForm
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/forgotpassword", method = RequestMethod.POST)
    String requestPassword(@ModelAttribute("forgotPassForm") ForgotPassForm forgotPassForm, Model model) throws Exception{
		System.out.println(forgotPassForm.getEmail());
		loginService.resetPassword(forgotPassForm);
		
		//String userName=forgotPassForm.getEmail();
		//ChangePassForm changePassForm= new ChangePassForm();
		//changePassForm.setUserName(userName);
		//model.addAttribute("changePassForm",changePassForm);
		return "redirect:/login";
        
    }
	
	/**
	 * @param model
	 * @param userName
	 * @return
	 */
	@RequestMapping(value = "changePassword/{userName}", method = RequestMethod.GET)
    String showChangePasswordForm(Model model,@PathVariable ("userName") String userName){
		ChangePassForm changePassForm= new ChangePassForm();
		changePassForm.setUserName(userName);
		changePassForm.setStatus("Active");
		model.addAttribute("changePassForm",changePassForm);
		
        return "changePassword";
    }
	
	/**
	 * @param changePassForm
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    String changePassword(@ModelAttribute("changePassForm") ChangePassForm changePassForm, Model model) throws Exception{
		System.out.println(changePassForm.getNewPass());
		System.out.println(changePassForm.getUserName());
		if(loginService.changePassword(changePassForm)) {
			return "redirect:/login";
		}
		//String userName=forgotPassForm.getEmail();
		return "redirect:/changePassword";
        
    }
	
	/**
	 * @param model
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value = "/changePassword", method = RequestMethod.GET)
    String changePasswordForm(Model model,HttpSession httpSession){
		ChangePassForm changePassForm= new ChangePassForm();
		CustomerEntity customerEntity=(CustomerEntity)httpSession.getAttribute("user");
		changePassForm.setUserName(customerEntity.getEmail());
		changePassForm.setStatus("Active");
		model.addAttribute("customerEntity", customerEntity);
		model.addAttribute("changePassForm",changePassForm);
		
        return "resetPassword";
    }
	
	/**
	 * @param changePassForm
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
    String resetPassword(@ModelAttribute("changePassForm") ChangePassForm changePassForm, Model model) throws Exception{
		System.out.println(changePassForm.getNewPass());
		System.out.println(changePassForm.getUserName());
		if(loginService.changePassword(changePassForm)) {
			return "redirect:/userHome";
		}
		//String userName=forgotPassForm.getEmail();
		return "redirect:/changePassword";
        
    }
	
	
	
	/*@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    String newPassword(@ModelAttribute("changePassForm") ChangePassForm changePassForm, Model model) throws Exception{
		System.out.println(changePassForm.getNewPass());
		System.out.println(changePassForm.getUserName());
		if(loginService.changePassword(changePassForm)) {
			return "redirect:/login";
		}
		//String userName=forgotPassForm.getEmail();
		return "redirect:/changePassword";
        
    }*/
}
