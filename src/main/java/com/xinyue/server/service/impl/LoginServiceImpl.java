package com.xinyue.server.service.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.xinyue.authe.util.Md5;
import com.xinyue.manage.model.Member;
import com.xinyue.server.dao.LoginDAO;
import com.xinyue.server.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	private Logger log = Logger.getLogger(LoginServiceImpl.class);
	
	@Resource
	private LoginDAO loginDAO;
	
	@Override
	public boolean login(Member loginInfo) {
		
		try {
			//MD5加密
			loginInfo.setPassword(Md5.encodeByMD5(loginInfo.getPassword()));
			
			int result = loginDAO.findMemberByLoginInfo(loginInfo);
			
			if (result > 0) {
				return true;
			}
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		
		return false;
	}

	@Override
	public boolean updateLoginTime(Member loginInfo) {
		try {
//			//MD5加密
//			loginInfo.setPassword(Md5.encodeByMD5(loginInfo.getPassword()));
			
			int result = loginDAO.updateLoginTime(loginInfo);
			
			if (result > 0) {
				return true;
			}
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return false;
	}

	@Override
	public Member getMemberInfo(Member loginInfo) {
		
//		//MD5加密
//		loginInfo.setPassword(Md5.encodeByMD5(loginInfo.getPassword()));
		
		return loginDAO.getMemberInfo(loginInfo);
	}

}
