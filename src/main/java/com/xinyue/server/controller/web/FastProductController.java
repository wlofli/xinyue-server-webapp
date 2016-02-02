package com.xinyue.server.controller.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.manage.model.FastProductApplicant;
import com.xinyue.manage.model.FastProductCompany;
import com.xinyue.manage.service.OrderService;
import com.xinyue.manage.util.GlobalConstant;

/**
 * author lzc
 */
/**
 * lzc 15-12-8 fastApplicantStepOne()
 *
 */
@Controller
@RequestMapping("order")
public class FastProductController {
	
	@Resource
	private OrderService orderService;
	
	private Logger log = Logger.getLogger(getClass());
	
	/**
	 * 快速申贷第一步
	 * add by mzj
	 * @param tel
	 * @param request
	 * @return
	 * modified by lzc 修改内容,参数manageid修改可能为空,新增productId参数
	 */
	@RequestMapping(value="/fast/step/one",method=RequestMethod.POST)
	public @ResponseBody String fastApplicantStepOne(@RequestParam(defaultValue="")String productId,
			String tel,@RequestParam(defaultValue="")String managerId,HttpServletRequest request) {
		
		try {
			//先清除session内容
			request.getSession().setAttribute(GlobalConstant.FAST_APPLICANT_STEP_ONE, null);
			request.getSession().setAttribute(GlobalConstant.FAST_APPLICANT_STEP_TWO, null);
			//modified by lzc 15-12-8 顺序交换
			request.getSession().setAttribute(GlobalConstant.FAST_APPLICANT_STEP_ONE, productId+"&"+managerId+"&"+tel);
			//end
			return "true";
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return "false";
	}
	
	/**
	 * 快速申贷第二步
	 * add by mzj
	 * @param applicantFast
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/fast/step/two",method=RequestMethod.POST)
	public @ResponseBody String fastApplicantStepTwo(FastProductApplicant applicantFast,HttpServletRequest request) {
		
		try {
			request.getSession().setAttribute(GlobalConstant.FAST_APPLICANT_STEP_TWO, applicantFast);
			
			return "true";
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return "false";
	
	}
	
	/**
	 * 快速申贷第三步
	 * @param companyFast
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/fast/step/three",method=RequestMethod.POST)
	public @ResponseBody String fastApplicantStepThree(FastProductCompany companyFast,HttpServletRequest request) {
		
		try {
			String stepOneData = (String) request.getSession().getAttribute(GlobalConstant.FAST_APPLICANT_STEP_ONE);
			FastProductApplicant applicantFast = (FastProductApplicant) request.getSession().getAttribute(GlobalConstant.FAST_APPLICANT_STEP_TWO);
			
			//数据处理
			boolean result = orderService.addFastOrderTypeTwo(stepOneData,applicantFast,companyFast);
			
			if (result) {
				return "true";
			}
		} catch (Exception e) {
			log.error(e.getMessage());
		}	
		return "false";
	}

}
