/**
 * 
 */
package com.grocery.service.impl;

import java.sql.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.grocery.entity.AddressEntity;
import com.grocery.entity.CartEntity;
import com.grocery.entity.CategoryEntity;
import com.grocery.entity.CustomerEntity;
import com.grocery.entity.ProductEntity;
import com.grocery.entity.ShopEntity;
import com.grocery.form.RegisterUserForm;
import com.grocery.repository.AddressRepository;
import com.grocery.repository.CartRepository;
import com.grocery.repository.CategoryRepository;
import com.grocery.repository.CustomerRepository;
import com.grocery.repository.ProductRepository;
import com.grocery.repository.ShopRepository;
import com.grocery.service.ICustomerService;

/**
 * @author Gaurav Mahajan
 *
 */
@Service
public class CustomerService implements ICustomerService {

	
	@Autowired
	private CustomerRepository customerRepo;
	
	@Autowired
	private AddressRepository addressRepo;
	
	@Autowired
	private CartRepository cartRepository;
	
	@Autowired
	private ShopRepository shopRepo;
	
	@Autowired
	private ProductRepository productRepo;
	
	@Autowired
	private CategoryRepository categoryRepo;
	
	long millis=System.currentTimeMillis();  
	
	 Date regDate=new Date(millis); 


	@Override
	public CustomerEntity addNewUser(RegisterUserForm registerUserForm) {
		// TODO Auto-generated method stub
		CustomerEntity  customerEntity=new CustomerEntity();
		
		customerEntity.setFirstName(registerUserForm.getFirstName());
		customerEntity.setLastName(registerUserForm.getLastName());
		customerEntity.setEmail(registerUserForm.getEmail());
		customerEntity.setMobile(registerUserForm.getMobile());
		customerEntity.setRecordStatus("Active");
		customerEntity.setRegDate(regDate);
		
		AddressEntity addressEntity=new AddressEntity();
		addressEntity.setAddressLine1(registerUserForm.getAddressLine1());
		addressEntity.setAddressLine2(registerUserForm.getAddressLine2());
		addressEntity.setCity(registerUserForm.getCity());
		addressEntity.setPincode(registerUserForm.getPincode());
		addressEntity.setState(registerUserForm.getState());
		
		customerEntity.getAddressEntities().add(addressEntity);
        
		customerEntity=customerRepo.save(customerEntity);
		
		return customerEntity;
		/*LoginEntity loginEntity=new LoginEntity();
		loginEntity.setIsAdmin("false");
		loginEntity.setUserName(registerUserForm.getEmail());
		loginEntity.setPassword(registerUserForm.getFirstName()+"@1234");
		loginEntity.setStatus("New");
		
		List<RoleEntity> roleEntities = roleRepo.findByName("USER");
		Set<RoleEntity> entities = new HashSet<RoleEntity>();
		for (RoleEntity roleEntity : roleEntities) {
			System.out.println("-----------------------------------------------> " + roleEntity.getRoleId());
			System.out.println("-----------------------------------------------> " + roleEntity.getRoleName());
			entities.add(roleEntity);
		}
		loginEntity.setRoles(entities);
	
		//customerEntity.setLoginEntity(loginEntity);
		loginEntity.setCustomerEntity(customerEntity);*/

		
		/*try {
			gmailService.send(loginEntity.getUserName(),loginEntity.getPassword(),null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			logger.error(e);
		}*/
         
	}

	@Override
	public List<CustomerEntity> getCustomers() {
		// TODO Auto-generated method stub
	
		List<CustomerEntity> customerEntities=customerRepo.findAll();
		return customerEntities;
	}

	@Override
	public List<AddressEntity> getAddresses(CustomerEntity customerEntity) {
		// TODO Auto-generated method stub
	    CustomerEntity customerEntity1=customerRepo.getOne(customerEntity.getCustomerId());
	    List<AddressEntity> addressEntities=customerEntity1.getAddressEntities();
	    
		return addressEntities;
	}

	@Override
	public void editMobileNo(CustomerEntity customerEntity) {
		// TODO Auto-generated method stub
		
		customerRepo.save(customerEntity);
	}

	@Override
	public void removeAddress(CustomerEntity customerEntity) {
		// TODO Auto-generated method stub
		customerRepo.save(customerEntity);
	}

	@Override
	public void addAddress(CustomerEntity customerEntity) {
		// TODO Auto-generated method stub
		customerRepo.save(customerEntity);
	}

	@Override
	public List<ShopEntity> getShopByPincode(Long shopPincode) {
		
		return shopRepo.getShopByPincode(shopPincode);
	}

	@Override
	public List<ProductEntity> getProductByShop(ShopEntity shopEntity) {
		
		return productRepo.getProductByShop(shopEntity);
	}

	@Override
	public ShopEntity getShopById(long shopId) {
		// TODO Auto-generated method stub
		return shopRepo.getOne(shopId);
	}

	@Override
	public CartEntity addCart(CartEntity cartEntity) {
		// TODO Auto-generated method stub
		return cartRepository.save(cartEntity);
	}

	@Override
	public CustomerEntity getCustomerById(long customerId) {
		// TODO Auto-generated method stub
		return customerRepo.getOne(customerId);
	}

	@Override
	public CartEntity getCartEntity(ShopEntity shopEntity, CustomerEntity customerEntity2) {
		// TODO Auto-generated method stub
		CartEntity cartEntity1 = null;
		List<CartEntity> cartEntities=cartRepository.findAll();
		for (CartEntity cartEntity : cartEntities) {
			if(cartEntity.getCustomerEntity().getCustomerId()==customerEntity2.getCustomerId() && cartEntity.getShopEntity().getShopId() == shopEntity.getShopId())
			{
				cartEntity1=cartEntity;
			}
		}
		return cartEntity1;
	}

	@Override
	public AddressEntity getAddressById(Long address) {
		// TODO Auto-generated method stub
		return addressRepo.getOne(address);
	}

	@Override
	public void removeCart(CartEntity cartEntity) {
		// TODO Auto-generated method stub
		cartEntity.getProductEntities().clear();
		cartEntity.setCustomerEntity(null);
		cartEntity.setShopEntity(null);
		cartRepository.save(cartEntity);
		
		cartRepository.delete(cartEntity);
	}

	@Override
	public Optional<CategoryEntity> getCategoryById(long categoryId) {
		// TODO Auto-generated method stub
		return categoryRepo.findById(categoryId);
	}

	@Override
	public List<ProductEntity> getProductCategory(ShopEntity shopEntity, Optional<CategoryEntity> categoryEntity) {
		// TODO Auto-generated method stub
		return productRepo.getProductByCategory(shopEntity,categoryEntity);
	}

	@Override
	public List<CategoryEntity> getAllCategory() {
		// TODO Auto-generated method stub
		return categoryRepo.findAll();
	}

}
