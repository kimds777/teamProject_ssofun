package com.ssofun.www.community.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssofun.dto.CommunityCommentDto;
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
	
	
	// 사용자 로그인 페이지
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
	
	
	// 커뮤니티 메인페이지 
	@RequestMapping("communityMainPage")
	public String communityMainPage(HttpSession session, Model model) {
		UserDto user = (UserDto)session.getAttribute("user");

		
		List<Map<String, Object>> list = communityService.communityList();
		
	    // list에 있는 각각의 CommunityDto에 대해 title을 HTML 이스케이프 처리
	    for (Map<String, Object> item : list) {
	        CommunityDto communityDto = (CommunityDto) item.get("communityDto");
	        String title = communityDto.getTitle();
	        title = StringEscapeUtils.escapeHtml4(title);
	        communityDto.setTitle(title);
	    }

		model.addAttribute("list", list); 
		
		
		return "www/community/communityMainPage";
	}

	
	//커뮤니티 글쓰기 페이지
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
	
	
	//커뮤니티 글 내용 상세 페이지 
		@RequestMapping("communityReadPage")
		public String communityReadPage(Model model, int community_id, HttpSession session ) {
			communityService.increaseReadCount(community_id);
			UserDto user = (UserDto)session.getAttribute("user");
			
			
			Map<String,Object> map = communityService.getCommunity(community_id);
			

			// html escape 글 내용 
			CommunityDto communityDto = (CommunityDto)map.get("communityDto");
			String contents = communityDto.getContents();
			contents = StringEscapeUtils.escapeHtml4(contents);
			contents = contents.replaceAll("\n", "<br>");
			communityDto.setContents(contents);
			
			// html escape 제목
			String title = communityDto.getTitle();
			title = StringEscapeUtils.escapeHtml4(title);
			communityDto.setTitle(title);

			// 댓글 리스트
			List<Map<String, Object>> Commentlist = communityService.community_commentList();
			
		    // Commentlist에 있는 각각의 CommunityCommentDto에 대해 comment을 HTML 이스케이프 처리
		    for (Map<String, Object> item : Commentlist) {
		    	CommunityCommentDto communityCommentDto = (CommunityCommentDto) item.get("communityCommentDto");
		        String comment = communityCommentDto.getComment();
		        comment = StringEscapeUtils.escapeHtml4(comment);
		        communityCommentDto.setComment(comment);
		    }

			model.addAttribute("Commentlist", Commentlist);
			model.addAttribute("data", map);
			
			
			return "www/community/communityReadPage";
				
	
			}
			

		
		//글 삭제
		@RequestMapping("deleteProcess")
		public String deleteProcess(int community_id) {
			
			communityService.deleteContent(community_id);
			
			return "redirect:./communityMainPage";
		}
		
		// 글 수정
		@RequestMapping("communityUpdatePage")
		public String communityUpdatePage(Model model, int community_id) {
			
			Map<String, Object> map = communityService.getCommunity(community_id);
			model.addAttribute("data", map);
			
			return "www/community/communityUpdatePage";
		}
		
		@RequestMapping("communityupdateProcess")
		public String updateContentProcess(CommunityDto communityDto) {
		
			communityService.contentsUpdate(communityDto);
			
			return "redirect:./communityMainPage";
		}
		
		
		// 댓글 등록 
		@RequestMapping("commentInsertProcess")
		public String commentInsert(CommunityCommentDto communityCommentDto) {
			communityService.commentInsert(communityCommentDto);
			
			return "redirect:./communityReadPage?community_id=" + communityCommentDto.getCommunity_id();
			// 리다이렉트 시 보이는 리드페이지를 구별하기 위해 커뮤니티 아이디를 넘기는 것. 
		}
		
		
		

		
		
}
