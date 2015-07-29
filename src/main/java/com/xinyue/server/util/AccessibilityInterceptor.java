package com.xinyue.server.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.xinyue.manage.model.Member;
import com.xinyue.manage.util.GlobalConstant;

/**
 * 拦截url
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年7月2日
 */
public class AccessibilityInterceptor extends HandlerInterceptorAdapter implements HandlerInterceptor {

	private Logger log = Logger.getLogger(AccessibilityInterceptor.class);

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.HandlerInterceptor#preHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object)
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		//session取得用户信息
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
		if (member == null) {
			log.log(Level.INFO, "用户未登陆或者登陆过期");
			response.sendRedirect("/errors/redirect.html");
			return false;
		}
		
		return true;
	}
	
	

}
