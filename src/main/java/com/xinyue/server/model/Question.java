package com.xinyue.server.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 
 * @author wenhai.you
 * @2015年7月29日
 * @下午6:20:32
 */
public class Question implements Serializable {

	private String id;
	private String title;
	
	private String createtime; 
	private String sign;
	private String num;
	
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
