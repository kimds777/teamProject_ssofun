package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class DeliveryDto {
	private int delivery_id; // PK
	private int delivery_company_id; // FK
	private int delivery_recipient_id; // FK
	private String invoice_no; // 운송장번호
	@JsonFormat(pattern = "yyyy-MM-dd:HH.mm.ss",  timezone = "Asia/Seoul") //데이터 포맷 변환
	private Date created_at; // 등록일
	private int used_fg; // 여부
	
	public DeliveryDto() {
		super();
	}

	public DeliveryDto(int delivery_id, int delivery_company_id, int delivery_recipient_id, String invoice_no,
			Date created_at, int used_fg) {
		super();
		this.delivery_id = delivery_id;
		this.delivery_company_id = delivery_company_id;
		this.delivery_recipient_id = delivery_recipient_id;
		this.invoice_no = invoice_no;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}

	public int getDelivery_id() {
		return delivery_id;
	}

	public void setDelivery_id(int delivery_id) {
		this.delivery_id = delivery_id;
	}

	public int getDelivery_company_id() {
		return delivery_company_id;
	}

	public void setDelivery_company_id(int delivery_company_id) {
		this.delivery_company_id = delivery_company_id;
	}

	public int getDelivery_recipient_id() {
		return delivery_recipient_id;
	}

	public void setDelivery_recipient_id(int delivery_recipient_id) {
		this.delivery_recipient_id = delivery_recipient_id;
	}

	public String getInvoice_no() {
		return invoice_no;
	}

	public void setInvoice_no(String invoice_no) {
		this.invoice_no = invoice_no;
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
