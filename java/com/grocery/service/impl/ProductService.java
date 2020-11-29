/**
 * 
 */
package com.grocery.service.impl;




import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.grocery.entity.CategoryEntity;
import com.grocery.entity.ProductEntity;
import com.grocery.entity.ShopEntity;
import com.grocery.form.CategoryForm;
import com.grocery.form.ProductForm;
import com.grocery.repository.CategoryRepository;
import com.grocery.repository.ProductRepository;
import com.grocery.service.IProductService;

/**
 * @author Gaurav Mahajan
 *
 */
@Service
public class ProductService implements IProductService {

	
	@Autowired
	private CategoryRepository categoryRepo;
	
	@Autowired
	private ProductRepository productRepo;

	private int status;
	
	@Override
	public void addNewCategory(CategoryForm categoryForm) {
		// TODO Auto-generated method stub
		CategoryEntity categoryEntity=new CategoryEntity();
		categoryEntity.setPro_category(categoryForm.getPro_category());
		categoryRepo.save(categoryEntity);
	}

	@Override
	public List<CategoryEntity> getcategories() {
		// TODO Auto-generated method stub
		List<CategoryEntity> categoryEntities =categoryRepo.findAll();
		return categoryEntities;
	}

	@Override
	public ProductEntity addNewProduct(ProductForm productForm,ShopEntity shopEntity) {
		// TODO Auto-generated method stub
		System.out.println(productForm.getPro_category());
		CategoryEntity categoryEntity = categoryRepo.getCategorybyName(productForm.getPro_category());
		
		System.out.println(categoryEntity);
		
		ProductEntity productEntity=new ProductEntity();
		productEntity.setPro_name(productForm.getPro_name());
		productEntity.setPro_brandname(productForm.getPro_brandname());
		productEntity.setPro_price(productForm.getPro_price());
		productEntity.setPro_weight(productForm.getPro_weight());
		productEntity.setPro_status(productForm.getPro_status());
		
	    productEntity.setPro_image(productForm.getPro_image());
		
		productEntity.setPro_description(productForm.getPro_description());
		
		productEntity.setCategoryEntity(categoryEntity);
		
		productEntity.setShopEntity(shopEntity);
		
		productRepo.save(productEntity);
		
		return productEntity;
	}

	

	@Override
	public CategoryEntity addNewCategory(ProductForm productForm) {
		// TODO Auto-generated method stub
		CategoryEntity categoryEntity=new CategoryEntity();
		categoryEntity.setPro_category(productForm.getPro_category());
		categoryRepo.save(categoryEntity);
		
		return categoryEntity;
	}

	@Override
	public List<ProductEntity> getProducts() {
		// TODO Auto-generated method stub
		List<ProductEntity> productEntities =productRepo.findAll();
		
		return productEntities;
	}

	@Override
	public void deleteProductById(long productId) {
		// TODO Auto-generated method stub
		String n=null;
		status=productRepo.update(productId,n);
		if(status > 0) {
		  productRepo.deleteById(productId);
		}
	}

	@Override
	public ProductForm getProductById(long productId) {
		// TODO Auto-generated method stub
		ProductEntity productEntity=productRepo.getOne(productId);
		
		ProductForm productForm=new ProductForm();
		
		productForm.setPro_name(productEntity.getPro_name());
		productForm.setPro_brandname(productEntity.getPro_brandname());
		productForm.setPro_image(productEntity.getPro_image());
		productForm.setPro_status(productEntity.getPro_status());
		productForm.setPro_description(productEntity.getPro_description());
		productForm.setPro_weight(productEntity.getPro_weight());
		productForm.setPro_price(productEntity.getPro_price());
		productForm.setPro_category(productEntity.getCategoryEntity().getPro_category());
		
		return productForm;
	}

	
	@Override
	public int editProduct(ProductForm productForm) {
		// TODO Auto-generated method stub

		status = productRepo.editProduct(productForm.getPro_image(),productForm.getPro_price(),productForm.getPro_status(),productForm.getPro_weight(),productForm.getPro_description(),productForm.getPro_name());
		System.out.println("Update= "+status);
		return status;
	}

	@Override
	public ProductEntity getProduct(long productId) {
		// TODO Auto-generated method stub
		return productRepo.getOne(productId);
	}

}
