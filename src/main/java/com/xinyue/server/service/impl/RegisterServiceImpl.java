package com.xinyue.server.service.impl;

import java.util.UUID;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.xinyue.authe.util.Md5;
import com.xinyue.manage.dao.RewardDAO;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.model.OutLine;
import com.xinyue.manage.util.SecurityUtils;
import com.xinyue.server.dao.RegisterDAO;
import com.xinyue.server.service.RegisterService;

/**
 * 注册服务层
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年7月18日
 */
/**
 * lzc 15-11-30 saveMember()添加初始化资金
 * 
 *
 */
@Service
public class RegisterServiceImpl implements RegisterService {

	private Logger log = Logger.getLogger(RegisterServiceImpl.class);
	
	@Resource
	private RegisterDAO registerDAO;
	
	@Resource
	private RewardDAO rewardDAO;
	
	@Override
	public boolean saveMember(Member registerInfo) {
		
		try {
			registerInfo.setPassword(Md5.encodeByMD5(registerInfo.getPassword()));
			
			while (true) {
				String invitationCode = SecurityUtils.randomStr(6);
				
				if (registerDAO.findMemberByInvitationCode(invitationCode) == 0) {
					registerInfo.setInvitationCode(invitationCode);
					break;
				}
			}
			//add by lzc
			registerInfo.setId(UUID.randomUUID().toString().replaceAll("-", ""));
			//end
			int result = registerDAO.saveMember(registerInfo);
			
			if (result > 0) {
				//add by lzc
				OutLine outLine = new OutLine();
				outLine.setId(UUID.randomUUID().toString().replaceAll("-", ""));
				outLine.setUserId(registerInfo.getId());
				outLine.setUserType("m");
				rewardDAO.initOutline(outLine);
				//end
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
