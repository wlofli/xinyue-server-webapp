/*
 * 杭州摩科商用设备有限公司
 * MOKO-Commercial Device Co.,Ltd
 * 
 * 地图API调用
 * 
 * 创建人：茅
 * 
 * 日期：2015/04/03
 * 
 * 版本v1.0.0
 * 
 * 
 */
package com.xinyue.server.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import net.sf.json.JSONObject;

import com.xinyue.server.bean.BaiduCityInfo;
import com.xinyue.server.bean.BaiduCityInfo.Address_detail;
import com.xinyue.server.bean.BaiduCityInfo.Content;
import com.xinyue.server.bean.BaiduCityInfo.Point;

public class MapFunction {

	public BaiduCityInfo getIPCity(String ip,String ak){
		
		//服务地址
		String ipUrl = "http://api.map.baidu.com/location/ip?ak="
				+ ak + "&ip=" + ip;
		
		URL url = null;

		URLConnection urlConn = null;

		BufferedReader in = null;

		String inputLine = null;
		
		BaiduCityInfo cityInfo = new BaiduCityInfo();
		
		try {
			url = new URL(ipUrl);
			
			urlConn = url.openConnection();
			
			in = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
			
			while ((inputLine = in.readLine()) != null) {
				
				JSONObject jsonObj = JSONObject.fromObject(inputLine);
				
				//状态判断[1:异常状态;0:正常状态]
				switch (jsonObj.getInt("status")) {
				case 0:
					//地址
					cityInfo.setAddress(jsonObj.getString("address"));
					
					//详细内容
					JSONObject jsonContent = jsonObj.getJSONObject("content");
					Content content = new Content();				
					content.setAddress(jsonContent.getString("address"));
					//详细内容信息
					JSONObject jsonDetail = jsonContent.getJSONObject("address_detail");
					Address_detail detail = new Address_detail();
					detail.setCity(jsonDetail.getString("city"));
					detail.setCity_code(jsonDetail.getInt("city_code"));
					detail.setDistrict(jsonDetail.getString("district"));
					detail.setProvince(jsonDetail.getString("province"));
					detail.setStreet(jsonDetail.getString("street"));
					detail.setStreet_number(jsonDetail.getString("street_number"));
					content.setAddress_detail(detail);
					//坐标
					JSONObject jsonXY = jsonContent.getJSONObject("point");
					Point point = new Point();
					point.setX(jsonXY.getString("x"));
					point.setY(jsonXY.getString("y"));
					content.setPoint(point);
					
					cityInfo.setContent(content);
					//返回状态码
					cityInfo.setStatus(jsonObj.getInt("status"));
					break;
				default:
					//状态
					cityInfo.setStatus(jsonObj.getInt("status"));
					//错误信息
					cityInfo.setErrMessage(jsonObj.getString("message"));
					break;
				}
				
			}
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return cityInfo;
	}
}
