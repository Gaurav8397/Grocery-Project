package com.grocery.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class YearlyReport {
	
	@Id
	private int year;
	private int count;
	private int quantity;
	private double amount;
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
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
		return "YearlyReport [year=" + year + ", count=" + count + ", quantity=" + quantity + ", amount=" + amount
				+ "]";
	}
	
	

}
