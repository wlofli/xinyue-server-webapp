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
import com.xinyue.manage.model.Member;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.been.OrgCollectBean;
import com.xinyue.server.model.OrgCollect;
import com.xinyue.server.service.OrgCollectService;

/**
 * 
 * @author wenhai.you
 * @2015年7月21日
 * @下午1:57:24
 */
@Controller
@RequestMapping("/member/orgcollectctr")
public class OrgCollectController {

	@Resource
	private OrgCollectService obiz;
	@RequestMapping("/show")
	public String show(Model model , OrgCollectBean cbean , HttpServletRequest req){
		if(GlobalConstant.isNull(cbean.getMemberid())){
			Member m = (Member)req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
			cbean.setMemberid("00022b625df943ab934299050c5d6f43");
		}
		PageData<OrgCollect> pdata = obiz.findPage(cbean);
		
		model.addAttribute("pdata", pdata);
		model.addAttribute("cbean", cbean);
		return "screens/collect/org";
	}
	
	@RequestMapping("/del")
	@ResponseBody
	public String delProCollect(@RequestBody List<Integer> id){
		boolean b = obiz.delOrgCollect(id);
		if(b){
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping("/detail/detailid{id}")
	public String show(Model model , int id){
		OrgCollect c = obiz.showDetail(id);
		model.addAttribute("cdetail", c);
		return "screens/collect/orgDetail";
	}
	
}
