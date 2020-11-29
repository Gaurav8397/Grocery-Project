/**
 * 
 */
package com.grocery.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.grocery.app.GmailService;
import com.grocery.entity.CustomerEntity;
import com.grocery.entity.LoginEntity;
import com.grocery.entity.RoleEntity;
import com.grocery.entity.ShopEntity;
import com.grocery.form.ChangePassForm;
import com.grocery.form.ForgotPassForm;
import com.grocery.form.LoginForm;
import com.grocery.repository.LoginRepository;
import com.grocery.repository.RoleRepository;
import com.grocery.service.ILoginService;
import com.grocery.service.IShopService;

/**
 * @author Gaurav Mahajan
 *
 */
@Service
public class LoginService implements ILoginService {

	@Autowired
	private LoginRepository loginRepo;
	
	@Autowired
	private RoleRepository roleRepo;
	
	@Autowired
	private IShopService shopService;
	
	@Autowired
	private ILoginService loginService;
	
	@Autowired
	private GmailService gmailService;

    String status=null;
    String role=null;

	@Override
	public LoginEntity login(LoginForm loginForm) {
		List<LoginEntity> loginEntities=loginRepo.validateLoginUser(loginForm.getUserName(),loginForm.getPassword());
		LoginEntity loginEntity=null;
		if(loginEntities != null && loginEntities.size() > 0 && loginEntities.get(0) != null) {
			for (LoginEntity loginEntity1 : loginEntities) {
				loginEntity=loginEntity1;  
				/*status=loginEntity.getStatus();
				Set<RoleEntity> roleEntities=loginEntity.getRoles();
				for (RoleEntity roleEntity : roleEntities) {
					System.out.println("-----------------------------------------------> " + roleEntity.getRoleId());
					System.out.println("-----------------------------------------------> " + roleEntity.getRoleName());
					role=roleEntity.getRoleName();
					System.out.println("===================="+role);
				}
				System.out.println(status);*/
			}	
			return loginEntity;
		}
		else {
			//status=null;
			return null;
		}
	}


	@Override
	public void addNewLogin(ShopEntity shopEntity) {
		// TODO Auto-generated method stub
		LoginEntity  loginEntity=new LoginEntity();
		
		loginEntity.setUserName(shopEntity.getEmail());
		loginEntity.setPassword(shopEntity.getFirstName()+"@1234");
		loginEntity.setIsAdmin("false");
		loginEntity.setStatus("New");
		List<RoleEntity> roleEntities = roleRepo.findByName("VENDOR");
		Set<RoleEntity> entities = new HashSet<RoleEntity>();
		for (RoleEntity roleEntity : roleEntities) {
			System.out.println("-----------------------------------------------> " + roleEntity.getRoleId());
			System.out.println("-----------------------------------------------> " + roleEntity.getRoleName());
			entities.add(roleEntity);
		}
		
		loginEntity.setRoles(entities);
		
		loginEntity.setShopEntity(shopEntity);
		
		gmailService.send(loginEntity.getUserName(),loginEntity.getPassword(),null);
		
		loginRepo.save(loginEntity);
		
		
	}


	@Override
	public LoginEntity getLoginUserbyName(String userName) throws Exception {
		List<LoginEntity>loginEntities = loginRepo.validateUser(userName);
		if(loginEntities.size() == 1 ) {
			return loginEntities.get(0);
		}
		return null;
	}


	@Override
	public void resetPassword(ForgotPassForm forgotPassForm) throws Exception {
		// TODO Auto-generated method stub
		ShopEntity shopEntity=shopService.getUserbyEmail(forgotPassForm.getEmail());
		LoginEntity loginEntity = loginService.getLoginUserbyName(forgotPassForm.getEmail());
		System.out.println("first name= "+shopEntity.getFirstName());
		gmailService.send(loginEntity.getUserName(),loginEntity.getPassword(),shopEntity.getFirstName());
		
	}


	@Override
	public boolean changePassword(ChangePassForm changePassForm) {
		// TODO Auto-generated method stub
		int status=loginRepo.update(changePassForm.getUserName(),changePassForm.getNewPass(),changePassForm.getStatus());
		System.out.println(status);
		if(status != 0) {
			return true;
		}
		else {
			return false;
		}	
	}


	@Override
	public void addNewLogin(CustomerEntity customerEntity) {
		// TODO Auto-generated method stub
         LoginEntity  loginEntity=new LoginEntity();
		
		loginEntity.setUserName(customerEntity.getEmail());
		loginEntity.setPassword(customerEntity.getFirstName()+"@1234");
		loginEntity.setIsAdmin("false");
		loginEntity.setStatus("New");
		List<RoleEntity> roleEntities = roleRepo.findByName("USER");
		Set<RoleEntity> entities = new HashSet<RoleEntity>();
		for (RoleEntity roleEntity : roleEntities) {
			System.out.println("-----------------------------------------------> " + roleEntity.getRoleId());
			System.out.println("-----------------------------------------------> " + roleEntity.getRoleName());
			entities.add(roleEntity);
		}
		
		loginEntity.setRoles(entities);
		
		loginEntity.setCustomerEntity(customerEntity);
		
		
		gmailService.send(loginEntity.getUserName(),loginEntity.getPassword(),null);
		
		loginRepo.save(loginEntity);
		
		
	}

}
