# 📁 Spring_Project_ssofun
스프링 + JSP 파싱_펀딩 사이트
## 💻 프로젝트 소개
펀딩과 쇼핑몰이 결합된 사이트로 회원이 프로젝트에 참여하거나 창작자로 전환하여 프로젝트를 진행할 수 있습니다. <br>
회원은 진행중인 펀딩 커뮤니티에 게시글과 댓글을 통해, 창작자는 펀딩 공지사항을 통해 회원과 소통할 수 있습니다. <br>
또한 찜 기능을 사용하여 관심있는 펀딩을 저장할 수 있으며, 이는 회원 마이페이지에서 확인이 가능합니다.<br>
회원은 마이페이지에서 창작자로 전환이 가능하며, 창작자는 진행중인 펀딩 등록 및 진행중인 펀딩 관리가 가능합니다. 
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

## 📌 주요 기능
#### [공통영역] 로그인
- DB값 검증
- 카카오 API 연동
- 로그인 성공시 세션 생성

#### [공통영역] 회원가입
- 카카오 API 연동
- 이메일/닉네임 DB값 검증
- 회원정보 입력

#### [공통영역] SNS가입
- 회원정보 출력 및 변경

#### [공통영역] 회원가입 완료
- 회원정보 출력

#### [공통영역] SNS가입
- 회원정보 출력 및 변경

#### [펀딩-회원] 메인
- 리스트 출력(달성률 + 최신 등록순)
- 펀딩 달성률 출력

#### [펀딩-회원] 목록
- 카테고리 출력
- 리스트 출력(최신 등록순)
- 펀딩 달성률 출력
- 페이징 처리

#### [펀딩-회원] 상세
- 섬네일 리스트 출력
- 펀딩 정보 출력
- 리워드 리스트 출력
- 추천 펀딩 리스트 출력
- 공지사항 + 커뮤니티 리스트 및 댓글 리스트 출력
- 공지사항 + 커뮤니티 댓글, 대댓글 입력 
- 리워드 선택
- 좋아요 등록, 출력, 수정 (CRU)
  
#### [펀딩-회원] 리워드 선택
- 펀딩 정보 출력
- 리워드 리스트 출력
- 리워드 선택 및 제한 수량 유효성 검사
- 리워드 선택 정보 입력

#### [펀딩-회원] 결제
- 선택된 리워드 정보 출력
- 서포터 정보 출력 및 입력
- 배송지 등록, 출력, 수정 (CRU) 
- 다음 우편번호 API 연동
- 아임포트 결제 API 연동

#### [펀딩-회원] 결제 완료
- 결제된 리워드 정보 출력

#### [펀딩-창작자] 마이페이지
- 등록한 펀딩 리스트 출력
- 세션 유무 체크

#### [펀딩-창작자] 프로젝트 등록
- 창작자 정보 유무 체크
- 세션 유무 체크
- TinyMCE 에디터 API 연동
- 펀딩 정보 입력

#### [펀딩-창작자] 펀딩관리 > 프로젝트
- 세션 유무 체크
- 펀딩 등록 정보 출력

#### [펀딩-창작자] 펀딩관리 > 주문내역
- 세션 유무 체크
- 주문 상태별 주문건 출력
- 주문 리스트 출력
- 주문 발주 및 배송사 입력
- 페이징 처리

#### [펀딩-창작자] 펀딩관리 > 대시보드
- 세션 유무 체크
- 펀딩 현황(달성금액+달성률+후원자수+잔여일) 출력
- Chart.js API 연동
- 후원자 성별 및 연령 리스트 출력
- 일별 주문 금액 및 누적 금액 출력

#### [펀딩-창작자] 펀딩관리 > 공지사항
- 세션 유무 체크
- 공지사항 등록, 수정, 삭제 (CRU)
- 댓글 수 출력

#### [펀딩-창작자] 펀딩관리 > 커뮤니티
- 세션 유무 체크
- 리스트 출력
- 답변 유무 체크
- 답변 등록
