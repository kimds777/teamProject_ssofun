package com.ssofun.admin.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssofun.dto.DeliveryCompanyDto;
import com.ssofun.dto.DeliveryDto;
import com.ssofun.dto.HyunMinDeliveryJoinDto;
import com.ssofun.dto.HyunMinProductJoinDto;
import com.ssofun.dto.HyunMinProductReviewListDto;
import com.ssofun.dto.ProductCategoryDto;
import com.ssofun.dto.ProductCategoryTypeDto;
import com.ssofun.dto.ProductDto;
import com.ssofun.dto.ProductOrderItemDto;
import com.ssofun.dto.ProductOrderStatusDto;
import com.ssofun.dto.ProductReviewDto;
import com.ssofun.dto.ProductReviewImageDto;
import com.ssofun.dto.ProductThumbnailDto;

public interface StoreAdminSqlMapper {

	   // 모든상품리스트
	   public List<HyunMinProductJoinDto> selectAll(HyunMinProductJoinDto hyunMinProductJoinDto);
	   
	   // 카테고리타입리스트
	   public List<ProductCategoryTypeDto> categoryTypeList(ProductCategoryTypeDto productCategoryTypeDto);
	   
	   // 진행상태리스트
	   public List<ProductOrderStatusDto> orderStatusList(ProductOrderStatusDto productOrderStatusDto);
	   
	   // 상품등록 
	   public void productInsert(ProductDto ProductDto);
	   
	   // 상품썸네일등록
	   public void productThumbnaillInsert(ProductThumbnailDto productThumbnailDto);
	   
	   // 상품 카테고리 타입등록 
	   public void productcategorytypeInsert(ProductCategoryTypeDto productCategoryTypeDto);
	   
	   // 상품 하나의 대한 정보가져오기 
	   public ProductDto selectById(int product_id);
	   
	   // 카테고리 등록
	   public void productcategoryInsert(ProductCategoryDto productCategoryDto);
	   
	  // 상품상세보기
	   public HyunMinProductJoinDto productDetail(int product_id);
	   public List<ProductThumbnailDto> productThumbnailDetail(int product_id);
	   
	   // 상품수정 찐
	   public void productUpdate(ProductDto ProductDto);
	   
	   // 상품수정
	   public void productUpdate1(ProductDto ProductDto);
	   public void productUpdateUsedFg(ProductDto ProductDto);
	   // 상품삭제
	   public void productDelete(ProductDto ProductDto);
	   // 썸네일수정
	   public void productThumbnaillUpdate(ProductThumbnailDto productThumbnailDto);
	   public void productThumbnaillUpdateUsedFg(ProductThumbnailDto productThumbnailDto);
	   // 카테고리수정
	   public void productcategoryUpdate(ProductCategoryDto productCategoryDto);
	   
	   // 주문아이템등록
	   public void productOrderItemInsert(ProductOrderItemDto productOrderItemDto);
	   
	   // N번 관리자가 판매하는 모든상품의 주문 내역
	   public List<ProductOrderItemDto> productOrderItemList(ProductOrderItemDto productOrderItemDto);
	   
	   // N번 관리가 판매하는 하나의 상품의 주문내역
	   public ProductOrderItemDto orderItemDetail(int product_order_item_id);
	   
	   // 진행상태수정
	   public void adminCheckUpdate(ProductOrderItemDto productOrderItemDto); // 판매자확인완료
	   public void deliveryingUpdate(ProductOrderItemDto productOrderItemDto); // 배송중
	   
	   // 택배사리스트
	   public List<DeliveryCompanyDto> deliveryCompanyList(DeliveryCompanyDto deliveryCompanyDto);
	   // 택배사등록
	   public int deliveryInsert(DeliveryDto deliveryDto);
	   
	   // 카테고리별 오더리스트
	   public List<ProductOrderItemDto> orderItemCategoryList(ProductOrderItemDto productOrderItemDto);
	   
	   // 발송리스트
	   public List<DeliveryDto> deliveryList(DeliveryDto deliveryDto);
	   // 발송상세보기
	   public ProductOrderItemDto deliveryDetail(int product_order_item_id);
	   
	   // 상품리스트(리뷰개수,평점)
	   public List<HyunMinProductReviewListDto> productReviewList(HyunMinProductReviewListDto hyunMinProductReviewListDto);
	   
	   // 상품하나에 대한 리뷰리스트
	   public List<HyunMinProductReviewListDto> productDetailReviewList(int product_id);
	   // 상품하나에 대한 리뷰이미지리스트
	   public List<ProductReviewImageDto> productReviewImageList(int product_id);
	}