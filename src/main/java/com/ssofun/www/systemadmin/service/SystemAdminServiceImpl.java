package com.ssofun.www.systemadmin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssofun.dto.*;
import com.ssofun.www.systemadmin.mapper.SystemAdminSqlMapper;

@Service
public class SystemAdminServiceImpl {
	
	@Autowired
	private SystemAdminSqlMapper systemAdminSqlMapper;
	
	
	public AdminDto getAdminByIdAndPw(AdminDto AdminDto) {
		AdminDto sessionSystemAdmin = systemAdminSqlMapper.getAdminByIdAndPw(AdminDto);
		
		return sessionSystemAdmin;
	}
	
	
	//미답변 qna리스트
	public List<Map<String, Object>> getUnansweredQnaList() {
		
		List<Map<String ,Object>> unanswerList = new ArrayList<>();
		
		List<QnaDto> getUnansweredQnaList = systemAdminSqlMapper.selectQnaByNonAnswer();
		//리스트받아온걸 for문 돌려서 해체한 다음 
		
		
		for(QnaDto qnaDto :getUnansweredQnaList) {
			Map<String, Object> map = new HashMap<>();
			
//			QnaDto qnaDto = systemAdminSqlMapper.
			int userId = qnaDto.getUser_id();
			
			UserDto userDto = systemAdminSqlMapper.selectUserDtoByUserId(userId);
			
			map.put("userDto", userDto);
			map.put("qnaDto",qnaDto);
		
			unanswerList.add(map);
		
		}
		
		
		return unanswerList;
	}
	
	
	//답변완료qnalist
	public List<Map<String, Object>> answerCompletedQnaList() {
		
		List<Map<String, Object>> answerCompleteList = new ArrayList<>();
		
		List<QnaDto> answerCompletedQnaList = systemAdminSqlMapper.selectQnaNotNullAnswer();
		
		for(QnaDto qnaDto:answerCompletedQnaList) {
			Map<String, Object> map = new HashMap<>();
			
			int userId = qnaDto.getUser_id();
			UserDto userDto = systemAdminSqlMapper.selectUserDtoByUserId(userId);
			
			map.put("userDto",userDto);
			map.put("qnaDto", qnaDto);
			
			answerCompleteList.add(map);
			
			
		
		}
		
		
		return answerCompleteList;
	}


	
	public Map<String, Object> getQnaData(int qna_id) {
		
		Map<String, Object> map = new HashMap<>();
		
		
//		UserDto userDto = systemAdminSqlMapper.;
		QnaDto qnaDto = systemAdminSqlMapper.selectQnaDataBYQnaId(qna_id);//qnaid에 해당되는 qna글정보를 가져옴
		UserDto userDto = systemAdminSqlMapper.selectUserDtoByUserId(qnaDto.getUser_id());//qnadto에 있는 uesrid를 userdto에 담아서 넘겨옴 
		
		
		List<Qna_ImageDto> Qna_ImageDtoList= systemAdminSqlMapper.selectQnaImageByQnaId(qna_id);
		
		map.put("UserDto", userDto);
		map.put("QnaDto", qnaDto);
		map.put("Qna_ImageDtoList", Qna_ImageDtoList);
		
	return map;
	}

	//qna답변 삽입(업데이트)
	public void updateQnaAnswer(QnaDto qnaDto) {
		systemAdminSqlMapper.updateQnaAnswer(qnaDto);
	}
	
	
	
	
	
	

//faq관련
	
	//faq글삽입
	public void systemAdminCreateFaq(FaqDto faqDto) {
		systemAdminSqlMapper.systemAdminCreateFaq(faqDto);
		System.out.println("service:"+faqDto.getTitle());
	}
	
	// faq 글목록
	public List<Map<String, Object>> getfaqList(){
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<FaqDto> faqDtoList = systemAdminSqlMapper.selectAllFaq();
		
		
		
		for(FaqDto faqDto : faqDtoList) {
			Map<String, Object> map = new HashMap<>();
			
			int adminId = faqDto.getAdmin_id();
			 
			AdminDto adminDto = systemAdminSqlMapper.selectAdminDtoByAdminId(adminId);
			 
			 
			 map.put("adminDto", adminDto);
			 map.put("faqDto",faqDto);
			 
			 list.add(map);
		}
		
		return list;
	}


	public Map<String, Object> getFaqData(int faqId){
		
		
		Map<String, Object> map = new HashMap<>();
		
		FaqDto faqDto = systemAdminSqlMapper.selectFaqDtoByfaqId(faqId);
		AdminDto adminDto = systemAdminSqlMapper.selectAdminDtoByAdminId(faqDto.getAdmin_id());
		
		map.put("faqDto", faqDto);
		map.put("adminDto", adminDto);
		return map;
	}

	//faq글수정
	public void updateFaqData(FaqDto faqDto) {
		systemAdminSqlMapper.updateFaqDataByFaqId(faqDto);
	}
	
	
	//faq글삭제

	public void deleteFaqData(int faqId) {
		systemAdminSqlMapper.deleteFaqDataByFaqId(faqId);
	}
	

	//faq도움 상위10개의 리스트 
	public List<Map<String, Object>> selectTop10HelpfulFaqList() {
		
		List<Map<String, Object>> topFaqlist = new ArrayList<>();
		List<FaqHelpStatusDto>  faqHelpStatusDtoList = systemAdminSqlMapper.selectTop10HelpfulFaq();
		
		
		for(FaqHelpStatusDto faqHelpStatusDto:faqHelpStatusDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			int faqId = faqHelpStatusDto.getFaq_id();
			
			FaqDto faqDto = systemAdminSqlMapper.selectFaqDtoByfaqId(faqId);
			
			
			map.put("faqDto",faqDto);
			map.put("faqHelpStatusDto", faqHelpStatusDto);
					
			topFaqlist.add(map);
			}
			return topFaqlist;
		}
		
		
		

//		List<Map<String ,Object>> unanswerList = new ArrayList<>();
//		
//		List<QnaDto> getUnansweredQnaList = systemAdminSqlMapper.selectQnaByNonAnswer();
//		//리스트받아온걸 for문 돌려서 해체한 다음 
//		
//		
//		for(QnaDto qnaDto :getUnansweredQnaList) {
//			Map<String, Object> map = new HashMap<>();
//			
//			QnaDto qnaDto = systemAdminSqlMapper.
//			int userId = qnaDto.getUser_id();
//			
//			UserDto userDto = systemAdminSqlMapper.selectUserDtoByUserId(userId);
//			
//			map.put("userDto", userDto);
//			map.put("qnaDto",qnaDto);
//		
//			unanswerList.add(map);
		
	
	
	
}
