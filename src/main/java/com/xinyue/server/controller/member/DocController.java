package com.xinyue.server.controller.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.service.CommonService;
import com.xinyue.server.model.FileInfo;
import com.xinyue.server.service.CommonMemberService;

/**
 *  *  CommonService 2015-10-20 ywh 移走
 * @author wenhai.you
 * @2015年7月20日
 * @上午11:14:17
 */
/**
 * 15-11-27 lzc show()修改
 *
 */
@Controller
@RequestMapping("/member/docctr")
public class DocController {

	@Resource
	private CommonService cbiz;
	
	@Resource
	private CommonMemberService mbiz;
	
	@RequestMapping("/filedown")
	public void filedown(HttpServletRequest req , HttpServletResponse resp){
		String file = req.getParameter("file");
		//String path = req.getServletContext().getRealPath(file);
		//cbiz.download(path, resp);
		cbiz.downLocal(file, resp);
	}
	
	@RequestMapping("/show")
	public String show(Model model , HttpServletRequest req){
//		PageData<FileInfo> finfo = mbiz.showDoc(req.getParameter("topage"));
	
//		model.addAttribute("finfo", finfo);
		return "/screens/member/down";
	}
}
