<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-2">테스트 로그인 상태</div>
	<div class="col-2">user: ${empty user ? "X" : user.nickname }</div>
	<div class="col-2">shopAdmin: ${empty shopAdmin ? "X" : shopAdmin.login_account }</div>
	<div class="col-2">systemAdmin: ${empty systemAdmin ? "X" : systemAdmin.login_account }</div>
</div>
<div class="row">
	<div class="col-2 text-center fw-bold fs-5">SSOFUN<br>사이트 관리</div>
	<div class="col-1 text-center fw-bold">홈</div>
	<div class="col-1 text-center fw-bold">업체관리</div>
	<div class="col-1 text-center fw-bold">회원관리</div>
	<div class="col-1 text-center fw-bold">사이트 관리</div>
	<div class="col-1 text-center fw-bold"><a href="../systemadmin/systemAdminMainPage">QnA</a></div>
	<div class="col-1 text-center fw-bold">공지사항</div>
</div>
  