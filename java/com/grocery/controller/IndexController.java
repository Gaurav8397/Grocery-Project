package com.grocery.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class IndexController {

	private static final Logger logger=LogManager.getLogger(IndexController.class);
 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String indexPage() {
		logger.error("app start");
		return "index";
		
	}
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String indexPageHome() {
		logger.error("app start");
		return "index";
		
	}
}
