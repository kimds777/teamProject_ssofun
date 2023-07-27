package com.ssofun.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class UserDto {
	private long user_id;
	private long user_phone_auth_id;
	private String name;
	private String email;
	private String password;
	private String token;
	private int gender;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date birth;
	private String nickname;
	private int agree_sms;
	
	public UserDto() {
	}

	public UserDto(long user_id, long user_phone_auth_id, String name, String email, String password, String token,
			int gender, Date birth, String nickname, int agree_sms) {
		super();
		this.user_id = user_id;
		this.user_phone_auth_id = user_phone_auth_id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.token = token;
		this.gender = gender;
		this.birth = birth;
		this.nickname = nickname;
		this.agree_sms = agree_sms;
	}


	public long getUser_phone_auth_id() {
		return user_phone_auth_id;
	}



	public void setUser_phone_auth_id(long user_phone_auth_id) {
		this.user_phone_auth_id = user_phone_auth_id;
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



	public int getAgree_sms() {
		return agree_sms;
	}



	public void setAgree_sms(int agree_sms) {
		this.agree_sms = agree_sms;
	}



	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "UserDto [user_id=" + user_id + ", user_phone_auth_id=" + user_phone_auth_id + ", name=" + name
				+ ", email=" + email + ", password=" + password + ", token=" + token + ", gender=" + gender + ", birth="
				+ birth + ", nickname=" + nickname + ", agree_sms=" + agree_sms + "]";
	}
	
	
	
}
