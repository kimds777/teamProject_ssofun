package com.ssofun.admin.store.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ssofun.admin.store.service.StoreAdminService;
import com.ssofun.dto.*;

@Controller
@RequestMapping("/admin/*")
public class StoreAdminController {
   
   @Autowired
   private StoreAdminService storeAdminService;
   
   // 관리자 메인페이지 
   @RequestMapping("adminMainPage")
   public String adminMainPage(HttpSession session) {
	   
	  AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
	  
	  session.setAttribute("shopAdmin", shopAdmin);
	   
      return "admin/adminMainPage";
   }
   
   // 로그아웃
   @RequestMapping("logoutProcess")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:./adminMainPage";
	}
   
   // 상품등록 페이지 
   @RequestMapping("productInsertPage")
   public String productInsertPage(ProductCategoryTypeDto productCategoryTypeDto, Model model) {
	   
	   List<ProductCategoryTypeDto> categoryTypeList = storeAdminService.categoryTypeList(productCategoryTypeDto);
	   
	   model.addAttribute("categoryTypeList", categoryTypeList);
      
      return "admin/productInsertPage";
   }
      
   // 상품등록
   @RequestMapping("productInsertProcess")
   public String productThumbnaillInsertProcess(ProductDto productDto, ProductThumbnailDto params,ProductCategoryDto productCategoryDto
		   											,MultipartFile [] thumbnail_files) {
      int totalFiles = thumbnail_files.length; // 등록된 이미지 파일의 총 개수
      
      List<ProductThumbnailDto> productThumbnailList = new ArrayList<>();
      
      // 파일 저장 로직
      if(totalFiles > 0) { // 파일이 있을 때
         
         for(int i = 0; i < totalFiles; i++) {
            MultipartFile multipartFile = thumbnail_files[i];
            
            if(multipartFile.isEmpty()) {
               continue;
            }
            
            System.out.println("파일명 " + multipartFile.getOriginalFilename());
            
            String rootFolder = "C:/ssofunUploadFiles/";
            
            String saveFileName = multipartFile.getOriginalFilename(); // 파일명 저장
                     
            try {
               multipartFile.transferTo(new File(rootFolder + saveFileName));
            }catch(Exception e) {
               e.printStackTrace();
            }
            
            ProductThumbnailDto productThumbnailDto = new ProductThumbnailDto();
            productThumbnailDto.setName(saveFileName);
            productThumbnailDto.setOrder_list(i);
            
            productThumbnailList.add(productThumbnailDto);
         }
         
      }
      storeAdminService.productInsert(productDto);
      storeAdminService.productcategoryInsert(productCategoryDto);
      storeAdminService.productThumbnaillInsert(params,productThumbnailList);
      

      
      return "redirect:./adminMainPage";
   }
   
   // 상품 리스트페이지
   @RequestMapping("productListPage")
   public String productListPage(ProductCategoryDto productCategoryDto,Model model) {
	   
	   List<ProductCategoryDto> productList = storeAdminService.selectAll(productCategoryDto);
	  	   
	   model.addAttribute("productList", productList);
	   
	   return "admin/productListPage";
   }
   
   // 상품카테고리타입페이지 
   @RequestMapping("productCategoryTypeInsertPage")
   public String productCategoryTypeInsertPage() {
      return "admin/productCategoryTypeInsertPage";
   }
   
   // 상품카테고리타입등록 
   @RequestMapping("productCategoryTypeInsertProcess")
   public String productCategoryTypeInsertProcess(ProductCategoryTypeDto productCategoryTypeDto) {
      
      storeAdminService.productcategorytypeInsert(productCategoryTypeDto);
      
      return "redirect:./adminMainPage";
   }
   
   // 상품상세보기
   @RequestMapping("productDetailPage")
   public String productDetailProcess(int product_id, Model model) {
      
	   ProductCategoryDto productDetail = storeAdminService.productDetail(product_id);
	   List<ProductThumbnailDto> productThumbnailDetail = storeAdminService.productThumbnailDetail(product_id);
	   System.out.println(productDetail.getProduct_id());
	   
	   model.addAttribute("productDetail", productDetail);
	   model.addAttribute("productThumbnailDetail", productThumbnailDetail);
	   
      return "admin/productDetailPage";
   }
   
   // 상품카테고리 등록페이지
   @RequestMapping("productCategoryInsertPage")
   public String productcategoryInsertPage() {
      return "admin/productCategoryInsertPage";
   }
   
   // 상품카테고리 등록
//   @ResponseBody
//   @RequestMapping("productcategoryInsertProcess")
//   public ProductCategoryTypeDto productcategoryInsertProcess(ProductCategoryDto productCategoryDto,ProductCategoryTypeDto productCategoryTypeDto) {
//      
//      storeAdminService.productcategoryInsert(productCategoryDto);
//      
//      return CategoryTypeDto;
//   }
   
   // 상품수정페이지
   @RequestMapping("productUpdatePage")
   public String productUpdatePage(int product_id, Model model) {
	   
	   ProductCategoryDto productDetail = storeAdminService.productDetail(product_id);
	   List<ProductThumbnailDto> productThumbnailDetail = storeAdminService.productThumbnailDetail(product_id);
	   
	   model.addAttribute("productDetail", productDetail);
	   model.addAttribute("productThumbnailDetail", productThumbnailDetail);
	   
	   return "admin/productUpdatePage";
   }
   
   // 상품수정
   @RequestMapping("productUpdateProcess")
   public String productUpdateProcess(int product_id,ProductDto productDto, ProductThumbnailDto params,
		   ProductCategoryDto productCategoryDto,MultipartFile[] thumbnail_files) {

       int totalFiles = thumbnail_files.length; // 등록된 이미지 파일의 총 개수

       List<ProductThumbnailDto> productThumbnailList = new ArrayList<>();

       // 파일 저장 로직
       if (totalFiles > 0) { // 파일이 있을 때

           for (int i = 0; i < totalFiles; i++) {
               MultipartFile multipartFile = thumbnail_files[i];

               if (multipartFile.isEmpty()) {
                   continue;
               }

               System.out.println("파일명 " + multipartFile.getOriginalFilename());

               String rootFolder = "C:/ssofunUploadFiles/";

               String saveFileName = multipartFile.getOriginalFilename(); // 파일명 저장

               try {
                   multipartFile.transferTo(new File(rootFolder + saveFileName));
               } catch (Exception e) {
                   e.printStackTrace();
               }

               ProductThumbnailDto productThumbnailDto = new ProductThumbnailDto();
               productThumbnailDto.setName(saveFileName);
               productThumbnailDto.setOrder_list(i);

               productThumbnailList.add(productThumbnailDto);
           }
       }

       ProductCategoryDto pId = storeAdminService.productDetail(product_id);
       storeAdminService.productUpdate(productDto);
       storeAdminService.productThumbnailUpdate(params, productThumbnailList);
       storeAdminService.productcategoryUpdate(productCategoryDto);
       
       return "redirect:./adminMainPage";
   }
   
   // 상품삭제
   @ResponseBody
   @RequestMapping("productDeleteProcess")
   public String productDeleteProcess(ProductDto productDto) {
	   
	   storeAdminService.productDelete(productDto);
	   System.out.println(productDto.getUsed_fg());
	   
	   return "1";
   }
   
   // 주문페이지
   @RequestMapping("orderItemInsertPage")
   public String orderItemInsertPage() {
	   return "admin/orderItemInsertPage";
   }
   
   // 상품주문
   @RequestMapping("productOrderItemInsertProcess")
   public String productOrderItemInsertProcess(ProductOrderItemDto productOrderItemDto) {
	   
	   storeAdminService.productOrderItemInsert(productOrderItemDto);
	   
	   return "redirect:./orderItemInsertPage";
   }
   
   // 오더리스트
   @RequestMapping("orderItemListPage")
   public String orderItemListPage( Model model, ProductOrderItemDto productOrderItemDto, ProductOrderStatusDto productOrderStatusDto) {
	   
	   List<ProductOrderItemDto> orderItemCategoryList = storeAdminService.productOrderItemList(productOrderItemDto);
	   
	   List<ProductOrderStatusDto> orderStatusList = storeAdminService.orderStatusList(productOrderStatusDto);
	   
	   model.addAttribute("orderItemCategoryList", orderItemCategoryList);
	   model.addAttribute("orderStatusList", orderStatusList);
	   
	   return "admin/orderItemListPage";
   }
   
   // 관리자 판매상품 상세보기
   @RequestMapping("orderItemDetailPage")
   public String orderItemDetailPage(Model model ,int product_order_item_id) {
	   
	   ProductOrderItemDto orderItemDetail = storeAdminService.orderItemDetail(product_order_item_id);
	   
	   model.addAttribute("orderItemDetail", orderItemDetail);
	   
	   return "admin/orderItemDetailPage";
   }
   
   // 관리자 진행상태처리
   @RequestMapping("orderStatusProcess")
   public String orderStatusProcess(Model model,int product_order_item_id,ProductOrderItemDto productOrderItemDto) {
	   
	   ProductOrderItemDto orderItemDetail = storeAdminService.orderItemDetail(product_order_item_id);
	   
	   System.out.println(orderItemDetail.getProduct_order_item_id());
	   System.out.println(orderItemDetail.getProduct_order_status_id());
	   
	   if(orderItemDetail.getProduct_order_status_id() == 3) {
		   storeAdminService.adminCheckUpdate(productOrderItemDto);
		   return "redirect:./orderItemDetailPage?product_order_item_id=" + product_order_item_id;
	   }else if(orderItemDetail.getProduct_order_status_id() == 4) {
		   storeAdminService.deliveryingUpdate(productOrderItemDto);
		   return "redirect:./orderItemDetailPage?product_order_item_id=" + product_order_item_id;
	   }
	   return "redirect:./orderItemListPage";
   }
   
   // 택배사등록
   @RequestMapping("deliveryInsertProcess")
   public String deliveryInsertProcess(DeliveryDto deliveryDto,int product_order_item_id) {
	   
	   storeAdminService.deliveryInsert(deliveryDto);
	   
	   return "redirect:./orderItemDetailPage?product_order_item_id=" + product_order_item_id;
   }
}