package com.xinyue.server.bean;

import java.io.Serializable;

/**
 * 
 * @author wenhai.you
 * @2015年7月29日
 * @下午6:20:32
 */
public class QuestionBean implements Serializable {

	private String id;
	private String title;
	
	private String createtime; 
	private String sign;
	private String num;
	
	private String orgid;
	private String topage;
	private String questype;
	
	public String getQuestype() {
		return questype;
	}
	public void setQuestype(String questype) {
		this.questype = questype;
	}
	public String getOrgid() {
		return orgid;
	}
	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}
	public String getTopage() {
		return topage;
	}
	public void setTopage(String topage) {
		this.topage = topage;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	@Override
	public String toString() {
		return "Question [id=" + id + ", title=" + title + ", createtime="
				+ createtime + ", sign=" + sign + ", num=" + num + "]";
	}
	
}
