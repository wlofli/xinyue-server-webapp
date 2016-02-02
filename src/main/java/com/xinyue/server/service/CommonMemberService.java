package com.xinyue.server.service;



import java.util.List;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.model.Member;
import com.xinyue.server.model.FileInfo;

/**
 * 
 * @author wenhai.you
 * @2015年7月16日
 * @下午4:21:18
 */

public interface CommonMemberService {

	public Member getBasicMember(String id);
	
	public boolean saveMember(Member member);
	
	public boolean inspectPwd(String id , String password);
	
	public boolean updatePwd(String id , String password);
	
	public String findTel(String id);
	
	public boolean updateTel(String id , String contactPhone);
	
	public PageData<FileInfo> showDoc(String topage);
	
	/**
	 * ywh gg 根据电话号码查询会员 信息
	 * @param contactPhone
	 * @return
	 */
	public Member getMemberByPhone(String contactPhone);
}
