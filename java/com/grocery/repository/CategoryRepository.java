/**
 * 
 */
package com.grocery.repository;

import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.grocery.entity.CategoryEntity;

/**
 * @author Gaurav Mahajan
 *
 */
@Repository
@Transactional
public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {

	@Query("SELECT a FROM CategoryEntity a WHERE a.pro_category=:pro_category")
	CategoryEntity getCategorybyName(@Param("pro_category") String pro_category);

	
}
