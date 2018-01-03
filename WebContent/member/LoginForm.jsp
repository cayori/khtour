<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/favicon.ico" />
<link href="//www.facebook.com/tourtipsguide" rel="publisher" />

<title>로그인</title>
<link rel="stylesheet" type="text/css" href="//img.tourtips.com/css/pc/common.css?utv=0002217" />
<link rel="stylesheet" type="text/css" href="//img.tourtips.com/css/default.css?utv=0002217" />
<link rel="stylesheet" type="text/css" href="//img.tourtips.com/css/member.css?utv=0002217" />
<link rel="stylesheet" type="text/css" href="//img.tourtips.com/css/pc/member.css?utv=0002217" />
<!--[if lt IE 8]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE8.js"></script>
<![endif]-->
<script type="text/javascript">
document.domain = "tourtips.com";
</script>
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
//google analytics pc
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
ga('create', 'UA-38984076-1', 'auto');
ga('require', 'linkid', 'linkid.js');
ga('set', 'dimension4', 'www');
ga('send', 'pageview');

if(!wcs_add) var wcs_add = {};
wcs_add["wa"] = "2403236b48f994";
wcs_do();
</script>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-M8XMTD');</script><script type="text/javascript" src="//img.tourtips.com/js/cm/jquery-1.11.2.min.js?utv=0002217"></script>
<script type="text/javascript" src="//img.tourtips.com/js/cm/common.js?utv=0002217"></script>
<script type="text/javascript" src="/css/js"></script>
<script>
</script>

</head>

<body onLoad="getLogin()">
<div id="u_skip"><a href="#container" onclick="document.getElementById('container').focus();return false;">컨텐츠 바로가기</a></div><div id="wrap">
<style>
.up_close {background:url(//img.tourtips.com/images/common/close_btn_b.png) no-repeat right center; position:absolute; width:38px; height:37px; top:15px; right:30px; cursor:pointer}
</style>
<script>
/* function TTNBClick () {
        setCookie('TTNB_219', '0', '1');
        $('.ttnb').hide();
} */


</script>


<script>
  // SDK를 비동기적으로 호출
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/ko_KR/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  window.fbAsyncInit = function() {
	config = {appId:appid,cookie:true,xfbml:true,version:'v2.8'};
	// config = $.extend(config,option);
	// console.log(config);
	FB.init(config);
		$('#facebook-login-li').show();
  }
</script>

<script>var appid = "591083917570826";var scope = "email,user_birthday,publish_stream,read_friendlists,user_likes";</script>

<script src="/khtour/js/login.js"></script><!-- 공백 입력시 경고창 띄우게 하는 js파일 -->

<div id="container">
	<div id="content">
		<div class="body">
			<div class="lnb">
				<ul class="city_name">
				<br/>
					<li class="city"><img src="//img.tourtips.com/images/common/lnb/login.png" alt="로그인" /></li>
				</ul>
			</div>
			<div class="sbody">
				<div class="nlogin_total_box">
					<h3 class="nlogin_title">회원로그인</h3>
					
					<div class="nlogin_content">
						<div class="nlogin_input_content">
							<form name="form" method="post" action="LoginMember.action" onsubmit="return checklogin(this.form)">
								<fieldset>
									<table>
										<tr>
											<td>
												<p>
													<input type="text" name="id"  style="background:#FFF" placeholder="아이디">
												</p>
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<input type="password" name="password" style="background:#FFF" placeholder="비밀번호">
												</p>
											</td>
										</tr>
										
										<tr>
											<td>
											<br/>
												<p class="nlogin_form_section nlogin_form_check">
													<input type="checkbox" name="saveid" id="saveid" title="아이디 저장" onclick="confirmSave(this)">
													<label for="login_status">아이디 저장</label>
												</p>
											</td>
										</tr>
										<tr>
											<td>
												<p>
													<button class="nlogin_btn" type="submit" id="login_submit">로그인</button>
												</p>
											</td>
										</tr>
									</table>
								</fieldset>
							</form>
						</div>
					</div>
					<ul class="nlogin_link">
						<li><a href="JoinForm.action" id="members_join">가입하기</a></li>
						<li><a href="FindIdPw.action" id="members_recover">아이디 / 비밀번호 찾기</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<script type="text/javascript"><!-- 페이지 맨 위로 이동시켜주는 로직 -->
var nvDisplayType = "self";$("#person_20150818").show(); $("#terms_20161107").show();</script>
<button type="button" onclick="javascript:window.scrollTo(0, 0);" class="goTop"><img src="//img.tourtips.com/images/cm/img_goTop.png" alt="맨위로"></button>
<!-- 여기까지 -->
</body>
</html>