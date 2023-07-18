package com.ssofun.www.systemadmin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssofun.dto.*;
import com.ssofun.www.faq.service.FaqServiceImpl;
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
	
	
//	미답변 qna글의 리스트프로세스
	public List<Map<String, Object>> getUnansweredQnaListProcess(Model model, HttpSession session){
		
//		int adminId = 	((Tb_AdminDto)session.getAttribute("sessionAdmin")).getAdmain_id();
		
		
//		미답변 qna를 리스트에 담음
		List<Map<String, Object>> getUnansweredQnaList = systemAdminService.getUnansweredQnaList();

//		리스트를 모델에 담아서 넘김
		model.addAttribute("getUnansweredQnaList", getUnansweredQnaList);
		
		
		return getUnansweredQnaList; 
	}
	
	
	
	
//답변완료 qna글의 리스트프로세스
	public List<Map<String, Object>> answerCompletedQnaListProcess(Model model, HttpSession session){
		
//		int adminId = 	((Tb_AdminDto)session.getAttribute("sessionAdmin")).getAdmain_id();
		
		List<Map<String, Object>> answerCompletedQnaList = systemAdminService.answerCompletedQnaList();

			model.addAttribute("answerCompletedQnaList", answerCompletedQnaList);
		
		
		return answerCompletedQnaList; 
	}
	

	@RequestMapping("systemAdminQnaMainPage")
	public String systemAdminQnaMain(Model model, HttpSession session ) {


		getUnansweredQnaListProcess(model, session);//미답변qna리스트 
		answerCompletedQnaListProcess(model, session);//답변완료qna리스트
		
			return"systemadmin/systemAdminQnaMainPage";
	}
	
	
	
	
	@RequestMapping("systemAdminReadQnaPage")
	public String systemAdminReadQnaPage(Model model, int qna_id) {
		
//		String name = UserDto.
		Map<String, Object> map = systemAdminService.getQnaData(qna_id);
		QnaDto QnaDto = (QnaDto)map.get("QnaDto");
		String contents = QnaDto.getContents();
		String answer_contents = QnaDto.getAnswer_contents();
		
		
		//int userId = QnaDto.getUser_id();
		
		
	    // html escape
	    contents = StringEscapeUtils.escapeHtml4(contents);
	    contents = contents.replaceAll("\n", "<br>");
	    QnaDto.setContents(contents);
	    
	    
	    if(answer_contents!=null) {
	    answer_contents = StringEscapeUtils.escapeHtml4(answer_contents);
	    answer_contents = answer_contents.replaceAll("\n", "<br>");
	    QnaDto.setAnswer_contents(answer_contents);
	    
	    }
	    
	    
	    model.addAttribute("data",map);
		
		
	   
	    
		
		
		return"systemadmin/systemAdminReadQnaPage";
	}
	
	@RequestMapping("writeQnaAnswerProcess")
	public String writeQnaAnswerProcess(QnaDto qnaDto,Model model, HttpSession session){
		
		
		getUnansweredQnaListProcess(model, session);
		answerCompletedQnaListProcess(model, session);
		systemAdminService.updateQnaAnswer(qnaDto);

		
		return "systemadmin/systemAdminQnaMainPage";
	}
	
	
	
	
	
	
	
	//FAQ관리자
	
	
	//FAQ메인페이지(목록)
	@RequestMapping("systemAdminFaqMainPage")
	public String systemAdminFaqMainPage(Model model) {
		
		List<Map<String, Object>> list = systemAdminService.getfaqList();
		model.addAttribute("list",list);//request에 담아서 jsp에서 꺼내쓸 수 있음 
		
		
		return"systemadmin/systemAdminFaqMainPage";
	}
	
	
	
	
	//FAQ글작성
	@RequestMapping("systemAdminWriteFaqPage")
	public String systemAdminWriteFaqPage() {
		
		return"systemadmin/systemAdminWriteFaqPage";
	}
	
	
	@RequestMapping("systemAdminWriteFaqProcess")
	public String systemAdminWriteFaqProcess(HttpSession session, FaqDto faqDto) {
		//세션에 저장된 systemadmin값 가져옴
		AdminDto systemAdmin = (AdminDto)session.getAttribute("systemAdmin");
		
		int adminId = systemAdmin.getAdmin_id();
		faqDto.setAdmin_id(adminId);
		
		systemAdminService.systemAdminCreateFaq(faqDto);
		
		System.out.println("컨트롤러"+faqDto.getTitle());
		
		return "redirect:./systemAdminFaqMainPage";
	}
	
	
	//faq상세글보기
	@RequestMapping("systemAdminReadFaqPage")
	public String systemAdminReadFaqPage(Model model,int faqId) {
		 
		Map<String, Object> map = systemAdminService.getFaqData(faqId);
		
		FaqDto faqDto = (FaqDto)map.get("faqDto");
		String contents = faqDto.getContents();
		contents =  StringEscapeUtils.escapeHtml4(contents);
		contents = contents.replaceAll("\n", "<br>");
		faqDto.setContents(contents);
		
		
		
		model.addAttribute("faqData",map);
	
		return "systemadmin/systemAdminReadFaqPage";
	}
	
	
	//faq글삭제
	@RequestMapping("systemAdminFaqDeleteProcess")
	public String systemAdminFaqDeleteProcess(int faqId) {
		
		systemAdminService.deleteFaqData(faqId);
		
		return"redirect:./systemAdminFaqMainPage";
	}
	
	
	
	//faq글수정
	@RequestMapping("systemAdminFaqUpdatePage")
	public String systemAdminFaqUpdatePage(Model model ,@RequestParam("faqId")int faqId) {
		
		systemAdminService.getFaqData(faqId);
		Map<String, Object> map = systemAdminService.getFaqData(faqId);
		
		FaqDto faqDto = (FaqDto)map.get("faqDto");
		String contents = faqDto.getContents();
		contents =  StringEscapeUtils.escapeHtml4(contents);
		contents = contents.replaceAll("\n", "<br>");
		faqDto.setContents(contents);
		
		
		model.addAttribute("faqData",map);
		
		System.out.println(faqId);
		return"systemadmin/systemAdminFaqUpdatePage";
	}
	
	@RequestMapping("systemAdminUpdateFaqProcess")
	public String systemAdminUpdateFaqProcess(FaqDto faqDto) {
		systemAdminService.updateFaqData(faqDto);
		
		return"redirect:./systemAdminFaqMainPage";
	}
	

}
