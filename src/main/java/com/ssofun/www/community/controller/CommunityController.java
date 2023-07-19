package com.ssofun.www.community.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssofun.dto.CommunityDto;
import com.ssofun.dto.UserDto;
import com.ssofun.www.community.service.CommunityService;
import com.ssofun.www.integration.service.IntegratedAuthenticationService;
import com.ssofun.www.qna.service.QnaServiceImpl;

@RequestMapping("www/community/*")
@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private IntegratedAuthenticationService integratedAuthenticationService;
	
	@RequestMapping("loginPage")
	public String userLoginPage(HttpSession session) {
		
		if(session.getAttribute("user") != null) {
			return "redirect:./communityMainPage";
		}
		
		return "integratedAuthentication/userLoginPage";
	}

	@RequestMapping("loginProcess")
	public String userLoginProcess(HttpSession session, UserDto params) {

		UserDto user = integratedAuthenticationService.findUserByIdAndPw(params);
		
		if(user == null) {
			return "integratedAuthentication/loginFailed";
		}
		
		
		session.setAttribute("user", user);
		
		return "redirect:./communityMainPage";
	}
	
	
	@RequestMapping("communityMainPage")
	public String communityMainPage(HttpSession session) {
		UserDto user = (UserDto)session.getAttribute("user");

		
		
		return "www/community/communityMainPage";
	}

	
	@RequestMapping("communityWritePage")
	public String communityWritePage() {
		
		return "www/community/communityWritePage";
		
	}
	
	@RequestMapping("communityWriteProcess")
	public String communityWriteProcess(HttpSession session, CommunityDto communityDto ) {
		
		UserDto user = (UserDto)session.getAttribute("user");
		
		long user_id = user.getUser_id();
		communityDto.setUser_id(user_id);
		
		communityService.communityWrite(communityDto);
		
		return "redirect:./communityMainPage";
	}
	
	
}
