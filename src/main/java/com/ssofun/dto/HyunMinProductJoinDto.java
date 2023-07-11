package com.ssofun.dto;

import java.util.Date;

public class HyunMinProductJoinDto {
	private int product_category_type_id;
	private int product_id;
	private int admin_id;
	private String biz_name;
	private String category_type_name;
	private String product_name;
	private int price;
	private int price_sale;
	private String contents;
	private Date created_at;
	private String thumbnail_name;
	public HyunMinProductJoinDto() {
		super();
	}
	public HyunMinProductJoinDto(int product_category_type_id, int product_id, int admin_id, String biz_name,
			String category_type_name, String product_name, int price, int price_sale, String contents, Date created_at,
			String thumbnail_name) {
		super();
		this.product_category_type_id = product_category_type_id;
		this.product_id = product_id;
		this.admin_id = admin_id;
		this.biz_name = biz_name;
		this.category_type_name = category_type_name;
		this.product_name = product_name;
		this.price = price;
		this.price_sale = price_sale;
		this.contents = contents;
		this.created_at = created_at;
		this.thumbnail_name = thumbnail_name;
	}
	public int getProduct_category_type_id() {
		return product_category_type_id;
	}
	public void setProduct_category_type_id(int product_category_type_id) {
		this.product_category_type_id = product_category_type_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public String getBiz_name() {
		return biz_name;
	}
	public void setBiz_name(String biz_name) {
		this.biz_name = biz_name;
	}
	public String getCategory_type_name() {
		return category_type_name;
	}
	public void setCategory_type_name(String category_type_name) {
		this.category_type_name = category_type_name;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPrice_sale() {
		return price_sale;
	}
	public void setPrice_sale(int price_sale) {
		this.price_sale = price_sale;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public String getThumbnail_name() {
		return thumbnail_name;
	}
	public void setThumbnail_name(String thumbnail_name) {
		this.thumbnail_name = thumbnail_name;
	}	
}
