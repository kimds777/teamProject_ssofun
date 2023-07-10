package com.ssofun.www.store.controller;

import java.io.File;

import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ssofun.dto.*;
import com.ssofun.www.store.service.StoreServiceImpl;

@Controller
@RequestMapping("www/store/*")
public class StoreController {
	
	@Autowired
	private StoreServiceImpl storeService;
	 
	@RequestMapping("login")
	public String login() {
		return "www/main/loginPage1";
	}
	@RequestMapping("test")
	public String test(ProductDto producDto, Model model) {
		List<ProductDto> list = storeService.getItemList(producDto);
		model.addAttribute("list", list);
		return "www/main/test";
	}
	//=================
	
	@RequestMapping("mainPage")
	public String mainPage( ProductDto producDto, Model model) {
		
		List<ProductDto> list = storeService.getItemList(producDto);
		model.addAttribute("list", list);
		
		return"www/main/mainPage";
	}
	
	@RequestMapping("loginPage")
	public String loginPage() {
		return "www/main/loginPage";
	}
	
	@ResponseBody
	@RequestMapping("loginProcess")
	public String loginProcess(HttpSession session, ProductUserDto userDto) {
		ProductUserDto sessionUser = storeService.login(userDto);
		session.setAttribute("sessionUser", sessionUser);
		if(sessionUser !=null) {
			return "1";
		}else {
			return "0";
		}
	}
	
	@RequestMapping("logoutProcess")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:./mainPage";
	}
	
	@RequestMapping("register")
	public String register() {
		return "www/main/register";
	}
	
	@ResponseBody
	@RequestMapping("registerProcess")
	public String registerProcess(AdminDto testDto, String id) {
		boolean exists = storeService.existsUserId(id);
		if(exists == true) {
			return "1"; 
		}else {
			storeService.register(testDto);
			return "0";
		}
	}
	
	// 상품상세보기 페이지
	@RequestMapping("productPage")
	public String productPage(int id, Model model) {
		List<ProductDto> list = storeService.getItemListDetail(id);
		model.addAttribute("detail", list);
		return "www/main/productPage";
	}
	
	@RequestMapping("productProcess")
	public String productProcess(HttpSession session, ProductUserDto std,  ProductDto producDto ,int id, int amount, int count) {
		ProductUserDto sessionUser = (ProductUserDto)session.getAttribute("sessionUser");
		System.out.println(id);
		System.out.println(amount);
		System.out.println(count);
		System.out.println(sessionUser);
		if(sessionUser == null) {
			return "redirect:./loginPage";
		}else {
			session.setAttribute("sessionUser", sessionUser);	
			session.setAttribute("amount", amount);
	        session.setAttribute("count", count);
			return "redirect:./productOrderPage?id=" + id;
		}	
	}
	
	
	// 주문페이지 
	@RequestMapping("productOrderPage")
	public String productOrderPage(int id,  Model model) {
		List<ProductDto> list = storeService.getItemListDetail(id);
		model.addAttribute("detail", list);
		return "www/main/productOrderPage";
	}
	
	// 주문페이지 
	@RequestMapping("productOrderProcess")
	public String productOrderProcess(ProductRecipient recipiDto, ProductOrderItemDto poiDto, ProductOrderDto porDto, ProductDto pDto) {
		storeService.registRecipient(recipiDto);
		storeService.registProductOrder(porDto);
		storeService.registOrderItem(poiDto);
		return "redirect:./mainPage";
	}
	
	
	// 장바구니 페이지
	@RequestMapping("cartPage")
	public String cartPage(int id, Model model) {
		List<ProductUserDto> list = storeService.getCartList(id);
		model.addAttribute("list",list);
		return "www/main/cartPage";
	}
	
	//장바구니 삭제
	@RequestMapping("deleteCartProcess")
	public String deleteCartProcess(ProductCart cartDto, int user_id, int product_id) {
		storeService.deleteCart(cartDto);	
		return "redirect:./cartPage?id="+user_id;
	}
	
	@ResponseBody
	@RequestMapping("cartProcess")
	public String cartProcess(ProductCart cartDto, ProductUserDto Std, HttpSession session) {
		ProductUserDto sessionUser = (ProductUserDto)session.getAttribute("sessionUser");
		if(sessionUser !=null) {
			storeService.registCart(cartDto);
			return "1";
		}else {
			return "0";
		}
	}
	
	//==등록 관련
	@RequestMapping("adminPage")
	public String adminPage() {	
		return "www/main/adminPage";
	}
	
	@RequestMapping("protuctRegist")
	public String protuctRegist() {
		return "www/main/protuctRegist";
	}
	
	@RequestMapping("protuctProcess")
	public String protuctProcess(ProductDto productDto, HttpSession session ) {
		AdminDto sessionUser = (AdminDto)session.getAttribute("sessionUser");
		
		int adminId = sessionUser.getAdmin_id();
		System.out.println(adminId);
		productDto.setAdmin_id(adminId);
		storeService.registerProduct(productDto);
		return "redirect:./loginPage";
	}
	
	@RequestMapping("thumbnail")
	public String thumbnail() {	
		return "www/main/thumbnail";
	}
	
	@ResponseBody
	@RequestMapping("thumbnailProcess")
	public String thumbnailProcess(ProductThumbnailDto params, MultipartFile[] imageFiles) {
	    int totalFiles = imageFiles.length; // 등록된 이미지 파일의 총 개수

	    List<ProductThumbnailDto> thumbnailList = new ArrayList<>();

	    if (totalFiles > 0) {
	        for (int i = 0; i < totalFiles; i++) {
	            MultipartFile multipartFile = imageFiles[i];

	            if (multipartFile.isEmpty()) {
	                continue;
	            }

	            System.out.println("파일명: " + multipartFile.getOriginalFilename());

	            String rootFolder = "C:/uploadFiles/";

	            String saveFileName = multipartFile.getOriginalFilename();

	            try {
	                multipartFile.transferTo(new File(rootFolder + saveFileName));
	            } catch (Exception e) {
	                e.printStackTrace();
	            }

	            ProductThumbnailDto thumbnail = new ProductThumbnailDto();
	            thumbnail.setName(saveFileName);
	            thumbnail.setOrder_list(i);
	            thumbnailList.add(thumbnail);
	        }
	    }

	    storeService.registThumbnail(params, thumbnailList);
	    return "1";
	}
	
	@RequestMapping("type")
	public String type() {
		return "www/main/type";
	}
	
	@RequestMapping("typeProcess")
	public String typeProcess(ProductCategoryTypeDto catyDto) {
		storeService.registerType(catyDto);
		return"www/main/mainPage";
	}
	
}
