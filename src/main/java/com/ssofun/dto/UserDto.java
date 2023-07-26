package com.ssofun.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class UserDto {
	
	private long user_id;
	private long user_phone_auth_id;
	private String email;
	private String password;
	private String token;
	private String name;
	private String nickname;
	private int agree_sms;
	private int gender;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private Date create_at;
	private int used_fg;
	public UserDto() {
		super();
	}
	public UserDto(long user_id, long user_phone_auth_id, String email, String password, String token, String name,
			String nickname, int agree_sms, int gender, Date birth, Date create_at, int used_fg) {
		super();
		this.user_id = user_id;
		this.user_phone_auth_id = user_phone_auth_id;
		this.email = email;
		this.password = password;
		this.token = token;
		this.name = name;
		this.nickname = nickname;
		this.agree_sms = agree_sms;
		this.gender = gender;
		this.birth = birth;
		this.create_at = create_at;
		this.used_fg = used_fg;
	}
	public long getUser_id() {
		return user_id;
	}
	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}
	public long getUser_phone_auth_id() {
		return user_phone_auth_id;
	}
	public void setUser_phone_auth_id(long user_phone_auth_id) {
		this.user_phone_auth_id = user_phone_auth_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getAgree_sms() {
		return agree_sms;
	}
	public void setAgree_sms(int agree_sms) {
		this.agree_sms = agree_sms;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public Date getCreate_at() {
		return create_at;
	}
	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}
	public int getUsed_fg() {
		return used_fg;
	}
	public void setUsed_fg(int used_fg) {
		this.used_fg = used_fg;
	}
	
	
}