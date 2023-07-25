package com.ssofun.www.store.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssofun.dto.*;
import com.ssofun.www.store.mapper.StoreSqlMapper;

@Service
public class StoreServiceImpl {
	
	@Autowired
	private StoreSqlMapper storeSqlMapper;
	
	//테스트회원가입
	public void register(AdminDto adminDto) {
		storeSqlMapper.insert(adminDto);
	}
	
	//상품타입등록
	public void registerType(ProductCategoryTypeDto catyDto) {
		storeSqlMapper.insertByCaType(catyDto);
	}
		
	//테스트회원가입 ID 중복확인
	public boolean existsUserId(String uerId) {
			
		int count = storeSqlMapper.countByUserId(uerId);
	
		if(count > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	// 관리자 로그인
	public AdminDto login(AdminDto adminDto) {
		AdminDto sessionUser = storeSqlMapper.selectByIdAndPass(adminDto);
		return sessionUser;
	}
	
	
	//상품등록
	public void registerProduct(ProductDto productDto) {
		storeSqlMapper.insertByItem(productDto);
	}
	
	//썸네일 등록
	public void registThumbnail(ProductThumbnailDto thumbnail,List<ProductThumbnailDto> thumbnail_list) {
		for(ProductThumbnailDto th : thumbnail_list) {
			String name = th.getName();
			int list = th.getOrder_list();
			thumbnail.setOrder_list(list);
			thumbnail.setName(name);
			storeSqlMapper.insertByThumbnail(thumbnail);
		}
	}
	
	//장바구니 등록
	public void registCart(ProductCart cartDto) {
		storeSqlMapper.insertByCart(cartDto);
	}
	
	// 장바구니 구매후 물품제거
	public void updateCart(ProductCart cartDto) {
		storeSqlMapper.cartUpdate(cartDto);
	}
	
	//배송 받는 사람 등록
	public void registRecipient(ProductRecipient recipiDto) {
		storeSqlMapper.insertByRecipient(recipiDto);
	}
	
	//상품 주문 등록
	public void registProductOrder(ProductOrderDto porDto) {
		storeSqlMapper.insertByOrder(porDto);
	}
	//주문 물품 등록
	public void registOrderItem(ProductOrderItemDto poiDto) {
		storeSqlMapper.insertByOrderItem(poiDto);
	}
	
	//리뷰 등록
	public void regitstReview(ProductReviewDto reDto) {
		storeSqlMapper.insertByReview(reDto);
	}
	
	//리뷰 이미지등록
	public void registReimg(ProductReviewImageDto reimgDto, List<ProductReviewImageDto> reimg_list) {
		for(ProductReviewImageDto rid : reimg_list) {
			String url = rid.getUrl();
			int list = rid.getOrder_list();
			reimgDto.setOrder_list(list);
			reimgDto.setUrl(url);
			storeSqlMapper.insertByReviewImg(reimgDto);
		}
	}
	
	//상품출력
	public List<ProductDto> getItemList( ProductDto producDto){
		List<ProductDto> productList = storeSqlMapper.selectProductList(producDto);
		
		return productList;
	}
	
	//카테고리 출력
	public List<ProductCategoryTypeDto> getProductCT(ProductCategoryTypeDto pctDto){
		List<ProductCategoryTypeDto> productCTList = storeSqlMapper.selectProductCT(pctDto);
		return productCTList;
	}
	
	//상품상세보기
	public List<ProductDto> getItemListDetail(int id){
			
		List<ProductDto> productListDetail = storeSqlMapper.selectProductListDetail(id);
			
		return productListDetail;
	}
	
	//장바구니 목록 출력
	public List<ProductUserDto> getCartList(int id){
		List<ProductUserDto> CartList = storeSqlMapper.selectCartList(id);
		
		return CartList;
	}
	
	//마이페이지 주문목록 출력
	public List<ProductOrderItemDto> getMypageList(int id){
		List<ProductOrderItemDto> MypageList = storeSqlMapper.selectMypageProductList(id);
		
		return MypageList;
	}
	
	//마이페이지 주문목록 출력
	public List<ProductOrderItemDto> getOrderDetailList(int id){
		List<ProductOrderItemDto> OrderDetailList = storeSqlMapper.selectOrderDetailList(id);
			
		return OrderDetailList;
	}
	
	// 리뷰
	public ProductOrderItemDto getReview(int id) {
		return storeSqlMapper.selectReview(id);
	}
	
	//장바구니 삭제
	public void deleteCart(ProductCart cartDto) {
		storeSqlMapper.deleteByCart(cartDto);
	}
	
	//주소 출력
	public ProductRecipient getRecipient(ProductRecipient reciDto) {
	    return storeSqlMapper.selectRecipient(reciDto);
	}
	
	// ProductUser 로그인
	public ProductUserDto login(ProductUserDto userDto) {
		ProductUserDto sessionUser = storeSqlMapper.selectByEmailAndPassword(userDto);
		return sessionUser;
	}
	
	
}
