package com.ssofun.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class FundingDto {
	private long funding_id;
	private String funding_category;
	private String funding_tag;
	private String creator_name;
	private String creator_email;
	private long achievementPrice; //달성 금액
	private int achievementRate; //달성률
	private int countSupporter;
	private String title;
	private String description;
	private String contents; //상세설명 HTML로 입력되야함
	private int favorit; //좋아요
	private List<FundingNewsDto> newsList; //공지사항 리스트
	private List<FundingCommunityDto> reviewList; //커뮤니티 리스트
	private List<FundingThumbnailDto> thumbnailList; //섬네일 리스트
	private List<FundingRewardDto> rewardList; // 리워드 리스트
	private int d_day; //펀딩 종료 잔여일
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date start_from; //펀딩 시작일
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd EEEE")
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date close_at; //펀딩 종료일
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy년 MM월 dd일")
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date delivery_from; //배송 시작 예정일
	
	public FundingDto() {
		super();
	}


	public FundingDto(long funding_id, String funding_category, String funding_tag, String creator_name,
			String creator_email, long achievementPrice, int achievementRate, int countSupporter,
			String title, String description, String contents, int favorit, List<FundingNewsDto> newsList,
			List<FundingCommunityDto> reviewList, List<FundingThumbnailDto> thumbnailList,
			List<FundingRewardDto> rewardList, int d_day, Date start_from, Date close_at, Date delivery_from) {
		super();
		this.funding_id = funding_id;
		this.funding_category = funding_category;
		this.funding_tag = funding_tag;
		this.creator_name = creator_name;
		this.creator_email = creator_email;
		this.achievementPrice = achievementPrice;
		this.achievementRate = achievementRate;
		this.countSupporter = countSupporter;
		this.title = title;
		this.description = description;
		this.contents = contents;
		this.favorit = favorit;
		this.newsList = newsList;
		this.reviewList = reviewList;
		this.thumbnailList = thumbnailList;
		this.rewardList = rewardList;
		this.d_day = d_day;
		this.start_from = start_from;
		this.close_at = close_at;
		this.delivery_from = delivery_from;
	}

	public List<FundingCommunityDto> getReviewList() {
		return reviewList;
	}


	public void setReviewList(List<FundingCommunityDto> reviewList) {
		this.reviewList = reviewList;
	}


	public List<FundingNewsDto> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<FundingNewsDto> newsList) {
		this.newsList = newsList;
	}

	public List<FundingRewardDto> getRewardList() {
		return rewardList;
	}

	public void setRewardList(List<FundingRewardDto> rewardList) {
		this.rewardList = rewardList;
	}

	public long getFunding_id() {
		return funding_id;
	}

	public void setFunding_id(long funding_id) {
		this.funding_id = funding_id;
	}

	public String getFunding_category() {
		return funding_category;
	}

	public void setFunding_category(String funding_category) {
		this.funding_category = funding_category;
	}

	public String getFunding_tag() {
		return funding_tag;
	}

	public void setFunding_tag(String funding_tag) {
		this.funding_tag = funding_tag;
	}

	public String getCreator_name() {
		return creator_name;
	}

	public void setCreator_name(String creator_name) {
		this.creator_name = creator_name;
	}

	public String getCreator_email() {
		return creator_email;
	}

	public void setCreator_email(String creator_email) {
		this.creator_email = creator_email;
	}

	public long getAchievementPrice() {
		return achievementPrice;
	}

	public void setAchievementPrice(long achievementPrice) {
		this.achievementPrice = achievementPrice;
	}

	public int getAchievementRate() {
		return achievementRate;
	}

	public void setAchievementRate(int achievementRate) {
		this.achievementRate = achievementRate;
	}

	public int getCountSupporter() {
		return countSupporter;
	}

	public void setCountSupporter(int countSupporter) {
		this.countSupporter = countSupporter;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getFavorit() {
		return favorit;
	}

	public void setFavorit(int favorit) {
		this.favorit = favorit;
	}

	public List<FundingThumbnailDto> getThumbnailList() {
		return thumbnailList;
	}

	public void setThumbnailList(List<FundingThumbnailDto> thumbnailList) {
		this.thumbnailList = thumbnailList;
	}

	public int getD_day() {
		return d_day;
	}

	public void setD_day(int d_day) {
		this.d_day = d_day;
	}

	public Date getStart_from() {
		return start_from;
	}

	public void setStart_from(Date start_from) {
		this.start_from = start_from;
	}

	public Date getClose_at() {
		return close_at;
	}

	public void setClose_at(Date close_at) {
		this.close_at = close_at;
	}

	public Date getDelivery_from() {
		return delivery_from;
	}

	public void setDelivery_from(Date delivery_from) {
		this.delivery_from = delivery_from;
	}




}
