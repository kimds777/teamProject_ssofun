package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class AdminDto {
	private int admin_id;
	private int biz_id;
	private String login_account;
	private String login_password;
	@JsonFormat(pattern ="yyyy.MM.dd.HH.mm.ss", timezone = "Asia/Seoul")
	private Date created_at;
	private int used_fg;
	
	public AdminDto() {
		super();
	}
	
	public AdminDto(int admin_id, int biz_id, String login_account, String login_password, Date created_at,
			int used_fg) {
		super();
		this.admin_id = admin_id;
		this.biz_id = biz_id;
		this.login_account = login_account;
		this.login_password = login_password;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public int getBiz_id() {
		return biz_id;
	}
	public void setBiz_id(int biz_id) {
		this.biz_id = biz_id;
	}
	public String getLogin_account() {
		return login_account;
	}
	public void setLogin_account(String login_account) {
		this.login_account = login_account;
	}
	public String getLogin_password() {
		return login_password;
	}
	public void setLogin_password(String login_password) {
		this.login_password = login_password;
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
