package com.xinyue.server.been;

import java.io.Serializable;

/**
 * 
 * @author wenhai.you
 * @2015年7月27日
 * @上午10:46:17
 */
public class RecommendInfo implements Serializable {

	private String memberid;
	private String topage; 
	private String sort;
	
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getTopage() {
		return topage;
	}
	public void setTopage(String topage) {
		this.topage = topage;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
			
}
