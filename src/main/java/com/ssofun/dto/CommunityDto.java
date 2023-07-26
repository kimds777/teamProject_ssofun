package com.ssofun.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CommunityDto {
	
	private int community_id;
	private long user_id;
	private String title;
	private String contents;
	private int read_count;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date community_created_at;
	private Date created_at;
	private int used_fg;
	public CommunityDto() {
		super();
	}
	public CommunityDto(int community_id, long user_id, String title, String contents, int read_count,
			Date community_created_at, Date created_at, int used_fg) {
		super();
		this.community_id = community_id;
		this.user_id = user_id;
		this.title = title;
		this.contents = contents;
		this.read_count = read_count;
		this.community_created_at = community_created_at;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}
	public int getCommunity_id() {
		return community_id;
	}
	public void setCommunity_id(int community_id) {
		this.community_id = community_id;
	}
	public long getUser_id() {
		return user_id;
	}
	public void setUser_id(long user_id) {
		this.user_id = user_id;
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
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public Date getCommunity_created_at() {
		return community_created_at;
	}
	public void setCommunity_created_at(Date community_created_at) {
		this.community_created_at = community_created_at;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public int getUsed_fg() {
		return used_fg;
	}
	public void setUsed_fg(int used_fg) {
		this.used_fg = used_fg;
	}
	
	
	

}
