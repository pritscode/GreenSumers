package com.test.my.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.my.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberservice;
	
	@RequestMapping("/registView")
	public String registView() {
		return "member/registView";
	}

	@RequestMapping("/loginView")
	public String loginView() {
		return "member/loginView";
	}
}
