/**
 * 
 */
package com.grocery.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * @author Gaurav Mahajan
 *
 */
@Entity
@Table(name ="CartEntity")
public class CartEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	@Column(name="cartId",nullable = false,unique = true)
	private long cartId;
	
	@OneToMany(cascade = CascadeType.ALL)
	private Set<ProductEntity> productEntities = new HashSet<ProductEntity>(0);
	
	@OneToOne(cascade = CascadeType.ALL)
	CustomerEntity customerEntity;
	
	@OneToOne(cascade = CascadeType.ALL)
	private ShopEntity shopEntity;

	/**
	 * @return the cartId
	 */
	public long getCartId() {
		return cartId;
	}

	/**
	 * @param cartId the cartId to set
	 */
	public void setCartId(long cartId) {
		this.cartId = cartId;
	}

	

	/**
	 * @return the productEntities
	 */
	public Set<ProductEntity> getProductEntities() {
		return productEntities;
	}

	/**
	 * @param productEntities the productEntities to set
	 */
	public void setProductEntities(Set<ProductEntity> productEntities) {
		this.productEntities = productEntities;
	}

	/**
	 * @return the customerEntity
	 */
	public CustomerEntity getCustomerEntity() {
		return customerEntity;
	}

	/**
	 * @param customerEntity the customerEntity to set
	 */
	public void setCustomerEntity(CustomerEntity customerEntity) {
		this.customerEntity = customerEntity;
	}

	/**
	 * @return the shopEntity
	 */
	public ShopEntity getShopEntity() {
		return shopEntity;
	}

	/**
	 * @param shopEntity the shopEntity to set
	 */
	public void setShopEntity(ShopEntity shopEntity) {
		this.shopEntity = shopEntity;
	}
	
	
}
