/**
 * 
 */
package com.grocery.service;

import java.util.List;

import com.grocery.entity.ShopEntity;
import com.grocery.form.RegisterShopForm;

/**
 * @author Gaurav Mahajan
 *
 */

public interface IShopService {

	/**
	 * @param registerShopForm
	 * @return
	 */
	ShopEntity addNewUser(RegisterShopForm registerShopForm);

	/**
	 * @param email
	 * @return
	 * @throws Exception
	 */
	public ShopEntity getUserbyEmail(String email) throws Exception;

	/**
	 * @param shopEntity
	 * @return 
	 */
	ShopEntity editShop(ShopEntity shopEntity);

	List<ShopEntity> getAllshop();
	
	

}
