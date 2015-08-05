package com.xinyue.server.bean;

import java.io.Serializable;

import com.xinyue.manage.util.CommonFunction;
import com.xinyue.server.util.MailSender;

/**
 * 
 * @author wenhai.you
 * @2015年7月16日
 * @上午10:44:08
 */
public class EmailBean extends MailSender implements Serializable {

	public EmailBean() {
		// TODO Auto-generated constructor stub
		this.authValidate = CommonFunction.getValue("mail.smtp.auth");
		this.mailServerHost = CommonFunction.getValue("mail.smtp.host");
		this.sendAddress = CommonFunction.getValue("mail.send.address");
		this.sendUserName = CommonFunction.getValue("mail.send.address");
		this.sendUserPassword = CommonFunction.getValue("mail.send.password");
	}
	
}
