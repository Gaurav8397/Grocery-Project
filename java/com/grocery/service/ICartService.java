/**
 * 
 */
package com.grocery.service;

import java.util.List;

import com.grocery.entity.CartEntity;

/**
 * @author Gaurav Mahajan
 *
 */
public interface ICartService {

	/**
	 * @return
	 */
	public List<CartEntity> getCart();

	/**
	 * @param cartProductId
	 */
	public void deleteProductById(long cartProductId);
	
	

}
