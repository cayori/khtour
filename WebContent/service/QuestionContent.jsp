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
	function deleteconfirm() {
		var del
		del = confirm("정말 삭제하시겠습니까?")
		if (del == true) {
			return true;
		} else {
			return false;
		}
	}

	function validation() {
		if (questioncomment.content.value == "") {
			alert("댓글을 입력해주세요.");
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
			<h2 class="titleSt02">상담문의 상세보기</h2>
			<br> <br>
			<div class="viewArea" id="viewPrint">
				<br> <br> <br>
				<!-- 글헤드 -->
				<div class="viewHead" id="viewHead">
					<div class="titleArea">
						<br>
						<s:if test="listco.isEmpty()">[답변대기] </s:if>
						<s:else>[답변완료]</s:else>
						<strong class="title"><s:property
								value="resultClass.subject" /> </strong>
						<div>
							<span class="user load_user_info_a" u="1000009E4CD"><s:property
									value="resultClass.id" /></span><span class="date"><s:property
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
				<!-- 댓글몇갠지나오게하기 -->
				<div class="replyArea" id="replyArea">

					<div class="replyStatus">
						<p>답변</p>
						<span class="vBlank"> </span>
					</div>

					<ul class="replyList" id="replyList">

						<li class="comment_list blank"
							style="width: 0px; height: 0px; border: 0px; padding: 0px;"></li>

						<s:iterator value="listco" status="stat">
							<li class="comment_list " data="171876" pdata="0">
								<div class="comment">
									<div class="replyCnt">
										<p class="writer">
											<span class="writer_name.">관리자</span>
										</p>
										<span class="date"><s:property value="reg_date" /></span>

										<p class="txt">
											<span><s:property value="content" /> </span>
										</p>
									</div>
									<s:if
										test='%{#session.admincheck == 1 || #session.admincheck == 11 }'>
										<div class="functionArea">
											<s:hidden name="question_no" value="question_no" />
											<s:hidden name="currentPage" value="currentPage" />
											<button type="button" title="삭제" class="comment"
												onclick="location.href='AdminReplyDelete.action?question_no=<s:property value="question_no"/>&currentPage=<s:property value="currentPage"/>&no=<s:property value="no" />'">삭제</button>
										</div>
									</s:if>
								</div>
							</li>
						</s:iterator>
						
						<s:if test="resultClass.cocount>10">
						<div>
							<s:property value="pagingHtmlco" escape="false" />
						</div>
						</s:if>
						<!-- 댓글쓰는 폼 -->
						<s:if
							test='%{#session.admincheck == 1 || #session.admincheck == 11 }'>
							<form name="questioncomment" id="commentForm" method="post"
								enctype="multipart/form-data" action="AdminReply.action"
								onsubmit="return validation();">
								<li class="commentForm">
									<div class="commentFormArea">
										<textarea cols="30" rows="4" name="content"
											placeholder="답글을 입력해주세요."></textarea>
										<s:hidden name="id" value="%{#session.id}" />
										<s:hidden name="question_no" value="%{question_no}" />
										<button type="submit" title="등록" class="regist" data="write"
											id="comment_write">등록</button>
									</div>
								</li>
							</form>
						</s:if>
					</ul>
				</div>
				<!-- 글바텀 -->

				<div class="rightArea" align="right">

					<s:if
						test='%{#session.admincheck == 1 || #session.admincheck == 11 }'>
						<a
							href="ModifyQuestionForm.action?question_no=<s:property value='question_no' />&currentPage=<s:property value='currentPage' />"
							class="btn orange goQuestion tboardWriteLoginCheck">수정</a>
						<a
							href="DeleteQuestion.action?question_no=<s:property value='question_no' />&currentPage=<s:property value='currentPage' />"
							class="btn orange goQuestion tboardWriteLoginCheck"
							onclick="return deleteconfirm();">삭제</a>
					</s:if>
					<s:elseif test="%{#session.id == resultClass.id }">
						<a
							href="ModifyQuestionForm.action?question_no=<s:property value='question_no' />&currentPage=<s:property value='currentPage' />"
							class="btn orange goQuestion tboardWriteLoginCheck">수정</a>
						<a
							href="DeleteQuestion.action?question_no=<s:property value='question_no' />&currentPage=<s:property value='currentPage' />"
							class="btn orange goQuestion tboardWriteLoginCheck"
							onclick="return deleteconfirm();">삭제</a>
					</s:elseif>
					<a
						href="ListQuestion.action?currentPage=<s:property value='currentPage' />"
						class="btn white">목록</a>
				</div>
			</div>
			<!-- //글바텀 -->

		</div>

	</div>





</body>
</html>