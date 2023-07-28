package com.ssofun.www.community.mapper;

import java.util.List;

import com.ssofun.dto.CommunityCommentDto;
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
	//커뮤니티 댓글 테이블 프라이머리키로 검색
	public CommunityCommentDto selectByCommunityCommentId(int community_comment_id);
	//조회수 증가
	public void increaseReadCount(int community_id);
	//글 삭제
	public void deleteById(int community_id);
	// 글 수정
	public void contentsUpdate(CommunityDto communityDto);
	
	//댓글 등록 
	public void commentInsert(CommunityCommentDto communityCommentDto);
	
	//댓글 리스트 출력
//	public List<CommunityCommentDto> communitySelectComment ();
	
	//게시글 하나에 대한 댓글 리스트 출력
	public List<CommunityCommentDto> communitySelectCommentList(int community_id);
	
	//게시글에 대한 댓글 개수
	public int getCommentCount(int community_id);

	
}
