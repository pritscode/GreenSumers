package com.greensumers.carbonbudget.comparison.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ComparisonController {

	
	@RequestMapping("/statisticsView")
	public String statisticsView(HttpSession session) {
		if (session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}
		
		return "comparison/statisticsView";
	}
	
}
