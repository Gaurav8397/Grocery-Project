/**
 * 
 */
package com.grocery.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grocery.entity.CustomerEntity;

/**
 * @author Gaurav Mahajan
 *
 */
@Repository
@Transactional
public interface CustomerRepository extends JpaRepository<CustomerEntity, Long> {

}
