package com.xinyue.server.service.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.xinyue.authe.util.Md5;
import com.xinyue.manage.model.Member;
import com.xinyue.server.dao.RegisterDAO;
import com.xinyue.server.service.RegisterService;

/**
 * 注册服务层
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年7月18日
 */
@Service
public class RegisterServiceImpl implements RegisterService {

	private Logger log = Logger.getLogger(RegisterServiceImpl.class);
	
	@Resource
	private RegisterDAO registerDAO;
	
	@Override
	public boolean saveMember(Member registerInfo) {
		
		try {
			registerInfo.setPassword(Md5.encodeByMD5(registerInfo.getPassword()));
			
			int result = registerDAO.saveMember(registerInfo);
			
			if (result > 0) {
				return true;
			}
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return false;
	}

	@Override
	public boolean checkEmail(String email) {
		
		try {
			int result = registerDAO.findMemberByEmail(email);
			
			if (result == 0) {
				return true;
			}
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return false;
	}


}
