package com.ssofun.www.community.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssofun.www.community.mapper.CommunitySqlMapper;

@Service
public class CommunityService {
	
	@Autowired
	private CommunitySqlMapper communitySqlMapper;
	
	
	

}
