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
		
	
	
	
	
//companyManagement관련, 입점사관리
	
	//업체등록
	public void insertcreateCompanyAccount(BizDto bizDto) {
		systemAdminSqlMapper.createCompanyAccount(bizDto);
		
		};
	
	
	//입점사목록가져오기()
	public List<Map<String, Object>> getBizDtoListContainCount(){
		List<Map<String, Object>> bizList = new ArrayList<>();
		List<BizDto> bizDtoList	= systemAdminSqlMapper.bizDtoList();
		
		for(BizDto bizDto : bizDtoList) {
			Map<String, Object> map = new HashMap<>();
			int biz_id = bizDto.getBiz_id();
			int adminCount = systemAdminSqlMapper.countAdminByBizId(biz_id); 
			
			map.put("bizDto", bizDto);
			map.put("adminCount",adminCount);//biz_id에 해당하는 판매자수
			
			
			bizList.add(map);
		}
		
		return bizList; 
	}
	
	
	public List<BizDto> getBizDtoList (){
		List<BizDto> bizList = systemAdminSqlMapper.bizDtoList();
		
		return bizList;
	}

	
	
	//biz_id로 해당되는 글정보가져오기
	public BizDto getBizData(int biz_id) {
		
		BizDto bizDto = systemAdminSqlMapper.selectBizDataBybizId(biz_id);
		System.out.println("service"+bizDto.getBiz_name());
		
		return bizDto;
		
	};
	
	
	
	
//판매자관리
	
	//bizid에 소속된 판매자리스트 
	public List<Map<String, Object>> getAdminDataByBizId(int biz_id){
		
		List<Map<String, Object>> adminDtoList = new ArrayList<>();
		
		List<AdminDto> adminDtoListByBizId = systemAdminSqlMapper.selectAdminDtoListByBizId(biz_id);
		
		BizDto bizDto = systemAdminSqlMapper.selectBizDataBybizId(biz_id);
		for(AdminDto adminDto:adminDtoListByBizId) {
			
			Map<String, Object> map = new HashMap<>();
			
			
			
			map.put("bizDto", bizDto);
			map.put("adminDto", adminDto);
			
			adminDtoList.add(map);
			}
			return adminDtoList;
		}
	
	//adminid로 판매자정보가져옴(bizid로 adminDto,bizDto엮음)
	public Map<String, Object> getAdminData(int admin_id){
		Map<String, Object> map = new HashMap<>();
		
		
		AdminDto adminDto = systemAdminSqlMapper.selectAdminDtoByAdminId(admin_id);
		
		int bizId = adminDto.getBiz_id(); 
		BizDto	bizDto = systemAdminSqlMapper.selectBizDataBybizId(bizId);

		
		map.put("bizDto", bizDto);
		map.put("adminDto", adminDto);
		
		return map;
	}
	
	//bizId로 해당되는 bizDto정보가져옴
	public Map<String, Object> selectBizDataBybizId(int bizId){
		
		Map<String, Object> map = new HashMap<>();

		
		
		BizDto bizDto = systemAdminSqlMapper.selectBizDataBybizId(bizId);
		
		map.put("bizDto", bizDto);
		
		return map;
	}
	

	
	//판매자등록
	public void createAdminAccount(AdminDto adminDto) {
		systemAdminSqlMapper.createVenderAccount(adminDto);
	}
	
	
	
	//전체판매자리스트(venderManagementMainPage)
	//bizid에 소속된 판매자리스트 
	public List<Map<String, Object>> getAllAdminList(){
		List<Map<String, Object>> adminList = new ArrayList<>();
		
		List<AdminDto> adminDtoList = systemAdminSqlMapper.selectAdminDtoList();

		for(AdminDto adminDto:adminDtoList) {
			Map<String, Object> map = new HashMap<>();
			int bizId = adminDto.getBiz_id();
			
			BizDto bizDto = systemAdminSqlMapper.selectBizDataBybizId(bizId);
			
			map.put("adminDto", adminDto);
			map.put("bizDto", bizDto);
			adminList.add(map);
		}
		
		return adminList ;
	}
	
	

	
	
	
	
	
	
//	public List<Map<String, Object>> getAdminDataByBizId(int biz_id){
//		
//		List<Map<String, Object>> adminDtoList = new ArrayList<>();
//		
//		List<AdminDto> adminDtoListByBizId = systemAdminSqlMapper.selectAdminDtoListByBizId(biz_id);
//		
//		BizDto bizDto = systemAdminSqlMapper.selectBizDataBybizId(biz_id);
//		for(AdminDto adminDto:adminDtoListByBizId) {
//			
//			Map<String, Object> map = new HashMap<>();
//			
//			
//			
//			map.put("bizDto", bizDto);
//			map.put("adminDto", adminDto);
//			
//			adminDtoList.add(map);
//			}
//			return adminDtoList;
//		}
	
	
	
	
	
}
