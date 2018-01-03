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
<SCRIPT type="text/javascript">
	function validation() {
		if (questionwrite.subject.value == "") {
			alert("제목을 입력해주세요.");
			return false;
		} else if (questionwrite.content.value == "") {
			alert("내용을 입력해주세요.");
			return false;
		}
		return true;
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
				<li class=""><a href="ListNotice.action" class="">공지사항</a></li>
				<li class=""><a href="ListQuestion.action" class="on">상담문의</a></li>
			</ul>
		</div>
		<!-- //사이드부분 -->
		<!-- 콘텐츠부분 -->
		<div class="contents">
			<h2 class="titleSt02">상담문의</h2>
			<br> <br>
			<form action="WriteQuestion.action" method="post"
				name="questionwrite" enctype="multipart/form-data"
				onsubmit="return validation();">
				<div class="writeWrap" id="writeWrap">
					<table>
						<colgroup>
							<col style="width: 12%">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="title">제목</label></th>
								<td><input type="text" id="title" name="subject"
									class="title" value=""></td>
							</tr>
							<tr>
								<td colspan="2"><textarea rows="25" cols="62"
										name="content"></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
				<p class="warningDesc">* 공개된 게시판으로 주민번호, 전화번호, 이메일 주소 등 고객님의 소중한
					개인정보를 절대 남기지 마세요.</p>

				<div class="btnWrap C" align="right">
					<s:hidden name="id" value="%{#session.id}" />
					<button type="submit" class="btn orange">등록</button>
				</div>
			</form>
		</div>
		<!-- //콘텐츠부분 -->
	</div>
</body>
</html>

