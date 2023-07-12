package com.ssofun.www.maker.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ssofun.dto.FundingCategoryDto;
import com.ssofun.dto.FundingItemDto;
import com.ssofun.dto.FundingRewardDto;
import com.ssofun.dto.FundingTagDto;
import com.ssofun.dto.FundingThumbnailDto;
import com.ssofun.dto.UserCreatorBankDto;
import com.ssofun.dto.UserCreatorDto;
import com.ssofun.www.funding.service.FundingServiceImpl;
import com.ssofun.www.maker.service.MakerServiceImpl;

@Controller
@RequestMapping("www/maker/*")
public class MakerController {
	
	@Autowired
	private FundingServiceImpl fundingService;
	
	@Autowired
	private MakerServiceImpl makerService;

	
//	판매자 페이지

	@RequestMapping("makerProjectRegisterPage")
	public String creatorPage(){		
		return "www/maker/makerProjectRegisterPage";
	}
	
	@ResponseBody
	@RequestMapping("AJAXgetCategoryList")
	public List<FundingCategoryDto> AJAXgetCategoryList(){
		return fundingService.selectAllFundingCategory();
	}
	
	
	@ResponseBody
	@RequestMapping("AJAXinsertUserCreator")
	public long AJAXinsertUserCreator(UserCreatorDto params) {
		return makerService.insertUserCreator(params);
	}
	
	@ResponseBody
	@RequestMapping("AJAXinsertCreatorBank")
	public long AJAXinsertCreatorBank(UserCreatorBankDto params) {
		return  makerService.insertCreatorBank(params);
	}
	
	@ResponseBody
	@RequestMapping("AJAXinsertTag")
	public long AJAXinsertTag(FundingTagDto params) {
		return makerService.insertTag(params);
	}
	
	
	@ResponseBody
	@RequestMapping("AJAXinsertFunding")
	public long AJAXinsertFunding(long funding_category_id, long funding_tag_id, long user_creator_id, String funding_code,
			String title, String contents, String description, long target_price, int adult_fg, String delivery_from) {
		LocalDate deliveryFrom = LocalDate.parse(delivery_from);
		System.out.println("funding_category_id: "+funding_category_id);
		return makerService.insertFunding(funding_category_id,funding_tag_id,user_creator_id,funding_code,title,contents,description,
				target_price,adult_fg,deliveryFrom);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "AJAXinsertFundingReward", method = RequestMethod.POST)
	public long AJAXinsertFundingReward(@RequestBody FundingRewardDto fundingRewardDto, @RequestParam("delivery_from") String delivery_from 
			,@RequestParam("start_from") String start_from, @RequestParam("close_at") String close_at) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy. MM. dd. EEEE");
		
		SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy.MM.dd");
		System.out.println("delivery_from: "+delivery_from);
		System.out.println("start_from: "+start_from);
		System.out.println("close_at: "+close_at);
		try {
			Date deliveryFrom = formatter.parse(delivery_from);
			fundingRewardDto.setDelivery_from(deliveryFrom);
			System.out.println(deliveryFrom);
			
			Date startFrom = formatter2.parse(start_from);
			fundingRewardDto.setStart_from(startFrom);
			System.out.println(startFrom);
			
			Date closeAt = formatter2.parse(close_at);
			fundingRewardDto.setClose_at(closeAt);
			System.out.println(closeAt);
			
		} catch (Exception  e) {
			e.printStackTrace();
		}
		
		System.out.println("Delivery_price: "+fundingRewardDto.getDelivery_price());
		
		return makerService.insertFundingReward(fundingRewardDto);
	}
	
	@ResponseBody
	@RequestMapping(value = "AJAXinsertFundingRewardItem", method = RequestMethod.POST)
	public int AJAXinsertFundingRewardItem(@RequestBody FundingItemDto fundingItemDto) {
		System.out.println("펀딩 아이템 이름: "+fundingItemDto.getName());
		return makerService.insertFundingRewardItem(fundingItemDto);
	}
	
	
	@ResponseBody
	@RequestMapping("AJAXinsertFundingThumbnail")
	public int AJAXinsertFundingThumbnail(@RequestParam("funding_id") long funding_id,@RequestParam("url") MultipartFile url, @RequestParam("image_order") int image_order) {
		System.out.println("funding_id: "+funding_id);
		
		return makerService.insertThumbnail(funding_id,url,image_order);
	}
	
	
	
}
