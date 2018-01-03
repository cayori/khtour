<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="shortcut icon" href="/favicon.ico" />
<link href="//www.facebook.com/tourtipsguide" rel="publisher" />

<title>[관리자] 공지사항 작성</title>
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
		if (noticewrite.subject.value == "") {
			alert("제목을 입력해주세요.");
			return false;
		} else if (noticewrite.content.value == "") {
			alert("내용을 입력해주세요.");
			return false;
		}
		return true;
	}
</SCRIPT>
</head>

<body>
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
			<h2 class="titleSt02">공지사항 작성폼</h2>
			<br> <br>
			<form action="AdminWriteNotice.action" method="post" name="noticewrite"
				enctype="multipart/form-data" onsubmit="return validation();">
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
				<div class="btnWrap C" align="right">
					<button type="submit" data="submit" formdata="save"
						class="btn orange">등록</button>
				</div>
			</form>
		</div>
		<!-- //콘텐츠부분 -->
	</div>
</body>
</html>

