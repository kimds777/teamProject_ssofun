package com.ssofun.www.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	
	// 장바구니 구매후 물품제거
	public void cartUpdate(ProductCart cartDto);
	
	// 배송 받는 사람 등록
	public void insertByRecipient(ProductRecipient recipiDto);
	
	// 상품 주문 등록
	public void insertByOrder(ProductOrderDto porDto);
		
	// 주문 물품 등록
	public void insertByOrderItem(ProductOrderItemDto poiDto);
	
	// 리뷰 등록
	public void insertByReview(ProductReviewDto reDto);
	
	// 리뷰 이미지 등록
	public void insertByReviewImg(ProductReviewImageDto reimgDto);

	//테스트회원가입 ID 중복확인
	public int countByUserId(String userid);
	
	// ProductUser 로그인
	public ProductUserDto selectByEmailAndPassword(ProductUserDto userDto);
	
	// Admin 관리자 테스트 로그인
	public AdminDto selectByIdAndPass(AdminDto adminDto);
	
	// 상품출력
	public List<ProductDto> selectProductList(ProductDto productDto);
	
	// 카테고리 선택 상품 출력
	public List<ProductDto> selectProductCTList(int pct);
	
	// 상품상세보기
	public List<ProductDto> selectProductListDetail(int id);
	
	// 장바구니 목록출력
	public List<ProductUserDto> selectCartList(int id);
	
	// 장바구니 삭제
	public void deleteByCart(ProductCart cartDto);	
	
	// 마이페이지 주문목록 출력
	public List<ProductOrderItemDto> selectMypageProductList(int id);
	
	// 주문상세 출력
	public List<ProductOrderItemDto> selectOrderDetailList(int id);
	
	// 리뷰관리
	public ProductOrderItemDto selectReview(int id);
	
	// 상품마다 리뷰 출력
	public List<ProductReviewDto> selectProductReview(int id);
	
	// 상품별 리뷰개수 출력
	public List<ProductDto> selectByRecount(ProductDto pDto);
	
	// 카테고리 출력
	public List<ProductCategoryTypeDto> selectProductCT(ProductCategoryTypeDto pctDto);
	
	// 주소 출력
	public ProductRecipient selectRecipient(ProductRecipient reciDto);
	
	// 좋아요 관련
	public void insertLike(ProductFavoritDto pfDto);
	public void deleteLike(ProductFavoritDto pfDto);
	public int countMyLike(ProductFavoritDto pfDto);
	public int countLikeByProductId(int ProductId);
	
	// 상품마다 좋아요 개수 출력
	public List<ProductFavoritCountDto> likeCountByProductId(ProductFavoritCountDto pfDto);
	//테스트상품등록
	public void insertByItem(ProductDto productDto);
	

	
}
