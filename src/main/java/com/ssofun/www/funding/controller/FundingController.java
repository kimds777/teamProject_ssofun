package com.ssofun.www.funding.controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.ssofun.www.funding.dto.DeliveryRecipientDto;
import com.ssofun.www.funding.dto.FundingCategoryDto;
import com.ssofun.www.funding.dto.FundingCommunityDto;
import com.ssofun.www.funding.dto.FundingCommunityReviewAnswerDto;
import com.ssofun.www.funding.dto.FundingCommunityReviewDto;
import com.ssofun.www.funding.dto.FundingDto;
import com.ssofun.www.funding.dto.FundingFavoritDto;
import com.ssofun.www.funding.dto.FundingNewsDto;
import com.ssofun.www.funding.dto.FundingNewsReviewAnswerDto;
import com.ssofun.www.funding.dto.FundingNewsReviewDto;
import com.ssofun.www.funding.dto.FundingOrderDto;
import com.ssofun.www.funding.dto.FundingRewardOrderDto;
import com.ssofun.www.funding.dto.PaymentDto;
import com.ssofun.www.funding.service.FundingServiceImpl;
import com.ssofun.www.user.service.UserServiceImpl;

@Controller
@RequestMapping("www/funding/*")
public class FundingController {

	@Autowired
	private FundingServiceImpl fundingService;
	
//	@Autowired 
//	private UserServiceImpl userService;
//
//	@RequestMapping("fundingMainPage")
//	public String fundingMainPage(HttpSession session, @RequestParam(value = "user_id", required = false, defaultValue = "0") long user_id) {
//		if(user_id != 0) {		
//			System.out.println("user_id: "+user_id);
//			session.setAttribute("user", userService.getUserByUserId(user_id));
//		}
//		return "www/funding/fundingMainPage";
//	}
	
	@RequestMapping("fundingMainPage")
	public String fundingMainPage() {
		return "www/funding/fundingMainPage";
	}
	
	//펀딩 메인페이지 달성률 높은순으로 8개 출력
	@ResponseBody
	@RequestMapping("AJAXgetFundingOrderByAchievementRate")
	public List<FundingDto> AJAXgetFundingOrderByAchievementRate(){
		return fundingService.getFundingOrderByAchievementRate();
	}


	@ResponseBody
	@RequestMapping("AJAXgetFundingAchievementRate")
	public int AJAXgetFundingAchievementRate(long funding_id) {
		return fundingService.getFundingAchievementRate(funding_id);
	}
	
	@ResponseBody
	@RequestMapping("AJAXgetFundingOrderByCreatedAt")
	public List<FundingDto> AJAXgetFundingOrderByCreatedAt() {
		return fundingService.getFundingOrderByCreatedAt();
	}
	
	
	

//	펀딩 리스트 페이지 ----------------------------------------------------------------------------------------

	@RequestMapping("fundingListPage")
	public String fundingListPage() {
		return "www/funding/fundingListPage";
	}

	@RequestMapping("categoryFundingListPage")
	public String categoryFundingListPage(Model model, int funding_category_id) {
		model.addAttribute("funding_category_id", funding_category_id);
		return "www/funding/categoryFundingListPage";
	}

	@ResponseBody
	@RequestMapping("getCategoryListAjax")
	public List<FundingCategoryDto> getCategoryListAjax() {
		return fundingService.selectAllFundingCategory();
	}

	@ResponseBody
	@RequestMapping("getFundingListAjax")
	public List<FundingDto> getFundingListAjax(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "funding_category_id", defaultValue = "1") long funding_category_id) {
		return fundingService.selectAllFunding(pageNum, funding_category_id);
	}

	@ResponseBody
	@RequestMapping("getPageListAjax")
	public int[] getPageListAjax(@RequestParam(value = "clickNum", defaultValue = "1") int clickNum,
			@RequestParam(value = "funding_category_id", defaultValue = "1") long funding_category_id) {
		int[] pageList = fundingService.selectPageNumList(clickNum, funding_category_id);
		return pageList;
	}

	@ResponseBody
	@RequestMapping("getMaxPageNumAjax")
	public int getMaxPageNumAjax(
			@RequestParam(value = "funding_category_id", defaultValue = "1") long funding_category_id) {
		return fundingService.selectCountPage(funding_category_id);
	}

	@ResponseBody
	@RequestMapping(value = "getPageNameAjax", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	public String getPageNameAjax(
			@RequestParam(value = "funding_category_id", defaultValue = "1") long funding_category_id) {
		System.out.println(fundingService.selectCategoryNameByCateId(funding_category_id));
		return fundingService.selectCategoryNameByCateId(funding_category_id);
	}

//	상세 소개 페이지 ----------------------------------------------------------------------------------------

	@RequestMapping("fundingDetailPage")
	public String fundingDetailPage(Model model, long funding_id) {
		model.addAttribute("funding_id", funding_id);
		return "www/funding/fundingDetailPage";
	}

	//펀딩 상세 정보 조회
	@ResponseBody
	@RequestMapping("getFundingDtoAjax")
	public FundingDto getFundingDtoAjax(long funding_id) {
		FundingDto fundingDto = fundingService.selectFunding(funding_id);
		
		return fundingDto;
	}
	
	//섬네일 갯수 조회
	@ResponseBody
	@RequestMapping("AJAXgetDetailThumbnailCount")
	public int AJAXgetDetailThumbnailCount(@RequestParam("funding_id") long funding_id) {
		return fundingService.getDetailThumbnailCount(funding_id);
	}
	
	//후원자 수 조회
	@ResponseBody
	@RequestMapping("AJAXgetSupportCount")
	public int AJAXgetSupportCount(long funding_id) {

		return fundingService.getSupportCount(funding_id);
	}

//	상세 상세 공지 페이지 -----------------------------------------------------------------------------------------------------

	@RequestMapping("fundingDetailNoticeListPage")
	public String fundingDetailNoticeListPage(Model model, long funding_id) {
		model.addAttribute("funding_id", funding_id);
		return "www/funding/fundingDetailNoticeListPage";
	}

	@RequestMapping("fundingDetailNoticePage")
	public String fundingDetailNoticePage(Model model, long funding_notice_id, long funding_id) {
		model.addAttribute("funding_id", funding_id);
		model.addAttribute("funding_notice_id", funding_notice_id);
		return "www/funding/fundingDetailNoticePage";
	}

	@ResponseBody
	@RequestMapping("getFundingNewsDtoAjax")
	public FundingNewsDto getFundingNewsDtoAjax(Model model, long funding_notice_id) {
		model.addAttribute("funding_notice_id", funding_notice_id);
		return fundingService.selectFundingNews(funding_notice_id);
	}

	@ResponseBody
	@RequestMapping("insertNewsCommentAjax")
	public int insertNewsCommentAjax(FundingNewsReviewDto params, long user_id) {
		return fundingService.insertNewsComment(params, user_id);
	}

	@ResponseBody
	@RequestMapping("insertNewsCommentReplyAjax")
	public int insertNewsCommentReplyAjax(FundingNewsReviewAnswerDto params, long user_id, long funding_notice_id) {
		System.out.println(params.getThis_answer_id());
		System.out.println(funding_notice_id);
		System.out.println(user_id);
		return fundingService.insertNewsReply(params, user_id, funding_notice_id);
	}

//	상세 커뮤니티 페이지

	@RequestMapping("fundingDetailCommunityPage")
	public String fundingDetailCommunityPage(Model model, long funding_id, long funding_review_id) {
		model.addAttribute("funding_id", funding_id);
		model.addAttribute("funding_review_id", funding_review_id);
		return "www/funding/fundingDetailCommunityPage";
	}

	@RequestMapping("fundingDetailCommunityListPage")
	public String fundingDetailCommunityListPage(Model model, long funding_id) {
		model.addAttribute("funding_id", funding_id);
		return "www/funding/fundingDetailCommunityListPage";
	}

	// 커뮤니티 상세
	@ResponseBody
	@RequestMapping("getFundingCommunityAjax")
	public FundingCommunityDto getFundingCommunityAjax(long funding_review_id) {

		return fundingService.selectCommunity(funding_review_id);
	}

	@ResponseBody
	@RequestMapping("insertReviewAjax")
	public int insertReviewAjax(long funding_id, long user_id, String contents) {
		return fundingService.insertReview(funding_id, user_id, contents);
	}

	@ResponseBody
	@RequestMapping("AJAXinsertCommunityComment")
	public int AJAXinsertCommunityComment(long funding_id, FundingCommunityReviewDto params, long user_id) {
		return fundingService.insertCommunityComment(funding_id, params, user_id);
	}

	@ResponseBody
	@RequestMapping("AJAXinsertCommunityCommentReply")
	public int AJAXinsertCommunityCommentReply(long funding_id, FundingCommunityReviewAnswerDto params, long user_id) {
		return fundingService.insertCommunityCommentReply(funding_id, params, user_id);
	}

	@ResponseBody
	@RequestMapping("AJAXinsertFavorit")
	public int AJAXinsertFavorit(FundingFavoritDto params) {
		return fundingService.insertFavorit(params);
	}

	@ResponseBody
	@RequestMapping("AJAXgetCountFavorit")
	public int AJAXgetCountFavorit(long funding_id) {
		return fundingService.selectCountFavorit(funding_id);
	}

	@ResponseBody
	@RequestMapping("AJAXdeleteFavorit")
	public int AJAXdeleteFavorit(FundingFavoritDto params) {
		return fundingService.deleteFavorit(params);
	}

//	결제 페이지  ----------------------------------------------------------------------------------------

	@RequestMapping("fundingRewardChoicePage")
	public String fundingRewardChoicePage() {
		return "www/funding/fundingRewardChoicePage";
	}

	@RequestMapping("fundingRewardPaymentPage")
	public String fundingRewardPaymentPage() {
		return "www/funding/fundingRewardPaymentPage";
	}
	
	@ResponseBody
	@RequestMapping("AJAXgetRewardPaymentCount")
	public int AJAXgetRewardPaymentCount(long funding_reward_id) {
		return fundingService.getRewardPaymentCount(funding_reward_id);
	}

	@ResponseBody
	@RequestMapping(value = "AJAXinsertFundingOrder", method = RequestMethod.POST, consumes = "application/json;")
	public long AJAXinsertFundingOrder(@RequestBody FundingOrderDto fundingOrderDto) {
		return fundingService.insertOrder(fundingOrderDto);
	}

	@ResponseBody
	@RequestMapping("AJAXgetPaymentBeforeFundingOrder")
	public FundingOrderDto AJAXgetPaymentBeforeFundingOrder(long funding_order_id) {

		return fundingService.getPaymentBeforeFundingOrder(funding_order_id);
	}

	// 콜백 수신 처리
	@RequestMapping("AJAXcallback_receive")
	public ResponseEntity<?> AJAXcallback_receive(@RequestBody Map<String, Object> model) {

		String process_result = "결제성공!";

		// 응답 header 생성
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
		JSONObject responseObj = new JSONObject();

		try {
			String imp_uid = (String) model.get("imp_uid");
			String merchant_uid = (String) model.get("merchant_uid");
			boolean success = (Boolean) model.get("success");
			String error_msg = (String) model.get("error_msg");

			System.out.println("----callback receive----");
			System.out.println("------------------------");
			System.out.println("imp_uid : " + imp_uid);
			System.out.println("merchant_uid : " + merchant_uid);
			System.out.println("success : " + success);

			if (success == true) {
				String api_key = "2607570622351351";
				String api_secret = "SAuHwM5ScWi0wXn6C90YtPytOKaJ5EuXmhKJK8T02SyAq1waZvKQKoDc2FLYSFxi9AkpAxAxgQ6vkvUW";

				IamportClient ic = new IamportClient(api_key, api_secret);
				IamportResponse<Payment> response = ic.paymentByImpUid(imp_uid);

				BigDecimal iamport_amount = response.getResponse().getAmount();

				responseObj.put("process_result", "결제성공");

			} else {
				System.out.println("error_msg : " + error_msg);
				responseObj.put("process_result", "결제실패 : " + error_msg);
			}
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.put("process_result", "결제실패 : 관리자에게 문의해 주세요");
		}
		return new ResponseEntity<String>(responseObj.toString(), responseHeaders, HttpStatus.OK);
	}

	// 웹혹 수신 처리
//	@RequestMapping("AJAXwebhook_receive")
//	public ResponseEntity<?> AJAXwebhook_receive(Model respone, @RequestBody Map<String, Object> model) throws Exception {
//
//		//service로 옮겨놓기
//		// 응답 header 생성
//		HttpHeaders responseHeaders = new HttpHeaders();
//		responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
//
//		try {
//			String imp_uid = (String) model.get("imp_uid");
//			String merchant_uid = (String) model.get("merchant_uid");
//			String status = (String) model.get("status");
//
//			System.out.println("----webhook receive----");
//			System.out.println("------------------------");
//			System.out.println("imp_uid : " + imp_uid);
//			System.out.println("merchant_uid : " + merchant_uid);
//			System.out.println("status : " + status);
//
//			String api_key = "2607570622351351";
//			String api_secret = "SAuHwM5ScWi0wXn6C90YtPytOKaJ5EuXmhKJK8T02SyAq1waZvKQKoDc2FLYSFxi9AkpAxAxgQ6vkvUW";
//
//			IamportClient ic = new IamportClient(api_key, api_secret);
//			IamportResponse<Payment> response = ic.paymentByImpUid(imp_uid);
//
//			BigDecimal iamport_amount = response.getResponse().getAmount();
//
//			// REST API를 통해 토큰 얻기
//			try {
//				URL url = new URL("https://api.iamport.kr/users/getToken");
//				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//				conn.setRequestMethod("POST");
//				conn.setDoOutput(true);
//				String requestBody = "{\"imp_key\": \"" + api_key + "\", \"imp_secret\": \"" + api_secret + "\"}";
//				conn.setRequestProperty("Content-Type", "application/json");
//				DataOutputStream wr = new DataOutputStream(conn.getOutputStream());
//				wr.writeBytes(requestBody);
//				wr.flush();
//				wr.close();
//				int responseCode = conn.getResponseCode();
//				System.out.println("응답 코드: " + responseCode);
//				BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//				String inputLine;
//				JSONObject jsonObject = null;
//				StringBuilder respon = new StringBuilder();
//				while ((inputLine = in.readLine()) != null) {
//					respon.append(inputLine);
//					jsonObject = new JSONObject(inputLine);
//				}
//				in.close();
//				System.out.println("응답: " + respon.toString());
//
//				Map<String, Object> map = new HashMap<>();
//
//				for (String key : jsonObject.keySet()) {
//					map.put(key, jsonObject.get(key));
//				}
//				
//				Map<String, Object> responseMap = new HashMap<>();
//				JSONObject responseObject = (JSONObject) map.get("response");
//				for(String key : responseObject.keySet()) {
//					responseMap.put(key, responseObject.get(key));
//				}
//				
//				String token = (String) responseMap.get("access_token");
//				respone.addAttribute(token);
//
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//
//		} catch (IOException e) {
//			e.printStackTrace();
////			return new ResponseEntity(new CustomerErrorType("서버호출"), HttpStatus.INTERNAL_SERVER_ERROR);
//			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//		}
//
//		return new ResponseEntity<String>("결과반영 성공", responseHeaders, HttpStatus.OK);
//	}
	
	@ResponseBody
	@RequestMapping("AJAXinsertPayment")
	public long AJAXinsertPayment(PaymentDto params) { //PaymentDto에 담아도됨	
		long payment_id = fundingService.insertPayment(params); 

		return payment_id;
	}
	
	@ResponseBody
	@RequestMapping("AJAXinsertOrderPayment")
	public int AJAXinsertOrderPayment(long payment_id, long funding_order_id) {
		return fundingService.insertOrderPayment(payment_id,funding_order_id);
	}
	
	@ResponseBody 
	@RequestMapping("AJAXinsertDeliveryRecipient")
	public long AJAXinsertDeliveryRecipient(DeliveryRecipientDto params) {	
		System.out.println(params.getName());
		return fundingService.insertDeliveryRecipient(params);
	}
	
	@ResponseBody
	@RequestMapping("AJAXupdateFundingRewardOrder")
	public int AJAXupdateFundingRewardOrder(@RequestParam(value = "funding_order_id") long funding_order_id,
			@RequestBody FundingRewardOrderDto params) {
		return fundingService.updateFundingRewardOrder(funding_order_id, params);
	}

	@ResponseBody
	@RequestMapping("AJAXupdateFundingOrder")
	public int AJAXupdateFundingOrder(@RequestParam(value = "funding_order_id") long funding_order_id,
			@RequestBody FundingOrderDto params) {

		System.out.println(params.getUsed_fg() + " " + params.getFunding_order_status_id() + " " + funding_order_id);
		return fundingService.updateFundingOrder(funding_order_id, params);
	}

	@RequestMapping("fundingCompletePaymentPage")
	public String fundingCompletePaymentPage() {
		return "www/funding/fundingCompletePaymentPage";
	}

	@ResponseBody
	@RequestMapping("AJAXgetFundingOrder")
	public FundingOrderDto AJAXgetFundingOrder(long funding_order_id) {
		return fundingService.selectFundingOrder(funding_order_id);
	}
	


}
