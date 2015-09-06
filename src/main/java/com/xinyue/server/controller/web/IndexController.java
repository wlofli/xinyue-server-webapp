package com.xinyue.server.controller.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONObject;
import com.xinyue.manage.beans.SearchNew;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.beans.SubCityInfo;
import com.xinyue.manage.model.Advertising;
import com.xinyue.manage.model.FastProduct;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.model.NewInfo;
import com.xinyue.manage.model.Province;
import com.xinyue.manage.service.AdvertisingService;
import com.xinyue.manage.service.CityService;
import com.xinyue.manage.service.FastProductService;
import com.xinyue.manage.service.MemberService;
import com.xinyue.manage.service.NewService;
import com.xinyue.manage.service.OrganizationTypeService;
import com.xinyue.manage.service.ProductService;
import com.xinyue.manage.service.SelectService;
import com.xinyue.manage.util.CommonFunction;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.bean.BaiduCityInfo;
import com.xinyue.server.util.MapFunction;

/**
 * 主页
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年8月6日
 */
@Controller
public class IndexController {

	@Resource
	AdvertisingService advertisingService;
	
	@Resource
	OrganizationTypeService organizationTypeService;
	
	@Resource
	ProductService productService;
	
	@Resource
	MemberService memberService;
	
	@Resource
	FastProductService fastProductService;
	
	@Resource
	SelectService selectService;
	
	@Resource
	CityService cityService;
	
	
	@Resource
	NewService newService;
	
	private Logger log = Logger.getLogger(IndexController.class);
	
	//图片显示路径
	private static String SHOW_PATH = CommonFunction.getValue("down.path");
	
	/**
	 * 首页
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value={"/","/index"})
	public String index(HttpServletRequest request,Model model) {
		
		String baiduAK = CommonFunction.getValue("baidu_ak");
		
		//IP获得
		String ip = request.getHeader("x-forwarded-for");
		
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getHeader("Proxy-Client-IP");  
	    }  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getHeader("WL-Proxy-Client-IP");  
	    }  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getRemoteAddr();
	    }
	    
	    //debug start
	    ip = "58.101.12.65";
	    //debug end
	    
	    BaiduCityInfo cityInfo = new BaiduCityInfo();
	    MapFunction mf = new MapFunction();
	    
	    cityInfo = mf.getIPCity(ip, baiduAK);
	    
	    if (request.getSession().getAttribute(GlobalConstant.SUB_CITY_INFO) == null) {
	    	//城市获得
	    	String cityName = "";
	    	if (cityInfo != null && cityInfo.getStatus() == 0) {
	    		//城市编码
//	    		String cityCodeBaidu = String.valueOf(cityInfo.getContent().getAddress_detail().getCity_code());
	    		//城市名
	    		cityName = cityInfo.getContent().getAddress_detail().getCity();
	    		//省名
	    		model.addAttribute("provinceName", cityInfo.getContent().getAddress_detail().getProvince());
	    	}else {
	    		log.error("城市获取错误："+cityInfo.getErrMessage());
	    		//转到主页
	    		cityName = CommonFunction.getValue("quanbu");
	    	}
	    	String cityCode = cityService.findCityCodeByName(cityName.substring(0,2));
	    	request.getSession().setAttribute(GlobalConstant.SUB_CITY_INFO, jsonCity(cityCode, cityName));
		}
	    //取得当前城市名
	    JSONObject jo = JSONObject.parseObject(request.getSession().getAttribute(GlobalConstant.SUB_CITY_INFO).toString());
	    request.getSession().setAttribute(GlobalConstant.SUB_CITY_NAME, jo.getString("cityName"));
	    
		//取得大广告
		List<Advertising> adList = advertisingService.getIndexAD();
		model.addAttribute("indexADs", adList);
		model.addAttribute("showPath", SHOW_PATH);
		
		//快速申贷
		FastProduct fastProduct = new FastProduct();
		model.addAttribute("fastLoanInfo", fastProduct);
		
		//城市
		List<SelectInfo> provinces = selectService.findProvince();
		model.addAttribute("provinces", provinces);
		
		//合作融资机构数量
		int organizationCount = organizationTypeService.getCount();
		model.addAttribute("organizationCount", organizationCount);
		
		//合作融资产品数量
		int productCount = productService.getCount(null);
		model.addAttribute("productCount", productCount);
		
		//累计融资金额
		//累计服务企业
		int companyCount = memberService.getCount(null);
		model.addAttribute("companyCount", companyCount);
		
		SearchNew searchNew = new SearchNew();
		//undone->city
//		searchNew.setCity();
		
		List<NewInfo> newList = newService.getNewInfoListByTime(searchNew, 0, GlobalConstant.PAGE_SIZE);
		model.addAttribute("newlist", newList);
		
		request.getSession().setAttribute(GlobalConstant.INDEX_TYPE, "index");
		
		return "screens/index"; 
	}
	
	/**
	 * 快速申贷
	 * @param request
	 * @param model
	 * @param fastLoanInfo
	 * @return
	 */
	@RequestMapping(value="fast/loan",method=RequestMethod.POST)
	public String fastLoan(HttpServletRequest request,Model model,FastProduct fastLoanInfo) {
		
		String returnPath = "";
		
		boolean result = fastProductService.saveFastOrder(fastLoanInfo);
		
		if (result) {
			result = memberService.findMemberByPhone(fastLoanInfo.getContactPhone());
			if (!result) {
				Member member = new Member();
				member.setCompany(fastLoanInfo.getCompany());
				member.setContactName(fastLoanInfo.getContactName());
				member.setContactPhone(fastLoanInfo.getContactPhone());
				
				model.addAttribute("registerInfo", member);
				returnPath = "screens/register";
			}else {
				returnPath = index(request, model);
				model.addAttribute("message", "申请成功");
			}
		}else {
			returnPath = index(request, model);
			model.addAttribute("message", "申请失败");
		}
		
		return returnPath;
	}
	
	/**
	 * 城市列表
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("city/list")
	public String gotoCityList(HttpServletRequest request,Model model) {
		HashMap<String,String[]> map = new HashMap<String, String[]>();
		
		SubCityInfo cityInfo = new SubCityInfo();
		model.addAttribute("cityInfo", cityInfo);
		
		//城市
		List<SelectInfo> provinces = selectService.findProvince();
		model.addAttribute("provinces", provinces);
				
		//按拼音检索
		int asc = 65;
		for (int i = asc; i < 91; i++) {
			String pinyin = String.valueOf((char) i);
			String[] name = cityService.getCitiesByPy(pinyin);
			
			map.put(pinyin, name);
		}
		model.addAttribute("cityPinyInfo", map);
		
		// 按地区检索
		// 华北
		HashMap<String, String[]> hbMap = new HashMap<>();
		// 华东
		HashMap<String, String[]> hdMap = new HashMap<>();
		// 华南
		HashMap<String, String[]> hnMap = new HashMap<>();
		// 华中
		HashMap<String, String[]> hzMap = new HashMap<>();
		// 东北
		HashMap<String, String[]> dbMap = new HashMap<>();
		// 西南
		HashMap<String, String[]> xnMap = new HashMap<>();
		// 西北
		HashMap<String, String[]> xbMap = new HashMap<>();
		// 其他
		HashMap<String, String[]> qtMap = new HashMap<>();

		List<Province> provinceList = cityService.findProvince();

		for (Province province : provinceList) {
			String location = province.getLocation();
			String[] listTemp = cityService.findCitiesByParentId(province
					.getCode());

			switch (location) {
			case "hb":
				hbMap.put(province.getName(), listTemp);
				break;
			case "hd":
				hdMap.put(province.getName(), listTemp);
				break;
			case "hn":
				hnMap.put(province.getName(), listTemp);
				break;
			case "hz":
				hzMap.put(province.getName(), listTemp);
				break;
			case "db":
				dbMap.put(province.getName(), listTemp);
				break;
			case "xn":
				xnMap.put(province.getName(), listTemp);
				break;
			case "xb":
				xbMap.put(province.getName(), listTemp);
				break;
			default:
				qtMap.put(province.getName(), listTemp);
				break;
			}
		}

		model.addAttribute("hbMap", hbMap);
		model.addAttribute("hdMap", hdMap);
		model.addAttribute("hnMap", hnMap);
		model.addAttribute("hzMap", hzMap);
		model.addAttribute("dbMap", dbMap);
		model.addAttribute("xnMap", xnMap);
		model.addAttribute("xbMap", xbMap);
				
		return "screens/city";
	}
	
	/**
	 * 进入对应城市
	 * @param request
	 * @param model
	 * @param cityInfo
	 * @return
	 */
	@RequestMapping(value="/city/enter",method=RequestMethod.POST)
	public String gotoCityIndex(HttpServletRequest request,Model model,SubCityInfo cityInfo) {
		
		String cityName = cityService.findCityByCode(cityInfo.getCity());
		
		request.getSession().setAttribute(GlobalConstant.SUB_CITY_INFO, jsonCity(cityInfo.getCity(), cityName+"市"));
		
		String ret = "";
		
		ret = index(request, model);
		
		return ret;
	}
	
	/**
	 * 城市分站
	 * @param request
	 * @param model
	 * @param cityName
	 * @return
	 */
	@RequestMapping(value="/city/select")
	public String selectCity(HttpServletRequest request,Model model,String cityName) {
		
		try {
			String cityNameTemp = URLDecoder.decode(cityName,"utf-8");
			
			String cityCode = cityService.findCityCodeByName(cityNameTemp);
			
			request.getSession().setAttribute(GlobalConstant.SUB_CITY_INFO, jsonCity(cityCode, cityNameTemp+"市"));
			
			String ret = index(request, model);
			
			return ret;
		} catch (UnsupportedEncodingException e) {
			log.error(e.getMessage());
		}
		
		return "";
	}
	
	/**
	 * 城市信息（json）
	 * @param cityCode 城市代码
	 * @param cityName 城市名字
	 * @return {"cityCode":"";"cityName":""}
	 */
	private String jsonCity(String cityCode,String cityName){
		
		String result = "";
		
		JSONObject jo = new JSONObject();
		jo.put("cityCode", cityCode);
		jo.put("cityName", cityName);
		
		result = jo.toJSONString();
		
		return result;
	}
}
