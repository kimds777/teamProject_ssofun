package com.ssofun.www.community.mapper;

import java.util.List;

import com.ssofun.dto.CommunityDto;
import com.ssofun.dto.UserDto;

public interface CommunitySqlMapper {

	// 글 입력
	public void communityWriteInsert(CommunityDto communityDto);
	//글 리스트 출력
	public List<CommunityDto> communitySelectList ();
	//유저 테이블 프라이머리키로 검색
	public UserDto selectByUserId (long user_id);
	//커뮤니티 테이블 프라이머리키로 검색
	public CommunityDto selectByCommunityId (int community_id);
	
	//조회수 증가
	public void increaseReadCount(int community_id);
	//글 삭제
	public void deleteById(int community_id);
	// 글 수정
	public void contentsUpdate(CommunityDto communityDto);

	
}
