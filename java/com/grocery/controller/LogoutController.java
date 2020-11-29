package com.grocery.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.grocery.form.LoginForm;

@Controller
public class LogoutController {

	@RequestMapping(value = "/logout",method = RequestMethod.GET)
	public String logout(Model model,HttpSession httpSession) {
		
		httpSession.invalidate();
		model.addAttribute("loginForm", new LoginForm());
		
		return "login";
		
	}
}
