package com.ssofun.www.systemadmin.mapper;

import java.util.List;

import com.ssofun.dto.*;

public interface SystemAdminSqlMapper {

	
	public AdminDto getAdminByIdAndPw(AdminDto AdminDto);
	
	
	public List<QnaDto>	selectQnaByNonAnswer();
	
	
	public QnaDto selectQnaDataBYQnaId (int qna_id);
	
	
	
	public List<Qna_ImageDto> selectQnaImageByQnaId(int qna_id);
	
	
	public UserDto selectUserDtoByUserId(int user_id);
	
	
	public List<QnaDto> selectQnaNotNullAnswer();
}
