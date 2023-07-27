package com.ssofun.www.systemadmin.controller;

import java.util.HashMap;
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
	
	
	
	
	
	
	
	
	
	//입점사관리메인페이지(리스트)
	@RequestMapping("companyManagement/companyManagementMainPage")
	public String companyManagementMainPage(Model model) {
		
		List<Map<String, Object>> bizList = systemAdminService.getBizDtoListContainCount();
		model.addAttribute("bizList",bizList);
		
		return "systemadmin/companyManagement/companyManagementMainPage";
	}
	

	
	
	
	
	
	//입점사등록페이지
	@RequestMapping("companyManagement/companyRegistrationPage")
	public String companyRegistrationPage() {
		
		return"systemadmin/companyManagement/companyRegistrationPage";
	}
	
	//입점사 등록프로세스
	@RequestMapping("writeCompanyAccountProcess")
	public String writeCompanyAccount(@RequestParam("biz_name")String biz_name,
									@RequestParam("biz_ceo")String biz_ceo,
									@RequestParam("biz_no_1")String biz_no_1,
									@RequestParam("biz_no_2")String biz_no_2,
									@RequestParam("biz_no_3")String biz_no_3,
									@RequestParam("biz_phone_1")String biz_phone_1,
									@RequestParam("biz_phone_2")String biz_phone_2,
									@RequestParam("biz_phone_3")String biz_phone_3) {
		
		String combinedBizNo = biz_no_1+"-"+biz_no_2+"-"+biz_no_3;
		String combinedBizPhone = biz_phone_1+"-"+biz_phone_2+"-"+biz_phone_3;
		
		BizDto bizDto = new BizDto();
		bizDto.setBiz_name(biz_name);
		bizDto.setBiz_ceo(biz_ceo);
		bizDto.setBiz_no(combinedBizNo);
		bizDto.setBiz_phone(combinedBizPhone);
		
		
		systemAdminService.insertcreateCompanyAccount(bizDto);
		
		System.out.println("controllerinsert"+bizDto.getBiz_ceo());
		return"redirect:./companyManagement/companyManagementMainPage";
	}
	
	
	
	
	
	//입점사 상세페이지
	@RequestMapping("companyManagement/readCompanyPage")
	public String readCompanyPage(Model model, int biz_id) {
		
		BizDto bizData = systemAdminService.getBizData(biz_id); 
		int adminCount = systemAdminService.getAdminCount(biz_id);
		
		
		model.addAttribute("adminCount",adminCount);
		model.addAttribute("bizData",bizData);
		System.out.println(bizData.getBiz_id());
		System.out.println(adminCount);
		return "systemadmin/companyManagement/readCompanyPage";
		
	}
	
	
	
	//입점사 수정페이지
	@RequestMapping("companyManagement/updateCompanyPage")
	public String updateCompanyPage(Model model,int biz_id) {
		
		BizDto bizDto = systemAdminService.getBizData(biz_id);
		
		String biz_no=systemAdminService.getBizData(biz_id).getBiz_no();
		
		String[] parts = biz_no.split("-");
		
		  String bizNoPart1 = parts[0];
		  String bizNoPart2 = parts[1];
		  String bizNoPart3 = parts[2];
		
		String biz_phone=systemAdminService.getBizData(biz_id).getBiz_phone();
		
		String[] phoneParts = biz_phone.split("-");
			
			String bizPhone1 =phoneParts[0];
			String bizPhone2 =phoneParts[1];
			String bizPhone3 =phoneParts[2];
		  
		  
		  
		  

	    model.addAttribute("bizNoPart1", bizNoPart1);
	    model.addAttribute("bizNoPart2", bizNoPart2);
	    model.addAttribute("bizNoPart3", bizNoPart3);
	    
	    model.addAttribute("bizPhone1",bizPhone1);
	    model.addAttribute("bizPhone2",bizPhone2);
	    model.addAttribute("bizPhone3",bizPhone3);
	    

		model.addAttribute("bizDto",bizDto);
		
		return "systemadmin/companyManagement/updateCompanyPage";
		
	}
	
	@RequestMapping("companyUpdateProcess")
	public String companyUpdateProcess(@RequestParam("biz_id")int biz_id,
											@RequestParam("biz_name")String biz_name,
											@RequestParam("biz_ceo")String biz_ceo,
											@RequestParam("biz_no_1")String biz_no_1,
											@RequestParam("biz_no_2")String biz_no_2,
											@RequestParam("biz_no_3")String biz_no_3,
											@RequestParam("biz_phone_1")String biz_phone_1,
											@RequestParam("biz_phone_2")String biz_phone_2,
											@RequestParam("biz_phone_3")String biz_phone_3) {
		
		
		String combinedBizNo = biz_no_1+"-"+biz_no_2+"-"+biz_no_3;
		String combinedBizPhone = biz_phone_1+"-"+biz_phone_2+"-"+biz_phone_3;

		BizDto bizDto = new BizDto();
		
		bizDto.setBiz_id(biz_id);
		bizDto.setBiz_name(biz_name);
		bizDto.setBiz_ceo(biz_ceo);
		bizDto.setBiz_no(combinedBizNo);
		bizDto.setBiz_phone(combinedBizPhone);
		
		System.out.println(biz_name);
		
		systemAdminService.updateCompanyData(bizDto);
		
		
		
		
		return "redirect:./companyManagement/companyManagementMainPage";
	}
	
	
	
	
	
	
	//판매자메인페이지(전체리스트)
	@RequestMapping("companyManagement/venderManagementMainPage")
	public String venderManagementMainPage(Model model) {
		
		List<Map<String, Object>> allAdminList= systemAdminService.getAllAdminList();
		model.addAttribute("allAdminList",allAdminList);
		
		return"systemadmin/companyManagement/venderManagementMainPage";
	}
	
	
	
	//판매자등록페이지
	@RequestMapping("companyManagement/venderRegistrationPage")
	public String venderRegistrationPage(Model model,@RequestParam(value = "biz_id", defaultValue = "0")int biz_id ) {
		
		//입점사관리 => 상세페이지=> 해당되는 판매자관리메인=>판매자등록으로 들어오는 경우 미리 회사명 입력받아서 화면에 출력(adminId넘겨받아서 조회하기)
		
//		Map<String, Object> bizDtoByAdminId = systemAdminService.getAdminData(biz_id);

		
		int bizId = biz_id;
		
		
		Map<String, Object>bizDto = systemAdminService.selectBizDataBybizId(bizId);
			
		List<BizDto> bizList = systemAdminService.getBizDtoList();
		
		
		model.addAttribute("bizList",bizList);
		model.addAttribute("bizDto",bizDto);
		model.addAttribute("bizId",bizId);
		
		return"systemadmin/companyManagement/venderRegistrationPage";
	}
	
	
	//판매자등록프로세스
	@RequestMapping("venderRegistrationProcess")
	public String venderRegistrationProcess(
													@RequestParam("biz_id")int biz_id,
													@RequestParam("admin_nickname")String admin_nickname,
													@RequestParam("login_account")String login_account,
													@RequestParam("login_password")String login_password,
													@RequestParam("admin_phone1")String admin_phone1,
													@RequestParam("admin_phone2")String admin_phone2,
													@RequestParam("admin_phone3")String admin_phone3,
													@RequestParam("admin_received_report")String admin_received_report,
													@RequestParam("admin_report_description")String admin_report_description)
	
	{

		System.out.println(biz_id);
		String combinedAdminPhone = admin_phone1+"-"+admin_phone2+"-"+admin_phone3;
		
		AdminDto adminDto = new AdminDto();
		adminDto.setBiz_id(biz_id);
		adminDto.setAdmin_nickname(admin_nickname);
		adminDto.setLogin_account(login_account);
		adminDto.setLogin_password(login_password);
		adminDto.setAdmin_phone(combinedAdminPhone);
		adminDto.setAdmin_received_report(admin_received_report);
		adminDto.setAdmin_report_description(admin_report_description);
		

		 
		systemAdminService.createAdminAccount(adminDto);


		return "redirect:./companyManagement/venderListOfCompanyNumberPage?biz_id="+adminDto.getBiz_id();

	}


	
	//회사번호에 따른 소속판매자리스트페이지
	@RequestMapping("companyManagement/venderListOfCompanyNumberPage")
	public String venderListOfCompanyNumberPage(Model model, int biz_id) {

		List<Map<String, Object>> adminDtoList = systemAdminService.getAdminDataByBizId(biz_id);
		
		
		//이 코드로 작성하면 데이터 없으면 bizid가 안날라감 
//		BizDto bizDto = null;
//	    for (Map<String, Object> map : adminDtoList) {//첫번째 판매자정보를 가져오므로 항상 업체명 불러오려면 쿼리문부터 불러와야됨
//	        bizDto = (BizDto) map.get("bizDto");
//	        if (bizDto != null) {
//	            break; // 첫 번째로 찾은 bizDto 정보만 가져옴 (모든 Map에 동일한 bizDto 정보가 들어있음)
//	        }
//	    }
		
		
		BizDto bizDto = systemAdminService.getBizData(biz_id);
			
		model.addAttribute("adminDtoList",adminDtoList);
		model.addAttribute("bizDto", bizDto); 
		
		System.out.println(bizDto.getBiz_id());
		
		return"systemadmin/companyManagement/venderListOfCompanyNumberPage";
	}

	
	
	//판매자상세페이지
	@RequestMapping("companyManagement/readVenderPage")
	public String readVenderPage(Model model, int admin_id) {
		
		Map<String, Object> adminDtoByAdminId = systemAdminService.getAdminData(admin_id);
		
		
		
		
		model.addAttribute("adminDtoByAdminId",adminDtoByAdminId);
		return"systemadmin/companyManagement/readVenderPage";
	}
	
	
	//판매자계정설정
	@RequestMapping("venderAccountSetProcess")
	public String venderAccountSetProcess(int admin_id) {
		System.out.println("adminid"+admin_id);
		int bizId = systemAdminService.getAdminDataByAdminId(admin_id).getBiz_id();
		int uesdFg = systemAdminService.getAdminDataByAdminId(admin_id).getUsed_fg();
		System.out.println("계정admin"+admin_id);
		
		if(uesdFg == 1) {
			systemAdminService.adminAccountDeactivation(admin_id);
		}else {
			systemAdminService.adminAccountActivation(admin_id);
		}
	
//		"redirect:./companyManagement/venderListOfCompanyNumberPage?biz_id="+adminDto.getBiz_id();
		return"redirect:./companyManagement/readVenderPage?admin_id="+admin_id;
	}
	
	
	
	
	
	
	
	
	
	
	
//사이트관리
	
	
	//펀딩관리사이트 승인관련
	@RequestMapping("siteManagement/fundingManagementPage")
	public String fundingManagementPage(Model model) {
		
		List<Map<String, Object>> unauthorizedFundingList = systemAdminService.getUnauthorizedFunding();
				
		model.addAttribute("fundingList",unauthorizedFundingList);
		
		
		return "systemadmin/siteManagement/fundingManagementPage";
	}
	
	
	//펀딩승인프로세스
	@RequestMapping("fundingApprovalProcess")
	public String fundingApprovalProcess(int funding_id) {
		
		System.out.println("펀딩프로세스"+funding_id);
		
		systemAdminService.fundingApproval(funding_id);
		
		return "redirect:./siteManagement/fundingManagementPage";
	}
	
	
	
	
	//펀딩사이트 카테고리추가페이지
	@RequestMapping("siteManagement/fundingCategoryAddPage")
	public String fundingCategoryAddPage(Model model) {
		
		List<FundingCategoryDto>fundingCategoryList = systemAdminService.getFundingCategpryData();
		
		model.addAttribute("fundingCategoryList",fundingCategoryList);
		
		return"systemadmin/siteManagement/fundingCategoryAddPage";
	}
	
	//펀딩카테고리추가프로세스
	@RequestMapping("fundingCategoryAddProcess")
	public String fundingCategoryAddProcess(FundingCategoryDto fundingCategoryDto) {
		
		
		systemAdminService.fundingCategoryAdd(fundingCategoryDto);
		return"redirect:./siteManagement/fundingCategoryAddPage";
	}
	
	
	

	
	
}
