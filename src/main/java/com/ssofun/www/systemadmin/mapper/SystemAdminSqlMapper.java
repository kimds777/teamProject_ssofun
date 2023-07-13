package com.ssofun.www.systemadmin.mapper;

import java.util.List;

import com.ssofun.dto.*;

public interface SystemAdminSqlMapper {

	
	public AdminDto getAdminByIdAndPw(AdminDto AdminDto);
	
	//답변있는 qna글 리스트
	public List<QnaDto>	selectQnaByNonAnswer();
	
	
	//답변없는 qna글 리스트
	public List<QnaDto> selectQnaNotNullAnswer();
	
	
	public QnaDto selectQnaDataBYQnaId (int qna_id);
	
	
	
	public List<Qna_ImageDto> selectQnaImageByQnaId(int qna_id);
	
	
//	public UserDto selectUserDtoByUserId(int user_id);

	
	//QnA답변넣기
	public void updateQnaAnswer(QnaDto qnaDto);
	
	//qnaid로 유저정보가져옴
	public UserDto selectUserDtoByUserId(int qna_id);
	
	//userdto랑 qnadto id로 조인하기 
	public QnaDto selectById (int id);
}
