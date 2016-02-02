package com.xinyue.server.controller.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.model.Advertising;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.model.Organization;
import com.xinyue.manage.model.Product;
import com.xinyue.manage.model.ProductType;
import com.xinyue.manage.model.Question;
import com.xinyue.manage.model.SuccessCase;
import com.xinyue.manage.service.AdvertisingService;
import com.xinyue.manage.service.FastProductService;
import com.xinyue.manage.service.ProductTypeService;
import com.xinyue.manage.service.SelectService;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.bean.OrgCollectBean;
import com.xinyue.server.bean.ProductSearch;
import com.xinyue.server.bean.QuestionBean;
import com.xinyue.server.service.OrgCollectService;

/**
 * 前台
 * @author wenhai.you
 * @2015年8月17日
 * @上午11:16:23
 */
/**
 * 
 *
 */
@Controller
@RequestMapping("/org")
public class OrgController {

	@Resource
	private OrgCollectService obiz;
	
	
	@Resource
	private FastProductService fastProductService;
	
	/**
	 * ywh 前台机构显示
	 * @param model
	 * @param cbean
	 * @return
	 */
	@RequestMapping("/show")
	public String show(Model model , OrgCollectBean cbean){
		//显示头部位置 
		model.addAttribute(GlobalConstant.INDEX_TYPE, "org");
		//显示机构信息
		PageData<Organization> pdata = obiz.findOrgPage(cbean);
		model.addAttribute("orgpage", pdata);
		//查询信息
		model.addAttribute("cbean", cbean);
		//显示图片路径
		model.addAttribute("showpath", obiz.SHOW_PATH);
		//产品类型 对应 擅长业务
		model.addAttribute("protype", obiz.findByStatus());
		//服务地区 对应 城市分站 
		model.addAttribute("orgstation", obiz.findAllStation());
		//机构类型
		model.addAttribute("orgtype", obiz.findOrgTypes());
		return "screens/org/orglist";
	}
	
	/**
	 * ywh 前台 机构详情 
	 * @param orgid
	 * @param model
	 * @return
	 */
	@RequestMapping("/detail")
	public String detail(String orgid , Model model, HttpServletRequest req){
		//显示头部位置 
		model.addAttribute(GlobalConstant.INDEX_TYPE, "org");
		//显示机构信息
		Organization org = obiz.findOrgById(orgid);
		model.addAttribute("org", org);
		//显示产品信息
		List<Product> prolist = obiz.findProByBank(orgid);
		model.addAttribute("listpro", prolist);
		
		//成功案例信息
		List<SuccessCase> caselist = obiz.findCaseByPro(prolist);
		model.addAttribute("listcase", caselist);
		
		
		
		detailRight(model);
		return "screens/org/detail";
	}
	
	
	/**
	 * ywh 机构详情显示 贷款产品分页
	 * @param orgid
	 * @param topage
	 * @param model
	 * @return
	 */
	@RequestMapping("/pro")
	public String showpro(String orgid , String topage , Model model){
		//显示头部位置 
		model.addAttribute(GlobalConstant.INDEX_TYPE, "org");
		//产品分页信息
		PageData<Product> pagepro = obiz.findPageProByBank(orgid, topage);
		model.addAttribute("pagepro", pagepro);
		//用来跳转其他模块 调用 机构id
		Organization org = obiz.findOrgById(orgid);
		model.addAttribute("org", org);
		detailRight(model);
		return "screens/org/product";
	}
	
	/**
	 * ywh 机构详情显示 成功案例分页
	 * @param orgid
	 * @param topage
	 * @param model
	 * @return
	 */
	@RequestMapping("/case")
	public String showcase(String orgid , String topage , Model model){
		//显示头部位置 
		model.addAttribute(GlobalConstant.INDEX_TYPE, "org");
		//成功案例信息
		PageData<SuccessCase> pagecase = obiz.findPageCaseByPro(orgid, topage);
		model.addAttribute("pagecase", pagecase);
		//用来跳转其他模块 调用 机构id
		Organization org = obiz.findOrgById(orgid);
		model.addAttribute("org", org);
		
		detailRight(model);
		return "screens/org/case";
	}
	
	/**
	 * ywh 前台 机构 显示机构档案信息
	 * @param orgid
	 * @param model
	 * @return
	 */
	@RequestMapping("/org")
	public String showorg(String orgid ,  Model model){
		//显示头部位置 
		model.addAttribute(GlobalConstant.INDEX_TYPE, "org");
		//显示机构档案信息
		Organization org = obiz.findOrgById(orgid);
		model.addAttribute("org", org);
		//显示图片路径		
		detailRight(model);
		return "screens/org/orgdetail";
	}
	
	/**
	 * 
	 * @param orgid
	 * @param title
	 * @param topage
	 * @param model
	 * @return
	 */
	@RequestMapping("/credit")
	public String showAdvisory(String orgid , String title , String topage , Model model){
		//显示头部位置 
		model.addAttribute(GlobalConstant.INDEX_TYPE, "org");
		//用来跳转其他模块 调用 机构id
		Organization org = obiz.findOrgById(orgid);
		model.addAttribute("org", org);
		//贷款咨询
		PageData<Question> pagecredit = obiz.findPageAdvisory(orgid, title, topage);
		model.addAttribute("pagecredit", pagecredit);
	/**
		//问题回答
		QuestionBean qbean = new QuestionBean();
		qbean.setOrgid(orgid);
		model.addAttribute("qbean", qbean);
		*/
		detailRight(model);
		
		return "screens/org/credit";
	}
	

	@RequestMapping("/advisory")
	public String advisory(QuestionBean qbean , Model model){
		Organization org = obiz.findOrgById(qbean.getOrgid());
		model.addAttribute("org", org);
		PageData<Question> pagecredit = obiz.findPageAdvisory("0005", qbean.getTitle(), qbean.getTopage());
		model.addAttribute("pagecredit", pagecredit);
		//model.addAttribute("qbean", qbean);
		
		detailRight(model);
		return "screens/org/credit";
	}
	
	@Resource
	private ProductTypeService productTypeService;
	@Resource
	private SelectService selectService;
	@Resource
	private AdvertisingService advertisingService;
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
		
		model.addAttribute("qbean", new QuestionBean());
		
		//广告
		Advertising advertising = advertisingService.findAdByType(3);
		model.addAttribute("advert", advertising);
		model.addAttribute("showpath", obiz.SHOW_PATH);
	}
}
