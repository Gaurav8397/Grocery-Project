package com.grocery.mapper;

import java.util.List;

import com.grocery.entity.ShopEntity;



public class ShopJsonMapper {
	int iTotalRecords;

    int iTotalDisplayRecords;
    
    List<ShopEntity> aaData;

	public int getiTotalRecords() {
		return iTotalRecords;
	}

	public void setiTotalRecords(int iTotalRecords) {
		this.iTotalRecords = iTotalRecords;
	}

	public int getiTotalDisplayRecords() {
		return iTotalDisplayRecords;
	}

	public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
		this.iTotalDisplayRecords = iTotalDisplayRecords;
	}

	public List<ShopEntity> getAaData() {
		return aaData;
	}

	public void setAaData(List<ShopEntity> aaData) {
		this.aaData = aaData;
	}
    
    

}
