package com.ssofun.www.maker.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssofun.dto.FundingCategoryDto;
import com.ssofun.dto.FundingTagDto;
import com.ssofun.www.funding.service.FundingServiceImpl;

@Controller
@RequestMapping("www/maker/*")
public class MakerController {
	
	@Autowired
	private FundingServiceImpl fundingService;

	
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
	@RequestMapping("AJAXinsertTag")
	public long AJAXinsertTag(FundingTagDto params) {
		return fundingService.insertTag(params);
	}
	
	@ResponseBody
	@RequestMapping("AJAXgetTemporarilyTag")
	public FundingTagDto AJAXgetTemporarilyTag(long funding_tag_id) {
		return fundingService.getTemporarilyTag(funding_tag_id);
	}
	
//	@ResponseBody
//	@RequestMapping("")
	
	
//	@RequestMapping("uploadAjax")
//	public void uploadAjax(FundingDto fundingDto ,MultipartFile [] url, int funding_category_id, int user_creator_id
//			, int fuding_tag_id) {
//		System.out.println("펀딩 태그 : "+fuding_tag_id);
//		System.out.println("파일1 : "+url[0]);
//		System.out.println("파일2 : "+url[1]);
//		System.out.println("파일3 : "+url[2]);
//		System.out.println("펀딩 제목 : "+fundingDto.getTitle());
//		//fundingService.insertFunding(fundingDto,url,funding_category_id,user_creator_id,fuding_tag_id);
//		//return true;
//	}
	
}
