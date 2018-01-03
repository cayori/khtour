<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script type="text/javascript">
	var auto_refresh = setInterval(function() {
		$('#load_tweets').load('Lately.action').fadeIn("fast");
	}, 500);
</script>

<link rel="shortcut icon" href="/favicon.ico" />
<link href="//www.facebook.com/tourtipsguide" rel="publisher" />
<!-- 슬라이드 자동 넘기기 -->

<title>KH투어 - 여행 패키지</title>
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/dest.css?utv=0002211" />
<link rel="stylesheet" type="text/css" href="/khtour/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/main.css?utv=0002219" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/jquery-ui.css?utv=0002219" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/common.css?utv=0002217" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/default.css?utv=0002217" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/community.css?utv=0002217" />
<!--[if lt IE 8]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE8.js"></script>
<![endif]-->
<script type="text/javascript">
	document.domain = "tourtips.com";
</script>
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>

<script type="text/javascript">
	//google analytics pc
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script', '//www.google-analytics.com/analytics.js',
			'ga');
	ga('create', 'UA-38984076-1', 'auto');
	ga('require', 'linkid', 'linkid.js');
	ga('set', 'dimension4', 'www');
	ga('send', 'pageview');

	if (!wcs_add)
		var wcs_add = {};
	wcs_add["wa"] = "2403236b48f994";
	wcs_do();
</script>
<script>
	(function(w, d, s, l, i) {
		w[l] = w[l] || [];
		w[l].push({
			'gtm.start' : new Date().getTime(),
			event : 'gtm.js'
		});
		var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
				+ l
				: '';
		j.async = true;
		j.src = '//www.googletagmanager.com/gtm.js?id=' + i + dl;
		f.parentNode.insertBefore(j, f);
	})(window, document, 'script', 'dataLayer', 'GTM-M8XMTD');
</script>
<script>
	(function(w, d, s, l, i) {
		w[l] = w[l] || [];
		w[l].push({
			'gtm.start' : new Date().getTime(),
			event : 'gtm.js'
		});
		var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
				+ l
				: '';
		j.async = true;
		j.src = '//www.googletagmanager.com/gtm.js?id=' + i + dl;
		f.parentNode.insertBefore(j, f);
	})(window, document, 'script', 'dataLayer', 'GTM-M8XMTD');
</script>
<script type="text/javascript"
	src="//img.tourtips.com/js/cm/jquery-1.11.2.min.js?utv=0002219"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/cm/common.js?utv=0002219"></script>
<script type="text/javascript" src="/css/js"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/cm/jquery-ui.js?utv=0002219"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/cm/anythingslider.js?utv=0002219"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/pc/main/main.js?utv=0002219"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/cm/jquery-1.11.2.min.js?utv=0002211"></script>

<script>
	$(document).ready(function() {
		var selectTarget = $('.selectbox select');

		selectTarget.on('blur', function() {
			$(this).parent().removeClass('focus');
		});

		selectTarget.change(function() {
			var select_name = $(this).children('option:selected').text();

			$(this).siblings('label').text(select_name);
		});
	});
</script>


</head>

<body>
<jsp:include page="../item/SideBar.jsp" flush="false" />
	<div id="wrap">
		<style>
body {
	margin: 10px;
	font-size: 14px;
}

.where {
	display: block;
	margin: 25px 15px;
	font-size: 11px;
	color: #000;
	text-decoration: none;
	font-family: verdana;
	font-style: italic;
}

.selectbox {
	position: relative;
	width: 200px;
	border: 1px solid #999;
	z-index: 1;
}

.selectbox:before {
	content: "";
	position: absolute;
	top: 50%;
	right: 15px;
	width: 0;
	height: 0;
	margin-top: -1px;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
	border-top: 5px solid #333;
}

.selectbox label {
	position: absolute;
	top: 1px;
	left: 5px;
	padding: .8em .5em;
	color: #999;
	z-index: -1;
}

.selectbox select {
	width: 100%;
	height: auto;
	line-height: normal;
	font-family: inherit;
	padding: .8em .5em;
	border: 0;
	opacity: 0;
	filter: alpha(opacity = 0);
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}
</style>
		<script>
			function TTNBClick() {
				setCookie('TTNB_219', '0', '1');
				$('.ttnb').hide();
			}
		</script>
		<span class="shadow"> <!-- for ui -->
		</span>


	</div>
	<script type="text/javascript">
		//환율 레이어
		$('.btnCurrency').click(function() {
			$('#currencyPopUp').show();
		});

		$(".info_layer_close").click(function() {
			$(this).parents("#currencyPopUp").hide();
		});

		//월별 날씨 레이어
		$('.weather a').click(function() {
			$('#weatherLayer').show();
		});

		$("#weatherLayer .closeLayer").click(function() {
			$(this).parents("#weatherLayer").hide();
		});

		//여행정보 오버 시
		// var $cityInfo = $(".cityInfoArea .cityInfo");
		// var $info = $(".cityInfoArea .info");
		// var $infoIn = $(".cityInfoArea .infoIn");

		// function infoLeave() {

		// 	$cityInfo.animate({
		// 		height:"251px"
		// 	}, 500);
		// 	$info.addClass('animated').animate({
		// 		height:"58px"
		// 	}, 500, function(){
		// 		$info.removeClass("animated").dequeue();
		// 	});
		// 	$infoIn.fadeOut(300);

		// 	clearInterval(endInfo);
		// }

		// function infoHover() {

		// 	$cityInfo.dequeue().stop().animate({
		// 		height:"386px"
		// 	}, 500);
		// 	$info.dequeue().stop().animate({
		// 		height:"193px"
		// 	}, 500);
		// 	$infoIn.dequeue().stop().fadeIn(300);

		// 	clearInterval(startInfo);
		// }

		// var startInfo = setInterval(function () {infoHover()}, 300);
		// var endInfo = setInterval(function () {infoLeave()}, 1300);

		// $cityInfo.on({
		// 	mouseenter : function() {
		// 		if (!$(this).hasClass("animated")) {
		// 			infoHover();
		// 		}
		// 	},
		// 	mouseleave : function() {
		// 		infoLeave();
		// 	}
		// });

		if ($('.localTimeArea .time').length > 0) {
			applyTimmer($('.localTimeArea .time'));
		}

		function applyTimmer(obj) {
			var now = new Date();
			var arrTimes = $(obj).text().match(/[0-9:]/g).join("").split(":");
			if (arrTimes.length < 2)
				return;
			now.setHours(arrTimes[0]);
			now.setMinutes(arrTimes[1]);
			$(obj).text(
					"현지시간 " + fillzero(now.getHours(), 2) + ":"
							+ fillzero(now.getMinutes(), 2) + ":"
							+ fillzero(now.getSeconds(), 2));
			setTimeout("applyTimmer($('.localTimeArea .time'))", 1000);
		}

		function fillzero(s, len) {
			var ts = s;
			for (var i = 0; i < len; i++) {
				ts = "0" + ts;
			}
			ts = ts.substr(ts.length - len);
			return ts;
		}
	</script>
	<script>
		function deletecheck() {
			return confirm("해당 상품을 삭제하시겠습니까?");
		}
	</script>
	<!-- //visualWrap -->


	<!-- subWrap -->
	<div id="subWrap">

		<!-- lnb -->
		<div class="lnb" id="destLeftMenu">
			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
			<br /> <br /> <br /> <br /> <br />
			<h1 class="bigTitle">
				<b>지역별</b>
			</h1>
			<ul id="destSpotTypeList">
				<br />
				<br />
				<br />
				<li><a href="ListItem.action" class="on">전체</a></li>
				<li><a href="ListItem.action?r=1" class="on">서울</a></li>
				<li><a href="ListItem.action?r=2" class="on">부산</a></li>
				<li><a href="ListItem.action?r=3" class="on">전주</a></li>
				<li><a href="ListItem.action?r=4" class="on">경주</a></li>
				<li><a href="ListItem.action?r=5" class="on">제주</a></li>
				<li><a href="ListItem.action?r=6" class="on">강원</a></li>
			</ul>
			<br /> <br /> <br />
			<div id="load_tweets">
				<jsp:include page="Lately.jsp" flush="false" />
			</div>

		</div>
		<!-- //lnb -->


		<!-- contents -->
		<div class="contents">
			<div id="header">
				<div id="search">
					<table width="750">
						<form method="post" action="ListItem.action">
							<input type="hidden" name="r" value="<s:property value="r"/>" />
							<td>
								<fieldset>
									<legend>검색</legend>
									<span class="round"> <input type="text" name="search"
										title="검색어 입력" tabindex="1" style="ime-mode: active;"
										placeholder="Search">
										<button type="submit" id="search_btn" title="검색" tabindex="2">검색</button>
									</span>
								</fieldset>
							</td>
						</form>
						<td align="right">
							<div class="selectbox">
								<label for="ex_select">항목 정렬</label> <select id="ex_select"
									name="n"
									onChange="location.href='ListItem.action?n='+this.value+'&r=<s:property value="r"/>'">
									<option selected>항목 정렬</option>
									<option value="0">신규등록순</option>
									<option value="1">낮은 가격순</option>
									<option value="2">높은 가격순</option>
									<option value="3">만족도순</option>
								</select>
							</div>
						</td>
					</table>
				</div>
			</div>
			<!-- themaArea-->
			<div class="themaArea">
				<h2 class="title">여행 패키지 상품</h2>
				<br /> <br />
				<table>
					<tr>
						<td>
							<!-- 테이블에서 꺼내온 여행상품 목록 리스트 --> <!-- listArea -->
							<div class="cardWrap">
								<ul>
									<s:iterator value="itemlist" status="stat">
										<li class="card"><a
											href="SelectItem.action?no=<s:property value="no"/>">
												<div class="thumb">
											<img src="/khtour/img2/<s:property value="image1"/>" alt="">
												</div>
												<div class="infoWrap">
													<strong class="title"><s:property value="name"/></strong>
													<p class="desc"><s:property value="price"/>원</p>
												</div> <span class="border"></span>
										</a>
											<div name="contentCard" id="contentCard_1000057984"
												data-id="1000057984" data-evaluatestatus="N"
												data-scraptype="C" data-scrapstatus="N">
												<s:if
													test="#session.admincheck == 1 || #session.admincheck == 11">
													<div class="likeArea">
														<ul>
															<li><a href="ModifyItemForm.action?no=${no}"><img
																	src="/khtour/img/m.png" width="60px" height="40px" /></a></li>
															<li></li>
															<li><a href="DeleteItem.action?no=${no}"
																onclick="return deletecheck()"><img
																	src="/khtour/img/d.png" width="60px" height="40px" /></a></li>
														</ul>
													</div>
												</s:if>
												<s:elseif
													test="#session.admincheck == 0 || #session.damincheck == null">
													<div class="likeArea">
														<ul>
															<s:if test="%{grade == 1}">
																<li class="star"><img src="/khtour/img/stars1.png"
																	width="250px" height="45px" /></li>
															</s:if>
															<s:elseif test="%{grade == 2}">
																<li class="star"><img src="/khtour/img/stars2.png"
																	width="250px" height="45px" /></li>
															</s:elseif>
															<s:elseif test="%{grade == 3}">
																<li class="star"><img src="/khtour/img/stars3.png"
																	width="250px" height="45px" /></li>
															</s:elseif>
															<s:elseif test="%{grade == 4}">
																<li class="star"><img src="/khtour/img/stars4.png"
																	width="250px" height="45px" /></li>
															</s:elseif>
															<s:elseif test="%{grade == 5}">
																<li class="star"><img src="/khtour/img/stars5.png"
																	width="250px" height="45px" /></li>
															</s:elseif>
															<s:elseif test="%{grade == 0}">
																<li class="star"><img src="/khtour/img/post.png"
																	width="250px" height="45px" /></li>
															</s:elseif>
														</ul>
													</div>
												</s:elseif>
											</div></li>
									</s:iterator>
								</ul>
							</div>
						</td>
					</tr>
					<tr align="center">
						<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
					</tr>
				</table>
			</div>
		</div>

	</div>
	<!-- //subWrap -->
	</div>

	<script type="text/javascript">
		$("a[data-id=1036]", ".cityListLayer").addClass("cur")
	</script>
	<button type="button" onclick="javascript:window.scrollTo(0, 0);"
		class="goTop">
		<img src="//img.tourtips.com/images/cm/img_goTop.png" alt="맨위로">
	</button>
	<script type="text/javascript">
		window.NREUM || (NREUM = {});
		NREUM.info = {
			"beacon" : "bam.nr-data.net",
			"licenseKey" : "f67d8241dc",
			"applicationID" : "10343175",
			"transactionName" : "YVIGNxRWChACUkQKXFgYJxYVQwsOTFVVEEcZVA0XHxg=",
			"queueTime" : 0,
			"applicationTime" : 2867,
			"atts" : "TRUFQVxMGR4=",
			"errorBeacon" : "bam.nr-data.net",
			"agent" : ""
		}
	</script>
</body>
</html>

