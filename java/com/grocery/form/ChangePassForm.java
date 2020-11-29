package com.grocery.form;

/**
 * @author Gaurav Mahajan
 *
 */
public class ChangePassForm {

	private String userName;
	
	private String oldPass;
	
	private String newPass1;
	
	private String newPass;
	
	private String status;
	
	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * @return the newPass1
	 */
	public String getNewPass1() {
		return newPass1;
	}
	/**
	 * @param newPass1 the newPass1 to set
	 */
	public void setNewPass1(String newPass1) {
		this.newPass1 = newPass1;
	}
	
	
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return the oldPass
	 */
	public String getOldPass() {
		return oldPass;
	}
	/**
	 * @param oldPass the oldPass to set
	 */
	public void setOldPass(String oldPass) {
		this.oldPass = oldPass;
	}
	/**
	 * @return the newPass
	 */
	public String getNewPass() {
		return newPass;
	}
	/**
	 * @param newPass the newPass to set
	 */
	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}
	
}
