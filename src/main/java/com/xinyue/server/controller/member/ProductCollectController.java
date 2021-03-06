package com.xinyue.server.controller.member;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.model.Collect;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.bean.CollectBean;
import com.xinyue.server.service.ProductCollectService;

/**
 * 
 * @author wenhai.you
 * @2015年7月21日
 * @下午1:57:24
 */
@Controller
@RequestMapping("/member/procollectctr")
public class ProductCollectController {

	@Resource
	private ProductCollectService pbiz;
	@RequestMapping("/show")
	public String show(Model model , CollectBean cbean , HttpServletRequest req){
		if(GlobalConstant.isNull(cbean.getMemberid())){
			Member m = (Member)req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
			cbean.setMemberid(m.getId());
		}
		PageData<Collect> pdata = pbiz.findPageData(cbean);
		
		model.addAttribute("pdata", pdata);
		model.addAttribute("cbean", cbean);
		return "screens/collect/product";
	}
	
	@RequestMapping("/del")
	@ResponseBody
	public String delProCollect(@RequestBody List<Integer> id){
		boolean b = pbiz.delProCollect(id);
		if(b){
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping("/detail/detailid{id}")
	public String show(Model model , int id){
		Collect c = pbiz.showDetail(id);
		model.addAttribute("cdetail", c);
		return "screens/collect/productDetail";
	}
	
}
