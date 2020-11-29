/**
 * 
 */
package com.grocery.mapper;

import java.util.List;

import com.grocery.entity.CustomerEntity;

/**
 * @author Gaurav Mahajan
 *
 */
public class CustomerJsonMapper {
	
	int iTotalRecords;

    int iTotalDisplayRecords;
    
    List<CustomerEntity> aaData;

	/**
	 * @return the iTotalRecords
	 */
	public int getiTotalRecords() {
		return iTotalRecords;
	}

	/**
	 * @param iTotalRecords the iTotalRecords to set
	 */
	public void setiTotalRecords(int iTotalRecords) {
		this.iTotalRecords = iTotalRecords;
	}

	/**
	 * @return the iTotalDisplayRecords
	 */
	public int getiTotalDisplayRecords() {
		return iTotalDisplayRecords;
	}

	/**
	 * @param iTotalDisplayRecords the iTotalDisplayRecords to set
	 */
	public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
		this.iTotalDisplayRecords = iTotalDisplayRecords;
	}

	/**
	 * @return the aaData
	 */
	public List<CustomerEntity> getAaData() {
		return aaData;
	}

	/**
	 * @param aaData the aaData to set
	 */
	public void setAaData(List<CustomerEntity> aaData) {
		this.aaData = aaData;
	}


}
