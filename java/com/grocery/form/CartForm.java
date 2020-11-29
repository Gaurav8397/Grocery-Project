/**
 * 
 */
package com.grocery.form;

import java.io.Serializable;




/**
 * @author Gaurav Mahajan
 *
 */
public class CartForm implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	

	private double productOrderTotalPrice;
	
	private double deliveryCharge;
	
	private double OrderTotalPrice;

	/**
	 * @return the productOrderTotalPrice
	 */
	public double getProductOrderTotalPrice() {
		return productOrderTotalPrice;
	}

	/**
	 * @param productOrderTotalPrice the productOrderTotalPrice to set
	 */
	public void setProductOrderTotalPrice(double productOrderTotalPrice) {
		this.productOrderTotalPrice = productOrderTotalPrice;
	}

	/**
	 * @return the deliveryCharge
	 */
	public double getDeliveryCharge() {
		return deliveryCharge;
	}

	/**
	 * @param deliveryCharge the deliveryCharge to set
	 */
	public void setDeliveryCharge(double deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}

	/**
	 * @return the orderTotalPrice
	 */
	public double getOrderTotalPrice() {
		return OrderTotalPrice;
	}

	/**
	 * @param orderTotalPrice the orderTotalPrice to set
	 */
	public void setOrderTotalPrice(double orderTotalPrice) {
		OrderTotalPrice = orderTotalPrice;
	}
	
}
