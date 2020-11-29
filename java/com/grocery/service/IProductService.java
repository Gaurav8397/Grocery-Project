/**
 * 
 */
package com.grocery.service;

import java.util.List;
import com.grocery.entity.CategoryEntity;
import com.grocery.entity.ProductEntity;
import com.grocery.entity.ShopEntity;
import com.grocery.form.CategoryForm;
import com.grocery.form.ProductForm;

/**
 * @author Gaurav Mahajan
 *
 */
public interface IProductService {

	/**
	 * @param categoryForm
	 * @return
	 */
	void addNewCategory(CategoryForm categoryForm);

	/**
	 * @return
	 */
	List<CategoryEntity> getcategories();

	
	/**
	 * @param productForm
	 * @param shopEntity 
	 * @return
	 */
	public ProductEntity addNewProduct(ProductForm productForm, ShopEntity shopEntity);

	/**
	 * @param productForm
	 * @return
	 */
	CategoryEntity addNewCategory(ProductForm productForm);

	/**
	 * @return
	 */
	List<ProductEntity> getProducts();

	/**
	 * @param productId
	 */
	public void deleteProductById(long productId);

	/**
	 * @param productId
	 * @return
	 */
	ProductForm getProductById(long productId);

	/**
	 * @param productForm
	 * @return
	 */
	public int editProduct(ProductForm productForm);
	 
	/**
	 * @param productId
	 * @return
	 */
	ProductEntity getProduct(long productId);
}
