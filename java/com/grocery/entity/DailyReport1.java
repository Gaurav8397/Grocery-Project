package com.grocery.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class DailyReport1 {
	
	@Id
	private int day;
	private int count;
	
	private int quantity;
	private double amount;
	
	private String date;
	
	
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "DailyReport1 [day=" + day + ", count=" + count + ", quantity=" + quantity + ", amount=" + amount
				+ ", date=" + date + "]";
	}

		

}
