package com.grocery.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class MonthlyReport {
	
	@Id
	private String month;
	private int count;
	private int quantity;
	private double amount;
	
	
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "MonthlyReport [month=" + month + ", count=" + count + ", quantity=" + quantity + ", amount=" + amount
				+ "]";
	}
	
	
	
	
	

}
