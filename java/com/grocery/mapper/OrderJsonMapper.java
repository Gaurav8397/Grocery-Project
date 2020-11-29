/**
 * 
 */
package com.grocery.mapper;

import java.util.List;
import com.grocery.entity.OrderEntity;

/**
 * @author Gaurav Mahajan
 *
 */
public class OrderJsonMapper {

	
	int iTotalRecords;

    int iTotalDisplayRecords;
    
    List<OrderEntity> aaData;

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
	public List<OrderEntity> getAaData() {
		return aaData;
	}

	/**
	 * @param aaData the aaData to set
	 */
	public void setAaData(List<OrderEntity> aaData) {
		this.aaData = aaData;
	}
    
    
}
