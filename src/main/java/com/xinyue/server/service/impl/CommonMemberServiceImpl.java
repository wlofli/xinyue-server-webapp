package com.xinyue.server.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.manage.util.SecurityUtils;
import com.xinyue.server.been.PwdInfo;
import com.xinyue.server.dao.CommonMemberDao;
import com.xinyue.server.model.FileInfo;
import com.xinyue.server.service.CommonMemberService;

/**
 * 
 * @author wenhai.you
 * @2015年7月16日
 * @下午4:23:06
 */
@Service
public class CommonMemberServiceImpl implements CommonMemberService {

	@Resource
	private CommonMemberDao mdao;
	
	private Logger logger = Logger.getLogger(CommonMemberServiceImpl.class);
	@Override
	public Member getBasicMember(String id) {
		// TODO Auto-generated method stub
		return mdao.getBasicMember(id);
	}

	@Override
	public boolean saveMember(Member member) {
		// TODO Auto-generated method stub
		try {
			mdao.saveMember(member);
			logger.info("会员信息更新成功 , 更新者为:"+member.getLoginName());
			return true;
		} catch (Exception e) {
			logger.error("会员信息更新失败 , 更新者为:"+member.getLoginName() , e);
			return false;
		}
		
	}
	
	@Override
	public boolean inspectPwd(String id , String password) {
		// TODO Auto-generated method stub
		try {
			String pwd = mdao.inspectPwd(id);
			if(SecurityUtils.makeMD5(password).equals(pwd)){
				return true;
			}
			return false;
		} catch (Exception e) {
			logger.error("可能账号不是唯一的" , e);
			return false;
		}
	}
	
	@Override
	public boolean updatePwd(String id, String password) {
		// TODO Auto-generated method stub
		try {
			mdao.updatePwd(id, SecurityUtils.makeMD5(password));
			logger.error("会员密码修改成功  修改者为:"+id);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("会员密码修改失败  修改者为:"+id,  e);
			return false;
		}
	}
	
	@Override
	public String findTel(String id) {
		// TODO Auto-generated method stub
		return mdao.findTel(id);
	}
	
	@Override
	public boolean updateTel(String id, String contactPhone) {
		// TODO Auto-generated method stub
		try {
			mdao.updateTel(id, contactPhone);
			logger.error("会员手机号码修改成功  修改者为:"+id);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("会员手机号码修改失败  修改者为:"+id,  e);
			return false;
		}
	}
	
	@Override
	public PageData<FileInfo> showDoc(String topage) {
		// TODO Auto-generated method stub
		int currentPage = GlobalConstant.isNull(topage) || "0".equals(topage)?1:Integer.valueOf(topage);
		int start = (currentPage - 1)*GlobalConstant.PAGE_SIZE;
		return new PageData<FileInfo>(mdao.showDoc(start , GlobalConstant.PAGE_SIZE) ,mdao.getDoc() ,  currentPage);
	}
}
