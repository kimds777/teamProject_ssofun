package com.ssofun.www.qna.mapper;

import java.util.List;

import com.ssofun.dto.*;

public interface QnaSqlMapper {

	public int selectQnaByLatestQnaId();
	
	
	
	public UserDto getUserByEmailAndPw(UserDto userDto);

	
	
	public void insertQna(QnaDto tb_QnaDto);

	
	
	public List<QnaDto> qnaListByUserId(int user_id);
	


	public UserDto selectUserDtoByEmail (String email);
	
	

	public QnaDto selectQnaDataBYQnaId (int qna_id);

	

	public void insertQnaImage(Qna_ImageDto Qna_ImageDto);
	
	

	public List<Qna_ImageDto> selectQnaImageByQnaId(int qna_id);
	
	
	//qna_id로 qna답변가져옴
	public void selectQnaAnswerByQnaId(int qna_id);
}
