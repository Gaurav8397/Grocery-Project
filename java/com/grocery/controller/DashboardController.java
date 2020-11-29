package com.grocery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.grocery.form.RegisterShopForm;

@Controller
public class DashboardController {

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String dashboard(Model model) {
		model.addAttribute("dashboard", "This is your dashboard ");
		return "vendorHome";
		
	}
	@RequestMapping(value = "/userHome", method = RequestMethod.GET)
	public String userHome(Model model) {
		model.addAttribute("registerShopForm", new RegisterShopForm());
		return "serachShop";
		
	}
}
