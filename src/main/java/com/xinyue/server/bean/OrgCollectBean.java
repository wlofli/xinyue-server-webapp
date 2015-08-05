package com.xinyue.server.bean;

import java.io.Serializable;

/**
 * 
 * @author wenhai.you
 * @2015年7月22日
 * @下午3:40:26
 */
public class OrgCollectBean implements Serializable {

	private String orgName;
	private String topage;
	private String memberid;
	
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getTopage() {
		return topage;
	}
	public void setTopage(String topage) {
		this.topage = topage;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	
}
