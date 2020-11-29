/**
 * 
 */
package com.grocery.service.impl;

import java.sql.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.grocery.entity.ShopEntity;
import com.grocery.form.RegisterShopForm;
import com.grocery.repository.ShopRepository;
import com.grocery.service.IShopService;

/**
 * @author Gaurav Mahajan
 *
 */
@Service
public class ShopService implements IShopService {

	@Autowired
	private ShopRepository shopRepo;

	long millis = System.currentTimeMillis();

	Date regDate = new Date(millis);

	@Override
	public ShopEntity addNewUser(RegisterShopForm registerShopForm) {
		// TODO Auto-generated method stub
		ShopEntity shopEntity = new ShopEntity();

		shopEntity.setFirstName(registerShopForm.getFirstName());
		shopEntity.setLastName(registerShopForm.getLastName());
		shopEntity.setEmail(registerShopForm.getEmail());
		shopEntity.setMobile(registerShopForm.getMobile());
		shopEntity.setShopName(registerShopForm.getShopName());
		shopEntity.setImage(registerShopForm.getImage());
		shopEntity.setAddressLine1(registerShopForm.getAddressLine1());
		shopEntity.setAddressLine2(registerShopForm.getAddressLine2());
		shopEntity.setCity(registerShopForm.getCity());
		shopEntity.setState(registerShopForm.getState());
		shopEntity.setPincode(registerShopForm.getPincode());
		shopEntity.setRecordStatus("Active");
		shopEntity.setRegistrationType(registerShopForm.getRegistrationType());
		shopEntity.setRegDate(regDate);

		shopEntity = shopRepo.save(shopEntity);

		return shopEntity;
	}

	@Override
	public ShopEntity getUserbyEmail(String email) throws Exception {
		// TODO Auto-generated method stub
		List<ShopEntity> shopEntities = shopRepo.validateUser(email);
		if (shopEntities.size() == 1) {
			return shopEntities.get(0);
		}
		return null;
	}

	@Override
	public ShopEntity editShop(ShopEntity shopEntity) {
		// TODO Auto-generated method stub

		ShopEntity shopEntity2 = shopRepo.save(shopEntity);
		return shopEntity2;
	}

	// get all shop list
	@Override
	public List<ShopEntity> getAllshop() {
		List<ShopEntity> ShopEntities = shopRepo.findAll();
		System.out.println(ShopEntities);
		return ShopEntities;
	}

}
