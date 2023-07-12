package com.ssofun.www.maker.mapper;

import java.time.LocalDate;

import org.apache.ibatis.annotations.Param;

import com.ssofun.dto.FundingItemDto;
import com.ssofun.dto.FundingRewardDto;
import com.ssofun.dto.FundingTagDto;
import com.ssofun.dto.FundingThumbnailDto;
import com.ssofun.dto.UserCreatorBankDto;
import com.ssofun.dto.UserCreatorDto;

public interface MakerSqlMapper {

	//---창작자 정보 입력
	public long insertUserCreator(UserCreatorDto userCreatorDto);
	//---창작자 은행 정보 입력
	public void insertCreatorBank(UserCreatorBankDto userCreatorBankDto);
	//---태그 정보 입력
	public long insertTag(FundingTagDto fundingTagDto);
	//---펀딩 입력
//	public long insertFunding(@Param("funding_category_id") long funding_category_id, @Param("funding_tag_id") long funding_tag_id, @Param("user_creator_id") long user_creator_id, 
//			@Param("funding_code") String funding_code, @Param("fundingDto") FundingDto fundingDto, @Param("target_price") long target_price,
//			@Param("adult_fg") int adult_fg, @Param("deliveryFrom") LocalDate deliveryFrom);
	
	public long insertFunding(@Param("funding_category_id") long funding_category_id, @Param("funding_tag_id") long funding_tag_id, @Param("user_creator_id") long user_creator_id, 
			@Param("funding_code") String funding_code, @Param("title") String title, @Param("contents") String contents, @Param("description") String description, @Param("target_price") long target_price, 
			@Param("adult_fg") int adult_fg, @Param("deliveryFrom") LocalDate deliveryFrom);
	//---펀딩 코드로 펀딩 아이디 조회
	public long selectFundingIdByCode(String funding_code);
	//---리워드 등록
	public long insertFundingReward(FundingRewardDto fundingRewardDto);
	//---리워드 아이템 등록
	public void insertFundingRewardItem(FundingItemDto fundingItemDto);
	//---섬네일 등록
	public void insertThumbnail(FundingThumbnailDto fundingThumbnailDto);
}
