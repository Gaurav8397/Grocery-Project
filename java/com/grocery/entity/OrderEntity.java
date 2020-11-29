package com.grocery.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name ="OrderEntity")
public class OrderEntity implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	@Column(name="orderId",nullable = false,unique = true)
	private long orderId;
	
	@Column(name="orderDate",nullable = false)
	private Date orderDate;
	
	@Column(name="orderStatus",nullable = false)
	private String orderStatus;
	
	@Column(name="orderAmount",nullable = false)
	private double orderAmount;
	
	@Column(name="deliveryCharge",nullable = false)
	private double deliveryCharge;

	@Column(name="totalAmount",nullable = false)
	private double totalAmount;
	
	@Column(name="totalQuantity",nullable = false)
	private double totalQuantity;

	@Column(name="paymentMode",nullable = false)
	private String paymentMode;
	
	@OneToMany(cascade = CascadeType.ALL)
	private List<OrderProductEntity> productEntities = new ArrayList<OrderProductEntity>(0);
	

	@OneToOne(cascade = CascadeType.ALL)
	AddressEntity addressEntity;
	
	@OneToOne(cascade = CascadeType.ALL)
	CustomerEntity customerEntity;
	
	@OneToOne(cascade = CascadeType.ALL)
	ShopEntity shopEntity;
	
	/**
	 * @return the totalQuantity
	 */
	public double getTotalQuantity() {
		return totalQuantity;
	}

	/**
	 * @param totalQuantity the totalQuantity to set
	 */
	public void setTotalQuantity(double totalQuantity) {
		this.totalQuantity = totalQuantity;
	}
	
	public AddressEntity getAddressEntity() {
		return addressEntity;
	}

	public void setAddressEntity(AddressEntity addressEntity) {
		this.addressEntity = addressEntity;
	}

	

	public CustomerEntity getCustomerEntity() {
		return customerEntity;
	}

	public void setCustomerEntity(CustomerEntity customerEntity) {
		this.customerEntity = customerEntity;
	}

	public long getOrderId() {
		return orderId;
	}

	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public double getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(double orderAmount) {
		this.orderAmount = orderAmount;
	}

	public double getDeliveryCharge() {
		return deliveryCharge;
	}

	public void setDeliveryCharge(double deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}


	public List<OrderProductEntity> getProductEntities() {
		return productEntities;
	}

	public void setProductEntities(List<OrderProductEntity> productEntities) {
		this.productEntities = productEntities;
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
