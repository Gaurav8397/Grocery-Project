/**
 * 
 */
package com.grocery.service;


import com.grocery.entity.CustomerEntity;
import com.grocery.entity.LoginEntity;
import com.grocery.entity.ShopEntity;
import com.grocery.form.ChangePassForm;
import com.grocery.form.ForgotPassForm;
import com.grocery.form.LoginForm;


/**
 * @author Gaurav Mahajan
 *
 */
public interface ILoginService {

	/**Login Method
	 * @param loginForm
	 * @return
	 */
	public LoginEntity login(LoginForm loginForm);

	/**
	 * @param shopEntity
	 * @return
	 */
	public void addNewLogin(ShopEntity shopEntity);
	
	/**
	 * @param userName
	 * @return
	 * @throws Exception
	 */
	public LoginEntity getLoginUserbyName(String email) throws Exception;

	/**
	 * @param forgotPassForm
	 * @throws Exception 
	 */
	public void resetPassword(ForgotPassForm forgotPassForm) throws Exception;

	/**
	 * @param changePassForm
	 * @return
	 */
	public boolean changePassword(ChangePassForm changePassForm);

	/**
	 * @param customerEntity
	 */
	public void addNewLogin(CustomerEntity customerEntity);
	
	
	

	
	
	
}
