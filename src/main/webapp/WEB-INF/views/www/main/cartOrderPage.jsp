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
<link href="../../resources/css/productOrder.css" rel="stylesheet"	type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Document</title>
</head>
<body>
	<jsp:include page="../../include/fundingHeader.jsp"/>
	
	 <div class="container">
       <div class="row">
        <div class="col"></div>
        <div class="col">
            <div class="row">
                <div class="col-title">주문</div>
            </div>
            <div class="row">
                <div class="col-contents"><hr>
                <div class="row">
                    <div class="col-customer">
                        <h2 class="customer-h2">구매자정보</h2>
                        <table class="customer-table">
                            <tobody>
                                <tr>
                                    <td class="customer-td1">이름</td>
                                    <td class="customer-td2">${sessionUser.nickname }</td>
                                </tr>
                            </tobody>
                        </table>
                    </div>
                </div>

				<form action="./cartOrderProcess" method="post">
                <div class="row">
                    <div class="col-customer">
                        <h2 class="delivery-address-h2">받는사람 정보</h2>
                        <table class="customer-table">
                            
                                <tr>
                                    <td class="customer-td1">이름</td>
                                    <td class="customer-td2">
                                        <input type="text" name="name" placeholder="이름">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="customer-td1">연락처</td>
                                    <td class="customer-td2">
                                        <input type="text" name="phone" placeholder="연락처">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="customer-td1">우편번호</td>
                                    <td class="customer-td2">
                                        <input type="text" name="address_post" id="address_post" placeholder="우편번호">
                                        <input type="button" onclick="address_input()" value="우편번호 찾기">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="customer-td1">기본주소</td>
                                    <td class="customer-td2">
                                        <input type="text" name="address_default" id="address_default" placeholder="기본주소">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="customer-td1">상세주소</td>
                                    <td class="customer-td2">
                                        <input type="text" name="address_detail" id="address_detail" placeholder="상세주소">
                                        <input type="text" id="sample6_extraAddress" placeholder="참고항목">
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="customer-td1">배송 요청사항</td>
                                    <td class="customer-td2">
                                        <input type="text" name="request_message" placeholder="배송 요청사항">
                                    </td>
                                </tr>
                            
                        </table>
                    </div>
                </div>
                
                <div class="row">
                	<div class="col-customer">
                		 <h2 class="customer-h2">배송상품</h2>
                		 	<c:forEach items="${list}" var="item" >
	                		<c:if test="${not empty item}">                       
	                        <table class="customer-table">
	                                <tr>
	                                    <td class="customer-td1">상품명</td>
	                                    <td class="pname-td2">${item.product_name}</td>
	                                     <td class="customer-td1">수량</td>
	                                    <td class="pcount-td2">${item.total_count }개</td>
	                                </tr>
	                		</table>
	                		</c:if>
	                		</c:forEach>                  		                	             		         
                	</div>
                </div>           
                
                
                <div class="row">
                    <div class="col-customer">
                    	<c:if test="${not empty list}">
                        <h2 class="customer-h2">결제정보</h2>
                        <table class="customer-table">
                               
                                <tr>
                                    <td class="customer-td1">총삼품가격</td>
                                    <td class="customer-td2"><fmt:formatNumber value="${amount}" pattern="#,###" />원</td>
                                </tr>

                                <tr>
                                    <td class="customer-td1">배송비</td>
                                    <td class="customer-td2">0원</td>
                                </tr>

                                <tr>
                                    <td class="customer-td1">총결제금액</td>
                                    <td class="customer-td2"><fmt:formatNumber value="${amount}" pattern="#,###" />원</td>
                                </tr>
                        </table>
                        </c:if>
                    </div>
                </div>
                
                
                
                <div class="row">
                    <div class="col-agreebtn">
	                    <input type="hidden" name="amount" value="${amount}" readonly/>						
						 <c:forEach items="${list}" var="item">
					        <input type="hidden" name="product_id" value="${item.product_id}" />
					        <input type="hidden" name="count" value="${item.total_count}" readonly/>
					    </c:forEach>
					    <input type="hidden" name="order_number" id="orderNumberInput" readonly/>												
                        <button class="prod-buy-btn">구매하기</button>            
                    </div>
                </div>
                </form>                
                
                </div>
            </div>
        </div>
        <div class="col"></div>
       </div>
    </div>
    
<script>    
    
//주문번호 생성 함수
function generateOrderNumber() {
    // 현재 날짜 및 시간을 기반으로 주문번호 생성
    var now = new Date();
    var year = now.getFullYear().toString().substr(-2); // 뒤의 두 자리만 사용 (예: 2023 -> 23)
    var month = (now.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 1을 더함
    var date = now.getDate().toString().padStart(2, '0');
    var hours = now.getHours().toString().padStart(2, '0');
    var minutes = now.getMinutes().toString().padStart(2, '0');
    var seconds = now.getSeconds().toString().padStart(2, '0');

    // 랜덤한 6자리 숫자 생성
    var randomNumber = Math.floor(Math.random() * 1000000).toString().padStart(6, '0');

    // 주문번호 형식: 년월일시분초_랜덤숫자 (예: 230719161234_123456)
    var orderNumber = year + month + date + hours + minutes + seconds + '_' + randomNumber;
    return orderNumber;
}

// 주문번호를 생성하여 input 요소에 설정
document.getElementById("orderNumberInput").value = generateOrderNumber();

    //주소 입력 api
    function address_input() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('address_post').value = data.zonecode;
                document.getElementById("address_default").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address_detail").focus();
            }
        }).open();
    }
    

</script>
    
    
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>