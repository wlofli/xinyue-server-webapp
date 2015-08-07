package com.xinyue.server.controller.member;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.manage.beans.SearchNew;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.model.NewInfo;
import com.xinyue.manage.model.NewType;
import com.xinyue.manage.service.NewService;
import com.xinyue.manage.util.GlobalConstant;

/**
 * author lzc
 */
@Controller
@RequestMapping("new")
public class NewController {

	@Resource
	private NewService newService;
	
//	private static NewType HotNew = null;
	
//	private static List<SelectInfo> newTypeList = null;
	


//	public static NewType getHotNew() {
//		return HotNew;
//	}


//	public static void setHotNew(NewType hotNew) {
//		HotNew = hotNew;
//	}
//	
//	private void getHotNewType(){
//		if(HotNew == null){
//			setHotNew(newService.getNewType(GlobalConstant.NEW_HOTNEWS_ID));
//		}
//	}


//	public static List<SelectInfo> getNewTypeList() {
//		return newTypeList;
//	}
//
//
//	public static void setNewTypeList(List<SelectInfo> newTypeList) {
//		NewController.newTypeList = newTypeList;
//	}


	//前台新闻列表
	@RequestMapping("newlist")
	public String getList(Model model, String typeId, int index){
		SearchNew searchNew = new SearchNew();
		searchNew.setNewType(typeId);
		List<NewInfo> newList = newService.getNewInfoListByTime(searchNew, index * GlobalConstant.PAGE_SIZE, 
				GlobalConstant.PAGE_SIZE);
		
		
		
		model.addAttribute("newList", newList);
		
		return "screens/newList";
	}
	
	
	//前台新闻首页
	@RequestMapping("/homelist")
	public String getHomeList(Model model,HttpServletRequest request ){
System.out.println("request.getcontextpath = " + request.getContextPath());
System.out.println("request.getRequestURL = " + request.getRequestURL());

		//!!!!!!!!!!!!!!!!!!!!!!!!-----------NEW_HOTNEWS_ID还未设置
		
		NewType newType = newService.getNewType(GlobalConstant.NEW_HOTNEWS_ID);
		//
System.out.println(newType.getName());
		model.addAttribute("hotnew", newType);
		
		
		SearchNew searchNew = new SearchNew();
System.out.println("newsearch.city = " + searchNew.getCity());
		searchNew.setNewType(GlobalConstant.NEW_HOTNEWS_ID);
		//设置所在城市
//		searchNew.setCity(city);
		List<NewInfo> hotNewList = newService.getNewInfoListByTime(searchNew, 0, GlobalConstant.PAGE_SIZE_TWO);
		//热门资讯
		model.addAttribute("hotnewlist", hotNewList);
		
		//最新资讯
		List<NewInfo> newList = newService.getNewInfoListByTime(null, 0, GlobalConstant.PAGE_SIZE);
		model.addAttribute("newlist", newList);
		
		List<String> idList = new ArrayList<String>();
		idList.add(GlobalConstant.NEW_HOTNEWS_ID);
		//除热门资讯以外的新闻id与名字
		List<SelectInfo> newTypeList = newService.getAllNewTypeList(idList);
		model.addAttribute("othernew",newTypeList);
		
		searchNew = new SearchNew();
		searchNew.setNewType(newTypeList.get(0).getKey());
		//第一个新闻列表
		List<NewInfo> firstList = newService.getNewInfoListByTime(searchNew, 0, GlobalConstant.PAGE_SIZE_FIFTY);
		model.addAttribute("othernewlist", firstList);
		
		
		
		
		return "screens/new/newHome";
	}
	
	//首页换新闻类型
	@RequestMapping("jsonlist")
	@ResponseBody
	public String getNewtypeList(){
		JSONObject jsonObject = new JSONObject();
		
		return jsonObject.toString(); 
	}
	
	
	//前台新闻详情
	@RequestMapping("detail")
	public String getNewDetail(Model model,String id){
		NewInfo newInfo = newService.getNewInfo(id);
		model.addAttribute("news", newInfo);
//System.out.println(newInfo);
		SelectInfo before = newService.getRecentNew(newInfo.getType(), newInfo.getSendDate(), 0);
System.out.println(before);
		SelectInfo after  = newService.getRecentNew(newInfo.getType(), newInfo.getSendDate(), 1);
System.out.println(after);
		model.addAttribute("brfore", before);
		model.addAttribute("after", after);
		return "screens/new/newDetail";
	}
	
}
