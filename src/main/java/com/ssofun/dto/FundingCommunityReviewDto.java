package com.ssofun.dto;

import java.util.List;

public class FundingCommunityReviewDto {
	private String nickname;
	private int created_at;
	private String contents;
	private int answer_count;
	private long funding_review_id; // 커뮤니티 댓글 아이디
	private List<FundingCommunityReviewAnswerDto> answerList;
	private long this_answer_id; //커뮤니티 아이디
	
	public FundingCommunityReviewDto() {
		super();
	}


	public FundingCommunityReviewDto(String nickname, int created_at, String contents, int answer_count,
			long this_answer_id, List<FundingCommunityReviewAnswerDto> answerList, long funding_review_id) {
		super();
		this.nickname = nickname;
		this.created_at = created_at;
		this.contents = contents;
		this.answer_count = answer_count;
		this.this_answer_id = this_answer_id;
		this.answerList = answerList;
		this.funding_review_id = funding_review_id;
	}




	public long getThis_answer_id() {
		return this_answer_id;
	}


	public void setThis_answer_id(long this_answer_id) {
		this.this_answer_id = this_answer_id;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public int getAnswer_count() {
		return answer_count;
	}


	public void setAnswer_count(int answer_count) {
		this.answer_count = answer_count;
	}


	public List<FundingCommunityReviewAnswerDto> getAnswerList() {
		return answerList;
	}


	public void setAnswerList(List<FundingCommunityReviewAnswerDto> answerList) {
		this.answerList = answerList;
	}


	public long getFunding_review_id() {
		return funding_review_id;
	}


	public void setFunding_review_id(long funding_review_id) {
		this.funding_review_id = funding_review_id;
	}


	
	
}
