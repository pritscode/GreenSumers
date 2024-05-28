package com.greensumers.carbonbudget.comparison.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.greensumers.carbonbudget.comparison.service.ComparisonService;
import com.greensumers.carbonbudget.comparison.vo.ComparisonVO;
import com.greensumers.carbonbudget.member.vo.MemberVO;

@Controller
public class ComparisonController {

	@Autowired
	ComparisonService comparisonService;
	
	@RequestMapping("/cfComparisonView")
	public String cfComparisonView(ComparisonVO vo, RedirectAttributes re, HttpSession session) {
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login == null) {
			return "redirect:/loginView";
		}
		vo.setAddressId(login.getMemAddrId());
		
		List<ComparisonVO> checkIn = comparisonService.checkInUsageData(vo);
		session.setAttribute("checkIn", checkIn);
		System.out.println(checkIn);
		
		return "comparison/cfComparisonView";
	}
	
}
