/**
 * 
 */
package com.grocery.repository;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.grocery.entity.LoginEntity;

/**
 * @author Gaurav Mahajan
 *
 */
@Repository
@Transactional
public interface LoginRepository extends JpaRepository<LoginEntity, Long> {

	/**
	 * @param userName
	 * @param password
	 * @return
	 */
	@Query("SELECT a FROM LoginEntity a WHERE a.userName=:userName and a.password=:password")
	List<LoginEntity> validateLoginUser(@Param("userName") String userName, @Param("password") String password);
	
	/**
	 * @param userName
	 * @return
	 */
	@Query("SELECT a FROM LoginEntity a WHERE a.userName=:userName")
	List<LoginEntity> validateUser(@Param("userName") String userName);

	/**
	 * @param userName
	 * @param password
	 * @param status 
	 * @return 
	 * @return
	 */
	@Modifying
	@Query("UPDATE LoginEntity a SET a.password=:password, a.status=:status WHERE a.userName=:userName")
	 int update(@Param("userName") String userName, @Param("password") String password, @Param("status") String status);


}
