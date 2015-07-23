package com.xinyue.server.been;

import java.io.Serializable;

/**
 * 用来修改密码和手机
 * @author wenhai.you
 * @2015年7月17日
 * @下午1:55:54
 */
public class PwdInfo implements Serializable {

	private String password;
	private String passwordCheck;
	private String passwordConfirm;
	
	private String contactPhone;
	private String confirmPhone;
	private String code;
	
	public String getContactPhone() {
		return contactPhone;
	}
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	public String getConfirmPhone() {
		return confirmPhone;
	}
	public void setConfirmPhone(String confirmPhone) {
		this.confirmPhone = confirmPhone;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPasswordCheck() {
		return passwordCheck;
	}
	public void setPasswordCheck(String passwordCheck) {
		this.passwordCheck = passwordCheck;
	}
	public String getPasswordConfirm() {
		return passwordConfirm;
	}
	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}
	
}
