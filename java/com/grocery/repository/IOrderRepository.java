package com.grocery.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.grocery.entity.OrderEntity;
import com.grocery.entity.ShopEntity;


@Repository
public interface IOrderRepository extends JpaRepository<OrderEntity,Long>
{

    @Query("SELECT a FROM OrderEntity a WHERE a.orderId=:orderId1")
	List<OrderEntity> getOrderlistById(@Param("orderId1")long orderId);


 	@Modifying
	@Query
	("UPDATE OrderProductEntity a SET a.productQuantity=:quantity,a.productStatus=:status  WHERE a.orderProductId=:productId")
	int updateOrderProduct(@Param("productId")long productId, @Param("quantity")int quantity,@Param("status")String status);

 	@Modifying
	@Query
	("UPDATE OrderEntity a SET a.totalAmount=:totalAmount,a.orderStatus=:status  WHERE a.orderId=:orderId")
	int updateOrder(@Param("orderId")long orderId, @Param("totalAmount")double totalAmount,@Param("status") String status);
 	
 	@Modifying
	@Query
	("UPDATE OrderEntity a SET a.orderStatus=:status  WHERE a.orderId=:orderId")
	void updateOrder(@Param("orderId")long orderId,@Param("status") String status);


 	@Query("SELECT a FROM OrderEntity a WHERE a.orderDate=:date")
	List<OrderEntity> viewByDate(@Param("date")Date date);

 	@Query("SELECT a FROM OrderEntity a WHERE a.shopEntity=:shopEntity")
	List<OrderEntity> findById(@Param("shopEntity")ShopEntity shopEntity);

	
	
}
