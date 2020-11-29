/**
 * 
 */
package com.grocery.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.grocery.entity.ShopEntity;

/**
 * @author Gaurav Mahajan
 *
 */
@Repository
@Transactional
public interface ShopRepository extends JpaRepository<ShopEntity, Long> {

	/**
	 * @param email
	 * @return
	 */
	@Query("SELECT a FROM ShopEntity a WHERE a.email=:email")
	List<ShopEntity> validateUser(@Param("email") String email);

	@Query("SELECT a FROM ShopEntity a WHERE a.pincode=:pincode")
	List<ShopEntity> getShopByPincode(@Param("pincode") Long shopPincode);

	
	
}
