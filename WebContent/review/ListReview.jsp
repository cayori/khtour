<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="shortcut icon" href="/favicon.ico" />
<link href="//www.facebook.com/tourtipsguide" rel="publisher" />

<title>후기게시판</title>
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/common.css?utv=0002217" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/default.css?utv=0002217" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/community.css?utv=0002217" />
<style type="text/css">
</style>
  <script type="text/javascript">
  function logincheck() {
		if(id.value == "") {
			alert("로그인을 해주세요");
			return false;
		}
	}
</script>
</head>

<body>
<jsp:include page="../item/SideBar.jsp" flush="false" />
	<!-- 통시작 -->
	
	<div id="subWrap">
		<!-- 콘텐츠부분 -->
			<br>
			<br>
			<h2 class="titleSt02">여행후기</h2>
			<br>
			<br>
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
						<s:iterator value="reviewList" status="stat">
							<tr>
								<td class="num"><s:property value="review_no" /></td>
								<td class="mrgnLeft0"><a
									href="SelectReview.action?review_no=<s:property value='review_no' />&currentPage=<s:property value='currentPage' />"
									class="title"><s:property value="subject" /></a></td>
								<td class="num"><s:property value="id" /></td>
								<td class="num"><s:property value="reg_date" /></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				<div class="paging">
				<center><s:property value="pagingHtml" escape="false" /></center> 
				</div>
			</div>
		
			<!-- 글쓰기 버튼 -->
			<div class="btnWrap R">
			<s:hidden name="id" value="%{#session.id}"/>
				<a href="WriteReviewForm.action" onclick="return logincheck();" class="btn orange writer tboardWriteLoginCheck">글쓰기</a>
			</div>
			
			<!-- //글쓰기 버튼 -->

	</div>
</body>
</html>

