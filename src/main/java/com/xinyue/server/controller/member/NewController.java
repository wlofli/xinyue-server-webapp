package com.xinyue.server.controller.member;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.manage.beans.AdvertisingInfo;
import com.xinyue.manage.beans.SearchNew;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.model.Advertising;
import com.xinyue.manage.model.NewInfo;
import com.xinyue.manage.model.NewType;
import com.xinyue.manage.service.AdvertisingService;
import com.xinyue.manage.service.NewService;
import com.xinyue.manage.util.CommonFunction;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.model.Page;

/**
 * author lzc
 */
@Controller
@RequestMapping("new")
public class NewController {

	@Resource
	private NewService newService;
	
	@Resource
	private AdvertisingService advertisingService;
	
	private static String REAL_PATH = CommonFunction.getValue("upload.path");
	
	private static String SHOW_PATH = CommonFunction.getValue("down.path")+"moko/images/";
	
	
	@ModelAttribute
	public void addShowPath(Model model){
		model.addAttribute("showpath", SHOW_PATH);
	}
	
	
	//最新资讯栏目模块
	@ModelAttribute("newlist")
	public List<NewInfo> newList(){
		List<NewInfo> newList = newService.getNewInfoListByTime(null, 0, GlobalConstant.PAGE_SIZE);
		return newList;
	}
	//新闻大广告
	@ModelAttribute("advertise1")
	public List<Advertising> getAdvertising(){
		AdvertisingInfo advertisingInfo = new AdvertisingInfo();
		advertisingInfo.setTitle("首页大广告");
		List<Advertising> advertisingList = advertisingService.getAdvertising(advertisingInfo);
		return advertisingList;
	}
	
	//前台新闻列表
	@RequestMapping("list")
	public String getList(Model model, @RequestParam(required=false)String typeId, @RequestParam(defaultValue="0")int index){
		SearchNew searchNew = new SearchNew();
		searchNew.setNewType(typeId);
		List<NewInfo> newstypeList = newService.getNewInfoListByTime(searchNew, index * GlobalConstant.PAGE_SIZE, 
				GlobalConstant.PAGE_SIZE);
		model.addAttribute("newtypelist", newstypeList);
		model.addAttribute("typeId", typeId);
		
		
		//分页
		Page page = new Page();
		int countAll = newService.getNewInfoCount(searchNew);
		page.setTotalNum(countAll);
		page.setPageNo(index);
		page.setStartIndex(4);
		page.setPageSize(GlobalConstant.PAGE_SIZE);
		model.addAttribute("page", page);
		
		List<Advertising> advertisings = getAdvertising();
		//广告
		model.addAttribute("advertiseList", advertisings);
		
		
		
		
		return "screens/new/newList";
	}
	
	
	//前台新闻首页
	@RequestMapping("/homelist")
	public String getHomeList(Model model,HttpServletRequest request,@ModelAttribute("newlist")List<NewInfo> newList ){
		request.getSession().setAttribute(GlobalConstant.INDEX_TYPE, "new");
		
		NewType newType = newService.getNewType(GlobalConstant.NEW_HOTNEWS_ID);
		model.addAttribute("hotnew", newType);
		
		
		SearchNew searchNew = new SearchNew();
		searchNew.setNewType(GlobalConstant.NEW_HOTNEWS_ID);
		//设置所在城市 
		//undone ->需要获取ip所在城市再设置城市
//		searchNew.setCity(city);
		List<NewInfo> hotNewList = newService.getNewInfoListByTime(searchNew, 0, GlobalConstant.PAGE_SIZE_TWO);
		//热门资讯
		model.addAttribute("hotnewlist", hotNewList);
		
		//最新资讯
		model.addAttribute("newlist", newList);
		
		List<String> idList = new ArrayList<String>();
		idList.add(GlobalConstant.NEW_HOTNEWS_ID);
		//除热门资讯以外的新闻id与名字
		List<SelectInfo> newTypeList = newService.getAllNewTypeList(idList);
		model.addAttribute("othernew",newTypeList);
		searchNew = new SearchNew();
		searchNew.setNewType(newTypeList.get(0).getKey());
		//第一个新闻列表
		List<NewInfo> firstList = newService.getNewInfoListByTime(searchNew, 0, GlobalConstant.PAGE_SIZE_NEWLIST);
		model.addAttribute("othernewlist", firstList);
//		model.addAttribute("showpath", SHOW_PATH);
		

		//首页小广告
		AdvertisingInfo advertisingInfo = new AdvertisingInfo();
		advertisingInfo.setTitle("首页小广告");
		List<Advertising> advertisingList = advertisingService.getAdvertising(advertisingInfo);
		model.addAttribute("advertise2", advertisingList);
		
		
		List<NewInfo> topNewList = newService.getNewINfoTop(GlobalConstant.PAGE_SIZE_SHOW_PICTURE);
		model.addAttribute("top", topNewList);
		
		
		return "screens/new/newHome";
	}
	
	//首页换新闻类型
	@RequestMapping("newlistjson")
	@ResponseBody
	public String getNewListByJson(String id){
		JSONObject jsonObject = new JSONObject();
		SearchNew searchNew = new SearchNew();
		searchNew.setNewType(id);
		List<NewInfo> newList = newService.getNewInfoListByTime(searchNew, 0, GlobalConstant.PAGE_SIZE_NEWLIST);
		if(newList != null && newList.size() > 0){
			jsonObject.accumulate("newlist", newList);
			jsonObject.accumulate(GlobalConstant.RET_JSON_RESULT, GlobalConstant.RET_SUCCESS);
		}else {
			jsonObject.accumulate(GlobalConstant.RET_JSON_RESULT, GlobalConstant.RET_FAIL);
		}
//System.out.println(jsonObject.get(GlobalConstant.RET_JSON_RESULT));
		return jsonObject.toString(); 
	}
	
	
	//前台新闻详情
	@RequestMapping("detail")
	public String getNewDetail(Model model,String id,@ModelAttribute("newlist")List<NewInfo> newList ){
		NewInfo newInfo = newService.getNewInfo(id);
		model.addAttribute("news", newInfo);
		SelectInfo before = newService.getRecentNew(newInfo.getNewType(), newInfo.getSendDate(), 0);
		SelectInfo after  = newService.getRecentNew(newInfo.getNewType(), newInfo.getSendDate(), 1);
		model.addAttribute("newlist", newList);
		model.addAttribute("before", before);
		model.addAttribute("after", after);
		return "screens/new/newDetail";
	}
	
	
	
}