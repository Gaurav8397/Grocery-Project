package com.grocery.entity;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * @author Gaurav Mahajan
 *
 */
@Entity
@Table(name ="ShopEntity")
public class ShopEntity implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	@Column(name="shopId",nullable = false,unique = true)
	private long shopId;
	
	@Column(name="firstName",nullable = false)
	private String firstName;
	
	@Column(name="lastName",nullable = false)
	private String lastName;
	
	@Column(name="shopName",nullable = false)
	private String shopName;
	
	@Column(name = "image", nullable = true)
	private String image;
	
	@Column(name="mobile",nullable = false,unique = true)
	private long mobile;
	
	@Column(name="email",nullable = false,unique = true)
	private String email;
	
	@Column(name="addressLine1",nullable = false)
	private String addressLine1;
	
	@Column(name = "addressLine2",nullable = true)
	private String addressLine2;
	
	@Column(name="city",nullable = false)
	private String city;
	
	@Column(name="state",nullable = false)
	private String state;
	
	@Column(name="pincode",nullable = false)
	private long pincode;
	
	@Column(name = "reg_date", nullable = false)
	private Date regDate;
	
	@Column(name = "record_Status",nullable = true)
	private String recordStatus;
	
	@Column(name = "registration_Type",nullable = true)
	private String registrationType;
	
	@OneToOne(cascade = CascadeType.ALL)
	private BankEntity bankEntity;
	
	/**
	 * @return the shopId
	 */
	public long getShopId() {
		return shopId;
	}

	/**
	 * @param shopId the shopId to set
	 */
	public void setShopId(long shopId) {
		this.shopId = shopId;
	}

	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * @return the shopName
	 */
	public String getShopName() {
		return shopName;
	}
	
	/**
	 * @return the image
	 */
	public String getImage() {
		return image;
	}

	/**
	 * @param image the image to set
	 */
	public void setImage(String image) {
		this.image = image;
	}

	/**
	 * @param shopName the shopName to set
	 */
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	/**
	 * @return the mobile
	 */
	public long getMobile() {
		return mobile;
	}

	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(long mobile) {
		this.mobile = mobile;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the addressLine1
	 */
	public String getAddressLine1() {
		return addressLine1;
	}

	/**
	 * @param addressLine1 the addressLine1 to set
	 */
	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	/**
	 * @return the addressLine2
	 */
	public String getAddressLine2() {
		return addressLine2;
	}

	/**
	 * @param addressLine2 the addressLine2 to set
	 */
	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}

	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}

	/**
	 * @return the state
	 */
	public String getState() {
		return state;
	}

	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
	}

	/**
	 * @return the pincode
	 */
	public long getPincode() {
		return pincode;
	}

	/**
	 * @param pincode the pincode to set
	 */
	public void setPincode(long pincode) {
		this.pincode = pincode;
	}

	/**
	 * @return the regDate
	 */
	public Date getRegDate() {
		return regDate;
	}

	/**
	 * @param regDate the regDate to set
	 */
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	/**
	 * @return the recordStatus
	 */
	public String getRecordStatus() {
		return recordStatus;
	}

	/**
	 * @param recordStatus the recordStatus to set
	 */
	public void setRecordStatus(String recordStatus) {
		this.recordStatus = recordStatus;
	}

	/**
	 * @return the registrationType
	 */
	public String getRegistrationType() {
		return registrationType;
	}

	/**
	 * @param registrationType the registrationType to set
	 */
	public void setRegistrationType(String registrationType) {
		this.registrationType = registrationType;
	}

	
	/**
	 * @return the bankEntity
	 */
	public BankEntity getBankEntity() {
		return bankEntity;
	}

	/**
	 * @param bankEntity the bankEntity to set
	 */
	public void setBankEntity(BankEntity bankEntity) {
		this.bankEntity = bankEntity;
	}

	@Override
	public String toString() {
		return "ShopEntity [shopId=" + shopId + ", firstName=" + firstName + ", lastName=" + lastName + ", shopName="
				+ shopName + ", mobile=" + mobile + ", email=" + email + ", addressLine1=" + addressLine1
				+ ", addressLine2=" + addressLine2 + ", city=" + city + ", state=" + state + ", pincode=" + pincode
				+ ", regDate=" + regDate + ", recordStatus=" + recordStatus + ", registrationType=" + registrationType
				+ "]";
	}

	
}
