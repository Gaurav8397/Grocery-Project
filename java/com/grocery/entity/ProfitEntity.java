package com.grocery.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ProfitEntity implements Serializable {
  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private long count;
	private long amount;
	


	

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}


	

	
	
}
