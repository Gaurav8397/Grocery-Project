/**
 * 
 */
package com.grocery.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.grocery.entity.CartProductEntity;

/**
 * @author Gaurav Mahajan
 *
 */
public interface CartProductRepository extends JpaRepository<CartProductEntity, Long> {

}
