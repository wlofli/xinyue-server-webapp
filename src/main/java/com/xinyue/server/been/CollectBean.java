package com.xinyue.server.been;

import java.io.Serializable;

/**
 * 
 * @author wenhai.you
 * @2015年7月21日
 * @下午2:06:36
 */
public class CollectBean implements Serializable {

	private String proName;
	private String orgName;
	private String topage;
	private String memberid;
	
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
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
