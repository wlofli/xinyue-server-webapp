package com.xinyue.server.controller.web;

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
import com.xinyue.manage.model.ProductType;
import com.xinyue.manage.service.AdvertisingService;
import com.xinyue.manage.service.NewService;
import com.xinyue.manage.service.ProductTypeService;
import com.xinyue.manage.service.SelectService;
import com.xinyue.manage.util.CommonFunction;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.bean.ProductSearch;
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
	
	@Resource
	private ProductTypeService productTypeService;
	
	@Resource
	private SelectService selectService;
	
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
//System.out.println(index);
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
		
		detailRight(model);
		
		
		
		return "screens/new/newList";
	}
	
	
	//前台新闻首页
	@RequestMapping("/homelist")
	public String getHomeList(Model model,HttpServletRequest request,@ModelAttribute("newlist")List<NewInfo> newList ){
		request.getSession().setAttribute(GlobalConstant.INDEX_TYPE, "new");
		
		List<SelectInfo> newTypeList = newService.getAllNewTypeList();
		model.addAttribute("newtype",newTypeList);
		
		SearchNew searchNew = new SearchNew();
		searchNew.setNewType(newTypeList.get(0).getKey());
		//设置所在城市 
		//undone ->需要获取ip所在城市再设置城市
//		searchNew.setCity(city);
		List<NewInfo> firsttNewList = newService.getNewInfoListByTime(searchNew, 0, GlobalConstant.PAGE_SIZE_TWO);
		//热门资讯
		model.addAttribute("firstnewlist", firsttNewList);
		
		//最新资讯
		model.addAttribute("newlist", newList);
		
		//第二个type
		searchNew.setNewType(newTypeList.get(1).getKey());
		//第一个新闻列表
		List<NewInfo> secondList = newService.getNewInfoListByTime(searchNew, 0, GlobalConstant.PAGE_SIZE_NEWLIST);
		model.addAttribute("secondnewlist", secondList);
		

		//首页小广告
		AdvertisingInfo advertisingInfo = new AdvertisingInfo();
		advertisingInfo.setTitle("首页小广告");
		List<Advertising> advertisingList = advertisingService.getAdvertising(advertisingInfo);
		model.addAttribute("advertise2", advertisingList);
		
		//轮播图的四个新闻
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
//System.out.println(newInfo.get());
		SelectInfo before = newService.getRecentNew(newInfo.getNewType(), newInfo.getModifiedTime(), 0);
//System.out.println(before.getValue());
		SelectInfo after  = newService.getRecentNew(newInfo.getNewType(), newInfo.getModifiedTime(), 1);
//System.out.println(after.getValue());
		model.addAttribute("before", before);
		model.addAttribute("after", after);
		detailRight(model);
		return "screens/new/newDetail";
	}
	
	
	
	/**
	 * 右边共通
	 * @param model
	 */
	private void detailRight(Model model){
		//搜索产品
		List<ProductType> productTypes = productTypeService.findProductTypeList();
		model.addAttribute("productTypes", productTypes);
		ProductSearch ps = new ProductSearch();
		model.addAttribute("psInfo", ps);
		
		//额度
		List<SelectInfo> amounts = selectService.findSelectByType(GlobalConstant.LOAN_AMOUNT);
		model.addAttribute("amounts", amounts);
		
		//贷款期限
		List<SelectInfo> loanPeriods = selectService.findSelectByType(GlobalConstant.LOAN_PERIOD);
		model.addAttribute("loanPeriods", loanPeriods);
		
		//热门资讯
		List<NewInfo> newList = newService.getNewInfoListByTime(null, 0, GlobalConstant.PAGE_SIZE);
		model.addAttribute("newlist", newList);
		
		//广告
		Advertising advertising = advertisingService.findAdByType(3);
		model.addAttribute("advert", advertising);
		model.addAttribute("showPath", SHOW_PATH);
	}
	
	
}
