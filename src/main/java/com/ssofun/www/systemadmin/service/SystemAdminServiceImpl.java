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
	
	
	public List<Map<String, Object>> getUnansweredQnaList() {
		
		Map<String, Object> map
		
		List<QnaDto> getUnansweredQnaList = systemAdminSqlMapper.selectQnaByNonAnswer();
		//리스트받아온걸 for문 돌려서 해체한 다음 
		
		
		for(QnaDto qna :getUnansweredQnaList) {
			Map<String, Object> map = new HashMap<>();
			
			int user_id = qna.getUser_id();
			
			UserDto userDto = systemAdminSqlMapper.selectById(user_id);
		}
		
		
		
		
		
		return getUnansweredQnaList;
	}
	
	
	public List<QnaDto> answerCompletedQnaList() {
		
		List<QnaDto> answerCompletedQnaList = systemAdminSqlMapper.selectQnaNotNullAnswer();
		
		
		return answerCompletedQnaList;
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

	
}
