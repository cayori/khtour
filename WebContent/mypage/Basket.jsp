<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>구매내역</title>
<link rel="stylesheet" type="text/css" href="/khtour/css/basket.css">
<script type="text/JavaScript">
	var check = false;
	function CheckAll() {
		var chk = document.getElementsByName("deleteCheck");
		if (check == false) {
			check = true;
			for (var i = 0; i < chk.length; i++) {
				chk[i].checked = false;
			}
		} else {
			check = false;
			for (var i = 0; i < chk.length; i++) {
				chk[i].checked = true;
			}
		}
	}
</script>
<!--  -->
<script type="text/javascript">
	function check() {

		if (frm.deleteCheck.checked == false) {
			alert("체크박스를 선택해주세요");
			return false;
		}
	}
</script>
</head>
<body>
	<div class="wrap">
		<div class="contents">
			<h1>장바구니</h1>
			<h2>장바구니에 담긴 상품입니다.</h2>
			<ul class="content_list">
				<li class="list_title">
					<ul>
						<li><input name="checkall" type="checkbox"
							onclick="javascript:CheckAll()"></li>
						<li>상품사진&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품이름</li>
						<li>총금액</li>
						<li>수량</li>
						<li></li>
					</ul>
				</li>
				<form action="BasketDelete.action" name="frm" method="post"
					onsubmit="return check()">
					<s:hidden name="id" value="%{#session.id}" />
					<s:iterator value="blist" status="stat">
						<li class="list">
							<ul>
								<li><input type="checkbox" class="checkbox" id="del_id"
									name="deleteCheck" value="<s:property value="no"/>"
									onclick="chkBox(this.checked)"></li>
								<li><img
									src="C:/Users/JeongEonGoo/workspace/khtour/WebContent/img/<s:property value="image1"/>"
									alt=""></li>
								<li><s:property value="name" /></li>
								<li><s:property value="price" />원</li>
								<li><s:property value="amount" />개</li>
							</ul>


						</li>
					</s:iterator>
					<li class="list_footer">
						<ul>
							<li><center>
									<s:property value="pagingHtml" escape="false" />
									<center></li>
						</ul>
					</li>
			</ul>

			<ul class="btn_wrap">
				<s:if test="blist.size()>0">
					<li><input type="submit" name="submit" value="선택삭제"></li>
				</s:if>
				<s:elseif test="order.size<=0">
					<li>구매내역이 없습니다.</li>

				</s:elseif>
				</form>
				<li><a href="Main.action">홈</a></li>
		</div>
	</div>

</body>

</html>