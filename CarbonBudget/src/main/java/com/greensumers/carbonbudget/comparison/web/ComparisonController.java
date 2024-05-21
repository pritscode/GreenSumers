package com.greensumers.carbonbudget.comparison.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ComparisonController {

	
	@RequestMapping("/cfComparisonView")
	public String cfComparisonView(HttpSession session) {
		if (session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}
		
		return "comparison/cfComparisonView";
	}
	
}
