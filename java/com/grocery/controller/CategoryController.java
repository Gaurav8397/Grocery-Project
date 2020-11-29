package com.grocery.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.grocery.form.CategoryForm;
import com.grocery.service.IProductService;


@Controller
public class CategoryController {
	
	@Autowired
	private IProductService productService;
	
	@RequestMapping(value = "/category",method = RequestMethod.POST)
	public String addCategory(Model model, @ModelAttribute("categoryForm") CategoryForm categoryForm) {
		System.out.println(categoryForm.getPro_category());
		productService.addNewCategory(categoryForm);
		//model.addAttribute("category", s);
		return "redirect:/addNewProduct";
		
	}
}
