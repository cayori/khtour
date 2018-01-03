<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript">window.NREUM||(NREUM={}),__nr_require=function(e,t,n){function r(n){if(!t[n]){var o=t[n]={exports:{}};e[n][0].call(o.exports,function(t){var o=e[n][1][t];return r(o||t)},o,o.exports)}return t[n].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<n.length;o++)r(n[o]);return r}({1:[function(e,t,n){function r(){}function o(e,t,n){return function(){return i(e,[(new Date).getTime()].concat(u(arguments)),t?null:this,n),t?void 0:this}}var i=e("handle"),a=e(2),u=e(3),c=e("ee").get("tracer"),f=NREUM;"undefined"==typeof window.newrelic&&(newrelic=f);var s=["setPageViewName","setCustomAttribute","setErrorHandler","finished","addToTrace","inlineHit"],l="api-",p=l+"ixn-";a(s,function(e,t){f[t]=o(l+t,!0,"api")}),f.addPageAction=o(l+"addPageAction",!0),f.setCurrentRouteName=o(l+"routeName",!0),t.exports=newrelic,f.interaction=function(){return(new r).get()};var d=r.prototype={createTracer:function(e,t){var n={},r=this,o="function"==typeof t;return i(p+"tracer",[Date.now(),e,n],r),function(){if(c.emit((o?"":"no-")+"fn-start",[Date.now(),r,o],n),o)try{return t.apply(this,arguments)}finally{c.emit("fn-end",[Date.now()],n)}}}};a("setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),function(e,t){d[t]=o(p+t)}),newrelic.noticeError=function(e){"string"==typeof e&&(e=new Error(e)),i("err",[e,(new Date).getTime()])}},{}],2:[function(e,t,n){function r(e,t){var n=[],r="",i=0;for(r in e)o.call(e,r)&&(n[i]=t(r,e[r]),i+=1);return n}var o=Object.prototype.hasOwnProperty;t.exports=r},{}],3:[function(e,t,n){function r(e,t,n){t||(t=0),"undefined"==typeof n&&(n=e?e.length:0);for(var r=-1,o=n-t||0,i=Array(o<0?0:o);++r<o;)i[r]=e[t+r];return i}t.exports=r},{}],ee:[function(e,t,n){function r(){}function o(e){function t(e){return e&&e instanceof r?e:e?c(e,u,i):i()}function n(n,r,o){if(!p.aborted){e&&e(n,r,o);for(var i=t(o),a=v(n),u=a.length,c=0;c<u;c++)a[c].apply(i,r);var f=s[w[n]];return f&&f.push([y,n,r,i]),i}}function d(e,t){b[e]=v(e).concat(t)}function v(e){return b[e]||[]}function g(e){return l[e]=l[e]||o(n)}function m(e,t){f(e,function(e,n){t=t||"feature",w[n]=t,t in s||(s[t]=[])})}var b={},w={},y={on:d,emit:n,get:g,listeners:v,context:t,buffer:m,abort:a,aborted:!1};return y}function i(){return new r}function a(){(s.api||s.feature)&&(p.aborted=!0,s=p.backlog={})}var u="nr@context",c=e("gos"),f=e(2),s={},l={},p=t.exports=o();p.backlog=s},{}],gos:[function(e,t,n){function r(e,t,n){if(o.call(e,t))return e[t];var r=n();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(e,t,{value:r,writable:!0,enumerable:!1}),r}catch(i){}return e[t]=r,r}var o=Object.prototype.hasOwnProperty;t.exports=r},{}],handle:[function(e,t,n){function r(e,t,n,r){o.buffer([e],r),o.emit(e,t,n)}var o=e("ee").get("handle");t.exports=r,r.ee=o},{}],id:[function(e,t,n){function r(e){var t=typeof e;return!e||"object"!==t&&"function"!==t?-1:e===window?0:a(e,i,function(){return o++})}var o=1,i="nr@id",a=e("gos");t.exports=r},{}],loader:[function(e,t,n){function r(){if(!h++){var e=y.info=NREUM.info,t=l.getElementsByTagName("script")[0];if(setTimeout(f.abort,3e4),!(e&&e.licenseKey&&e.applicationID&&t))return f.abort();c(b,function(t,n){e[t]||(e[t]=n)}),u("mark",["onload",a()],null,"api");var n=l.createElement("script");n.src="https://"+e.agent,t.parentNode.insertBefore(n,t)}}function o(){"complete"===l.readyState&&i()}function i(){u("mark",["domContent",a()],null,"api")}function a(){return(new Date).getTime()}var u=e("handle"),c=e(2),f=e("ee"),s=window,l=s.document,p="addEventListener",d="attachEvent",v=s.XMLHttpRequest,g=v&&v.prototype;NREUM.o={ST:setTimeout,CT:clearTimeout,XHR:v,REQ:s.Request,EV:s.Event,PR:s.Promise,MO:s.MutationObserver},e(1);var m=""+location,b={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-998.min.js"},w=v&&g&&g[p]&&!/CriOS/.test(navigator.userAgent),y=t.exports={offset:a(),origin:m,features:{},xhrWrappable:w};l[p]?(l[p]("DOMContentLoaded",i,!1),s[p]("load",r,!1)):(l[d]("onreadystatechange",o),s[d]("onload",r)),u("mark",["firstbyte",a()],null,"api");var h=0},{}]},{},["loader"];</script>

<link rel="shortcut icon" href="/favicon.ico" />
<link href="//www.facebook.com/tourtipsguide" rel="publisher" />

<title>회원정보수정</title>
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/common.css?utv=0002219" />
<link rel="stylesheet" type="text/css"
	href="/khtour/css/input.css" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/module/jQuery-Tagit-master/css/tagit-stylish-yellow.css?utv=0002219" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/member.css?utv=0002219" />
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
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-M8XMTD');</script>
<script type="text/javascript"
	src="//img.tourtips.com/js/cm/jquery-1.11.2.min.js?utv=0002219"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/cm/common.js?utv=0002219"></script>
<script type="text/javascript" src="/css/js"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/jquery.1.7.2.min.js?utv=0002219"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/default.js?utv=0002219"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/jquery-ui.1.8.20.min.js?utv=0002219"></script>
<script type="text/javascript"
	src="//img.tourtips.com/module/jQuery-Tagit-master/js/tagit.js?utv=0002219"></script>
<script>
</script>

<script language="JavaScript" src="/khtour/js/confirm.js"></script><!-- 공백 입력시 경고창 띄우게 하는 js파일 -->

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
function TTNBClick () {
        setCookie('TTNB_219', '0', '1');
        $('.ttnb').hide();
}
</script>

		<style>
.join_table .item #subemail_help.i_wrong {
	width: 280px
}

.join_table .item #subemail_help.i_tip {
	left: 345px
}

.join_table .item #subemail_help.i_ok {
	left: 345px
}
</style>
		<!-- container area -->
		<div id="container">
			<div id="content">
				<div class="body">
					<div class="lnb">
						<!-- 카테고리분류 -->
						<br/><br/><br/>
						<ul class="city_name">
							<li class="city"><img
								src="//img.tourtips.com/images/common/lnb/myinfo.png"
								alt="회원정보 관리" /></li>
						</ul>
					</div>
					<div class="sbody">
					<s:property value="#sessionScope.id"/>
						<!-- 회원정보수정 -->
						<ul class="navigation nav-tabs" style="margin-top: 38px">
							<li class="active"><a href="javascript:void(0);">회원정보수정</a></li>
						</ul>
						<form name="form" method="post" action="ModifyMember.action" onsubmit="return checkmodify(this.form)">
							<div class="add_info">
								회원가입 시 입력했던 회원정보를 수정할 수 있습니다.
							</div>
							<div class="join_form" style="margin-top: 0">
							
								<!-- 회원가입테이블 -->
								<fieldset>
									<div class="join_table" style="padding-top: 15px">
										<table border="1" cellspacing="0" summary="회원가입 폼 작성">
											<colgroup>
												<col width="150px" />
												<col width="650px" />
											</colgroup>
											<tbody>
											<input type="hidden" name="id" value="<s:property value="#session.id"/>"/>
												<tr>
													<th scope="row">아이디</th>
													<td>
														<div class="item">
															<span><s:property value="#session.id"/></span>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">새 비밀번호</th>
													<td>
														<div class="item">
															<input type="password" name="newpassword" 
																class="i_text" maxlength="20" placeholder="비밀번호 변경 시 입력" style="height: 25px;"/>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">새 비밀번호 확인</th>
													<td>
														<div class="item">
															<input type="password" name="newpassword2"
																 title="새 비밀번호" class="i_text" maxlength="20" placeholder="비밀번호 변경 확인" style="height: 25px;"/> <span
																class="i_tip" id="newPassConfirm_help"
																style="display: none"><img
																src="//img.tourtips.com/images/join/tipbox.gif" alt="" />다시
																한번 입력하세요.</span>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">이름</th>
													<td>
														<div class="item">
														<s:property value="name"/>
														</div>
													</td>
												</tr>
												<tr>
												</tr>
												<tr>
													<th scope="row">이메일 
													</th>
													<td>
														<div class="item">
																<input type="text"
																name="email" id="subemail_id" class="i_text"
																style="width: 100px" value="${email}"/> 
																
																@ 
																
																<input type="text"
																name="email2" id="subemail_host" class="i_text"
																style="width: 100px" value="${email2}"/> 
																
																<select name="emailHost" id="emailHost"
																style="width: 85px; height: 27px">
																<option value="">-직접입력-</option>
																<option value="naver.com">naver.com</option>
																<option value="hanmail.net">hanmail.net</option>
																<option value="nate.com">nate.com</option>
																<option value="gmail.com">gmail.com</option>
																<option value="hotmail.com">hotmail.com</option>
																<option value="daum.net">daum.net</option>
																<option value="yahoo.com">yahoo.com</option>
															</select> 
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">연락처</th>
													<td>
														<div class="item">
														<input type="text" name="tel" value="${tel}"
																title="연락처" class="i_text" maxlength="11"/><!-- 숫자만 들어가게 구현해보자 -->
														</div>
													</td>
												</tr>
												<tr>
													<td scope="row" colspan="2" class="itemTd">
														<div class="item">
															<p class="i_dot"></p>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<p class="join_btn_group">
										<span class="join_btn"><button type="submit">수정</button></span>
									</p>
								</fieldset>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- //container area -->
		<script src="//www.tourtips.com/ap/members/json_city/"></script>
		<script src="//img.tourtips.com/js/members/join.js?utv=0002219"></script>
		<script src="//img.tourtips.com/js/members/modify.js?utv=0002219"></script>

	</div>
	<script type="text/javascript"
		src="//img.tourtips.com/js/common.js?utv=0002219"></script>
</body>
</html>


