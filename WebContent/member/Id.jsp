<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<link rel="shortcut icon" href="/favicon.ico" />
<link href="//www.facebook.com/tourtipsguide" rel="publisher" />


<title>아이디찾기/비밀번호찾기</title>
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/common.css?utv=0002219" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/default.css?utv=0002219" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/member.css?utv=0002219" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/member.css?utv=0002217" />

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
<script type="text/javascript"
	src="//img.tourtips.com/js/cm/jquery-1.11.2.min.js?utv=0002219"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/cm/common.js?utv=0002219"></script>
<script type="text/javascript" src="/css/js"></script>
<script type="text/javascript"
	src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js?utv=0002219"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/default.js?utv=0002219"></script>
<script>
	
</script>
</head>

<body>
<jsp:include page="../item/SideBar.jsp" flush="false" />
	<div id="u_skip">
		<a href="#container"
			onclick="document.getElementById('container').focus();return false;">컨텐츠
			바로가기</a>
	</div>
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

		<!-- container area -->
		<div id="container">
			<div id="content">
				<div class="body">
					<div class="lnb">
						<!-- 카테고리분류 -->
						<ul class="city_name">
							<li class="city"><img
								src="//img.tourtips.com/images/common/lnb/myinfo.png"
								alt="회원정보 관리" /></li>
						</ul>

					</div>
					<div class="sbody">
						<div class="user_info_edit">
							<div class="login_box">
								<table>
									<div>
										회원님의 아이디는 <span class="email_alpha"><s:property
												value="id" /></span> 입니다.
									</div>
								</table>
								<div class="nlogin_join_center">
									<button class="nlogin_btn" type="button"
										onclick="javascript:location.href='LoginForm.action'">확인</button>
								</div>
							</div>
						</div>

					</div>
					<script>
						document.getElementById('login_pw').focus();
					</script>
				</div>
			</div>
		</div>
		<!-- //container area -->
	</div>
	<script type="text/javascript"
		src="//img.tourtips.com/js/common.js?utv=0002219"></script>

	<script type="text/javascript">
		
	</script>
</body>
}
</html>

