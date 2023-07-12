package com.ssofun.www.systemadmin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssofun.dto.*;
import com.ssofun.www.systemadmin.service.SystemAdminServiceImpl;

@Controller
@RequestMapping("systemadmin/*")
public class SystemAdminController {
	
	@Autowired
	private SystemAdminServiceImpl systemAdminService;
	
	
	
	@RequestMapping("systemAdminLoginPage")
	public String systemAdminLoginPage() {
		
		return"systemadmin/systemAdminLoginPage";
	}
	
	
	@ResponseBody
	@RequestMapping("systemAdminLoginProcess")
	public int systemAdminLoginProcess(HttpSession session, AdminDto adminDto) {
		
		
		AdminDto sessionSystemAdmin= systemAdminService.getAdminByIdAndPw(adminDto);
	
//		int user_id = sessionUser.getUser_id();
	
		if (sessionSystemAdmin == null) {		
			return 0;
		}else {
			session.setAttribute("sessionSystemAdmin", sessionSystemAdmin);
			
			return 1;
					//"redirect:../qna/qnaMain?user_id="+user_id;
		}
	}
	
	
	
	@RequestMapping("systemAdminMainPage")
	public String systemAdminMainPage() {
		return"systemadmin/systemAdminMainPage";
	}
	
	
	
	public List<QnaDto> getUnansweredQnaListProcess(Model model, HttpSession session){
		
//		int adminId = 	((Tb_AdminDto)session.getAttribute("sessionAdmin")).getAdmain_id();
		
		
		
		List<QnaDto> getUnansweredQnaList = systemAdminService.getUnansweredQnaList();

			model.addAttribute("getUnansweredQnaList", getUnansweredQnaList);
		
		
		return getUnansweredQnaList; 
	}
	
	
	
	public List<QnaDto> answerCompletedQnaList(Model model, HttpSession session){
		
//		int adminId = 	((Tb_AdminDto)session.getAttribute("sessionAdmin")).getAdmain_id();
		

		
		List<QnaDto> answerCompletedQnaList = systemAdminService.answerCompletedQnaList();

			model.addAttribute("answerCompletedQnaList", answerCompletedQnaList);
		
		
		return answerCompletedQnaList; 
	}
	

	@RequestMapping("systemAdminQnaMainPage")
	public String systemAdminQnaMain(Model model, HttpSession session ) {


		getUnansweredQnaListProcess(model, session);
		answerCompletedQnaList(model, session);
		
			return"systemadmin/systemAdminQnaMainPage";
	}
	
	
	
	
	@RequestMapping("systemAdminReadQnaPage")
	public String systemAdminReadQnaPage(Model model, int qna_id) {
		
//		String name = UserDto.
		Map<String, Object> map = systemAdminService.getQnaData(qna_id);
		QnaDto QnaDto = (QnaDto)map.get("QnaDto");
		String contents = QnaDto.getContents();
		
		
		//int userId = QnaDto.getUser_id();
		
		
	    // html escape
	    contents = StringEscapeUtils.escapeHtml4(contents);
	    contents = contents.replaceAll("\n", "<br>");
	    QnaDto.setContents(contents);
	    
	    
	    model.addAttribute("data",map);
		
		
	    
	    
		
		
		return"systemadmin/systemAdminReadQnaPage";
	}
	
	@RequestMapping("writeQnaAnswerProcess")
	public String writeQnaAnswerProcess(){
		
		
		
		return"systemadmin/systemAdminQnaMain";
	}

	
	
	
}
