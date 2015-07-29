package com.xinyue.server.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommonService {

	boolean sendCode(String phone, String code);

	/**
	 * 保存文件
	 * @param request
	 * @param suffix
	 * @param imagePath
	 * @return 成功：返回json数据;失败：返回"fail"
	 */
	String saveFile(HttpServletRequest request, String suffix, String imagePath);

	public void download(String path, HttpServletResponse resp);
	
	public void downLocal(String path, HttpServletResponse resp);
}
