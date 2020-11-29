/**
 * 
 */
package com.grocery.repository;


import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.grocery.entity.CategoryEntity;
import com.grocery.entity.ProductEntity;
import com.grocery.entity.ShopEntity;

/**
 * @author Gaurav Mahajan
 *
 */
@Repository
@Transactional
public interface ProductRepository extends JpaRepository<ProductEntity, Long> {
 
	/**
	 * @param productId
	 * @param n
	 * @return
	 */
	@Modifying
	@Query("UPDATE ProductEntity a SET a.categoryEntity=:n  WHERE a.productId=:productId")
	int update(@Param("productId") long productId, @Param("n") String n);

	/**
	 * @param pro_image
	 * @param pro_price
	 * @param pro_status
	 * @param pro_weight
	 * @param pro_description
	 * @return
	 */
	@Modifying
	@Query("UPDATE ProductEntity a SET a.pro_image=:pro_image , a.pro_price=:pro_price , a.pro_status=:pro_status , a.pro_weight=:pro_weight , a.pro_description=:pro_description WHERE a.pro_name=:pro_name")
	int editProduct(@Param("pro_image") String pro_image, @Param("pro_price") double pro_price, @Param("pro_status") String pro_status, @Param("pro_weight") String pro_weight, @Param("pro_description") String pro_description, @Param("pro_name") String pro_name);

	
	@Query("SELECT a FROM ProductEntity a WHERE a.shopEntity=:shopEntity")
	List<ProductEntity> getProductByShop(@Param("shopEntity") ShopEntity shopEntity);

	@Query("SELECT a FROM ProductEntity a WHERE a.shopEntity=:shopEntity AND a.categoryEntity=:categoryEntity")
	List<ProductEntity> getProductByCategory(@Param("shopEntity")ShopEntity shopEntity, @Param("categoryEntity")Optional<CategoryEntity> categoryEntity);
}
