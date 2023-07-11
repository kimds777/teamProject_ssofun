package com.ssofun.dto;

import java.util.List;

public class FundingCommunityDto {
	private String nickname;
	private int created_at;
	private String contents;
	private long funding_review_id;
	private int totalComment;
	private List<FundingCommunityReviewDto> reviewList;
	
	public FundingCommunityDto() {
		super();
	}



	public FundingCommunityDto(String nickname, int created_at, String contents, long funding_review_id,
			int totalComment, List<FundingCommunityReviewDto> reviewList) {
		super();
		this.nickname = nickname;
		this.created_at = created_at;
		this.contents = contents;
		this.funding_review_id = funding_review_id;
		this.totalComment = totalComment;
		this.reviewList = reviewList;
	}



	public int getTotalComment() {
		return totalComment;
	}



	public void setTotalComment(int totalComment) {
		this.totalComment = totalComment;
	}



	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getCreated_at() {
		return created_at;
	}

	public void setCreated_at(int created_at) {
		this.created_at = created_at;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}


	public long getFunding_review_id() {
		return funding_review_id;
	}

	public void setFunding_review_id(long funding_review_id) {
		this.funding_review_id = funding_review_id;
	}



	public List<FundingCommunityReviewDto> getReviewList() {
		return reviewList;
	}



	public void setReviewList(List<FundingCommunityReviewDto> reviewList) {
		this.reviewList = reviewList;
	}

	
}
