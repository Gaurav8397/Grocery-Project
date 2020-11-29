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
import javax.persistence.ManyToOne;
import javax.persistence.Table;



/**
 * @author Gaurav Mahajan
 *
 */
@Entity
@Table(name = "ProductEntity")
public class ProductEntity implements Serializable { 

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "productId",nullable = false,unique = true)
	private long productId;
	
	@Column(name = "pro_name", nullable = false)
	private String pro_name;

	@Column(name = "pro_brandname", nullable = false)
	private String pro_brandname;
	
	@Column(name = "pro_image", nullable = false)
	private String pro_image;
	
	@Column(name = "pro_price", nullable = false)
	private double pro_price;

	@Column(name = "pro_weight", nullable = false)
	private String pro_weight;

	@Column(name = "pro_status", nullable = false)
	private String pro_status;

	@Column(name = "pro_description", nullable = false)
	private String pro_description;
	
	@ManyToOne
	private CategoryEntity categoryEntity;

	@ManyToOne
    private ShopEntity shopEntity;
	
	/**
	 * @return the productId
	 */
	public long getProductId() {
		return productId;
	}

	/**
	 * @param productId the productId to set
	 */
	public void setProductId(long productId) {
		this.productId = productId;
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
	 * @return the pro_status
	 */
	public String getPro_status() {
		return pro_status;
	}

	/**
	 * @param pro_status the pro_status to set
	 */
	public void setPro_status(String pro_status) {
		this.pro_status = pro_status;
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
	 * @return the categoryEntity
	 */
	public CategoryEntity getCategoryEntity() {
		return categoryEntity;
	}

	/**
	 * @param categoryEntity the categoryEntity to set
	 */
	public void setCategoryEntity(CategoryEntity categoryEntity) {
		this.categoryEntity = categoryEntity;
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

	@Override
	public int hashCode() {
		 final int prime = 31;
	        int result = 1;
	        result = prime * result
	                + ((productId == 0) ? 0 : 12345);
	        return result;
	}

	
  
	
	
	
}
