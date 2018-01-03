<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="ko">
<head>
<!-- 파일 업로드 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">


<link rel="shortcut icon" href="/favicon.ico" />
<link href="//www.facebook.com/tourtipsguide" rel="publisher" />

<title>KH투어 - 상품 등록</title>
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/common.css?utv=0002216" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/community.css?utv=0002216" />
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
	src="//img.tourtips.com/js/cm/jquery-1.11.2.min.js?utv=0002216"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/cm/common.js?utv=0002216"></script>
<script type="text/javascript"
	src="/css/js"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/cm/tourtips-api.js?utv=0002216"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/cm/fb_function.js?utv=0002216"></script>
</head>

<body>
<jsp:include page="/item/SideBar.jsp" flush="false" />
	<div id="wrap">
		<script>
			function TTNBClick() {
				setCookie('TTNB_219', '0', '1');
				$('.ttnb').hide();
			}
		</script>

		<!-- subWrap -->
		<div id="subWrap">

			<!-- lnb -->
			<div class="lnb">
				<h1 class="lnbTitle">상품 등록</h1>
				<ul>
					<li class=""><a href="AdminAirWriteForm.action"><h4>항공 상품</h4></a></li>
					<li class=""><a href="AdminHotelWriteForm.action"><h4>호텔 상품</h4></a></li>
					<li class=""><a href="AdminItemWriteForm.action"><h4>여행 상품</h4></a></li>
				</ul>



			</div>
			<!-- //lnb -->
			<!-- contents -->
			<div class="contents">

				<h2 class="titleSt02">여행 상품 등록</h2>


				<!-- writeWrap -->
				<div class="formtag">

					<s:form action="AdminItemWrite" method="POST" name="form"
						enctype="multipart/form-data">
					 	<s:hidden name="hai" value="여행" />
						<s:hidden name="readcount" value="0"/>
						<s:hidden name="amount" value="0"/>
						<s:hidden name="grade" value="0"/>
						<s:hidden name="cocount" value="0"/>
						<tr><td><br/><br/><th>제목</th>
							<s:textfield name="name" cssStyle="height:35px; width:400px;"/></td>
						</tr>
						<tr>
						</tr>
						<tr><td><br/><br/><th>국가</th>
							<s:textfield name="country" value="대한민국, 한국" cssStyle="height:35px; width:400px;"/></td>
						</tr>
						<tr>
						</tr>
						<tr><td><br/><br/><th>지역</th>
							<s:textfield name="region" cssStyle="height:35px; width:400px;"/></td>
						</tr>
						<tr>
						</tr>
						<tr><td><br/><br/><th>가격</th>
							<s:textfield name="price" value="" cssStyle="height:35px; width:150px;"/></td>
						</tr>
						<tr>
						</tr>
						<tr><td><br/><br/><th>상품소개<th>
							<s:textfield name="content" cssStyle="height:120px; width:400px;"/></td>
						</tr>
						<br/>
						<tr>
						</tr> 
						<tr>
							<td><br/><br/><th>상품이미지</th></td>
							<s:file name="image1" />
							<s:file name="image1" />
							<s:file name="image1" />
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="등록" /> <input type="reset"
								value="다시작성" /> <input type="button"
								value="취소" 
								onclick="javascript:location.href='ListItem.action'" /></td>
						</tr>
					</s:form>
				</div>

				<!-- //writeWrap -->





			</div>
			<!-- //contents -->

		</div>
		<!-- //subWrap -->
	</div>
	<script type="text/javascript"
		src="//img.tourtips.com/js/mario.util.js?utv=0002216"></script>
	<script type="text/javascript"
		src="//img.tourtips.com/js/pc/util/tag.js?utv=0002216"></script>

	<script type="text/javascript">
		
	</script>
</body>
</html>

