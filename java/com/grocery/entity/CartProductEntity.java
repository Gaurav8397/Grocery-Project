/**
 * 
 */
package com.grocery.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Gaurav Mahajan
 *
 */
@Entity
@Table(name ="CartProductEntity")
public class CartProductEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	@Column(name="cartProductId",nullable = false,unique = true)
	private long cartProductId;
	
	@Column(name = "pro_name", nullable = false)
	private String pro_name;

	@Column(name = "pro_brandname", nullable = false)
	private String pro_brandname;
	
	@Column(name = "pro_image", nullable = true)
	private String pro_image;
	
	@Column(name = "pro_price", nullable = false)
	private double pro_price;

	@Column(name = "pro_weight", nullable = false)
	private String pro_weight;
	
	@Column(name = "pro_description", nullable = true)
	private String pro_description;
	
	@Column(name="pro_Quantity",nullable = false)
	private int pro_Quantity;

	/**
	 * @return the cartProductId
	 */
	public long getCartProductId() {
		return cartProductId;
	}

	/**
	 * @param cartProductId the cartProductId to set
	 */
	public void setCartProductId(long cartProductId) {
		this.cartProductId = cartProductId;
	}

	/**
	 * @return the pro_name
	 */
	public String getPro_name() {
		return pro_name;
	}

	/**
	 * @param pro_name the pro_name to set
	 */
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	/**
	 * @return the pro_brandname
	 */
	public String getPro_brandname() {
		return pro_brandname;
	}

	/**
	 * @param pro_brandname the pro_brandname to set
	 */
	public void setPro_brandname(String pro_brandname) {
		this.pro_brandname = pro_brandname;
	}

	/**
	 * @return the pro_image
	 */
	public String getPro_image() {
		return pro_image;
	}

	/**
	 * @param pro_image the pro_image to set
	 */
	public void setPro_image(String pro_image) {
		this.pro_image = pro_image;
	}

	/**
	 * @return the pro_price
	 */
	public double getPro_price() {
		return pro_price;
	}

	/**
	 * @param pro_price the pro_price to set
	 */
	public void setPro_price(double pro_price) {
		this.pro_price = pro_price;
	}

	/**
	 * @return the pro_weight
	 */
	public String getPro_weight() {
		return pro_weight;
	}

	/**
	 * @param pro_weight the pro_weight to set
	 */
	public void setPro_weight(String pro_weight) {
		this.pro_weight = pro_weight;
	}

	/**
	 * @return the pro_description
	 */
	public String getPro_description() {
		return pro_description;
	}

	/**
	 * @param pro_description the pro_description to set
	 */
	public void setPro_description(String pro_description) {
		this.pro_description = pro_description;
	}

	/**
	 * @return the pro_Quantity
	 */
	public int getPro_Quantity() {
		return pro_Quantity;
	}

	/**
	 * @param pro_Quantity the pro_Quantity to set
	 */
	public void setPro_Quantity(int pro_Quantity) {
		this.pro_Quantity = pro_Quantity;
	}
	
	
	
}
