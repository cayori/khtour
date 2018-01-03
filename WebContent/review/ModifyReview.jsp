<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
body, div, table, caption, thead, tbody, tr, td, tfoot, a {
	margin: 0;
	padding: 0;
}

body {
	font-family: "맑은 고딕";
	font-size: 0.8em;
	color: #666;
}

a {
	text-decoration: none;
	color: #000000;
	cursor: pointer;
}

a:hover {
	text-decoration: underline;
}

caption {
	font-size: 30px;
	text-align: center;
	font-weight: bold;
	margin: 20px;
}

table {
	width: 800px;
	border-collapse: collapse;
	margin: auto;
}

.dataTbl1 table {
	border-top: 2px solid #8d8d8d;
}

.dataTbl1 th {
	padding: 10px 8px;
	background: #f9f9f9;
	color: #666;
	border-bottom: 1px solid #8d8d8d;
}

.dataTbl1 td {
	padding: 11px 8px;
	line-height: 1.25em;
	text-align: center;
	color: #666;
	border-bottom: 1px solid #dbdbdb;
}

.dataTbl1 td.title {
	text-align: left;
	color: #000;
}
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
		<!-- 콘텐츠부분 -->
			<br>
			<br>
			<h2 class="titleSt02">후기게시판</h2>
			<br> <br>
			
			<form action="ModifyReview.action" method="post" name="questionwrite" enctype="multipart/form-data" onsubmit="return validation();">
			<s:hidden name="id" value="%{#session.id}"/>
			<s:hidden name="review_no" value="%{paramClass.review_no}"/>
				<div class="writeWrap" id="writeWrap">
					<table>
						<colgroup>
							<col style="width: 12%">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="title">제목</label></th>
								<td><input type="text" id="title" name="subject" class="title" value="<s:property value="paramClass.subject"/>"></td>
							
							</tr>
							<tr>
								<td colspan="2"><textarea rows="25" cols="62"
										name="content" ><s:property value="paramClass.content"/></textarea></td>
									
										
							</tr>
						</tbody>
					</table>
				</div>
				<s:textfield name="pw" theme="simple">비밀번호:</s:textfield>
				<p class="warningDesc">* 공개된 게시판으로 주민번호, 전화번호, 이메일 주소 등 고객님의 소중한
					개인정보를 절대 남기지 마세요.</p>

			

				<div class="btnWrap C" align="left">
					
					<br/>
					<s:file name="upload" label="File(1)" theme="simple">사진업로드</s:file>
					<s:file name="upload" label="File(2)" theme="simple"></s:file>
					<s:file name="upload" label="File(3)"  theme="simple"></s:file>
					<button type="submit" class="btn orange">등록</button>
				</div>
			</form>
		</div>
		<!-- //콘텐츠부분 -->
</body>
</html>

