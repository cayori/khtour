<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="shortcut icon" href="/favicon.ico" />
<link href="//www.facebook.com/tourtipsguide" rel="publisher" />

<title>상담문의</title>
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/common.css?utv=0002217" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/default.css?utv=0002217" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/community.css?utv=0002217" />
<style type="text/css">
</style>
</head>

<body>
<jsp:include page="../item/SideBar.jsp" flush="false" />
	<!-- 통시작 -->
	<div id="subWrap">

		<!-- 사이드부분 -->
		<div class="lnb">
			<h1 class="lnbTitle">HELP DESK</h1>
			<ul>
				<li class=""><a href="ListNotice.action" class="">공지사항</a></li>
				<li class=""><a href="ListQuestion.action" class="on">상담문의</a></li>
			</ul>
		</div>
		<!-- //사이드부분 -->
		<!-- 콘텐츠부분 -->
		<div class="contents">
			<h2 class="titleSt02">상담문의</h2>
			<br> <br>
			<div class="noticeListWrap">
				<table>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 30%">
						<col style="width: 10%">
						<col style="width: 10%">
					</colgroup>

					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>

					<tbody>
						<s:iterator value="list" status="stat">
							<tr>
								<td class="num"><s:property value="question_no" /></td>
								<td class="mrgnLeft0"><s:if test="cocount>0">[답변완료] </s:if>
									<s:else>[답변대기] </s:else><a
									href="SelectQuestion.action?question_no=<s:property value='question_no' />&currentPage=<s:property value='currentPage' />"
									class="title"><s:property value="subject" /></a></td>
								<td class="num"><s:property value="id" /></td>
								<td class="num"><s:property value="reg_date" /></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				<div class="paging" style="vertical-align: middle">
					<s:property value="pagingHtml" escape="false" />
				</div>
			</div>

			<!-- 글쓰기 버튼 -->
			<s:if test='%{#session.id=="" || #session.id==null }'>

			</s:if>
			<s:else>
				<div class="btnWrap R">
					<a href="WriteQuestionForm.action"
						class="btn orange writer tboardWriteLoginCheck">글쓰기</a>
				</div>
			</s:else>
			<!-- //글쓰기 버튼 -->

		</div>
		<!-- //콘텐츠부분 -->
	</div>
</body>
</html>

