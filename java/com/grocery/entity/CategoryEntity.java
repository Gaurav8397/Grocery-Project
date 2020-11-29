/**
 * 
 */
package com.grocery.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author Gaurav Mahajan
 *
 */
@Entity
@Table(name = "CategoryEntity")
public class CategoryEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "categoryId",nullable = false,unique = true)
	private long categoryId;
	
	@Column(name = "pro_category", nullable = false,unique = true)
	private String pro_category;

	@OneToMany(cascade = CascadeType.ALL)
	private List<ProductEntity> productEntities =new ArrayList<ProductEntity>(0);

	/**
	 * @return the categoryId
	 */
	public long getCategoryId() {
		return categoryId;
	}

	/**
	 * @param categoryId the categoryId to set
	 */
	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}

	/**
	 * @return the pro_category
	 */
	public String getPro_category() {
		return pro_category;
	}

	/**
	 * @param pro_category the pro_category to set
	 */
	public void setPro_category(String pro_category) {
		this.pro_category = pro_category;
	}

	/**
	 * @return the productEntities
	 */
	public List<ProductEntity> getProductEntities() {
		return productEntities;
	}

	/**
	 * @param productEntities the productEntities to set
	 */
	public void setProductEntities(List<ProductEntity> productEntities) {
		this.productEntities = productEntities;
	}
	
	

}
