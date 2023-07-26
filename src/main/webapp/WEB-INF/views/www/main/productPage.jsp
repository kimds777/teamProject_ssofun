<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link href="../../resources/css/productPage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../include/fundingHeader.jsp"/>

	<div class="con">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="prod-image">
						<div class="prod-image__items">
							<c:forEach items="${detail }" var="list">
								<div class="row">
									<div class="col">
										<img src="/ssofunUploadFiles/${list.thumbnail_name}"
											alt="thumb image" class="thumbnail-img"
											style="width: 65px; height: 65px;">
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="zoomed-image-container">
							<img src="" alt="zoomed image" class="zoomed-img">
						</div>
					</div>
				</div>

				<div class="col">
					<c:if test="${not empty detail}">
						<div class="row">
							<div class="col">${detail[0].biz_name}</div>
						</div>

						<div class="row">
							<div class="col">${detail[0].product_name}</div>
						</div>
						
						<div class="row">
							<div class="col-won2">
								<del>
									<fmt:formatNumber value="${detail[0].price}" pattern="#,###원" />
								</del>
							</div>
						</div>
						<div class="row">
							<div class="col-dicount">${Math.floor((detail[0].price - detail[0].price_sale) / detail[0].price * 100).intValue()}%</div>
							<div class="col-won1">
								<fmt:formatNumber value="${detail[0].price_sale}"
									pattern="#,###원" />
							</div>
						</div>

						<div class="row">
							<div class="col-ship">
								<div class="row">
									<div class="col-charge">배송비</div>
									<div class="col-free">무료</div>
								</div>
								<div class="row">
									<div class="col-time">배송예정시간</div>
									<div class="col-day">3일 내 배송</div>
								</div>
							</div>
						</div>

						<div class="row-box">
							<div class="col-Shipping">
								<div class="col-text">
									<img src="../../resources/img/delivery.png"> 배송 과정 중 도로교통
									상황에 따라 부득이하게 지연 배송이 발생될 수 있습니다.
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-pyment">결제금액</div>
							<div class="col"></div>
							<div class="col-last">
								<div class="row">
									<div class="col-pay">
										<span id="amount-display"></span>
									</div>
									<div class="col-but">
										<div class="button">
											<div class="button_quantity">
												<span class="custom-element">
													<button class="prod-quantity__plus"
														onclick="changeQuantity('+')">+</button> 
													<input
													type="text" id="prod-quantity" value="1"
													class="prod-quantity__input" min="1" maxlength="6"
													autocomplete="off" oninput="changeQuantity(this.value)">
													<button class="prod-quantity__minus"
														onclick="changeQuantity('-')">-</button>
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</c:if>
					<div class="row">
						<div class="col">
							<button class="prod-cart-btn" id="cart_btn">
								<i class="bi bi-cart3"></i> 장바구니
							</button>
						</div>
						<div class="col">
							 <form action="./productProcess" method="post">
					            <input type="hidden" name="id" id="productId" value="" />
					            <input type="hidden" name="amount" id="productAmount" value="" />
					            <input type="hidden" name="count" id="productCount" value="" />
					            <input type="hidden" name="user_id" id="userId" value="${sessionUser.user_id }" readonly/>
					            <button class="prod-buy-btn" onclick="setProductValues()">바로구매</button>
					        </form>	
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="box">
    <div class="col-tab">
        <ul class="nav tab-titles">
            <li class="nav-item"><button class="nav-link-btn" onclick="changeTab(0)">필수정보고시</button></li>
            <li class="nav-item"><button class="nav-link-btn" onclick="changeTab(1)">상세설명</button></li>
            <li class="nav-item"><button class="nav-link-btn" onclick="changeTab(2)">상품리뷰</button></li>
            <li class="nav-item"><button class="nav-link-btn" onclick="changeTab(3)">배송,교환,반품안내</button></li>
        </ul>
    </div>
</div>

					
			
			<div class="listbox">
			  <div class="scroll1" id="scroll1">scroll1</div>
			  <div class="scroll2" id="scroll2">scroll2</div>
			  <div class="scroll3" id="scroll3">scroll3</div>
			  <div class="scroll4" id="scroll4">scroll4</div>
			</div>
			




		</div>
	</div>

	<script>
	$(document).ready(function() {
	  // 첫 번째 썸네일 이미지의 경로를 가져옵니다.
	  var firstImageUrl = $('.thumbnail-img:first').attr('src');
	  // 확대 이미지 요소의 소스로 설정합니다.
	  $('.zoomed-img').attr('src', firstImageUrl);
	  // 확대 이미지 컨테이너를 보여줍니다.
	  $('.zoomed-image-container').show();
	  $('.thumbnail-img').hover(
		  function() {
		    var imageUrl = $(this).attr('src');
		    $('.zoomed-img').attr('src', imageUrl);
		    $('.zoomed-image-container').show();
		   }
		 );
	});
	
	// JavaScript 함수 변경: 탭 전환과 컨텐츠 보이기/숨기기
	function changeTab(index) {
	  // 모든 탭 컨텐츠를 숨깁니다.
	  const tabContents = document.querySelectorAll('.listbox > div');
	  tabContents.forEach((content) => {
	    content.style.display = 'none';
	  });

	  // 선택한 탭 컨텐츠만 보여줍니다.
	  const selectedTabContent = document.querySelector(`.listbox > div:nth-child(${index + 1})`);
	  if (selectedTabContent) {
	    selectedTabContent.style.display = 'block';
	  }
	}
	
	// 결제금액 표시
	function changeQuantity(value) {
	    var inputElement = document.getElementById("prod-quantity");
	    var quantity = parseInt(inputElement.value);
	    
	    if (isNaN(quantity)) {
	      quantity = 1;
	    } else {
	      if (value === '+') {
	        quantity += 1;
	      } else if (value === '-' && quantity > 1) {
	        quantity -= 1;
	      }
	    }
	    
	    inputElement.value = quantity;
	    updateAmount(quantity);
	  }
	  
	  function updateAmount(quantity) {
	    var priceElement = document.querySelector("col-pay");
	    var amountDisplay = document.getElementById("amount-display");
	    var price = parseInt("${detail[0].price_sale}");
	    var totalAmount = price * quantity;
	    
	    amountDisplay.innerText = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(totalAmount).replace(/₩|KRW/g, '') + '원';
	  }
	  
	  // 초기화
	  updateAmount(1);
	  
	  //배경 테두리 변경
	  function changeTab(event, index) {
	  //event.preventDefault(); -- 	  
	
	  const clickedTab = event.target.parentElement;
	  const tabs = document.querySelectorAll('.col-tab .tab-titles>li');
	
	  // 현재 'active' 클래스를 가진 탭을 찾아 제거
	  const activeTabs = document.querySelectorAll('.col-tab .tab-titles>li.active');
	  activeTabs.forEach((tab) => {
	    tab.classList.remove('active');
	  });
	
	  // 클릭된 탭에 'active' 클래스 추가
	  clickedTab.classList.add('active');
	}


	// URL에서 id 값을 추출하여 productId input 요소의 value에 설정
	    var url = new URL(window.location.href);
	    var id = url.searchParams.get("id");
	    document.getElementById("productId").value = id;
	
	 // 결제금액, 수량 
	    function setProductValues() {
	        // 결제금액과 수량 값을 가져와서 설정
	        var amountString = document.getElementById("amount-display").innerText;
	        var count = document.getElementById("prod-quantity").value;

	        // amountString을 정수형으로 변환
	        var amount = parseInt(amountString.replace(/[^0-9]/g, "")); // 숫자 이외의 문자 제거 후 정수형으로 변환

	        // 각 hidden input 요소에 값을 설정
	        document.getElementById("productAmount").value = amount;
	        document.getElementById("productCount").value = count;
	    }
	 
	  // 장바구니
		$(document).ready(function(){
			$("#cart_btn").on('click', function() {
				cart();
			})
		});

		function cart(){
			const userId = $("#userId").val();
			const productId = $("#productId").val();
			const count = document.getElementById("prod-quantity").value;
		    $.ajax({
		        url: "cartProcess",
		        method: "POST",
		        data: {
		        	user_id : userId,
		        	product_id : productId,
		        	count : count
		        },
		        success: function(res){
		        	if(res==1){
		        		location.href = 'cartPage'
		        	}
		        	else{
		        		alert("실패");
		        	}
		        },
		        error: function(){
		        	 if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?") == true){ 
		        		   //true는 확인버튼을 눌렀을 때 코드 작성
		        		    location.href = 'loginPage'
		        		   console.log("완료되었습니다.");
		        		 }else{
		        		   // false는 취소버튼을 눌렀을 때, 취소됨
		        		   console.log("취소되었습니다");
		        		 }
		           
		        }
		  	});
		}

</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>