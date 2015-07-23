package com.xinyue.server.service;

import javax.servlet.http.HttpServletRequest;

public interface CommonService {

	boolean sendCode(String phone, String code);

	String saveImage(HttpServletRequest request, String suffix, String imagePath);

}
