package com.xinyue.server.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xinyue.manage.model.Member;

@Controller
public class demoController {

	@RequestMapping(value={"/","/index"})
	public String demoHome(Model model) {
		
		Member member = new Member();
		
		model.addAttribute("loginInfo", member);
		return "screens/login";
	}
}
