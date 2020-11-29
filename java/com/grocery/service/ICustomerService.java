/**
 * 
 */
package com.grocery.service;

import java.util.List;
import java.util.Optional;

import com.grocery.entity.AddressEntity;
import com.grocery.entity.CartEntity;
import com.grocery.entity.CategoryEntity;
import com.grocery.entity.CustomerEntity;
import com.grocery.entity.ProductEntity;
import com.grocery.entity.ShopEntity;
import com.grocery.form.RegisterUserForm;

/**
 * @author Gaurav Mahajan
 *
 */
public interface ICustomerService {

	/**
	 * @param registerUserForm
	 * @return
	 */
	CustomerEntity addNewUser(RegisterUserForm registerUserForm);

	/**
	 * @return
	 */
	public List<CustomerEntity> getCustomers();

	/**
	 * @param customerEntity
	 * @return
	 */
	public List<AddressEntity> getAddresses(CustomerEntity customerEntity);

	/**
	 * @param customerEntity
	 */
	void editMobileNo(CustomerEntity customerEntity);

	/**
	 * @param customerEntity
	 */
	void removeAddress(CustomerEntity customerEntity);

	/**
	 * @param customerEntity
	 */
	void addAddress(CustomerEntity customerEntity);
	
	

	/**
	 * @param shoppincode
	 * @return
	 */
	List<ShopEntity> getShopByPincode(Long shoppincode);

	/**
	 * @param shopId
	 * @return
	 */
	List<ProductEntity> getProductByShop(ShopEntity shopEntity);

	/**
	 * @param shopId
	 * @return
	 */
	ShopEntity getShopById(long shopId);

	/**
	 * @param cartEntity
	 * @return 
	 */
	CartEntity addCart(CartEntity cartEntity);

	/**
	 * @param customerId
	 * @return
	 */
	CustomerEntity getCustomerById(long customerId);

	/**
	 * @param shopEntity
	 * @param customerEntity2
	 * @return
	 */
	CartEntity getCartEntity(ShopEntity shopEntity, CustomerEntity customerEntity2);

	/**
	 * @param address
	 * @return
	 */
	AddressEntity getAddressById(Long address);

	void removeCart(CartEntity cartEntity);

	Optional<CategoryEntity> getCategoryById(long categoryId);

	List<ProductEntity> getProductCategory(ShopEntity shopEntity, Optional<CategoryEntity> categoryEntity);

	List<CategoryEntity> getAllCategory();
	
}
