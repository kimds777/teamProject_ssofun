     
<p align="center">
<a href="https://hits.seeyoufarm.com"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fkimds777%2FteamProject_ssofun&count_bg=%23FF7C7C&title_bg=%23454545&icon=&icon_color=%23E5E5E5&title=hits&edge_flat=false"/></a>
</p>
<p align="center">
<img width="800px" src="https://capsule-render.vercel.app/api?type=venom&color=eb412a&height=300&section=header&text=SSOFUN&fontSize=120&fontColor=ffffff&stroke=eb412a&strokeWidth=1.5" />
</p>

<!--# 📁 Spring_Project_ssofun  
스프링 + JSP 파싱_펀딩 사이트-->
<br><br>
## 💻 프로젝트 소개  
펀딩과 쇼핑몰이 결합된 사이트로 회원이 프로젝트에 참여하거나 창작자로 전환하여 프로젝트를 진행할 수 있습니다. <br>
회원은 진행중인 펀딩 커뮤니티에 게시글과 댓글을 통해, 창작자는 펀딩 공지사항을 통해 회원과 소통할 수 있습니다. <br>
또한 찜 기능을 사용하여 관심있는 펀딩을 저장할 수 있으며, 이는 회원 마이페이지에서 확인이 가능합니다.<br>
회원은 마이페이지에서 창작자로 전환이 가능하며, 창작자는 진행중인 펀딩 등록 및 진행중인 펀딩 관리가 가능합니다.  
<br><br>
## ERD 👉 https://www.erdcloud.com/d/PKWS9RjckaTMbHAE9
<br>
<p align="center">
  <img width="800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/b3db3fa6-f4ca-4f6f-9a57-c7d3010efc3a">
</p>
<br><br>

## 📅 프로젝트 기간
* 2023.06.19 - 08.03 👉 총 34일
### 👯 역할 분담
* [팀장] 김다슬

  - [x] 공통영역 👉 Header, Footer, 로그인(회원+관리자), 회원가입(SNS+이메일), SNS가입, 회원가입 완료

  - [x] 펀딩-회원 👉 메인, 목록, 상세, 리워드선택, 결제, 결제완료, 마이페이지(찜한 펀딩+후원한 펀딩)

  - [x] 펀딩-창작자 👉 마이페이지, 프로젝트 등록, 펀딩관리(프로젝트+주문내역+대시보드+공지사항+커뮤니티)
### ⚙️ 개발 환경
 * `Java 11`
 * `JDK 11.0.19`
 * **IDE** `STS 3.9`
 * **Framework** `Spring Suite 3`
 * **Database** `MySql`
 * **ORM** `Mybatis`

### ✨ Skills
- FE : HTML, CSS, jQuery, JavaScript
- BE : Java, Spring MVC, Git
- DB : MySQL DB
<br><br>

## 📌 주요 기능
### [공통영역] 로그인
- DB값 검증
- 카카오 API 연동
- 로그인 성공시 세션 생성

<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/404ed75a-b0b4-4218-95d7-8aa72956f027">
</p>
</kbd>
<br><br><br>

### [공통영역] 회원가입
- 카카오 API 연동
- 이메일/닉네임 DB값 검증
- 회원정보 입력

<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/64a33cd0-7d97-459f-9cee-618dbdbfaabc">
</p>
</kbd>
<br><br><br>

### [공통영역] SNS가입
- 회원정보 출력 및 변경
<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/7e09e2ed-ff5e-4b19-9b07-0b601e0d0560">
</p>
</kbd>
<br><br><br>

### [공통영역] 회원가입 완료
- 회원정보 출력
<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/c559b963-c10e-4f33-bb78-a331823b8dd6">
</p>
</kbd>
<br><br><br>

### [펀딩-회원] 메인
- 리스트 출력(달성률 + 최신 등록순)
- 펀딩 달성률 출력
<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/8b8b6297-a846-4b76-a228-74734c41c928">
</p>
</kbd>
<br><br><br>

### [펀딩-회원] 목록
- 카테고리 출력
- 리스트 출력(최신 등록순)
- 펀딩 달성률 출력
- 페이징 처리
<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/30294539-282a-457c-a75b-5e32b25f6906">
</p>
</kbd>
<br><br><br>

### [펀딩-회원] 상세
- 섬네일 리스트 출력
- 펀딩 정보 출력
- 좋아요 등록, 출력, 수정 (CRU)
- 리워드 선택
<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/96c68330-d42a-4f08-bdc9-ee1862671f4d">
</p>
</kbd>
<br><br><br>

- 리워드 리스트 출력
- 추천 펀딩 리스트 출력
  
<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/874a22f2-e200-4775-a3f2-d2a831825f7f">
</p>
</kbd>
<br><br><br>

- 공지사항 + 커뮤니티 리스트 및 댓글 리스트 출력
- 공지사항 + 커뮤니티 댓글, 대댓글 입력 

<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/1552b55a-eeb2-4552-842e-46773a573763">
</p>
</kbd>
<kbd><br>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/17d4f82a-5750-421a-b6f5-9b0e183fe46f">
</p>
</kbd>
<br><br><br>

### [펀딩-회원] 리워드 선택
- 펀딩 정보 출력
- 리워드 리스트 출력
- 리워드 선택 및 제한 수량 유효성 검사
- 리워드 선택 정보 입력

<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/3fb7b3ba-0e4e-4dbc-9dd2-97ffd5a8b835">
</p>
</kbd>
<br><br><br>

### [펀딩-회원] 결제
- 선택된 리워드 정보 출력
- 서포터 정보 출력 및 입력
  
<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/6e886e62-108f-49ce-afb5-0d83c65f35d2">
</p>
</kbd>
<br><br>

- 배송지 등록, 출력, 수정 (CRU) 
- 다음 우편번호 API 연동

<kbd>
<p align="center">
  <img width = 300px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/c1432fde-6ad1-4772-831b-0a46e4490036">
  <img width = 300px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/97c6812f-ff78-411b-b9ec-a8a5c68bc7b8">
  <img width = 300px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/22416e23-a2ad-463c-a3b7-a9104f76a48b">
</p>
</kbd>
<br><br>

- 아임포트 결제 API 연동
<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/6449e6a3-0f49-4491-9810-9bd9dbfe7b5b">
</p>
</kbd>
<br><br><br>

### [펀딩-회원] 결제 완료
- 결제된 리워드 정보 출력
<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/993e97f5-de76-41bc-a7ee-b3c4a437e4d6">
</p>
</kbd>
<br><br><br>

### [펀딩-회원] 마이페이지
- 후원한 프로젝트 + 찜한 프로젝트 리스트 출력
- 세션 유무 체크
<kbd>
<span>
  <img width = 450px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/9d0c543d-9168-4494-860a-2b1c34d79675">
</span>
</kbd>
<kbd>
<span>
  <img width = 450px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/256a1a38-b0e0-402d-a7b1-37cc218a7275">
</span>
</kbd>
<br><br><br>

### [펀딩-창작자] 마이페이지
- 등록한 펀딩 리스트 출력
- 세션 유무 체크
  
<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/a292ee1c-ddef-4664-80a6-b8c77401409e">
</p>
</kbd>
<br><br><br>
  
### [펀딩-창작자] 프로젝트 등록
- 창작자 정보 유무 체크
- 세션 유무 체크
- TinyMCE 에디터 API 연동
- 펀딩 정보 입력 (섬네일 + 리워드 +  창작자 정보 + 계좌정보)
  
<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/c1a012f4-ccb7-439a-a438-3e301f6df56a">
</p>
</kbd><br><br>
<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/980cba8c-a72f-485d-9b53-88934e726efe">
</p>
</kbd><br><br>
<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/c9ca8204-79b1-46cf-9a2c-e5514a4b0cf3">
</p>
</kbd><br><br>
<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/ec58ad52-4627-4f68-8268-12b6d68ff5a6">
</p>
</kbd>
<br><br><br>

### [펀딩-창작자] 펀딩관리 > 프로젝트
- 세션 유무 체크
- 펀딩 등록 정보 출력
  
<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/584f81a5-fb7c-4229-b5aa-dde2bd7d9e1a">
</p>
</kbd><br><br><br>

### [펀딩-창작자] 펀딩관리 > 주문내역
- 세션 유무 체크
- 주문 상태별 주문건 출력
- 주문 리스트 출력
- 주문 발주 및 배송사 입력
- 페이징 처리

<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/294714ee-18f6-45df-92fa-d816ed884fa5">
</p>
</kbd><br><br><br>

### [펀딩-창작자] 펀딩관리 > 대시보드
- 세션 유무 체크
- 펀딩 현황(달성금액+달성률+후원자수+잔여일) 출력
- Chart.js API 연동
- 후원자 성별 및 연령 리스트 출력
- 일별 주문 금액 및 누적 금액 출력

<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/2db53ce2-9683-4edf-b9b4-baade8dd0fd7">
</p>
</kbd><br><br><br>

### [펀딩-창작자] 펀딩관리 > 공지사항
- 세션 유무 체크
- 공지사항 등록, 수정, 삭제 (CRU)
- 댓글 수 출력

<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/af6344a9-199a-4431-a94b-71906cd4d5b9">
</p>
</kbd><br><br>
<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/79390f3e-4acf-40a8-975a-e5b70ccea894">
</p>
</kbd><br><br><br>

#### [펀딩-창작자] 펀딩관리 > 커뮤니티
- 세션 유무 체크
- 리스트 출력
- 답변 유무 체크
- 답변 등록

<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/65a27827-7e1c-483e-9575-9d042910898b">
</p>
</kbd><br><br>
<kbd>
<p align="center">
  <img width = 800px" src="https://github.com/kimds777/teamProject_ssofun/assets/77198242/c29252e4-562a-4b6a-a7ae-9f89a27c27cc">
</p>
</kbd><br><br><br>
