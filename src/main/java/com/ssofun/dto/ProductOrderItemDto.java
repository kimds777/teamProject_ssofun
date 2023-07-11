package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductOrderItemDto {
	private int product_order_item_id; // PK
	private int product_order_id; // FK
	private int product_id; // FK
	private int product_order_status_id; // FK
	private int delivery_recipient_id; // FK
	private int count; // 개수
	@JsonFormat(pattern = "yyyy-MM-dd:HH.mm.ss",  timezone = "Asia/Seoul") //데이터 포맷 변환
	private Date created_at; // 등록일
	private int used_fg; // 사용여부
	private String biz_name; // 브랜드명
	private String category_type_name; // 카테고리명
	private String product_name; // 상품명
	private String thumbnail_name; // 파일명
	private int price; // 가격
	private int price_sale; // 할인가
	private String order_status_name; // 상태명
	private String recipient_name; // 수령인
	private String address_post; // 우편번호
	private String address_default; // 기본주소
	private String address_detail; // 상세주소
	private String request_message; // 배송요청사항
	
	public ProductOrderItemDto() {
		super();
	}

	public ProductOrderItemDto(int product_order_item_id, int product_order_id, int product_id,
			int product_order_status_id, int delivery_recipient_id, int count, Date created_at, int used_fg,
			String biz_name, String category_type_name, String product_name, String thumbnail_name, int price,
			int price_sale, String order_status_name, String recipient_name) {
		super();
		this.product_order_item_id = product_order_item_id;
		this.product_order_id = product_order_id;
		this.product_id = product_id;
		this.product_order_status_id = product_order_status_id;
		this.delivery_recipient_id = delivery_recipient_id;
		this.count = count;
		this.created_at = created_at;
		this.used_fg = used_fg;
		this.biz_name = biz_name;
		this.category_type_name = category_type_name;
		this.product_name = product_name;
		this.thumbnail_name = thumbnail_name;
		this.price = price;
		this.price_sale = price_sale;
		this.order_status_name = order_status_name;
		this.recipient_name = recipient_name;
	}

	public int getProduct_order_item_id() {
		return product_order_item_id;
	}

	public void setProduct_order_item_id(int product_order_item_id) {
		this.product_order_item_id = product_order_item_id;
	}

	public int getProduct_order_id() {
		return product_order_id;
	}

	public void setProduct_order_id(int product_order_id) {
		this.product_order_id = product_order_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getProduct_order_status_id() {
		return product_order_status_id;
	}

	public void setProduct_order_status_id(int product_order_status_id) {
		this.product_order_status_id = product_order_status_id;
	}

	public int getDelivery_recipient_id() {
		return delivery_recipient_id;
	}

	public void setDelivery_recipient_id(int delivery_recipient_id) {
		this.delivery_recipient_id = delivery_recipient_id;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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

	public String getThumbnail_name() {
		return thumbnail_name;
	}

	public void setThumbnail_name(String thumbnail_name) {
		this.thumbnail_name = thumbnail_name;
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

	public String getOrder_status_name() {
		return order_status_name;
	}

	public void setOrder_status_name(String order_status_name) {
		this.order_status_name = order_status_name;
	}

	public String getRecipient_name() {
		return recipient_name;
	}

	public void setRecipient_name(String recipient_name) {
		this.recipient_name = recipient_name;
	}

	public String getAddress_post() {
		return address_post;
	}

	public void setAddress_post(String address_post) {
		this.address_post = address_post;
	}

	public String getAddress_default() {
		return address_default;
	}

	public void setAddress_default(String address_default) {
		this.address_default = address_default;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public String getRequest_message() {
		return request_message;
	}

	public void setRequest_message(String request_message) {
		this.request_message = request_message;
	}	
}
