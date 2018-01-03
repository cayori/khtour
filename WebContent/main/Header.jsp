<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="shortcut icon" href="/favicon.ico" />
<link href="//www.facebook.com/tourtipsguide" rel="publisher" />

<title>KH투어</title>
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/common.css?utv=0002219" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/main.css?utv=0002219" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/jquery-ui.css?utv=0002219" />
<script type="text/javascript">
	document.domain = "tourtips.com";
</script>
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/cm/jquery-1.11.2.min.js?utv=0002219"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/cm/common.js?utv=0002219"></script>
<script type="text/javascript" src="/css/js"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/cm/jquery-ui.js?utv=0002219"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/cm/anythingslider.js?utv=0002219"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/pc/main/main.js?utv=0002219"></script>
</head>
<body>
	<div id="u_skip">
		<a href="#container"
			onclick="document.getElementById('container').focus();return false;">컨텐츠
			바로가기</a>
	</div>
	<div id="wrap">
		<style>
.up_close {
	background: url(//img.tourtips.com/images/common/close_btn_b.png)
		no-repeat right center;
	position: absolute;
	width: 38px;
	height: 37px;
	top: 15px;
	right: 30px;
	cursor: pointer
}
</style>
		<script>
			function TTNBClick() {
				setCookie('TTNB_219', '0', '1');
				$('.ttnb').hide();
			}
		</script>
		<!-- header -->
		<div id="header">
			<div class="loading" id="loading">
				<div class="bg"></div>
				<div class="pc">
					<img src="//img.tourtips.com/images/cm/loadingImg_pc.gif"
						alt="로딩 중입니다.">
				</div>
			</div>
			<!-- headTop -->
			<div class="headTop">
				<h1>
					<a href="Main.action"> <img src="/khtour/img/KHTOUR-logo.png"
						width="340px" ; alt="KH투어"> <!-- KH TOUR 로고 및 로고이미지에  링크추가하자 -->
					</a>
				</h1>

				<s:if test='%{#session.id == null}'>
					<!-- 비로그인일 때 -->
					<!-- loginArea : 로그인 전 -->
					<div class="loginArea" style="width: 300px;">
						<a href="LoginForm.action">로그인</a> <span>|</span> <a
							href="JoinForm.action">회원가입</a>
					</div>
				</s:if>

				<s:elseif test='%{#session.admincheck == 0 && #session.id != null}'>
					<!-- 회원이 로그인 했을 때 -->
					<div class="loginArea" style="width: 300px;">
						<a
							href="LogoutMember.action?id=<s:property value="#session.id" />">로그아웃</a>
						<span>|</span><Strong><s:property value="#session.id" /></Strong>님
						어서오세요
					</div>
				</s:elseif>

				<s:elseif test='%{#session.admincheck == 1 && #session.id != null}'>
					<!-- 관리자일 때 -->
					<div class="loginArea" style="width: 300px;">
						<s:a href="LogoutMember.action">로그아웃</s:a>
						<span>|</span> <a href="AdminForm.action">상품 및 고객 관리</a> <span>|</span><Strong>관리자</Strong>님
						어서오세요
					</div>
				</s:elseif>

				<s:elseif test='%{#session.admincheck == 11 && #session.id != null}'>
					<!-- 관리자일 때 -->
					<div class="loginArea" style="width: 300px;">
						<s:a href="LogoutMember.action">로그아웃</s:a>
						<span>|</span> <a href="AdminForm.action">상품 및 고객 관리</a> <span>|</span><Strong>관리자</Strong>님
						어서오세요
					</div>
				</s:elseif>
				<!-- //loginArea -->
				<!-- search -->
				 <div id="search">
					<fieldset>
						<jsp:include page="weather.jsp" flush="false" />
					</fieldset>
				</div> 
				<!-- //search -->

			</div>
			<!-- //headTop -->

			<!-- gnb -->
			<div id="gnb">
				<div class="gnbIn">
					<ul>
						<li class="dest"><a href="CompanyIntro.action"
							class="deapth1 " data-title="회사소개">회사소개<!-- <span class="new">new</span> --></a></li>
						<li class="community"><a href="ListItem.action"
							class="deapth1" data-name="여행정보">여행 패키지</a></li>
						<li class="book"><a href="ListAir.action" class="deapth1"
							data-title="항공">항공권</a></li>
						<li class="ticket"><a href="ListHotel.action" class="deapth1"
							class="deapth1" data-title="호텔">호텔 / 리조트</a></li>
						<li class="ticket"><a href="ListReview.action"
							class="deapth1" data-title="후기">여행 후기</a></li>
						<li class="air"><a href="MyPageForm.action" class="deapth1"
							data-title="마이페이지">마이페이지</a></li>
						<li class="hotel"><a href="ServiceForm.action"
							class="deapth1" data-title="고객센터">고객센터</a></li>
					</ul>
				</div>

			</div>
			<!-- //gnb -->

		</div>
	</div>
	<hr>
</body>
</html>
