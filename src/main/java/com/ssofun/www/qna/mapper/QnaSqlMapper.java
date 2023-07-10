package com.ssofun.www.qna.mapper;

import java.util.List;

import com.ssofun.dto.*;

public interface QnaSqlMapper {

//최근qnaId가져오기
	public int selectQnaByLatestQnaId();
	
	
//user, pw가져옴	
	public UserDto getUserByEmailAndPw(UserDto userDto);

	
//qna 글 삽입	
	public void insertQna(QnaDto tb_QnaDto);

	
//user_id로 본인이 쓴 qna목록 받아오기	
	public List<QnaDto> qnaListByUserId(int user_id);
	

//email로 user정보 가져옴
	public UserDto selectUserDtoByEmail (String email);
	
	
//qna_id로 qna글정보가져옴
	public QnaDto selectQnaDataBYQnaId (int qna_id);

	
//user qna글 작성시 이미지 삽입
	public void insertQnaImage(Qna_ImageDto Qna_ImageDto);
	
	
//qna이미지 리스트로 가져옴
	public List<Qna_ImageDto> selectQnaImageByQnaId(int qna_id);
	
	
}
