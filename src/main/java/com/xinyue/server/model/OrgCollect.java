package com.xinyue.server.model;

import java.io.Serializable;
import java.util.List;

import com.xinyue.manage.model.ProductType;
import com.xinyue.manage.model.SubStation;

/**
 * 
 * @author wenhai.you
 * @2015年7月22日
 * @上午11:18:52
 */
public class OrgCollect implements Serializable {

	private String id;
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
	//前台显示
	private String image;
	private String ordercount;
	
	
	
	//add by lzc
	private List<SubStation> businessAreas;
	private List<ProductType> businessType;
	
	public List<SubStation> getBusinessAreas() {
		return businessAreas;
	}
	public void setBusinessAreas(List<SubStation> businessAreas) {
		this.businessAreas = businessAreas;
	}
	public List<ProductType> getBusinessType() {
		return businessType;
	}
	public void setBusinessType(List<ProductType> businessType) {
		this.businessType = businessType;
	}
	
	
	//end by lzc
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrdercount() {
		return ordercount;
	}
	public void setOrdercount(String ordercount) {
		this.ordercount = ordercount;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
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
