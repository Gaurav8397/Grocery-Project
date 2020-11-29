package com.grocery.repository;


import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grocery.entity.OrderProductEntity;

@Repository
@Transactional
public interface OrderProductRepository extends JpaRepository<OrderProductEntity,Long> {

	
}
