package com.ssofun.www.community.mapper;

import java.util.List;

import com.ssofun.dto.CommunityDto;
import com.ssofun.dto.UserDto;

public interface CommunitySqlMapper {

	
	public void communityWriteInsert(CommunityDto communityDto);
	public List<CommunityDto> communitySelectList ();
	public UserDto selectByUserId (long user_id);
	public CommunityDto selectByCommunityId (int community_id);
}
