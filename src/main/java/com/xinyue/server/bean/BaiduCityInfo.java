/*
 * 杭州摩科商用设备有限公司
 * MOKO-Commercial Device Co.,Ltd
 * 
 * 百度地图信息
 * 
 * 创建人：茅
 * 
 * 日期：2015/04/01
 * 
 * 版本v1.0.0
 * 
 * 
 */
package com.xinyue.server.bean;

import java.io.Serializable;

public class BaiduCityInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3090237845579395923L;
	
	/**
	 * 地址 
	 */
	String address;
	
	/**
	 * 详细内容
	 */
	Content content = null;
	
	/**
	 * 返回状态码
	 */
	int status = 99;
	
	/**
	 * 错误消息
	 */
	String errMessage ;
	
	/**
	 * 详细内容
	 * @author MK)茅
	 *
	 */
	public static class Content{
		String address;
		
		Address_detail address_detail ;

		/**
		 * 百度经纬度坐标值
		 */
		Point point = null;
		
		/**
		 * @return the address
		 */
		public String getAddress() {
			return address;
		}

		/**
		 * @param address the address to set
		 */
		public void setAddress(String address) {
			this.address = address;
		}

		/**
		 * @return the address_detail
		 */
		public Address_detail getAddress_detail() {
			return address_detail;
		}

		/**
		 * @param address_detail the address_detail to set
		 */
		public void setAddress_detail(Address_detail address_detail) {
			this.address_detail = address_detail;
		}

		/**
		 * @return the point
		 */
		public Point getPoint() {
			return point;
		}

		/**
		 * @param point the point to set
		 */
		public void setPoint(Point point) {
			this.point = point;
		}
	}
	
	/**
	 * 详细地址信息
	 * @author MK)茅
	 *
	 */
	public static class Address_detail{
		
		String city;
		
		int city_code;
		
		String district;
		
		String province;
		
		String street;
		
		String street_number;

		/**
		 * @return the city
		 */
		public String getCity() {
			return city;
		}

		/**
		 * @param city the city to set
		 */
		public void setCity(String city) {
			this.city = city;
		}

		/**
		 * @return the city_code
		 */
		public int getCity_code() {
			return city_code;
		}

		/**
		 * @param city_code the city_code to set
		 */
		public void setCity_code(int city_code) {
			this.city_code = city_code;
		}

		/**
		 * @return the district
		 */
		public String getDistrict() {
			return district;
		}

		/**
		 * @param district the district to set
		 */
		public void setDistrict(String district) {
			this.district = district;
		}

		/**
		 * @return the province
		 */
		public String getProvince() {
			return province;
		}

		/**
		 * @param province the province to set
		 */
		public void setProvince(String province) {
			this.province = province;
		}

		/**
		 * @return the street
		 */
		public String getStreet() {
			return street;
		}

		/**
		 * @param street the street to set
		 */
		public void setStreet(String street) {
			this.street = street;
		}

		/**
		 * @return the street_number
		 */
		public String getStreet_number() {
			return street_number;
		}

		/**
		 * @param street_number the street_number to set
		 */
		public void setStreet_number(String street_number) {
			this.street_number = street_number;
		}
	}
	
	/**
	 * 百度经纬度坐标值
	 * @author MK)茅
	 *
	 */
	public static class Point{
		String x;
		
		String y;

		/**
		 * @return the x
		 */
		public String getX() {
			return x;
		}

		/**
		 * @param x the x to set
		 */
		public void setX(String x) {
			this.x = x;
		}

		/**
		 * @return the y
		 */
		public String getY() {
			return y;
		}

		/**
		 * @param y the y to set
		 */
		public void setY(String y) {
			this.y = y;
		}
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the content
	 */
	public Content getContent() {
		return content;
	}

	/**
	 * @param content the content to set
	 */
	public void setContent(Content content) {
		this.content = content;
	}

	/**
	 * @return the status
	 */
	public int getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(int status) {
		this.status = status;
	}

	/**
	 * @return the errMessage
	 */
	public String getErrMessage() {
		return errMessage;
	}

	/**
	 * @param errMessage the errMessage to set
	 */
	public void setErrMessage(String errMessage) {
		this.errMessage = errMessage;
	}
}
