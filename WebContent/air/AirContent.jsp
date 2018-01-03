<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>항공권상세보기</title>
<link rel="stylesheet" type="text/css" href="/khtour/css/detail1.css">
<link rel="stylesheet" type="text/js" href="/khtour/css/detail1.css">

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />

<script>
	$(function() {

		$.datepicker.regional['ko'] = {
			closeText : '닫기',
			prevText : '이전달',
			nextText : '다음달',
			currentText : '오늘',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			weekHeader : 'Wk',
			dateFormat : 'yy-mm-dd',
			firstDay : 0,
			isRTL : false,
			duration : 200,
			showAnim : 'show',
			showMonthAfterYear : true,
			yearSuffix : '년'
		};
		$.datepicker.setDefaults($.datepicker.regional['ko']);

		$("#datepicker").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					changeMonth : true,
					changeYear : true,
					onSelect : function(selectedDate) {

						var option = this.id == "datepicker" ? "minDate"
								: "maxDate", instance = $(this).data(
								"datepicker"), date = $.datepicker.parseDate(
								instance.settings.dateFormat
										|| $.datepicker._defaults.dateFormat,
								selectedDate, instance.settings);
						jQuery("#datepicker, #datepicker1").not(this)
								.datepicker("option", option, date);
						$('input[type=text][id=datepicker]').val(
								$("#datepicker").val())
					}

				});
	});

	$(function() {

		$.datepicker.regional['ko'] = {
			closeText : '닫기',
			prevText : '이전달',
			nextText : '다음달',
			currentText : '오늘',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			weekHeader : 'Wk',
			dateFormat : 'yy-mm-dd',
			firstDay : 0,
			isRTL : false,
			duration : 200,
			showAnim : 'show',
			showMonthAfterYear : true,
			yearSuffix : '년'
		};
		$.datepicker.setDefaults($.datepicker.regional['ko']);

		$("#datepicker1").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					changeMonth : true,
					changeYear : true,
					onSelect : function(selectedDate) {

						var option = this.id == "datepicker" ? "minDate"
								: "maxDate", instance = $(this).data(
								"datepicker"), date = $.datepicker.parseDate(
								instance.settings.dateFormat
										|| $.datepicker._defaults.dateFormat,
								selectedDate, instance.settings);
						jQuery("#datepicker, #datepicker1").not(this)
								.datepicker("option", option, date);
						$('input[type=text][id=datepicker1]').val(
								$("#datepicker1").val());
					}

				});
	});
</script>
<script language="JavaScript">
	function Check(x) {
		var grade = document.getElementById("g");
		var nx = Number(x);
		for (i = 1; i <= 5; i++) {
			if (i <= nx) {
				var imgx = document.getElementById(String(i));
				imgx.src = "/khtour/img/star.jpg";
			}
			if (i > nx) {
				var imgx = document.getElementById(String(i));
				imgx.src = "/khtour/img/nostar.jpg";
			}
		}
		grade.value = nx;
	}
</script>
<script type="text/javascript">
function check1(){
if (comment.c_content.value == "") {
	alert("댓글을 입력해주세요");
	return false;
}
}

</script>

<script type="text/javascript">
	function check() {

		if (frm.ad.value == "") {
			alert("출국 날짜를 선택해주세요");
			return false;
		}
		if (frm.dd.value == "") {
			alert("귀국 날짜를 선택해주세요");
			return false;
		}
		if (frm.people.value == "") {
			alert("인원수를 선택해주세요");
			return false;
		}
	}
</script>
<script>
	window.name = "joinair";

	$(function() {
		$("#kinds").on('click', act);
	});
	

	function act() {
		var e = document.getElementById("no");
	var url = "/khtour/air(1)/index.jsp?no="+e.value;
		window.open(url, '', 'left=300, top=300, width=700, height=500, scrollbars=no, status=no, resizable=no, fullscreen=no, channelmode=no');
	}
</script>
<script type="text/javascript">
	function gosubmit1() {
		var f = document.frm;
		f.method = "post";
		f.action = "Pay.action";
		f.submit();
	}
	function gosubmit2() {
		var f = document.frm;
		f.method = "post";
		f.action = "InsertBasket.action";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="../item/SideBar.jsp" flush="false" />
	<div class="header_gab"></div>


	<div class="wrap">
		<div class="contents">
			<!--상품상세보기-->
			<div class="section1">
				<div class="content_img">
					<img src="/khtour/img2/<s:property value="avo.image1"/>" alt="">


				</div>




				<div class="content_info">
					<ul>
						<form name="frm" action="Pay.action" method="post"
							onsubmit="return check()">
							<s:hidden name="seq_no" value="%{avo.no}" />
							<s:hidden name="no" value="%{avo.no}" />
							<s:hidden name="name" value="%{avo.name}" />
							<s:hidden name="price" value="%{avo.price}" />
							<s:hidden name="id" value="%{#session.id}" />
							<s:hidden name="air" value="%{avo.air}" />
							<s:hidden name="image1" value="%{avo.image1}" />
							<input type="hidden" id="no" name="no" value="<s:property value="no"/>"/>
							<li><h2><s:property value="%{avo.content}"/></h2></li>

							<li><span>항공사</span> <s:property value="avo.air" /></li>
							<li><span>금액</span> <s:property value="avo.price" />원</li>
							<li><span>인원</span><select name="people" class="select">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
							</select> 명</li>
							<li><span>좌석</span> <input type="text" name="kinds" id="kinds" value="<s:property value="se"/>" 
									theme="simple" width="100px;" maxlength="20"/></li>
							<li><span>출국일</span> <s:textfield id="datepicker" name="ad"
									theme="simple" cssStyle="width:100px" maxlength="20"
									readonly="true" /></li>
							<li><span>입국일</span> <s:textfield id="datepicker1" name="dd"
									theme="simple" cssStyle="width:100px" maxlength="20"
									readonly="true" /></li>
							<li><a href="javascript:gosubmit1();" onclick="return check()">예약</a></li><li> <a href="javascript:gosubmit2();" onclick="return check()">장바구니담기</a></li>
						</form>

					</ul>
				</div>
			</div>

			<!--상품사진-->
				<img src="/khtour/img2/<s:property value="avo.image2"/>" alt="">
				<img src="/khtour/img2/<s:property value="avo.image3"/>" alt="">

			<!--후기게시판-->
			<div class="section3">
				<h1>항공후기</h1>

				<ul class="write">
					<li>
						<ul>
							<form name="comment" action="WriteAirC.action?no=<s:property value="no" />"
								method="post" onsubmit="return check1()">
								<!--호텔코멘트쓰기 -->
								<li>
									<!--호텔코멘트쓰기 및 별점 주기 --> 평점&nbsp;&nbsp;:&nbsp;&nbsp; <img
									src="/khtour/img/star.jpg" width="20px" height="20px" id="1"
									onclick="Check(this.id)"> <img src="/khtour/img/star.jpg"
									width="20px" height="20px" id="2" onclick="Check(this.id)">
									<img src="/khtour/img/star.jpg" width="20px" height="20px"
									id="3" onclick="Check(this.id)"> <img
									src="/khtour/img/nostar.jpg" width="20px" height="20px" id="4"
									onclick="Check(this.id)"> <img
									src="/khtour/img/nostar.jpg" width="20px" height="20px" id="5"
									onclick="Check(this.id)">
								</li>
								<s:hidden id="g" name="c_grade" value="3" />
								<!-- 별점 값 -->
								<s:hidden name="seq_no" value="%{air.no}" />
								<s:hidden name="c_no" value="%{ContentCOA.c_no}" />
								<s:hidden name="c_id" value="%{#session.id}" />
								<li><span>글쓴이:</span><span><s:property
											value='%{#session.id}' /></span></li>
								<!--c_id와 session.id와 같아야한다  -->
						</ul>
					</li>
					<li><textarea onKeyup="len_chk()" name="c_content" cols="100"
							rows="10" style="margin: 0px; width: 1008px; height: 150px;"></textarea></li>
					<li><input type="submit" value="등록"></li>
					</form>
				</ul>

				<ul class="write_list_wrap">
					<li class="write_list_title">
						<ul>
							<li>평점</li>
							<li>작성자</li>
							<li>내용</li>
							<li>작성날짜</li>
							<li>삭제</li>
						</ul>
					</li>
					<!--iterator  -->
					<s:if test="ContentCOA.size()<=0">
						<li class="write_list">
							<ul>
								<li>등록된 게시물이 없습니다.</li>
							</ul>
						</li>
					</s:if>
					<s:iterator value="contentCOA" status="stat">
						<li class="write_list_title">
							<ul>
								<s:if test="%{c_grade == 1}">
									<li class="star"><img src="/khtour/img/stars1.png"
										width="100px" height="25px" /></li>
								</s:if>
								<s:elseif test="%{c_grade == 2}">
									<li class="star"><img src="/khtour/img/stars2.png"
										width="100px" height="25px" /></li>
								</s:elseif>
								<s:elseif test="%{c_grade == 3}">
									<li class="star"><img src="/khtour/img/stars3.png"
										width="100px" height="25px" /></li>
								</s:elseif>
								<s:elseif test="%{c_grade == 4}">
									<li class="star"><img src="/khtour/img/stars4.png"
										width="100px" height="25px" /></li>
								</s:elseif>
								<s:elseif test="%{c_grade == 5}">
									<li class="star"><img src="/khtour/img/stars5.png"
										width="100px" height="25px" /></li>
								</s:elseif>
								<li><s:property value="c_id" /></li>
								<li><s:property value="c_content" /></li>
								<li><s:property value="c_reg_date" /></li>
								<s:if test="%{#session.id==c_id}">
									<li><a
										href="DeleteAirCD.action?no=<s:property value="no" />&c_no=<s:property value="c_no"/>&currentPage=<s:property value="currentPage" /> ">삭제</a></li>
								</s:if>
								<!--삭제에 이미지를 넣어주면 좋을듯  -->


							</ul>
						</li>
					</s:iterator>
					<li>
						<center>
							<s:property value="pagingHtml" escape="false" />
						</center>
					</li>
				</ul>

			</div>

			<!--Q&A-->
			<div class="section4">
				<h1>Q&A</h1>
				<ul class="write_list_wrap">
					<li class="write_list_title">
						<ul>
							<li>번호</li>
							<li>작성자</li>
							<li>제목</li>
							<li>작성날짜</li>
						</ul>
					</li>
					<s:if test="itemQ.size()<=0">
						<li class="write_list">
							<ul>
								<li>등록된 게시물이 없습니다.</li>
							</ul>
						</li>
					</s:if>
					<s:iterator value="itemQ" status="stat">
						<li class="write_list_title">
							<ul>
								<li><s:property value="question_no" /></li>
								<li><s:property value="id" /></li>
									<li><a href="SelectQuestion.action?question_no=<s:property value="question_no"/>"><s:property value="subject"/></a></li>
								<li><s:property value="q_reg_date" /></li>
							</ul>
						</li>
					</s:iterator>
					<li>
						<center>
							<s:property value="pagingHtmlQ" escape="false" />
						</center>
					</li>
				</ul>


			</div>
		</div>
		<footer> </footer>
</body>
</html>