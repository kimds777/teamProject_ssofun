package com.ssofun.www.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssofun.www.faq.service.FaqServiceImpl;

@Controller
@RequestMapping("www/faq/*")
public class FaqController {

	@Autowired
	private FaqServiceImpl faqService;
	
	
	@RequestMapping("faqMainPage")
	public String faqMainPage() {
		
		
		return"www/faq/faqTopMainPage";
	}
	
}
