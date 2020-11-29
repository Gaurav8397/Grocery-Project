package com.grocery.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name ="BankEntity")
public class BankEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "bankId",unique = true, nullable = false)
	private long bankId;
	
	@Column(name="bankName",nullable = false)
	private String bankName;
	
	@Column(name="accountNo",nullable = false)
	private String accountNo;
	
	@Column(name="ifscCode",nullable = false)
	private String ifscCode;
	
	
	public long getBankId() {
		return bankId;
	}

	public void setBankId(long bankId) {
		this.bankId = bankId;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getIfscCode() {
		return ifscCode;
	}

	public void setIfscCode(String ifscCode) {
		this.ifscCode = ifscCode;
	}

	

	@Override
	public String toString() {
		return "BankEntity [bankId=" + bankId + ", bankName=" + bankName + ", accountNo=" + accountNo + ", ifscCode="
				+ ifscCode + "]";
	}
	
	

	
	
	
	

}
