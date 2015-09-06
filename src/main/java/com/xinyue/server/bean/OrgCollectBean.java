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
	
	private String business;
	private int bindex;
	private String area;
	private int aindex;
	private String typeName;
	private int tindex;
	private int rank;
	
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
	public String getBusiness() {
		return business;
	}
	public void setBusiness(String business) {
		this.business = business;
	}
	public int getBindex() {
		return bindex;
	}
	public void setBindex(int bindex) {
		this.bindex = bindex;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public int getAindex() {
		return aindex;
	}
	public void setAindex(int aindex) {
		this.aindex = aindex;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public int getTindex() {
		return tindex;
	}
	public void setTindex(int tindex) {
		this.tindex = tindex;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	
}
