<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="shortcut icon" href="/favicon.ico" />
<link href="//www.facebook.com/tourtipsguide" rel="publisher" />

<title>공지사항</title>
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/common.css?utv=0002217" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/default.css?utv=0002217" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/community.css?utv=0002217" />
<style type="text/css">
</style>
<SCRIPT type="text/javascript">
	function deleteconfirm() {
		var del
		del = confirm("정말 삭제하시겠습니까?")
		if (del == true) {
			return true;
		} else {
			return false;
		}
	}
</SCRIPT>
</head>

<body>
<jsp:include page="../item/SideBar.jsp" flush="false" />
	<!-- 통시작 -->
	<div id="subWrap">

		<!-- 사이드부분 -->
		<div class="lnb">
			<h1 class="lnbTitle">HELP DESK</h1>
			<ul>
				<li class=""><a href="ListNotice.action" class="on">공지사항</a></li>
				<li class=""><a href="ListQuestion.action" class="">상담문의</a></li>
			</ul>
		</div>
		<!-- //사이드부분 -->
		<!-- 콘텐츠부분 -->
		<div class="contents">
			<h2 class="titleSt02">공지사항 상세보기</h2>
			<br> <br>
			<div class="viewArea" id="viewPrint">
				<br> <br> <br>
				<!-- 글헤드 -->
				<div class="viewHead" id="viewHead">
					<div class="titleArea">
						<br> <strong class="title"><s:property
								value="resultClass.subject" /></strong>
						<div>
							<span class="date"><s:property
									value="resultClass.notice_no" /></span><span class="date"><s:property
									value="resultClass.reg_date" /></span><span class="count">조회수
								<i><s:property value="resultClass.readcount" /></i>
							</span>
						</div>
					</div>
				</div>
				<!-- 글바디 -->
				<div class="viewBody" id="viewBody">
					<div class="viewCnts">
						&nbsp;
						<pre>
						<s:property value="resultClass.content" />
						</pre>
					</div>
				</div>
				<!-- 글바텀 -->
				<div class="rightArea" align="right">
					<s:if
						test='%{#session.admincheck == 1 || #session.admincheck == 11 }'>
						<a
							href="AdminModifyNoticeForm.action?notice_no=<s:property value='notice_no' />&currentPage=<s:property value='currentPage' />"
							class="btn orange goQuestion tboardWriteLoginCheck">수정</a>
						<a
							href="AdminDeleteNotice.action?notice_no=<s:property value='notice_no' />&currentPage=<s:property value='currentPage' />"
							class="btn orange goQuestion tboardWriteLoginCheck"
							onclick="return deleteconfirm();">삭제</a>
					</s:if>
					<a
						href="ListNotice.action?currentPage=<s:property value='currentPage' />"
						class="btn white">목록</a>
				</div>
			</div>
		</div>
		<!-- //콘텐츠부분 -->
	</div>
</body>
</html>

