<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <link rel="stylesheet" href="../../resources/css/maker_projectRegister.css">

</head>

<body>


	<div id="rewardModal" class="hide">
        <ul>
            <li id="close">X</li>
            <li>리워드 추가</li>
        </ul>
        <ul>
            <li>
                <span>금액</span>
                <input type="text" id="rewardPrice" placeholder="0" value="5000">
                <span class="inputInner">원</span>
            </li>
            <li>
                <span>리워드명</span>
                <input type="text" id="rewardName" placeholder="예시: [얼리버드] 베이지 이불 베개 세트" value="test용 리워드명">
            </li>
            <li>
                <span>리워드 설명</span>
                <input type="text" id="rewardDesc" placeholder="이 리워드의 설명입니다." value="test용 리워드 설명">
            </li>
            <li id="itemList">
                <span>리워드 구성</span>
                <ul>
                    <li>
                        <input type="text" class="itemName" placeholder="구성품1" value="item1">
                        <input type="text" class="itemCount" placeholder="1개" value="1">
                    </li>
                    <li>
                        <input type="text" class="itemName" placeholder="구성품1" value="item2">
                        <input type="text" class="itemCount" placeholder="1개" value="2">
                    </li>
                </ul>
            </li>
            <li id="stockMax">
                <span>최대 재고</span>
                <input type="text" id="stock_max" placeholder="0" value="100">
                <span class="inputInner">개</span>
            </li>
            <li id="buyCount">
                <span>제한 수량</span>
                <input type="text" id="buy_count" placeholder="0" value="5">
                <span class="inputInner">개</span>
            </li>
            <li id="delivery">
                <span>배송비</span>
                <input type="text" class="delivery_price" placeholder="0" value="3000">
                <span class="inputInner">원</span>
                <p>무료배송인 경우 0원을 입력해주세요.</p>
            </li>
            <li id="deliveryFromReward">
                <span>배송 시작일</span>
                <input type="date" id="reward_delivery_from" value="2023-08-05">
            </li>
            <li id="start">
                <span>시작일</span>
                <input type="date" id="start_from" value="2023-07-15">
            </li>
            <li id="closeAt">
                <span>종료일</span>
                <input type="date" id="close_at" value="2023-07-22">
            </li>
            
            <li>
                <span class="close">취소</span>
                <span id="rewardAddBtn">추가</span>
            </li>
        </ul>
    </div>
    <div id="modalBg" class="hide"></div>
    
    <div class="container text-center">
		<!--헤더 영역-->
		<jsp:include page="../../include/fundingHeader.jsp"/>

        <div class="section info">
            <div id="pageName">
                <h3><span>창작자</span>님, 반가워요</h3>
                <p>프로젝트가 성공할 수 있도록 쏘펀이 함께할게요.</p>
            </div>

            <div id="formBox">
                <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data">

                    <div id="projectInfo">

                        <h5>프로젝트 정보</h5>

                        <div id="creatorType">
                            <label>창작자 유형</label>
                            <ul>
                                <li>개인사업자</li>
                                <li class="checked">법인사업자</li>
                            </ul>
                            <ul>
                                <li>사업자 등록번호 (10자리)</li>
                                <li><input type="text" id="biz_no" placeholder="사업자 등록 번호" value="0123456789"></li>
                            </ul>
                        </div>

                        <div id="targetPrice">
                            <label>목표 금액</label>
                            <p class="desc">최소 50만 원 ~ 최대 1억 원 사이에서 설정해 주세요.</p>
                            <div id="targetPriceBox">
                                <input type="text" id="target_price" placeholder="목표 금액을 입력해 주세요." value="1000000">
                                <span>원</span>
                            </div>
                        </div>

                    </div>

                    <div id="basicInfo">

                        <h5>기본 정보</h5>
                        <p>프로젝트를 대표하는 중요한 정보들을 입력해 주세요.</p>

                        <div id="category">
                            <label>카테고리</label>
                            <select id="funding_category_id" name="funding_category_id">
                                <option value="none">카테고리 선택</option>
                                <!-- <option value="1">테크·가전</option> -->
                            </select>
                        </div>

                        <div id="fundingTitle">
                            <label>프로젝트 제목</label>
                            <input type="text" id="projectTitle" placeholder="제목을 입력해 주세요." value="test title">
                            <span>100자 남음</span>
                        </div>

                        <div id="mainImg">
                            <label>대표 이미지</label>
                            <div id="mainThumnailBox">
                                <ul>
                                    <li>&#8226; 3MB 이하의 JPG, JPEG, PNG 파일</li>
                                    <li>&#8226; 이미지 권장 비율 1:1</li>
                                    <li>&#8226; 권장 사이즈 280x280 픽셀</li>
                                    <li>첨부 파일을 업로드해 주세요.</li>
                                </ul>
                                <input type="file" id="mainUrl" accept="image/*">
                            </div>
                        </div>

                        <div id="adultAuth">
                            <label>성인 인증 <span>(선택)</span></label>
                            <p class="desc">19세 이상만 사용할 수 있는 리워드인 경우 체크해 주세요. 체크 시 성인 인증을 완료한 서포터만 해당 프로젝트에 참여할 수 있어요.
                            </p>
                            <div id="targetPriceBox">
                                <input type="checkbox" id="adult_fg" value="1">
                                <span>19세 이상 참여 가능한 리워드예요.</span>
                            </div>
                        </div>

                        <div id="tags">
                            <label>태그</label>
                            <input type="text" id="name" placeholder="엔터를 누르면 최대 10개까지 태그를 입력할 수 있어요." value="test tags">
                            <span>0/10개의 태그</span>
                            <ul id="insertTagList"> 
                                <!-- <li>#친환경<span>X</span></li>
                                <li>#자연친화적<span>X</span></li> -->
                            </ul>
                        </div>

                        <div id="deliveryFrom">
                            <label>배송 시작 예정일</label>
                            <input type="date" id="delivery_from" value="2023-08-05"> 
                        </div>

                    </div>

                    <div id="storyWrite">

                        <h5>스토리 작성</h5>
                        <p>창작자님의 프로젝트를 소개해 주세요.</p>

                        <div id="detailImg">
                            <label>소개 사진 등록</label>
                            <p class="desc">프로젝트의 맨 위에서 가장 먼저 보여 주고 싶은 사진을 등록해 주세요.</p>
                            <div id="detailThumnailBox">
                                <ul>
                                    <li>&#8226; 2MB 이하의 JPG, JPEG, PNG 파일</li>
                                    <li>&#8226; 이미지 권장 비율 1:1.2</li>
                                    <li>&#8226; 권장 사이즈 500x450 픽셀</li>
                                    <li>&#8226; 여러 장 등록할 수 있어요.</li>
                                </ul>
                                <input type="file" id="url" multiple accept="image/*">
                            </div>
                        </div>

                        <div id="fundingDesc">
                            <label>프로젝트 요약</label>
                            <p class="desc">소개 사진과 함께 보이는 글이에요. 프로젝트를 쉽고 간결하게 소개해 주세요.</p>
                            <textarea name="description" id="description" placeholder="내용 입력">test description</textarea>
                            <span>200자 남음</span>
                        </div>

                        <div id="fundingContents">
                            <label>프로젝트 스토리</label>
                            <textarea name="contents" id="contents" placeholder="내용 입력">test contents</textarea>
                        </div>

                    </div>

                    <div id="rewardPlan">

                        <h5>리워드 설계</h5>
                        <p>서포터님들에게 제공할 리워드를 입력해 주세요.</p>

                        <!-- rewardRegisterBtn 클릭시 나타나는 팝업 코드 작성해야함!!!-->

                        <div id="rewardRegisterBtn">
                            <span>+</span>
                            <span>리워드 추가</span>
                        </div>

                        <div id="rewardList">
                            <!-- <ul class="reward">
                                <li>10,000원 <span>제한 수량 1개</span></li>
                                <li class="rewardTitle">리워드 제목</li>
                                <li class="rewardDesc">리워드 설명</li>
                                <li class="rewardItemList">
                                    <ul>
                                        <li>아이템 <span>1</span>개</li>
                                        <li>아이템 <span>2</span>개</li>
                                    </ul>
                                </li>
                                <li class="deliveryPrice"><span>배송비</span> 3,000원</li>
                                <li class="deliveryDate"><span>발송 예정일</span> 2023. 07. 16 일요일 예정</li>
                            </ul>
                            <ul class="reward">
                                <li>10,000원 <span>제한 수량 1개</span></li>
                                <li class="rewardTitle">리워드 제목</li>
                                <li class="rewardDesc">리워드 설명</li>
                                <li class="rewardItemList">
                                    <ul>
                                        <li>아이템 <span>1</span>개</li>
                                        <li>아이템 <span>2</span>개</li>
                                    </ul>
                                </li>
                                <li class="deliveryPrice"><span>배송비</span> 3,000원</li>
                                <li class="deliveryDate"><span>발송 예정일</span> 2023. 07. 16 일요일 예정</li>
                            </ul>
                            <ul class="reward">
                                <li>10,000원 <span>제한 수량 1개</span></li>
                                <li class="rewardTitle">리워드 제목</li>
                                <li class="rewardDesc">리워드 설명</li>
                                <li class="rewardItemList">
                                    <ul>
                                        <li>아이템 <span>1</span>개</li>
                                        <li>아이템 <span>2</span>개</li>
                                    </ul>
                                </li>
                                <li class="deliveryPrice"><span>배송비</span> 3,000원</li>
                                <li class="deliveryDate"><span>발송 예정일</span> 2023. 07. 16 일요일 예정</li>
                            </ul>
                            <ul class="reward">
                                <li>10,000원 <span>제한 수량 1개</span></li>
                                <li class="rewardTitle">리워드 제목</li>
                                <li class="rewardDesc">리워드 설명</li>
                                <li class="rewardItemList">
                                    <ul>
                                        <li>아이템 <span>1</span>개</li>
                                        <li>아이템 <span>2</span>개</li>
                                    </ul>
                                </li>
                                <li class="deliveryPrice"><span>배송비</span> 3,000원</li>
                                <li class="deliveryDate"><span>발송 예정일</span> 2023. 07. 16 일요일 예정</li>
                            </ul> -->
                        </div>
                    </div>

                    <!-- <div id="creatorInfo">
                    <h5>메이커 정보</h5>

                    <div id="creatorName">
                        <label>메이커명</label>
                        <p class="desc">법인 사업자는 법인등기부상 법인명 / 개인 사업자는 주민등록상 성명 또는 상호를 써 주세요.</p>
                        <input type="text" id="creatorName" value="개인회원 닉네임 넣어놓기" placeholder="메이커명 입력">
                    </div>
                </div> -->

                    <div id="creatorInfo">
                        <h5>창작자 정보</h5>

                        <div id="cInfo">
                            <label>창작자 정보</label>
                            <p>창작자 이름</p>
                            <p class="desc">창작자 개인이나 팀을 대표할 수 있는 이름을 써주세요.</p>
                            <input type="text" id="creatorName" value="test name" placeholder="창작자 이름" >

                            <p>창작자 이메일</p>
                            <input type="text" id="creatorEmail" placeholder="창작자 이메일" value="test@gmail.com">

                            <p>창작자 번호</p>
                            <input type="text" id="creatorPhone" placeholder="창작자 번호" value="01000000000">
                        </div>

                        <div id="calculateInfo">
                            <label>계좌 정보</label>
                            <select name="bank_type" id="bank_type">
                                <option value="none">은행 선택</option>
                                <option value="1" selected="selected">신한은행</option>
                                <option value="2">국민은행</option>
                            </select>
                            <input type="text" id="account_no" placeholder="계좌번호'-'없이 숫자만 입력" value="110235789651">
                            <input type="text" id="account_name" placeholder="예금주명" value="김다슬">
                        </div>

                    </div>

                    <input type="button" id="fundingRegisterSubmitBtn" value="등록하기">
                </form>
            </div>
        </div>


    </div>
   	<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp"/>
	    <script src="../../resources/js/maker_projectRegister.js"></script>
</body>
</html>