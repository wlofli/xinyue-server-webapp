package com.xinyue.server.model;

import java.io.Serializable;

/**
 * 
 * @author wenhai.you
 * @2015年7月22日
 * @上午11:18:52
 */
public class OrgCollect implements Serializable {

	private int id;
	private String orgName;
	private String creditCount;
	private String proCount;
	private String createTime;
	private String orgType;
	private String orgAddress;
	private String orgEstablish;
	private String orgScale;
	private String businessArea;
	private String business;
	
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCreditCount() {
		return creditCount;
	}
	public void setCreditCount(String creditCount) {
		this.creditCount = creditCount;
	}
	public String getProCount() {
		return proCount;
	}
	public void setProCount(String proCount) {
		this.proCount = proCount;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getOrgType() {
		return orgType;
	}
	public void setOrgType(String orgType) {
		this.orgType = orgType;
	}
	public String getOrgAddress() {
		return orgAddress;
	}
	public void setOrgAddress(String orgAddress) {
		this.orgAddress = orgAddress;
	}
	public String getOrgEstablish() {
		return orgEstablish;
	}
	public void setOrgEstablish(String orgEstablish) {
		this.orgEstablish = orgEstablish;
	}
	public String getOrgScale() {
		return orgScale;
	}
	public void setOrgScale(String orgScale) {
		this.orgScale = orgScale;
	}
	public String getBusinessArea() {
		return businessArea;
	}
	public void setBusinessArea(String businessArea) {
		this.businessArea = businessArea;
	}
	public String getBusiness() {
		return business;
	}
	public void setBusiness(String business) {
		this.business = business;
	}
	
	@Override
	public String toString() {
		return "OrgCollect [id=" + id + ", orgName=" + orgName
				+ ", creditCount=" + creditCount + ", proCount=" + proCount
				+ ", createTime=" + createTime + ", orgType=" + orgType
				+ ", orgAddress=" + orgAddress + ", orgEstablish="
				+ orgEstablish + ", orgScale=" + orgScale + ", businessArea="
				+ businessArea + ", business=" + business + "]";
	}
	
}
