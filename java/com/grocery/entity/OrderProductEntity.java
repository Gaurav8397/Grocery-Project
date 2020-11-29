package com.grocery.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name ="OrderProductEntity")
public class OrderProductEntity implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	@Column(name="orderProductId",nullable = false,unique = true)
	private long orderProductId;
	
	@Column(name="productName",nullable = false)
	private String productName;
	
	@Column(name="productBrandName",nullable = false)
	private String productBrandName;
	
	@Column(name="productDescription",nullable = false)
	private String productDescription;
	
	@Column(name="productPrice",nullable = false)
	private double productPrice;
	
	@Column(name="productImage",nullable = true)
	private String productImage;
	
	@Column(name="productStatus",nullable = false)
	private String productStatus;
	
	@Column(name="productQuantity",nullable = false)
	private int productQuantity;

	/**
	 * @return the orderProductId
	 */
	public long getOrderProductId() {
		return orderProductId;
	}

	/**
	 * @param orderProductId the orderProductId to set
	 */
	public void setOrderProductId(long orderProductId) {
		this.orderProductId = orderProductId;
	}

	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}

	/**
	 * @param productName the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}

	/**
	 * @return the productBrandName
	 */
	public String getProductBrandName() {
		return productBrandName;
	}

	/**
	 * @param productBrandName the productBrandName to set
	 */
	public void setProductBrandName(String productBrandName) {
		this.productBrandName = productBrandName;
	}

	/**
	 * @return the productDescription
	 */
	public String getProductDescription() {
		return productDescription;
	}

	/**
	 * @param productDescription the productDescription to set
	 */
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	/**
	 * @return the productPrice
	 */
	public double getProductPrice() {
		return productPrice;
	}

	/**
	 * @param productPrice the productPrice to set
	 */
	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	/**
	 * @return the productImage
	 */
	public String getProductImage() {
		return productImage;
	}

	/**
	 * @param productImage the productImage to set
	 */
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	/**
	 * @return the productStatus
	 */
	public String getProductStatus() {
		return productStatus;
	}

	/**
	 * @param productStatus the productStatus to set
	 */
	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	/**
	 * @return the productQuantity
	 */
	public int getProductQuantity() {
		return productQuantity;
	}

	/**
	 * @param productQuantity the productQuantity to set
	 */
	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	
	
	
	

}
