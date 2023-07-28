package com.ssofun.www.community.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssofun.dto.CommunityCommentDto;
import com.ssofun.dto.CommunityDto;
import com.ssofun.dto.UserDto;
import com.ssofun.www.community.mapper.CommunitySqlMapper;
import com.ssofun.www.integration.mapper.IntegratedAuthenticationSqlMapper;

@Service
public class CommunityService {
	
	@Autowired
	private CommunitySqlMapper communitySqlMapper;
	
	// 커뮤니티 글 인서트
	public void communityWrite(CommunityDto communityDto) {
		communitySqlMapper.communityWriteInsert(communityDto);
		
	}
	
	// 커뮤니티 리스트 셀렉트
	
	public List<Map<String, Object>> communityList() { 
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<CommunityDto> communityDtoList = communitySqlMapper.communitySelectList();
		
		for(CommunityDto communityDto : communityDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			long user_id = communityDto.getUser_id();
			
			UserDto userDto = communitySqlMapper.selectByUserId(user_id);
			
			// 댓글 개수 조회
			int commentCount = communitySqlMapper.getCommentCount(communityDto.getCommunity_id());
	  
			map.put("userDto", userDto);
			map.put("communityDto", communityDto);
			map.put("commentCount", commentCount);
		  
		  list.add(map);
		}
		
		return list;
	}
	
	
	// 커뮤니티 상세글 보기
	  public Map<String,Object> getCommunity(int community_id){ 
		  
		  Map<String,Object> map = new HashMap<>();
		  CommunityDto communityDto = communitySqlMapper.selectByCommunityId(community_id);
		  UserDto userDto = communitySqlMapper.selectByUserId(communityDto.getUser_id());
		  
		  map.put("communityDto", communityDto);
		  map.put("userDto", userDto);
		  
		  return map;
		  
	  
	  }
	 
	  // 조회수 증가
	  public void increaseReadCount(int community_id) {
		  communitySqlMapper.increaseReadCount(community_id);
		}
		
	  // 글 삭제 
		public void deleteContent(int community_id) {
			communitySqlMapper.deleteById(community_id);
		}
		
	 // 글 수정 
		public void contentsUpdate(CommunityDto communityDto) {
			communitySqlMapper.contentsUpdate(communityDto);
		}
	
		
	 // 댓글 등록
		public void commentInsert(CommunityCommentDto communityCommentDto) {
			communitySqlMapper.commentInsert(communityCommentDto);
		}
	
		
		// 댓글 리스트 셀렉트
//		public List<Map<String, Object>> community_commentList() {
//			
//			List<Map<String, Object>> Commentlist = new ArrayList<>();
//			
//			List<CommunityCommentDto> communityCommentDtoList = communitySqlMapper.communitySelectComment();
//			
//			for(CommunityCommentDto communityCommentDto : communityCommentDtoList) {
//				
//				Map<String, Object> map = new HashMap<>();
//				
//				long user_id = communityCommentDto.getUser_id();
//				
//				int community_id = communityCommentDto.getCommunity_id();
//				
//				UserDto userDto = communitySqlMapper.selectByUserId(user_id);
//				
//				CommunityDto communityDto = communitySqlMapper.selectByCommunityId(community_id);
//				  
//				map.put("userDto", userDto);
//				map.put("communityDto", communityDto);
//				map.put("communityCommentDto", communityCommentDto);
//			  
//				Commentlist.add(map);
//			}
//			
//			return Commentlist;
//		}
		
		// 하나의 게시글에 대한 댓글 리스트
		public List<Map<String, Object>> communitySelectCommentList(int community_id) {

		    List<Map<String, Object>> Commentlist = new ArrayList<>();
		    List<CommunityCommentDto> communityCommentDtoList = communitySqlMapper.communitySelectCommentList(community_id);

		    for (CommunityCommentDto communityCommentDto : communityCommentDtoList) {

		        Map<String, Object> map = new HashMap<>();
		        long user_id = communityCommentDto.getUser_id();
		        UserDto userDto = communitySqlMapper.selectByUserId(user_id);
		        CommunityDto communityDto = communitySqlMapper.selectByCommunityId(community_id);

		        map.put("userDto", userDto);
		        map.put("communityDto", communityDto);
		        map.put("communityCommentDto", communityCommentDto);

		        Commentlist.add(map);
		    }

		    return Commentlist;
		}
}
