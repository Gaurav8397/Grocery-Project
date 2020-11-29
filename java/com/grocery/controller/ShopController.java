/**
 * 
 */
package com.grocery.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.grocery.entity.BankEntity;
import com.grocery.entity.ShopEntity;
import com.grocery.form.RegisterShopForm;
import com.grocery.mapper.ShopJsonMapper;
import com.grocery.service.ILoginService;
import com.grocery.service.IShopService;

/**
 * @author Gaurav Mahajan
 *
 */
@Controller
public class ShopController {

	@Autowired
	private ILoginService loginService;

	@Autowired
	private IShopService shopService;

	// Save the uploaded file to this folder
	private static String UPLOADED_FOLDER = "./ProImages/";

	private static final Logger logger = LogManager.getLogger(ShopController.class);

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	String register(Model model) throws Exception {

		return "register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	String newShop(Model model, HttpServletRequest httpServletRequest) throws Exception {
		RegisterShopForm registerShopForm = new RegisterShopForm();
		String type = httpServletRequest.getParameter("registrationType");
		System.out.println(type);
		registerShopForm.setRegistrationType(type);
		model.addAttribute("registerShopForm", registerShopForm);

		return "shopRegistrationForm";
	}

	@RequestMapping(value = "/registerShop", method = RequestMethod.POST)
	String addShop(@ModelAttribute("registerShopForm") RegisterShopForm registerShopForm, Model model,
			@RequestParam("file") MultipartFile file, HttpServletRequest httpRequest, HttpSession httpSession)
			throws Exception {

		System.out.println(registerShopForm.getFirstName() + " " + registerShopForm.getEmail());
		System.out.println("Original Image Byte Size - " + file.getBytes().length);

		ServletContext context = httpSession.getServletContext();
		String path = context.getRealPath(UPLOADED_FOLDER);
		String filename = file.getOriginalFilename();

		System.out.println(path + filename);

		byte[] bytes = file.getBytes();

		BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(path + filename)));
		stream.write(bytes);
		stream.flush();
		stream.close();

		registerShopForm.setImage(filename);

		ShopEntity shopEntity = shopService.addNewUser(registerShopForm);

		if (shopEntity != null && shopEntity.getShopId() > 0) {
			logger.error("Shop entity added");
			loginService.addNewLogin(shopEntity);
			logger.error("shop regitered");
		}
		return "redirect:/login";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/vendorView")
	public String display(Model m, HttpServletRequest request, HttpSession httpSession) {

		ShopEntity shopEntity = (ShopEntity) httpSession.getAttribute("vendor");

		System.out.println("**************" + shopEntity.getImage());
		m.addAttribute("shopEntity", shopEntity);

		return "vendorView";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/vendorEdit")
	public String profileEdit(HttpServletRequest request, @ModelAttribute("shopEntity") ShopEntity shopEntity,
			HttpSession httpSession) {

		ShopEntity entity = (ShopEntity) httpSession.getAttribute("vendor");
		shopEntity.setBankEntity(entity.getBankEntity());
		System.out.println(shopEntity.getBankEntity());
		System.out.println(shopEntity.getImage());
		ShopEntity shopEntity2 = shopService.editShop(shopEntity);

		httpSession.setAttribute("vendor", shopEntity2);
		return "redirect:/vendorView";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/accountView")
	public String account(Model m, HttpServletRequest request, HttpSession httpSession) {

		ShopEntity shopEntity = (ShopEntity) httpSession.getAttribute("vendor");
		/*
		 * String userName=auth.getName();
		 * 
		 * System.out.println("In account"+auth.getName());
		 * 
		 * List<ShopEntity> list=shopService.getVendorByName(userName);
		 * System.out.println(list); BankEntity bankEntity = null; for (ShopEntity
		 * vendorEntity : list) { bankEntity=vendorEntity.getBankEntity(); }
		 */
		BankEntity bankEntity = shopEntity.getBankEntity();
		m.addAttribute("bankEntity", bankEntity);
		// m.addAttribute("list", list);
		// System.out.println(list);
		return "bankAccount";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/bankAccountEdit")
	public String accountEdit(@ModelAttribute("bankEntity") BankEntity bankEntity, HttpSession httpSession) {
		ShopEntity shopEntity = (ShopEntity) httpSession.getAttribute("vendor");
		// System.out.println("welcome "+bankEntity.getBankName());

		// String userName=auth.getName();

		// System.out.println("In account"+auth.getName());
		shopEntity.setBankEntity(bankEntity);
		ShopEntity shopEntity2 = shopService.editShop(shopEntity);
		httpSession.setAttribute("vendor", shopEntity2);
		return "redirect:/accountView";

	}

	

}
