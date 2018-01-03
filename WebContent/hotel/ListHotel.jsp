<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:v="urn:schemas-microsoft-com:vml" xmlns:og="http://ogp.me/ns#"
	xml:lang="ko" lang="ko">
<head>
<script>
	if (window.location.hash && window.location.hash === '#_=_') {
		window.location.hash = '';
	}
</script>
<!-- New Relic Header -->
<link href="/Styles/StyleSheet.ashx?key=JQueryUiBranding"
	rel="stylesheet" type="text/css" inspectlet-ignore />
<link
	href="https://cdn.datahc.com/Styles/Style.ashx?affiliateId=104707&branding=292000&key=MainWhitelabel&v=636168188594430000-708837376&cdn=1.0.2017.065002"
	rel="stylesheet" type="text/css" inspectlet-ignore />
<link
	href="https://cdn.datahc.com/Styles/Style.ashx?affiliateId=104707&branding=292000&key=PlaceWhitelabel&v=636168188594430000-708837376&cdn=1.0.2017.065002"
	rel="stylesheet" type="text/css" inspectlet-ignore />
<link
	href="https://media.datahc.com/Affiliates/104707/Brands/Styles/styles-292000_min_v5.css"
	rel="stylesheet" type="text/css" inspectlet-ignore />

<title>KHtour - 국내 호텔 실시간 검색!</title>
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/common.css?utv=0002216" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/hotelSearch.css?utv=0002216" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/hotel.css?utv=0002216" />

<script type="text/javascript"
	src="https://cdn.datahc.com/Script/Bundles/Master?v=JJPDWPfd_M7qchs5nFzIfac1mvFP7kg0ka2D9OBrxf81
&cdn=1.0.2017.065002"></script>

<script type="text/javascript">
	HC.gLanguageCode = 'KO';
	HC.gCountryCode = 'KR';
	HC.gCurrencyCode = 'KRW';
	HC.requestBase = 'http://hotels.tourtips.com';
	HC.Common.isRightToLeft = false;

	$.extend(true, HC, {
		Translations : {
			searchPageSortingResults : '검색 결과 업데이트 중',
			pageFilteringResults : '결과 필터링…',
			searchPageLoadingPage : '페이지 불러오는 중…',
			searchPageLoadingResults : '전세계 여행사이트 검색 비교중...',
			searchPageLoadingHotel : '호텔 불러오는 중…'
		}
	});

	var gLanguageCode = HC.gLanguageCode;
	var gCountryCode = HC.gCountryCode;
	var gCurrencyCode = HC.gCurrencyCode;

	HC.setPlatform(0);
	HC.Common.Init({
		"backendconfirmationtest" : 0,
		"assistedbookingostrovok" : 1,
		"assistedbookingamoma" : 0,
		"koreanpromobanner" : 1,
		"travellertypephotosonmobile" : 1,
		"crazyegg" : 0,
		"algoliawithsinglecharacter" : 0,
		"dropsave80message" : 1,
		"marxmaxcampaign" : 1,
		"groupratesbyroomtype" : 1,
		"searchresultsmobilenewheader" : 1,
		"secretdealsdesktop" : 0,
		"secretdealsmobile" : 0,
		"navermap" : 1,
		"mapfilter" : 1,
		"searchonbreadcrumbclick" : 1,
		"disconnectedmapviewmobile" : 1,
		"lighboxmap" : 0,
		"propertypagenewheader" : 1,
		"searchboxoptimisation" : 0
	}, 'KRW', false, '104707', false, 'KO', false, false, 'KR', '',
			'https://cdn.datahc.com', '1.0.2017.065002', 'PrivateBranding', {
				"DisableProviderRedirectRedirection" : false,
				"DisableClickTripz" : false
			}, 'PlaceLanding');
	HC.SpriteGallery.setImageConfiguration('https://media.datahc.com', 'HI');
	HC.Common.StarRating
			.setTemplate('<p class="hc-hotelrating hc-hotelrating--{1}" title="{2}"><span class="hc-hotelrating__value hc-hotelrating__value--{0}"></span></p>');

	HC.Common.setDevice({
		webBrowserType : 2,
		webBrowserMajorVersion : 56,
		os : 5
	});
</script>
<script>
	function deletecheck() {
		return confirm("해당 상품을 삭제하시겠습니까?");
	}
</script>
<script type="text/javascript">
	HC._currentServerTime = new Date(2017, 2, 8, 7, 16, 25, 239);

	$.datepicker.regional['ko'] = {
		closeText : '종료',
		prevText : '이전',
		nextText : '다음',
		currentText : '오늘',
		monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월",
				"10월", "11월", "12월" ],
		monthNamesShort : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
				"11", "12" ],
		dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
		dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
		dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
		weekHeader : 'Wk',
		dateFormat : 'yy\u0027년\u0027 m\u0027월\u0027 d\u0027일\u0027 DD',
		shortDateFormat : 'm\u0027월\u0027 d\u0027일\u0027',
		firstDay : 0,
		isRTL : false,
		showMonthAfterYear : true,
		yearSuffix : ''
	};

	$.datepicker.setDefaults($.datepicker.regional['ko']);
	HC.DateSelection.setCulture('ko');
	HC.DateSelection
			.init(HC._currentServerTime, '[Day]일', '[Year]년 [MonthNo]월');
	HC.Translations
			.set([
					[ 'DatedropdownMonthYearFormat',
							'[InsertMonthName] \u0027[InsertShortYear]' ],
					[ 'DatedropdownMonth', '-월' ],
					[ 'DatedropdownDay', '-일' ],
					[ 'DatedropdownMonthYearLongFormat',
							'[InsertYear]년 [InsertMonthName]' ],
					[ 'DatedropdownSelectMonthLabel', '월을 선택하세요:' ],
					[ 'JavaScriptEnsureCheckoutAfterCheckin',
							'체크아웃 날짜가 체크인 날짜보다 이후인지 확인하세요.' ],
					[ 'JavaScriptPeriodOfStay', '투숙 기간은 최대 30일을 초과할 수 없습니다.' ],
					[ 'JavaScriptBookWithinOneYear', '미리 예약은 최대 12개월까지만 가능합니다.' ],
					[ 'JavaScriptEnterCheckinCheckout', '체크인/체크아웃 날짜를 입력하세요.' ],
					[ 'JavaScriptCheckoutCheckinInFuture',
							'예정 체크인 및 체크아웃 날짜를 확인하시기 바랍니다.' ],
					[ 'EnterCorrectNumberOfChars', '최소 3자의 도시 이름을 입력하세요' ],
					[ 'JavaScriptSearching', '검색 중<span></span>' ],
					[ 'RoomConfigEnterAllAges', '동반입장하는 어린이의 나이를 기재해 주세요' ],
					[ 'RoomConfigEnterAgeOfChild', '어린이의 나이를 명시하세요' ],
					[ 'RoomConfigAgesBetween', '어린이는 만 0-17살 이하 여야 합니다' ],
					[ 'RoomConfigAtLeast1Adult1Child', '최소 한명의 어른이나 어린이를 명시하세요' ],
					[ 'HotelPageChangeDatesMessage', '아래 검색 세부사항을 변경하세요' ],
					[ 'AutoSuggestionBrowseText', '국가별검색' ],
					[ 'AutoSuggestionMoreOptions',
							'\u0027[InsertTerm]\u0027 결과 더 보기' ],
					[ 'ZeroHotels', '0개 호텔' ],
					[ 'GeoLocationCurrentLocation', '현재 내 위치' ],
					[ 'GeoLocationCurrentlyNotAvailable',
							'위치를 확인할 수 없습니다. 위치 설정을 업데이트하세요.' ],
					[ 'GeoLocationRetrievingLocation', '현재 위치 확인중' ],
					[ 'CalendarFooter',
							'[Checkin] - [Checkout] ([NumberOfNights]박)' ],
					[ 'CheckinDate', '체크인 날짜' ], [ 'CheckoutDate', '체크아웃 날짜' ],
					[ 'GeoLocationAroundMyCurrentLocation', '나의 현재위치 주변' ] ]);

	HC.SearchBox.init({
		defaultCheckin : '',
		defaultCheckout : '',
		rooms : [ {
			"adults" : 2
		} ],
		useSimpleAutocomplete : false,
		isAlgoliaTarget : true,
		useAlternateSource : false,
		indexVersion : 'a1'
	});
</script>

<script>
	(function() {
		var experiments = [];
		var experimentSeenScripts = [
				"HC.Map.mapSeenFilter = function(){\r\nHC.Common.setExperimentSeen(426)\r\n}",
				"HC.Map.mapSeenDisconnectedMobile = function(){\r\nHC.Common.setExperimentSeen(429)\r\n}",
				"HC.Hotel.Map.setSeenLightboxMap = function(){\r\nHC.Common.setExperimentSeen(432)\r\n}" ];
		HC.JsEvaluator.add.apply(HC.JsEvaluator.add, experiments);
		HC.JsEvaluator.add.apply(HC.JsEvaluator.add, experimentSeenScripts);
		HC.JsEvaluator.process();
	})();
</script>

<script>
	HC.UserContext.add({
		'isAuthenticated' : false,
		'pageName' : 'PlaceLanding',
		'platform' : 'DesktopWeb',
		'countryFileName' : 'South_Korea',
		'placeFileName' : 'Jeju',
		'hotelFileName' : '',
		'currencyCode' : 'KRW',
		'languageCode' : 'KO',
		'deviceCategory' : 'Desktop',
		'webBrowserType' : 'Chrome',
		'deviceOs' : 'Windows'
	});

	$(function() {

		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'//www.google-analytics.com/analytics.js', '__hcgaInternal');

		window.__hcga = function() {
			var commandName = arguments[0], args = Array.prototype.slice.call(
					arguments, 1);

			__hcgaInternal.apply(window, $.merge([ commandName ], args));
			__hcgaInternal.apply(window, $.merge([ 'registrationtracker.'
					+ commandName ], args));
		}

		var customDimensions = {
			"dimension3" : "104707",
			"dimension4" : "292000",
			"dimension1" : "PrivateBranding",
			"dimension20" : "00010101-00010101",
			"dimension8" : "South_Korea",
			"dimension10" : "KRW",
			"dimension16" : "00090Y000A0Y01571N01700N017B1N017F1N01890N01920N019A1N019B1N019C1N019F1N01A41N01A70N01A80N01A91N01AA1N01AC1N01AD1N01B00N01B11N01B20N",
			"hostname" : "hotels.tourtips.com",
			"dimension15" : 0,
			"dimension5" : "desktop",
			"dimension9" : "KO",
			"dimension6" : "PlaceLanding",
			"dimension7" : "Jeju",
			"dimension2" : "DesktopWeb"
		};

		__hcgaInternal('create', 'UA-40537616-1', {
			'storage' : 'none',
			'clientId' : '58f1e449-f20d-435a-b575-1c00b6bc8fbd',
			'userId' : ''
		});
		__hcgaInternal('create', 'UA-71354387-2', {
			'storage' : 'none',
			'clientId' : '58f1e449-f20d-435a-b575-1c00b6bc8fbd',
			'userId' : '',
			name : 'registrationtracker'
		});

		__hcga('set', customDimensions);
		__hcga('require', 'displayfeatures');

		if (window.location.hostname === "redirect.datahc.com") {
			__hcga('set', 'referrer', 'referrer.datahc.com');
		}

		HC.GoogleUA.sendPageView();

		__hcga('require', 'ec');

		HC.GoogleUA.init();

	});
</script>


<script type="text/javascript">
	HC.Errors
			.init(
					'\u003cp class=\u0027hc_f_t_err2 hc_f_error\u0027\u003e\u003cspan class=\u0027hc_icon\u0027\u003e!\u003c/span\u003e\u003cem\u003e[InsertMessage]\u003c/em\u003e\u003c/p\u003e',
					'\u003cp class=\u0027hc_info\u0027\u003e\u003cspan class=\u0027hc_icon\u0027\u003e참고\u003c/span\u003e\u003cem\u003e[InsertMessage]\u003c/em\u003e\u003c/p\u003e');
</script>



<script type="text/javascript"
	src="https://cdn.datahc.com/Script/Bundles/CitySearch?v=mzImAbVPR0CqWk-OT6SLKOHaBmdKweUNBUZK7U9LOLI1
&cdn=1.0.2017.065002"></script>


<script>
	HC.LandingPage.init('/Place/Jeju_1.htm');
</script>

<style type="text/css">
#hc_banner .hc_m_outer {
	background: url(https://media.datahc.com/PL24266.jpg?v=1.0.2017.065002)
		no-repeat center center;
}

#autocomplete {
	width: 200px;
	height: 30px;
	float: right;
}

#controls {
	width: 80px;
	height: 30px;
	float: right;
}

#country {
	width: 80px;
	height: 30px;
}

#map {
	height: 400px;
}

#map {
	width: 780px;
}

</style>
</head>
<body class="hc_page_landing hc_lang_ko hc_cur_krw hc_os_windows hc_r_layout_v8_full hc_ab_48139 "
	onclick="void(0)">

	<script>
		HC.Breakpoints.init();
	</script>

	<script type="text/javascript">
		HC.RoomConfig.init($('#hc_template_roomConfig'));
	</script>

	<div id="hc_r_globalWrap" class="hc_r_layout_v8_full">




		<style>
.ui-widget-header {
	color: #fff !important;
}

#hc_bodyElements .ui-datepicker-multi .ui-datepicker-next {
	color: #999999 !important;
}

#hc_bodyElements .ui-datepicker-multi .ui-datepicker-before {
	color: #999999 !important;
}
</style>

		<!-- fixes on 21 july 2014 -->
		<style type="text/css">
#hc_changeSearch .hc_m_close {
	color: #fff !important;
}
</style>

		<style>
#hc_r_globalWrap {
	margin-top: -2px;
}

#hc_mobileRedirect {
	height: 0px;
}

.hc_strip {
	width: 100%;
	min-width: 1090px
}
</style>

		<script>
			HC.MainNavigation.setCreateListModal(HC.Common
					.scriptPreviousSibling());
		</script>

		<script type="text/javascript">
			(function() {
				var navigationHolder = $('#hc_evt_settings_buttons');
				HC.MainNavigation
						.init(
								navigationHolder,
								{
									buttonContainer : navigationHolder,
									containers : [
											$("#hc_evt_settings_currency"),
											$("#hc_evt_settings_language"),
											$("#hc_evt_settings_languageRecommendation") ],
									popoverContainers : [
											$("#hc_evt_settings_currency"),
											$("#hc_evt_settings_language"),
											$("#hc_evt_settings_accountMenu") ],
									ajaxGet : {
										wishlist : '/WishList/List',
										searchHistory : '/SearchHistory/List',
										recentlyViewed : '/ViewedHotels/List',
										lists : '/HotelList/ListsSummary?redirectIfSingleList=true',
										hotDeals : '/HottestDeals/List'
									}
								});
			})();
		</script>

		<div id="hc_r_1">

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
				})(window, document, 'script',
						'//www.google-analytics.com/analytics.js', 'ga');
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
					var f = d.getElementsByTagName(s)[0], j = d
							.createElement(s), dl = l != 'dataLayer' ? '&l='
							+ l : '';
					j.async = true;
					j.src = '//www.googletagmanager.com/gtm.js?id=' + i + dl;
					f.parentNode.insertBefore(j, f);
				})(window, document, 'script', 'dataLayer', 'GTM-M8XMTD');
			</script>
			<script type="text/javascript"
				src="//img.tourtips.com/js/cm/jquery-1.11.2.min.js?utv=0002216"></script>
			<script type="text/javascript"
				src="//img.tourtips.com/js/cm/common.js?utv=0002216"></script>
			<script type="text/javascript" src="/css/js"></script>
			<script type="text/javascript"
				src="//img.tourtips.com/js/cm/anythingslider.js?utv=0002216"></script>

			</head>

			<body>
				<div id="wrap">
					<style>
.up_close {
	background: url(//img.tourtips.com/images/common/close_btn_b.png)
		no-repeat right center;
	position: absolute;
	width: 38px;
	height: 37px;
	top: 15px;
	right: 30px;
	cursor: pointer
}
</style>


					<script>
						function TTNBClick() {
							setCookie('TTNB_219', '0', '1');
							$('.ttnb').hide();
						}
					</script>
					<hr>
					<!-- subWrap -->
					<div id="subWrap">

						<!-- contentWrap -->
						<div id="contentWrap" align="left">

							<!-- hotelSearchArea -->
							<div class="hotelSearchArea">
								<!-- searchForm -->
								<link rel="stylesheet" type="text/css"
									href="//img.tourtips.com/css/pc/jquery-ui.css?v=0002216">
								<link rel="stylesheet" type="text/css"
									href="//img.tourtips.com/css/pc/searchHotel.css?v=0002216">

								<!-- searchHotel -->
								<div class="searchHotel" id="defaultForm">
									<form method="post" action="ListHotel.action"
										class="searchHotelForm">
										<input type="hidden" name="n"
											value="<s:property value="%{n}"/>" />

										<fieldset>

											<legend>호텔 검색</legend>

											<!-- hotelTop -->
											<div class="hotelTop">

												<!-- destiny -->
												<div class="destiny">
													<label for="originplace">호텔 &nbsp;&nbsp;검색</label> <a
														href="ListHotel.action?n=0">[전체 보기]</a>&nbsp;&nbsp;&nbsp;<a
														href="#region">[지역별]</a> <br />
													<div class="inputWrap">
														<input type="text" id="search" name="search"
															placeholder="도시, 지역, 혹은 호텔명"> <span
															class="border"></span>
													</div>
												</div>
												<!-- //destiny -->

												<!-- dateArea -->
												<div class="dateArea">
													<div class="date" id="checkinform">
														<label for="checkin">체크인</label>
														<div class="inputWrap">
															<input type="text" id="checkin" name="checkin"
																placeholder="날짜 선택" title="날짜 선택" autocomplete="off"
																readonly="readonly" tabindex="12"> <span
																class="border"></span>
														</div>
													</div>
													<div class="date arrival" id="checkoutform">
														<label for="checkout">체크아웃</label>
														<div class="inputWrap">
															<input type="text" id="checkout" name="checkout"
																placeholder="날짜 선택" title="날짜 선택" autocomplete="off"
																readonly="readonly" tabindex="13"> <span
																class="border"></span>
														</div>
													</div>

												</div>
												<div class="addBox">
													<label for="checkin">객실</label>
													<div class="selectWrap">
														<input type="text" id="adult" name="rn"
															placeholder="객실을 선택하세요">
														<ul class="roomList">
															<li>1</li>
															<li>2</li>
															<li>3</li>
															<li>4</li>
															<li>5</li>
															<li>6</li>
															<li>7</li>
															<li>8</li>
															<li>9</li>
															<li>10</li>
														</ul>
														<span class="border"></span>
													</div>
													<div class="selectWrap">
														<input type="text" id="child" name="pn"
															placeholder="인원을 선택하세요.">
														<ul class="roomList">
															<li>1</li>
															<li>2</li>
															<li>3</li>
															<li>4</li>
															<li>5</li>
															<li>6</li>
															<li>7</li>
															<li>8</li>
															<li>9</li>
															<li>10</li>
														</ul>
														<span class="border"></span>
													</div>
												</div>
											</div>

											<!-- hotelBottom -->
											<div class="hotelBottom">
												<div class="searchBtn">
													<button type="button" class="resetBtn">초기화</button>
													<button type="submit" id="btnHotelSearch"
														class="btnFlightsSearch" tabindex="17">검색</button>
												</div>
												<p class="warning" style="display: none;">체크아웃 날짜가 체크인
													날짜보다 뒤에 있는지 확인해 보세요!</p>
											</div>
											<!-- //hotelBottom -->

										</fieldset>

									</form>
								</div>

								<script type="text/javascript"
									src="//img.tourtips.com/js/util/placeholders.min.js?v=0002216"></script>
								<!-- add placeholder -->
								<script type="text/javascript"
									src="//img.tourtips.com/js/util/jquery.ui.datepicker.js?v=0002216"></script>
								<script type="text/javascript"
									src="//img.tourtips.com/js/util/hotel.search.v2.js?v=0002216"></script>
								<script>
									$(document)
											.ready(
													function() {
														hotels_search_lib
																.init('defaultForm');
														$(function() {
															//숙박 예정일 미정
															$(
																	".hotelBottom .chooseOption label")
																	.on(
																			"click",
																			function() {
																				$(
																						this)
																						.toggleClass(
																								"on");
																			});

														})
													});
								</script>
							</div>
						</div>
					</div>

					<script type="text/javascript">
						$(".qnaTab a").off('click');
						$(".qnaTab a").on('click', function(e) {
							var $this = $(this);
							var _gid = $this.data('id');

							$(".qnaTab a").removeClass('on');
							$this.addClass('on');

							$(".qnaList li").hide();
							$(".qnaList li[name=list_" + _gid + "]").show();
							$(".qnaList").removeClass("goLink");
							if (_gid == 3) {
								$(".qnaList").addClass("goLink");
							}
						});

						$(".qnaList a[name=openDesc]").off("click");
						$(".qnaList a[name=openDesc]").on("click", function(e) {
							var $this = $(this);
							var $li = $this.parents("li");

							$(".qnaList .answerBox").slideUp('fast');
							$li.siblings().removeClass("open");

							if ($li.hasClass("open")) {
								$li.removeClass("open");
								$li.find(".answerBox").slideUp('fast');
							} else {
								$li.addClass("open");
								$li.find(".answerBox").slideDown("fast");
							}
						});
					</script>
				</div>
				<div id="hc_inAround" class="hc_m_v1">
					<b class="b1h"></b><b class="b2h"></b><b class="b3h"></b><b
						class="b4h"></b>
					<div class="hc_m_outer">
						<div class="hc_m_hd"></div>
						<div class="hc_m_content">
							<h3>
								<span class="hc_t_placesnear hc_icon"></span>지역별 정렬<a
									href="ListHotel.action">[전체보기]</a><a name="region" />
							</h3>
							<ul>
								<li>
									<h2>
										<a href="ListHotel.action?n=1"
											data-ceid="placelanding_relatedplace">서울</a>
									</h2>
								</li>
								<li>
									<h2>
										<a href="ListHotel.action?n=2"
											data-ceid="placelanding_relatedplace">부산</a>
									</h2>
								</li>
								<li>
									<h2>
										<a href="ListHotel.action?n=3"
											data-ceid="placelanding_relatedplace">제주</a>
									</h2>
								</li>
								<li>
									<h2>
										<a href="ListHotel.action?n=4"
											data-ceid="placelanding_relatedplace">광주</a>
									</h2>
								</li>
								<li>
									<h2>
										<a href="ListHotel.action?n=5"
											data-ceid="placelanding_relatedplace">강원</a>
									</h2>
								</li>
								<li>
									<h2>
										<a href="ListHotel.action?n=6"
											data-ceid="placelanding_relatedplace">경주</a>
									</h2>
								</li>
							</ul>

						</div>
						<div class="hc_m_ft"></div>
					</div>
					<b class="b4bh"></b><b class="b3bh"></b><b class="b2bh"></b><b
						class="b1h"></b> <br />
					<script type='text/javascript'
						src='http://media.datahc.com/Affiliates/104707/Brands/Script/hc_scripts.min.js'></script>

					<script>
						(function(i, s, o, g, r, a, m) {
							i['GoogleAnalyticsObject'] = r;
							i[r] = i[r] || function() {
								(i[r].q = i[r].q || []).push(arguments)
							}, i[r].l = 1 * new Date();
							a = s.createElement(o), m = s
									.getElementsByTagName(o)[0];
							a.async = 1;
							a.src = g;
							m.parentNode.insertBefore(a, m)
						})
								(
										window,
										document,
										'script',
										'//www.google-analytics.com/analytics.js',
										'ga');

						ga('create', 'UA-38984076-1', 'auto');
						ga('send', 'pageview');
					</script>
					<script>
						(function(w, d, s, l, i) {
							w[l] = w[l] || [];
							w[l].push({
								'gtm.start' : new Date().getTime(),
								event : 'gtm.js'
							});
							var f = d.getElementsByTagName(s)[0], j = d
									.createElement(s), dl = l != 'dataLayer' ? '&l='
									+ l
									: '';
							j.async = true;
							j.src = '//www.googletagmanager.com/gtm.js?id=' + i
									+ dl;
							f.parentNode.insertBefore(j, f);
						})(window, document, 'script', 'dataLayer',
								'GTM-WCFKXT');
					</script>
					<div id="locationField">
						<input id="autocomplete" placeholder="도시명을 입력하세요." type="text" />
					</div>

					<div id="map"></div>

					<div id="listing">
						<table id="resultsTable">
							<tbody id="results"></tbody>
						</table>
					</div>

					<div style="display: none">
						<div id="info-content">
							<table>
								<tr id="iw-url-row" class="iw_table_row">
									<td id="iw-icon" class="iw_table_icon"></td>
									<td id="iw-url"></td>
								</tr>
								<tr id="iw-address-row" class="iw_table_row">
									<td class="iw_attribute_name">Address:</td>
									<td id="iw-address"></td>
								</tr>
								<tr id="iw-phone-row" class="iw_table_row">
									<td class="iw_attribute_name">Telephone:</td>
									<td id="iw-phone"></td>
								</tr>
								<tr id="iw-rating-row" class="iw_table_row">
									<td class="iw_attribute_name">Rating:</td>
									<td id="iw-rating"></td>
								</tr>
								<tr id="iw-website-row" class="iw_table_row">
									<td class="iw_attribute_name">Website:</td>
									<a href=""><td id="iw-website"></td></a>
								</tr>
							</table>
						</div>
					</div>

					<script>
						// This example uses the autocomplete feature of the Google Places API.
						// It allows the user to find all hotels in a given place, within a given
						// country. It then displays markers for all the hotels returned,
						// with on-click details for each hotel.

						var map, places, infoWindow;
						var markers = [];
						var autocomplete;
						var countryRestrict = {
							'country' : 'seoul'
						};
						var MARKER_PATH = 'https://maps.gstatic.com/intl/en_us/mapfiles/marker_green';
						var hostnameRegexp = new RegExp('^https?://.+?/');

						var countries = {
							'seoul' : {
								center : {
									lat : 37.554133,
									lng : 126.990831
								},
								zoom : 14
							},
							'busan' : {
								center : {
									lat : 35.161642,
									lng : 129.047429
								},
								zoom : 14
							},
							'gwangju' : {
								center : {
									lat : 35.156873,
									lng : 126.835587
								},
								zoom : 14
							},
							'gangwon' : {
								center : {
									lat : 38.050586,
									lng : 128.607400
								},
								zoom : 14
							},
							'gyungju' : {
								center : {
									lat : 35.846646,
									lng : 129.216901
								},
								zoom : 14
							},
							'jeju' : {
								center : {
									lat : 33.487646,
									lng : 126.518139
								},
								zoom : 14
							},
							'sk' : {
								center : {
									lat : 36.562227,
									lng : 127.864659
								},
								zoom : 6
							},
						};

						function initMap() {
							map = new google.maps.Map(document
									.getElementById('map'), {
								zoom : countries['sk'].zoom,
								center : countries['sk'].center,
								mapTypeControl : false,
								panControl : false,
								zoomControl : false,
								streetViewControl : false
							});

							infoWindow = new google.maps.InfoWindow({
								content : document
										.getElementById('info-content')
							});

							// Create the autocomplete object and associate it with the UI input control.
							// Restrict the search to the default country, and to place type "cities".
							autocomplete = new google.maps.places.Autocomplete(
							/** @type {!HTMLInputElement} */
							(document.getElementById('autocomplete')), {
								types : [ '(cities)' ],
							});
							places = new google.maps.places.PlacesService(map);

							autocomplete.addListener('place_changed',
									onPlaceChanged);

							// Add a DOM event listener to react when the user selects a country.
							document.getElementById('country')
									.addEventListener('change',
											setAutocompleteCountry);
						}

						// When the user selects a city, get the place details for the city and
						// zoom the map in on the city.
						function onPlaceChanged() {
							var place = autocomplete.getPlace();
							if (place.geometry) {
								map.panTo(place.geometry.location);
								map.setZoom(16);
								search();
							} else {
								document.getElementById('autocomplete').placeholder = 'Enter a city';
							}
						}

						// Search for hotels in the selected city, within the viewport of the map.
						function search() {
							var search = {
								bounds : map.getBounds(),
								types : [ 'lodging' ]
							};

							places
									.nearbySearch(
											search,
											function(results, status) {
												if (status === google.maps.places.PlacesServiceStatus.OK) {
													clearResults();
													clearMarkers();
													// Create a marker for each hotel found, and
													// assign a letter of the alphabetic to each marker icon.
													for (var i = 0; i < results.length; i++) {
														var markerLetter = String
																.fromCharCode('A'
																		.charCodeAt(0)
																		+ i);
														var markerIcon = MARKER_PATH
																+ markerLetter
																+ '.png';
														// Use marker animation to drop the icons incrementally on the map.
														markers[i] = new google.maps.Marker(
																{
																	position : results[i].geometry.location,
																	animation : google.maps.Animation.DROP,
																	icon : markerIcon
																});
														// If the user clicks a hotel marker, show the details of that hotel
														// in an info window.
														markers[i].placeResult = results[i];
														google.maps.event
																.addListener(
																		markers[i],
																		'click',
																		showInfoWindow);
														setTimeout(
																dropMarker(i),
																i * 100);
														addResult(results[i], i);
													}
												}
											});
						}

						function clearMarkers() {
							for (var i = 0; i < markers.length; i++) {
								if (markers[i]) {
									markers[i].setMap(null);
								}
							}
							markers = [];
						}

						// [START region_setcountry]
						// Set the country restriction based on user input.
						// Also center and zoom the map on the given country.
						function setAutocompleteCountry() {
							var country = document.getElementById('country').value;
							if (country == 'all') {
								autocomplete.setComponentRestrictions([]);
								map.setCenter({
									lat : 36.562227,
									lng : 127.864659,
									radius : 1
								});
								map.setZoom(2);
							} else {
								autocomplete.setComponentRestrictions({
									'country' : country
								});
								map.setCenter(countries[country].center);
								map.setZoom(countries[country].zoom);
							}
							clearResults();
							clearMarkers();
						}
						// [END region_setcountry]

						function dropMarker(i) {
							return function() {
								markers[i].setMap(map);
							};
						}

						function addResult(result, i) {
							var results = document.getElementById('results');
							var markerLetter = String.fromCharCode('A'
									.charCodeAt(0)
									+ i);
							var markerIcon = MARKER_PATH + markerLetter
									+ '.png';

							var tr = document.createElement('tr');
							tr.style.backgroundColor = (i % 2 === 0 ? '#F0F0F0'
									: '#FFFFFF');
							tr.onclick = function() {
								google.maps.event.trigger(markers[i], 'click');
							};

						}

						function clearResults() {
							var results = document.getElementById('results');
							while (results.childNodes[0]) {
								results.removeChild(results.childNodes[0]);
							}
						}

						// Get the place details for a hotel. Show the information in an info window,
						// anchored on the marker for the hotel that the user selected.
						function showInfoWindow() {
							var marker = this;
							places
									.getDetails(
											{
												placeId : marker.placeResult.place_id
											},
											function(place, status) {
												if (status !== google.maps.places.PlacesServiceStatus.OK) {
													return;
												}
												infoWindow.open(map, marker);
												buildIWContent(place);
											});
						}

						// Load the place information into the HTML elements used by the info window.
						function buildIWContent(place) {
							document.getElementById('iw-icon').innerHTML = '<img class="hotelIcon" ' +
      'src="' + place.icon + '"/>';
							document.getElementById('iw-url').innerHTML = '<b><a href="' + place.url +
      '">'
									+ place.name + '</a></b>';
							document.getElementById('iw-address').textContent = place.vicinity;

							if (place.formatted_phone_number) {
								document.getElementById('iw-phone-row').style.display = '';
								document.getElementById('iw-phone').textContent = place.formatted_phone_number;
							} else {
								document.getElementById('iw-phone-row').style.display = 'none';
							}

							// Assign a five-star rating to the hotel, using a black star ('&#10029;')
							// to indicate the rating the hotel has earned, and a white star ('&#10025;')
							// for the rating points not achieved.
							if (place.rating) {
								var ratingHtml = '';
								for (var i = 0; i < 5; i++) {
									if (place.rating < (i + 0.5)) {
										ratingHtml += '&#10025;';
									} else {
										ratingHtml += '&#10029;';
									}
									document.getElementById('iw-rating-row').style.display = '';
									document.getElementById('iw-rating').innerHTML = ratingHtml;
								}
							} else {
								document.getElementById('iw-rating-row').style.display = 'none';
							}

							// The regexp isolates the first part of the URL (domain plus subdomain)
							// to give a short URL for displaying in the info window.
							if (place.website) {
								var fullUrl = place.website;
								var website = hostnameRegexp
										.exec(place.website);
								if (website === null) {
									website = 'http://' + place.website + '/';
									fullUrl = website;
								}
								document.getElementById('iw-website-row').style.display = '';
								document.getElementById('iw-website').textContent = website;
							} else {
								document.getElementById('iw-website-row').style.display = 'none';
							}
						}
					</script>
					<script
						src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCg17Y1nvbshN8vxBLsmTXpRBhKCxhcg70&libraries=places&callback=initMap"
						async defer></script>

				</div>
				<div class="hc_r_clear"></div>
		</div>

		<div id="hc_r_2">
			<div id="hc_r_2b">

				<div id="hc_popularHotels" class="hc_m_v13 hc_i_layout_v4 "
					data-ceid="placelanding_popularhotels">
					<br> <br> <br> <b class="b1h"></b><b class="b2h"></b><b
						class="b3h"></b><b class="b4h"></b>
					<div class="hc_m_outer">
						<div class="hc_m_hd">
							<h2>국내의 인기 호텔</h2>
						</div>
						<div class="hc_m_content">
							<s:iterator value="Hotellist" status="stat">
								<div class="hc_sri hc_m" data-filename="December_Hotel_Jeju">
									<div class="hc_i_wrapper">
										<div class="hc_i">
											<h3>
												<strong><s:property value="name" /></strong></a>
											</h3>

											<a href="SelectHotel.action?no=<s:property value="no"/>"
												class="hc_i_photo"><img src="/khtour/img2/<s:property value="image1"/>"
												data-pid="274937174,350,202," /></a>
											<dl>
												<dt class="hc_i_addr">주소</dt>
												<dd class="hc_i_addr">
													<s:property value="region" />
													,
													<s:property value="country" />
												</dd>
												<dd class="hc_i_usrRating">
													<s:if test="%{grade == 1}">
														<li class="star"><img src="/khtour/img/stars1.png"
															width="100px" height="25px" /></li>
													</s:if>
													<s:elseif test="%{grade == 2}">
														<li class="star"><img src="/khtour/img/stars2.png"
															width="100px" height="25px" /></li>
													</s:elseif>
													<s:elseif test="%{grade == 3}">
														<li class="star"><img src="/khtour/img/stars3.png"
															width="100px" height="25px" /></li>
													</s:elseif>
													<s:elseif test="%{grade == 4}">
														<li class="star"><img src="/khtour/img/stars4.png"
															width="100px" height="25px" /></li>
													</s:elseif>
													<s:elseif test="%{grade == 5}">
														<li class="star"><img src="/khtour/img/stars5.png"
															width="100px" height="25px" /></li>
													</s:elseif>
													<s:elseif test="%{grade == 0}">
														<li class="star"><img src="/khtour/img/post.png"
															width="120px" height="30px" /></li>
													</s:elseif>
												</dd>
												<br>
												<dd class="hc_i_booking">
													<span>가격 </span><b><font size="5" color="#f37720"><s:property
																value="price" /></font></b><span>원</span>
												</dd>
												<br>
												<dt class="hc_i_price"></dt>
												<dd class="hc_i_price">
													<span><a
														href="SelectHotel.action?no=<s:property value="no"/>">상품
															보기</a></span>
												</dd>
												<s:if
													test="#session.admincheck == 1 || #session.admincheck == 11">
													<a
														href="ModifyHotelForm.action?no=<s:property value="no"/>">수정</a>&nbsp;&nbsp;&nbsp;/
												&nbsp;&nbsp;&nbsp;<a
														href="DeleteHotel.action?no=<s:property value="no"/>"
														onclick="return deletecheck()">삭제</a>
												</s:if>
												<dt class="hc_i_photos">사진</dt>
												<dd class="hc_i_photos">
													<ul>
														<li class="hc_i_photos_0"><a
															href="javascript:void(0);"><img
																data-pid="274937175,350,201,"
																src="https://media.datahc.com/Z1668758.jpg?v=-950563767"
																alt="" /></a></li>
														<li class="hc_i_photos_1"><a
															href="javascript:void(0);"><img
																data-pid="274937176,350,201,"
																src="https://media.datahc.com/Z1668758.jpg?v=-950563767"
																alt="" /></a></li>
														<li class="hc_i_photos_2"><a
															href="javascript:void(0);"><img
																data-pid="274937177,263,350,"
																src="https://media.datahc.com/Z1668758.jpg?v=-950563767"
																alt="" /></a></li>

													</ul>
													<div class="cDiv"></div>
												</dd>
											</dl>
											<div class="cDiv"></div>
										</div>
									</div>
								</div>
							</s:iterator>

							<div class="hc_f_btnWrap">
								<s:property value="pagingHtml" escape="false" />
							</div>
						</div>
						<div class="hc_m_ft"></div>
					</div>
					<b class="b4bh"></b><b class="b3bh"></b><b class="b2bh"></b><b
						class="b1h"></b>
				</div>

				<div id="hc_viewedHotels" class="hc_m_v7 hc_i_layout_v1"></div>

				<div class="hc_r_clear"></div>
			</div>
			<div class="hc_r_clear"></div>
		</div>

		<div id="hc_r_4">
			<div class="hc_r_clear"></div>
		</div>

		<div class="hc_r_clear"></div>
	</div>
	<!-- end hc_r_content -->

	<div class="cDivBoth">
		<!-- for ui -->
	</div>


</body>

</html>
