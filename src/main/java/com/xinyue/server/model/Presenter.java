package com.xinyue.server.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author wenhai.you
 * @2015年7月25日
 * @上午11:24:37
 */
public class Presenter implements Serializable {

	private Long id;
	private String presenteeName;
	private String presenteeTel;
	private String memberType="普通会员";
	private String creditType="信贷会员";
	private Date presenteeRegTime;
	private String presenterScore;
	private String presenterMoney;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getPresenteeName() {
		return presenteeName;
	}
	public void setPresenteeName(String presenteeName) {
		this.presenteeName = presenteeName;
	}
	public String getPresenteeTel() {
		return presenteeTel;
	}
	public void setPresenteeTel(String presenteeTel) {
		this.presenteeTel = presenteeTel;
	}
	public Date getPresenteeRegTime() {
		return presenteeRegTime;
	}
	public void setPresenteeRegTime(Date presenteeRegTime) {
		this.presenteeRegTime = presenteeRegTime;
	}
	public String getPresenterScore() {
		return presenterScore;
	}
	public void setPresenterScore(String presenterScore) {
		this.presenterScore = presenterScore;
	}
	public String getPresenterMoney() {
		return presenterMoney;
	}
	public void setPresenterMoney(String presenterMoney) {
		this.presenterMoney = presenterMoney;
	}
	public String getMemberType() {
		return memberType;
	}
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
	public String getCreditType() {
		return creditType;
	}
	public void setCreditType(String creditType) {
		this.creditType = creditType;
	}
	
}
