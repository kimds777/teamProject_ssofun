package com.ssofun.www.store.mapper;

import java.util.List;


import com.ssofun.dto.*;

public interface StoreSqlMapper {
	
	// 회원가입
	public void insert(AdminDto adminDto);	
	
	// 상품 타입 등록
	public void insertByCaType(ProductCategoryTypeDto catyDto);
	
	// 썸네일 등록
	public void insertByThumbnail(ProductThumbnailDto thumbnail);
	
	// 장바구니 등록
	public void insertByCart(ProductCart cartDto);
	
	// 배송 받는 사람 등록
	public void insertByRecipient(ProductRecipient recipiDto);
	
	// 상품 주문 등록
	public void insertByOrder(ProductOrderDto porDto);
		
	// 주문 물품 등록
	public void insertByOrderItem(ProductOrderItemDto poiDto);		

	//테스트회원가입 ID 중복확인
	public int countByUserId(String userid);
	
	// ProductUser 로그인
	public ProductUserDto selectByEmailAndPassword(ProductUserDto userDto);
	
	// Admin 관리자 테스트 로그인
	public AdminDto selectByIdAndPass(AdminDto adminDto);
	
	// 상품출력
	public List<ProductDto> selectProductList(ProductDto productDto);
	
	// 상품상세보기
	public List<ProductDto> selectProductListDetail(int id);
	
	// 장바구니 목록출력
	public List<ProductUserDto> selectCartList(int id);
	
	// 장바구니 삭제
	public void deleteByCart(ProductCart cartDto);	
	
	//테스트상품등록
	public void insertByItem(ProductDto productDto);
	

	
}
