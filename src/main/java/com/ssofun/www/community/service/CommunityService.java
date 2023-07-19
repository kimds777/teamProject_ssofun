package com.ssofun.www.community.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssofun.dto.CommunityDto;
import com.ssofun.www.community.mapper.CommunitySqlMapper;
import com.ssofun.www.integration.mapper.IntegratedAuthenticationSqlMapper;

@Service
public class CommunityService {
	
	@Autowired
	private CommunitySqlMapper communitySqlMapper;
	
	public void communityWrite(CommunityDto communityDto) {
		
	}
	
	
	
	

}
