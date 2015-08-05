package com.xinyue.server.bean;

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
	private String rank;
	
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
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
}
