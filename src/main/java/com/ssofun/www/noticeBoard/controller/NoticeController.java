package com.ssofun.www.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssofun.dto.NoticeCategoryDto;
import com.ssofun.dto.NoticeDto;
import com.ssofun.www.noticeBoard.service.NoticeService;

@Controller
@RequestMapping("www/notice/*")
public class NoticeController {
	
	@Autowired 
	private NoticeService noticeService;
	
	@RequestMapping("noticeMainPage")
	public String notice() {
		
		return "www/notice/noticeMainPage";
	}
	
	
	@RequestMapping("noticeinsertprocess")
	public String noticeinsertprocess(NoticeDto noticeDto, NoticeCategoryDto noticeCategoryDto ) {
		noticeService.insertNoticeBoard(noticeDto);
		noticeService.insertNoticeCategory(noticeCategoryDto);		
		return "redirect:./noticeMainPage";
		
	}

}

