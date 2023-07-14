package com.ssofun.www.faq.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssofun.www.faq.mapper.FaqSqlMapper;

@Service
public class FaqServiceImpl {

	@Autowired
	 private FaqSqlMapper faqSqlMapper;
}
