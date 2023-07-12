package com.ssofun.www.maker.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ssofun.dto.FundingDto;
import com.ssofun.dto.FundingItemDto;
import com.ssofun.dto.FundingRewardDto;
import com.ssofun.dto.FundingTagDto;
import com.ssofun.dto.FundingThumbnailDto;
import com.ssofun.dto.UserCreatorBankDto;
import com.ssofun.dto.UserCreatorDto;
import com.ssofun.www.maker.mapper.MakerSqlMapper;

@Service
public class MakerServiceImpl {

	@Autowired
	private MakerSqlMapper makerSqlMapper;
	
	public long insertUserCreator(UserCreatorDto userCreatorDto) {
		makerSqlMapper.insertUserCreator(userCreatorDto);
		return userCreatorDto.getUser_creator_id();
	}

	public long insertCreatorBank(UserCreatorBankDto userCreatorBankDto) {
		makerSqlMapper.insertCreatorBank(userCreatorBankDto);
		return 1;
	}

	public long insertTag(FundingTagDto fundingTagDto) {
		makerSqlMapper.insertTag(fundingTagDto);
		return fundingTagDto.getFunding_tag_id();
	}
	

	public long insertFunding(long funding_category_id, long funding_tag_id, long user_creator_id, String funding_code,
			String title, String contents, String description, long target_price, int adult_fg, LocalDate deliveryFrom) {
		makerSqlMapper.insertFunding(funding_category_id,funding_tag_id,user_creator_id,funding_code,title,contents,description,
				target_price,adult_fg,deliveryFrom);
		
		long funding_id = makerSqlMapper.selectFundingIdByCode(funding_code);
		return funding_id;
	}


//	펀딩 등록시 pk받아서 리워드 및 아이템 입력
	public long insertFundingReward(FundingRewardDto fundingRewardDto) {
		makerSqlMapper.insertFundingReward(fundingRewardDto);
		
		long funding_reward_id = fundingRewardDto.getFunding_reward_id();
		
		return funding_reward_id;
	}

	public int insertFundingRewardItem(FundingItemDto fundingItemDto) {
		System.out.println("아이템 이름: "+fundingItemDto.getName());
		makerSqlMapper.insertFundingRewardItem(fundingItemDto);
		return 1;
	}

	public int insertThumbnail(long funding_id, MultipartFile url, int image_order) {
		FundingThumbnailDto fundingThumbnailDto = new FundingThumbnailDto();
		
		// 메인이미지 저장 로직
		if (!url.isEmpty()) {
			
			System.out.println("파일명: "+ url.getOriginalFilename());
			
			String rootFolder = "c:/ssofunUploadFiles/";

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String today = sdf.format(new Date());

			File targetFolder = new File(rootFolder + today);

			if (!targetFolder.exists()) {
				targetFolder.mkdirs();
			}

			String fileName = UUID.randomUUID().toString();
			fileName += "_" + System.currentTimeMillis();

			String originalFileName = url.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));

			String saveFileName = today + "/" + fileName + ext;

			try {
				url.transferTo(new File(rootFolder + saveFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}

			fundingThumbnailDto.setUrl(saveFileName);
			fundingThumbnailDto.setFunding_id(funding_id);
			fundingThumbnailDto.setImage_order(image_order);

			makerSqlMapper.insertThumbnail(fundingThumbnailDto);
			return 1;
		}else {
			System.out.println("url이 비어있다고!!");
			return 0;
		}
		
	}
	
	
	
	

}
