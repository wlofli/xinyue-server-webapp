package com.xinyue.server.controller.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xinyue.manage.model.Helper;
import com.xinyue.manage.service.HelpService;
import com.xinyue.manage.util.GlobalConstant;

/**
 * 帮助中心
 * 
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年8月10日
 */
@Controller
@RequestMapping("/help")
public class HelpController {

	@Resource
	private HelpService helpService;
	
	private HashMap<String, Helper> helpMap = new HashMap<>();

	@RequestMapping(value = "")
	public String gotoHelp(HttpServletRequest request, Model model) {
		// 模块类型
		request.getSession().setAttribute(GlobalConstant.INDEX_TYPE, "help");

		// 数据取得
		List<Helper> helpers = helpService.getAllListByIndex();

		model.addAttribute("helpers", helpers);
		model.addAttribute("helpShow", helpers.get(0));
		
		HashMap<String, Helper> temp = new HashMap<>();
		for (Helper helper : helpers) {
			temp.put(helper.getCode(), helper);
		}
		setHelpMap(temp);

		return "screens/help/help_center";
	}

	@RequestMapping(value = "/detail")
	public String gotoDetail(HttpServletRequest request, Model model, String id) {

		// 数据取得
		List<Helper> helpers = helpService.getAllListByIndex();

		model.addAttribute("helpers", helpers);
		
		model.addAttribute("helpShow", helpMap.get(id));

		return "screens/help/help_center";
	}

	/**
	 * @return the helpMap
	 */
	public HashMap<String, Helper> getHelpMap() {
		return helpMap;
	}

	/**
	 * @param helpMap the helpMap to set
	 */
	public void setHelpMap(HashMap<String, Helper> helpMap) {
		this.helpMap = helpMap;
	}
}
