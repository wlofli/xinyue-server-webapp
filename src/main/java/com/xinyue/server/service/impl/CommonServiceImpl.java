package com.xinyue.server.service.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.httpclient.HttpException;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.xinyue.manage.util.CommonFunction;
import com.xinyue.server.service.CommonService;

@Service
public class CommonServiceImpl implements CommonService {

	// 短信内容
	private static String strContent = CommonFunction.getValue("sms.content");
	private static String sendUrl = CommonFunction.getValue("sms.send.url");
	private static String account = CommonFunction.getValue("sms.account");
	private static String password = CommonFunction.getValue("sms.password");

	private Logger log = Logger.getLogger(RegisterServiceImpl.class);

	private String downloadPath = CommonFunction.getValue("down.path");
	
	private String upLoadPath = CommonFunction.getValue("upload.path");
	
	@Override
	public boolean sendCode(String phone, String code) {
		// 结果
		String result = "";

		String line;

		BufferedReader in = null;

		try {
			// 短信内容说明
			String content = strContent.replace("%", code);

			// 内容编码转换
			String strTemp = URLEncoder.encode(content, "utf-8");

			// url作成
			String strUrl = sendUrl + "?account=" + account + "&password="
					+ password + "&mobile=" + phone + "&content=" + strTemp;

			URL url = new URL(strUrl);

			URLConnection conn = url.openConnection();

			conn.connect();

			in = new BufferedReader(
					new InputStreamReader(conn.getInputStream()));

			// 结果返回
			while ((line = in.readLine()) != null) {
				result += line;
			}

			if (!result.equals("100")) {
				log.info("<<<短信验证码发送失败代码-->" + result + ">>>");
			} else {
				return true;
			}

		} catch (HttpException e) {
			e.printStackTrace();
			log.error("httpError : " + e.toString());
		} catch (IOException e) {
			e.printStackTrace();
			log.error("IOError : " + e.toString());
		} finally {
			// 释放
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	@Override
	public String saveImage(HttpServletRequest request, String suffix, String imagePath) {
		
		String ret = "";
		
		//路径
		String savePath = upLoadPath+imagePath;
		String showPath = downloadPath+imagePath;
		//文件路径判断
		File file = new File(savePath);
		if (!file.exists()) {
			file.mkdirs();
		}
		
		CommonsMultipartResolver resolver = new CommonsMultipartResolver(request.getServletContext());
		
		if (resolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			
			Iterator<String> iter = multiRequest.getFileNames();
			
			while (iter.hasNext()) {
				String fileName = iter.next();
				String code = UUID.randomUUID().toString().replace("-", "");
				
				MultipartFile mFile = multiRequest.getFile(fileName);
				
				File uploadFile = new File(savePath+code+"."+suffix);
				
				try {

					FileCopyUtils.copy(mFile.getBytes(), uploadFile);
					
					String retPath = showPath+code+"."+suffix;
					
					ret = "{'name':'"+imagePath+code+"."+suffix+"','path':'"+_filterStr(retPath)+"'}";
				} catch (IOException e) {
					log.error(e.getMessage());
					ret = "fail";
				}
			}
		}
		return ret;
	}

	protected String _filterStr(String s) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < s.length(); i++) {

			char c = s.charAt(i);
			switch (c) {
			case '\"':
				sb.append("\\\"");
				break;
			case '\\':
				sb.append("\\\\");
				break;
			case '/':
				sb.append("\\/");
				break;
			case '\b':
				sb.append("\\b");
				break;
			case '\f':
				sb.append("\\f");
				break;
			case '\n':
				sb.append("\\n");
				break;
			case '\r':
				sb.append("\\r");
				break;
			case '\t':
				sb.append("\\t");
				break;
			default:
				sb.append(c);
			}
		}
		return sb.toString();
	}
}
