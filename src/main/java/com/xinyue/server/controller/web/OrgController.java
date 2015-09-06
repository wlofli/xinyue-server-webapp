package com.xinyue.server.controller.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.model.Organization;
import com.xinyue.manage.model.Product;
import com.xinyue.manage.model.Question;
import com.xinyue.manage.model.SuccessCase;
import com.xinyue.server.bean.OrgCollectBean;
import com.xinyue.server.bean.QuestionBean;
import com.xinyue.server.service.OrgCollectService;

/**
 * 
 * @author wenhai.you
 * @2015年8月17日
 * @上午11:16:23
 */
@Controller
@RequestMapping("/org")
public class OrgController {

	@Resource
	private OrgCollectService obiz;
	
	@RequestMapping("/show")
	public String show(Model model , OrgCollectBean cbean){
		PageData<Organization> pdata = obiz.findOrgPage(cbean);
		model.addAttribute("orgpage", pdata);
		model.addAttribute("cbean", cbean);
		
		//产品类型
		model.addAttribute("protype", obiz.findByStatus());
		
		//机构类型
		model.addAttribute("orgtype", obiz.findOrgTypes());
		return "screens/org/orglist";
	}
	
	@RequestMapping("/detail")
	public String detail(String orgid , Model model){
		Organization org = obiz.findOrgById(orgid);
		model.addAttribute("org", org);
		List<Product> prolist = obiz.findProByBank(orgid);
		if(prolist.size()<=4){
			List<Product> listpro = prolist.subList(0, prolist.size());
			model.addAttribute("listpro", listpro);
		}else{
			List<Product> listpro = prolist.subList(0, 4);
			model.addAttribute("listpro", listpro);
		}
		List<SuccessCase> caselist = obiz.findCaseByPro(prolist);
		if (caselist.size()<=4) {
			List<SuccessCase> listcase = caselist.subList(0, caselist.size());
			model.addAttribute("listcase", listcase);
		}else{
			List<SuccessCase> listcase = caselist.subList(0, 4);
			model.addAttribute("listcase", listcase);
		}
		return "screens/org/detail";
	}
	
	
	@RequestMapping("/pro")
	public String showpro(String orgid , String topage , Model model){
		PageData<Product> pagepro = obiz.findPageProByBank(orgid, topage);
		model.addAttribute("pagepro", pagepro);
		Organization org = obiz.findOrgById(orgid);
		model.addAttribute("org", org);
		return "screens/org/product";
	}
	
	@RequestMapping("/case")
	public String showcase(String orgid , String topage , Model model){
		PageData<SuccessCase> pagecase = obiz.findPageCaseByPro(orgid, topage);
		model.addAttribute("pagecase", pagecase);
		Organization org = obiz.findOrgById(orgid);
		model.addAttribute("org", org);
		return "screens/org/case";
	}
	
	
	@RequestMapping("/org")
	public String showorg(String orgid ,  Model model){
		
		Organization org = obiz.findOrgById(orgid);
		model.addAttribute("org", org);
		return "screens/org/orgdetail";
	}
	
	@RequestMapping("/credit")
	public String showAdvisory(String orgid , String title , String topage , Model model){
		Organization org = obiz.findOrgById(orgid);
		model.addAttribute("org", org);
		PageData<Question> pagecredit = obiz.findPageAdvisory("0005", title, topage);
		model.addAttribute("pagecredit", pagecredit);
		QuestionBean qbean = new QuestionBean();
		qbean.setOrgid(orgid);
		model.addAttribute("qbean", qbean);
		return "screens/org/credit";
	}
	
	@RequestMapping("/advisory")
	public String advisory(QuestionBean qbean , Model model){
		Organization org = obiz.findOrgById(qbean.getOrgid());
		model.addAttribute("org", org);
		PageData<Question> pagecredit = obiz.findPageAdvisory("0005", qbean.getTitle(), qbean.getTopage());
		model.addAttribute("pagecredit", pagecredit);
		model.addAttribute("qbean", qbean);
		return "screens/org/credit";
	}
}
