<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="shortcut icon" href="/favicon.ico" />
<link href="//www.facebook.com/tourtipsguide" rel="publisher" />

<title>고객센터</title>
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/common.css?utv=0002217" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/default.css?utv=0002217" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/community.css?utv=0002217" />
</head>

<body>
<jsp:include page="../item/SideBar.jsp" flush="false" />
	<div id="subWrap">
		<!-- 사이드부분 -->
		<div class="lnb">
			<h1 class="lnbTitle">HELP DESK</h1>
			<ul>
				<li class=""><a href="ListNotice.action" class="">공지사항</a></li>
				<li class=""><a href="ListQuestion.action" class="">상담문의</a></li>
			</ul>
		</div>
		<!-- //사이드부분 -->
		<!-- 콘텐츠부분 -->
		<div class="contents">
			<div class="cs_main">
				<!-- 안내 -->
				<div class="hgroup_cs">
					<h2 class="headtitle">KH투어의 귀는 언제나 열려 있습니다.</h2>
					<br> <br>
					<p>KH투어는 고객님의 목소리에 언제나 귀 기울이고 있습니다.</p>
					<p>
						고객님들이 문의, 신고해주신 내용을 모두 귀담아 듣고 만족하실 수 있도록 최선을 다 하겠습니다.<br> <br>
						<br>
					</p>
				</div>
				<div class="cs_board">
					<!-- 공지 -->
					<div class="faq_best5 lt">
						<ul class="navigation nav-tabs">
							<li class="active"><a href="ListNotice.action">공지사항</a></li>
							<p class="btn_more">
								<span class="button white"><button type="button"
										onclick="location.href='ListNotice.action'">더보기</button></span>
							</p>
						</ul>
						<ul class="board_list">

							<s:iterator value="noticelist" status="stat">
								<li><span class="notice_title"><a
										href="SelectNotice.action?notice_no=<s:property value='notice_no' />&currentPage=<s:property value='currentPage' />">
											<s:property value="subject" />
									</a> </span></li>
							</s:iterator>
						</ul>
					</div>
					<!-- 상담 -->
					<div class="board rt">
						<ul class="navigation nav-tabs">
							<li class="active"><a href="ListQuestion.action">상담문의</a></li>
							<p class="btn_more">
								<span class="button white"><button type="button"
										onclick="location.href='ListQuestion.action'">더보기</button></span>
							</p>
						</ul>
						<ul class="board_list">
							<s:iterator value="questionlist" status="stat">
								<li><span class="notice_title"> <a href=""> </a>
								</span> <span class="new"><a
										href="SelectQuestion.action?question_no=<s:property value='question_no' />&currentPage=<s:property value='currentPage' />"><s:property
												value="subject" /></a></span> <span class="date"><s:property
											value="reg_date" /></span></li>
							</s:iterator>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- //콘텐츠부분 -->
	</div>
</body>
</html>

