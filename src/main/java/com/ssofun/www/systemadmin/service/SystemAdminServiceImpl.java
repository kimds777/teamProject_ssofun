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
	
	
	public List<QnaDto> getUnansweredQnaList() {
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<QnaDto> getUnansweredQnaList = systemAdminSqlMapper.selectQnaByNonAnswer();
		
		return getUnansweredQnaList;
	}
	
	
	public List<QnaDto> answerCompletedQnaList() {
		
		List<QnaDto> answerCompletedQnaList = systemAdminSqlMapper.selectQnaNotNullAnswer();
		
		
		return answerCompletedQnaList;
	}
	
	




	
	public Map<String, Object> getQnaData(int qna_id, int user_id) {
		
		Map<String, Object> map = new HashMap<>();
		
		
		UserDto userDto = systemAdminSqlMapper.selectUserDtoByUserId(user_id);
		QnaDto QnaDto = systemAdminSqlMapper.selectQnaDataBYQnaId(qna_id);
		
		List<Qna_ImageDto> Qna_ImageDtoList= systemAdminSqlMapper.selectQnaImageByQnaId(qna_id);
		
		map.put("User_Dto", userDto);
		map.put("QnaDto", QnaDto);
		map.put("Qna_ImageDtoList", Qna_ImageDtoList);
		
	return map;
}

	//qna답변 삽입(업데이트)
	public void updateQnaAnswer(QnaDto qnaDto) {
		systemAdminSqlMapper.updateQnaAnswer(qnaDto);
	}

	
}
