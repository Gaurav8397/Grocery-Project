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

import com.grocery.entity.RoleEntity;

/**
 * @author Gaurav Mahajan
 *
 */
@Repository
@Transactional
public interface RoleRepository extends JpaRepository<RoleEntity, Long> {

	@Query("SELECT a FROM RoleEntity a WHERE a.roleName=:roleName")
	List<RoleEntity> findByName(@Param("roleName") String roleName);
}
