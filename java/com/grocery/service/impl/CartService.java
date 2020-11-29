/**
 * 
 */
package com.grocery.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grocery.entity.CartEntity;

import com.grocery.repository.CartRepository;
import com.grocery.service.ICartService;

/**
 * @author Gaurav Mahajan
 *
 */
@Service
public class CartService implements ICartService {
	
	@Autowired
	private CartRepository cartRepo;

	
	@Override
	public List<CartEntity> getCart() {
		// TODO Auto-generated method stub
		
		return cartRepo.findAll();
	}

	@Override
	public void deleteProductById(long cartProductId) {
		// TODO Auto-generated method stub
		
	   
		
	}

}
