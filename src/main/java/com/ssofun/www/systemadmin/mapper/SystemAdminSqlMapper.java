package com.ssofun.www.systemadmin.mapper;

import java.util.List;

import com.ssofun.dto.*;

public interface SystemAdminSqlMapper {

	
//Qna관련
	
	public AdminDto getAdminByIdAndPw(AdminDto AdminDto);
	
	//답변있는 qna글 리스트
	public List<QnaDto>	selectQnaByNonAnswer();
	
	
	//답변없는 qna글 리스트
	public List<QnaDto> selectQnaNotNullAnswer();
	
	
	public QnaDto selectQnaDataBYQnaId (int qna_id);
	
	
	
	public List<Qna_ImageDto> selectQnaImageByQnaId(int qna_id);
	
	
	//public UserDto selectUserDtoByUserId(int user_id);

	
	//QnA답변넣기
	public void updateQnaAnswer(QnaDto qnaDto);
	
	//qnaid로 유저정보가져옴
	public UserDto selectUserDtoByUserId(int qna_id);
	
	//userdto랑 qnadto id로 조인하기 
	public List<FaqDto> selectById (int id);
	
	
	
	
//faq관련
	
	//faq글작성
	public void systemAdminCreateFaq(FaqDto faqDto);
	
	//faq전체글가져옴
	public List<FaqDto> selectAllFaq();
	
	//adminId로 해당되는 admin정보 가져옴
	public AdminDto selectAdminDtoByAdminId(int adminId);
	
	//faqId로 해당되는 faq글정보가져옴
	public FaqDto selectFaqDtoByfaqId(int faqId); 
	
	//faqId로 해당하는 faqdata글수정
	public void updateFaqDataByFaqId (FaqDto faqDto);
	
	//faqId로 해당하는 글삭제
	public void deleteFaqDataByFaqId(int faq_id);
	
	
	
	//faq카테고리글목록
	public List<FaqDto> selectFaqFunding();

	public List<FaqDto> selectFaqStore();
	
	public List<FaqDto> selectFaqShipping();
	
	public List<FaqDto> selectFaqUser();
	
	public List<FaqDto> selectFaqCustomerService();
	
	
	
	//faq도움된다 안된다 insert
	public void insertFaqHelpStatus(FaqHelpStatusDto faqHelpStatusDto);
	
	
	//faq도움되는글 상위 10개 리스트 
	public List<FaqHelpStatusDto> selectTop10HelpfulFaq();
	
}
