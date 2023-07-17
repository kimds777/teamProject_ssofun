package com.ssofun.admin.store.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssofun.admin.store.mapper.StoreAdminSqlMapper;
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
import com.ssofun.dto.ProductReviewImageDto;
import com.ssofun.dto.ProductThumbnailDto;

@Service
public class StoreAdminService {

	   @Autowired
	   private StoreAdminSqlMapper storeAdminSqlMapper;
	   
	   // 모든 상품리스트
	   public List<HyunMinProductJoinDto> selectAll(HyunMinProductJoinDto hyunMinProductJoinDto) {
	      List<HyunMinProductJoinDto> list = storeAdminSqlMapper.selectAll(hyunMinProductJoinDto);
	      return list;
	   }
	   
	   // 카테고리타입리스트
	   public List<ProductCategoryTypeDto> categoryTypeList(ProductCategoryTypeDto productCategoryTypeDto){
		   List<ProductCategoryTypeDto> categoryTypeList = storeAdminSqlMapper.categoryTypeList(productCategoryTypeDto);
		   return categoryTypeList;
	   }
	   
	   // 진행상태리스트
	   public List<ProductOrderStatusDto> orderStatusList(ProductOrderStatusDto productOrderStatusDto){
		   
		   List<ProductOrderStatusDto> orderStatusList = storeAdminSqlMapper.orderStatusList(productOrderStatusDto);
		   
		   return orderStatusList;
	   }
	   
	   //  상품등록
	   public void productInsert(ProductDto productDto) {
	      storeAdminSqlMapper.productInsert(productDto);
	   }
	   
	   // 상품썸네일등록
	   public void productThumbnaillInsert(ProductThumbnailDto productThumbnailDto, List<ProductThumbnailDto> ProductThumbnailDtoList) {
	      
	      for(ProductThumbnailDto pd : ProductThumbnailDtoList) {
	         String name = pd.getName();
	         int list = pd.getOrder_list();
	         productThumbnailDto.setName(name);
	         productThumbnailDto.setOrder_list(list);
	         storeAdminSqlMapper.productThumbnaillInsert(productThumbnailDto);
	      }
	   }
	   
	   // 상품카테고리타입등록
	   public void productcategorytypeInsert(ProductCategoryTypeDto productCategoryTypeDto) {
	      storeAdminSqlMapper.productcategorytypeInsert(productCategoryTypeDto);
	   }
	   
	   // 하나의 상품에 대한 정보가져오기 
	   public ProductDto getSelectById(int product_id) {
	      ProductDto pId = storeAdminSqlMapper.selectById(product_id);
	      return pId;
	   }
	   
	   // 카테고리등록
	   public void productcategoryInsert(ProductCategoryDto productCategoryDto) {
	      storeAdminSqlMapper.productcategoryInsert(productCategoryDto);
	   }
	   
	   // 상품상세보기
	   public HyunMinProductJoinDto productDetail(int product_id) {
		   HyunMinProductJoinDto productDto = storeAdminSqlMapper.productDetail(product_id);
		   return productDto;
	   }
	   public List<ProductThumbnailDto> productThumbnailDetail(int product_id){
		   
		   List<ProductThumbnailDto> productThumbnailDetail = storeAdminSqlMapper.productThumbnailDetail(product_id);
		   
		   return productThumbnailDetail;
	   }
	   
		// 상품수정
		public void productUpdate(ProductDto productDto) {
		    storeAdminSqlMapper.productUpdate(productDto);
		}
		// 상품Used_Fg 0 
		public void productDelete(ProductDto productDto) {
			storeAdminSqlMapper.productDelete(productDto);
		}
		
		// 상품썸네일수정
		public void productThumbnailUpdate(ProductThumbnailDto productThumbnailDto, List<ProductThumbnailDto> ProductThumbnailDtoList) {
		   for(ProductThumbnailDto pd : ProductThumbnailDtoList) {
			   String name = pd.getName();
		       int list = pd.getOrder_list();
		       productThumbnailDto.setName(name);
		       productThumbnailDto.setOrder_list(list);
		       storeAdminSqlMapper.productThumbnaillUpdate(productThumbnailDto);
		       storeAdminSqlMapper.productThumbnaillUpdateUsedFg(productThumbnailDto);
		       } 
		}
		// 상품카테고리수정
		public void productcategoryUpdate(ProductCategoryDto productCategoryDto) {
			storeAdminSqlMapper.productcategoryUpdate(productCategoryDto);
		}
		
		// 주문아이템등록
		public void productOrderItemInsert(ProductOrderItemDto productOrderItemDto) {
			storeAdminSqlMapper.productOrderItemInsert(productOrderItemDto);
		}
		
		// N번 관리자가 판매하는 모든상품의 주문 내역
		public List<ProductOrderItemDto> productOrderItemList(ProductOrderItemDto productOrderItemDto){
			
			List<ProductOrderItemDto> productOrderItemList = storeAdminSqlMapper.productOrderItemList(productOrderItemDto);
			
			return productOrderItemList;
		}
		// N번 관리자가 판매하는 하나의 상품주문내역
		public ProductOrderItemDto orderItemDetail(int product_order_item_id) {
			
			ProductOrderItemDto orderItemDetail = storeAdminSqlMapper.orderItemDetail(product_order_item_id);
			
			return orderItemDetail;
		}
		
		// 관리자 진행상태수정
		// 판매자확인완료
		public void adminCheckUpdate(ProductOrderItemDto productOrderItemDto) {
			storeAdminSqlMapper.adminCheckUpdate(productOrderItemDto);
		}
		// 배송중
		public void deliveryingUpdate(ProductOrderItemDto productOrderItemDto) {
			storeAdminSqlMapper.deliveryingUpdate(productOrderItemDto);
		}
		
		// 택배사리스트
		public List<DeliveryCompanyDto> deliveryCompanyList(DeliveryCompanyDto deliveryCompanyDto){
			List<DeliveryCompanyDto> deliveryCompanyList = storeAdminSqlMapper.deliveryCompanyList(deliveryCompanyDto);
			return deliveryCompanyList;
		}
		
		// 택배사등록
		public int deliveryInsert(DeliveryDto deliveryDto) {
			int delivery_id = storeAdminSqlMapper.deliveryInsert(deliveryDto);
			return delivery_id;
		}
		
		// 카테고리별 오더리스트
		public List<ProductOrderItemDto> orderItemCategoryList(ProductOrderItemDto productOrderItemDto){
			
			List<ProductOrderItemDto> orderItemCategoryList = storeAdminSqlMapper.orderItemCategoryList(productOrderItemDto);
			
			return orderItemCategoryList;
		}
		
		// 발송리스트
		public List<DeliveryDto> deliveryList(DeliveryDto deliveryDto){
			List<DeliveryDto> deliveryList = storeAdminSqlMapper.deliveryList(deliveryDto);
			return deliveryList;
		}
		
		// 발송상세보기
		public ProductOrderItemDto deliveryDetail(int product_order_item_id) {
			
			ProductOrderItemDto deliveryDetail = storeAdminSqlMapper.deliveryDetail(product_order_item_id);
			
			return deliveryDetail;
		}
		
		// 상품리스트(리뷰개수,평점)
		public List<HyunMinProductReviewListDto> productReviewList(HyunMinProductReviewListDto hyunMinProductReviewListDto){
			
			List<HyunMinProductReviewListDto> productReviewList = storeAdminSqlMapper.productReviewList(hyunMinProductReviewListDto);
			
			return productReviewList;
		}
		
		// 상품하나에 대한 리뷰리스트
		public List<HyunMinProductReviewListDto> productDetailReviewList(int product_id){
			
			List<HyunMinProductReviewListDto> productDetailReviewList = storeAdminSqlMapper.productDetailReviewList(product_id);
			
			return productDetailReviewList;
		}
		// 상품하나에 대한 리뷰이미지리스트
		public List<ProductReviewImageDto> productReviewImageList(int product_id){
			
			
			List<ProductReviewImageDto> productReviewImageList = storeAdminSqlMapper.productReviewImageList(product_id);
			
			return productReviewImageList;
		}
	}