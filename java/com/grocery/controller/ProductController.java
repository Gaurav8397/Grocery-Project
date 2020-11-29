package com.grocery.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.grocery.entity.CategoryEntity;
import com.grocery.entity.ProductEntity;
import com.grocery.entity.ShopEntity;
import com.grocery.form.CategoryForm;
import com.grocery.form.ProductForm;
import com.grocery.mapper.ProductJsonMapper;
import com.grocery.service.IProductService;



/**
 * @author Gaurav Mahajan
 *
 */

@Controller
public class ProductController {
	
	@Autowired
	private IProductService productService;
	
	 //Save the uploaded file to this folder
	private static String UPLOADED_FOLDER = "./ProImages/";
	
	/**
	 * @param model
	 * @return
	 * This method will load jsp page
	 */
	@RequestMapping(value = "/product.web", method = RequestMethod.GET)
	public String product(Model model){
		
		return "product";	
	}
 
	// this method will help jsp to load the data from DB using ajax call using json format
			@RequestMapping(value = "/product.web", method = RequestMethod.GET, produces = "application/json")
			public @ResponseBody String loandTableDataFromDB(HttpServletRequest request, Model model,HttpSession httpSession) throws Exception {
				ShopEntity shopEntity=(ShopEntity) httpSession.getAttribute("vendor");
				List<ProductEntity> productEntities = productService.getProducts(); // all Data
				
				/*for (ProductEntity productEntity : productEntities) {
					if(productEntity.getShopEntity().getShopId()!=shopEntity.getShopId()) {
						productEntities.remove(productEntity);
					}	
				}*/
				
				productEntities.removeIf(ProductEntity -> (ProductEntity.getShopEntity().getShopId() != shopEntity.getShopId()));//Session wise data
				System.out.println(shopEntity.getShopId());
				
				ProductJsonMapper productJsonMapper = new ProductJsonMapper();
				productJsonMapper.setAaData(productEntities);
				productJsonMapper.setiTotalDisplayRecords(productEntities.size());
				productJsonMapper.setiTotalRecords(productEntities.size());
				
				Gson gson = new GsonBuilder().setPrettyPrinting().create();
				String jsonProductData = gson.toJson(productJsonMapper);
				System.out.println("Converted Json : "+ jsonProductData);
				return jsonProductData;
			}
		
	
	/**
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/addNewProduct",method = RequestMethod.GET)
	public String showProductForm(Model model)
	{
		List<CategoryEntity> categoryEntities=productService.getcategories();
		
		model.addAttribute("categoryEntities", categoryEntities);
		model.addAttribute("productForm", new ProductForm());
		model.addAttribute("categoryForm", new CategoryForm());
		
		return "addNewProduct";
		
	}
	
	
	/**
	 * @param productForm
	 * @param model
	 * @param httpRequest
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/addNewProduct",method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("productForm") ProductForm productForm, Model model, HttpServletRequest httpRequest,  
			 @RequestParam("file") MultipartFile file,  HttpSession httpSession) throws Exception{
		 System.out.println("Original Image Byte Size - " + file.getBytes().length);
		  
		 ServletContext context = httpSession.getServletContext();  
		    String path = context.getRealPath(UPLOADED_FOLDER);  
		    String filename = file.getOriginalFilename();  
		    
		    System.out.println(path+filename);        
		  
		    byte[] bytes = file.getBytes(); 
		    
		    BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(  
		         new File(path + filename)));  
		    stream.write(bytes);  
		    stream.flush();  
		    stream.close();  
		    
		   ShopEntity shopEntity=(ShopEntity) httpSession.getAttribute("vendor");
		    productForm.setPro_image(filename);
		    System.out.println(filename);
		ProductEntity productEntity=productService.addNewProduct(productForm,shopEntity);
		if(productEntity!=null && productEntity.getProductId() > 0) {
		  
			return "redirect:/product.web";
		}
		return "redirect:/addNewProduct";
		
	}
	
	@RequestMapping(value = "/deleteProduct/{productId}", method = RequestMethod.GET)
    String deleteProduct(Model model,@PathVariable ("productId") long productId) throws Exception{
		productService.deleteProductById(productId);
		
		return "redirect:/product.web";
    }
	
	@RequestMapping(value = "/editProduct/{productId}", method = RequestMethod.GET)
    String editProductForm(Model model,@PathVariable ("productId") long productId) throws Exception{
		ProductForm productForm=productService.getProductById(productId);
		model.addAttribute("productForm",  productForm);
		//model.addAttribute("image",new File(productForm.getPro_image()));
		return "editProduct";
    }
	
	@RequestMapping(value = "/changeProduct" , method = RequestMethod.POST)
	public String editProduct(@ModelAttribute("productForm") ProductForm productForm, Model model, HttpServletRequest httpRequest,
		  HttpSession httpSession) throws Exception{
		
	/*	 System.out.println("Original Image Byte Size - " + file.getBytes().length);
		  ServletContext context = httpSession.getServletContext();  
		    String path = context.getRealPath(UPLOADED_FOLDER);  
		    String filename = file.getOriginalFilename();  
		    
		    System.out.println(path+filename);        
		  
		    byte[] bytes = file.getBytes(); 
		    
		    BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(  
		         new File(path + filename)));  
		    stream.write(bytes);  
		    stream.flush();  
		    stream.close(); 
		 
		    productForm.setPro_image(filename);*/
		int status=productService.editProduct(productForm);
		if(status!=0) {
			return "redirect:/product.web";
		}
		return null;
	}
	
	@RequestMapping(value = "/viewProduct/{productId}", method = RequestMethod.GET)
    String viewProduct(Model model,@PathVariable ("productId") long productId) throws Exception{
		ProductForm productForm=productService.getProductById(productId);
		
		String image="../ProImages/"+productForm.getPro_image();
		model.addAttribute("productForm",  productForm);
	    model.addAttribute("image", image);
		return "viewProduct";
    }
	


@SuppressWarnings("unused")
private static byte[] readBytesFromFile(File file) {

    FileInputStream fileInputStream = null;
    byte[] bytesArray = null;

    try {

        bytesArray = new byte[(int) file.length()];

        //read file into bytes[]
        fileInputStream = new FileInputStream(file);
        fileInputStream.read(bytesArray);

    } catch (IOException e) {
        e.printStackTrace();
    } finally {
        if (fileInputStream != null) {
            try {
                fileInputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    return bytesArray;
 }

}

