package com.ssofun.dto;

import java.util.List;

public class FundingNewsDto {
	private int created_at;
	private String title;
	private String contents;
	private long funding_notice_id;
	private int totalComment;
	private List<FundingNewsReviewDto> reviewList;
	
	public FundingNewsDto() {
		super();
	}



	public FundingNewsDto(int totalComment, int created_at, String title, String contents, long funding_notice_id,
			List<FundingNewsReviewDto> reviewList) {
		super();
		this.totalComment = totalComment;
		this.created_at = created_at;
		this.title = title;
		this.contents = contents;
		this.funding_notice_id = funding_notice_id;
		this.reviewList = reviewList;
	}


	public int getTotalComment() {
		return totalComment;
	}



	public void setTotalComment(int totalComment) {
		this.totalComment = totalComment;
	}



	public long getFunding_notice_id() {
		return funding_notice_id;
	}

	public void setFunding_notice_id(long funding_notice_id) {
		this.funding_notice_id = funding_notice_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}



	public int getCreated_at() {
		return created_at;
	}



	public void setCreated_at(int created_at) {
		this.created_at = created_at;
	}



	public List<FundingNewsReviewDto> getReviewList() {
		return reviewList;
	}



	public void setReviewList(List<FundingNewsReviewDto> reviewList) {
		this.reviewList = reviewList;
	}

	
	
}
