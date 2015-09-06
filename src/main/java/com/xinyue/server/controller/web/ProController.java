package com.xinyue.server.controller.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.service.CityService;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.bean.ProductSearch;
import com.xinyue.server.service.ProductCollectService;

/**
 * 
 * @author wenhai.you
 * @2015年8月27日
 * @下午3:40:36
 */
@Controller
@RequestMapping("/product")
public class ProController {

	@Resource
	private CityService cityService;
	
	@Resource
	private ProductCollectService pbiz;
	
	@RequestMapping("/show")
	public String show(Model model , ProductSearch psearch){
		//显示头部位置 
		model.addAttribute(GlobalConstant.INDEX_TYPE, "product");
		//查询条件
		model.addAttribute("psearch", psearch);
		//省
		List<SelectInfo> provinces = cityService.getAllProvince();
		model.addAttribute("provinces", provinces);
		//机构
		model.addAttribute("org", pbiz.getOrgs());
		//产品类型
		model.addAttribute("producttype", pbiz.findByStatus());
		//产品
		model.addAttribute("propage", pbiz.findProductPageData(psearch));
		return "screens/pro/product";
	}
	
	
	@RequestMapping("/detail")
	public String detail(){
		
		return "screens/pro/detail";
	}
	
	
}
