<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>


<link rel="shortcut icon" href="/favicon.ico" />
<link href="//www.facebook.com/tourtipsguide" rel="publisher" />

<title>회원가입</title>
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/common.css?utv=0002217" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/default.css?utv=0002217" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/member.css?utv=0002217" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/member.css?utv=0002217" />
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
	src="//img.tourtips.com/js/cm/jquery-1.11.2.min.js?utv=0002217"></script>
<script type="text/javascript"
	src="//img.tourtips.com/js/cm/common.js?utv=0002217"></script>
<script type="text/javascript" src="/css/js"></script>


</head>

<body>
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

		<script language="JavaScript" src="/khtour/js/confirm.js"></script>
		<!-- 공백 입력시 경고창 띄우게 하는 js파일 -->



		<hr>

		<script>
			var appid = "591083917570826";
			var scope = "email,user_birthday,publish_stream,read_friendlists,user_likes";
			var step = "step1";
			var redirect = "https://www.tourtips.com/ap/helpdesk/question/";
			var fbouth = "";
		</script>
		
		
		<!-- 아이디 중복 체크 함수 -->
		<script>
		window.name = "joinwin";
		
		function confirmId(form) {
	        var idd = document.form.id.value;
			if (idd.length <= 5) {
	    		alert("아이디는 6자리 이상이어야 합니다.");
	    		document.form.id.focus();
	    		return false;
	    	}
	        // 아이디를 입력했는지 검사
			if ( idd == "") {
				alert("아이디를 입력하십시오.");
				document.form.id.focus();
				return false;
			}else if((idd < "0" || idd > "9") && (idd < "A" || idd > "Z") && (idd < "a"|| idd > "z")){
				alert("한글 및 특수문자는 사용할 수 없습니다.");
				return false;
			}
			
			var url = "ConfirmId.action?id=" + document.form.id.value;
	       
	        open(url, "confirm", "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
		}
		</script>
		
		
		<div id="container">
			<div id="content">
				<div class="body">
					<div class="lnb">
					<br/>
						<ul class="city_name">
							<li class="city"><img
								src="//img.tourtips.com/images/common/lnb/join.png"
								alt="회원가입 - 회원정보입력" /></li>
						</ul>
					</div>
					<div class="sbody">
						<form method="post" action="ConfirmEmail.action" name="form"
							onsubmit="return checkinput(this.form)" id="join_form"
							autocomplete="off">
							<fieldset>
								<div class="nlogin_total_box">
									<h3 class="nlogin_title nlogin_email_title">회원가입</h3>
									<div class="nlogin_content">
										<div class="email_member_join">
											<table class="nlogin_table" cellpadding="0" cellspacing="0">
												<colgroup>
													<col width="130" />
													<col width="*" />
												</colgroup>
												<tbody>
												<s:if test='%{confirmidcheck != "yes"}'>
													<tr>
														<td colspan="2">
															<div class="nlogin_form_section nlogin_form_text">
																<input type="text" name="id" id="join_id" title="아이디"
																	maxlength="10" placeholder="아이디 "/>
																	<input type="button" value="아이디 중복 확인" onclick="return confirmId(this.form)"/>
															</div><span class="nlogin_pass_info" id="join_name_helper">한글&nbsp;&nbsp;&nbsp;및&nbsp;&nbsp;&nbsp;특수문자&nbsp;&nbsp;사용&nbsp;&nbsp;불가</span>
																	<input type="hidden" name="confirmidcheck" value="no"/>
														</td>
													</tr>
													</s:if>
													<s:elseif test='%{confirmidcheck == "yes" }'>
													<tr>
														<td colspan="2">
															<div class="nlogin_form_section nlogin_form_text">
																<input type="text" name="id" id="join_id" title="아이디"
																	maxlength="10" value="${id}" />
																	<input type="button" value="아이디 중복 확인" onclick="return confirmId(this.form)"/>
																	<input type="hidden" name="confirmidcheck" value="yes"/>
															</div>
														</td>
													</tr>
													</s:elseif>
													<tr>
														<td colspan="2">
															<div class="nlogin_form_section nlogin_form_text">
																	<input type="password" name="password"
																	id="join_pw" title="비밀번호" placeholder="비밀번호" maxlength="20"/>
															</div>
															<div class="nlogin_form_section nlogin_form_text">
																	<input type="password" name="password2"
																	id="join_rpw" title="비밀번호 확인" placeholder="비밀번호확인" maxlength="20" />
															</div> 
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<div class="nlogin_form_section nlogin_form_text">
																	<input type="text" name="name"
																	id="join_name" title="이름" maxlength="20" placeholder="이름" />
															</div>
														</td>
													</tr>
													<tr>
														<td colspan="2" colspan="2">
															<div class="nlogin_form_section nlogin_form_text">
																<input type="text" name="email" id="subemail_id"
																	maxlength="20" placeholder="이메일"/> 
																	
																	<span class="email_alpha">@</span> 
																	
																	<input type="text" name="email2" id="subemail_host"
																	maxlength="20"/>
																	
															</div>
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<div class="nlogin_form_section nlogin_form_text">
																	<input type="text" name="tel" id="join_tel"
																	title="연락처" maxlength="11" placeholder="연락처"/>
															</div> <span class="nlogin_pass_info" id="join_name_helper">-
																생략하고 입력</span> <span class="nlogin_pass_info"
															id="join_name_helper"> ex)01077778888</span>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="agreeBox agreeAll">
									<input name="agree" type="checkbox" id="agreeAll"> <label
										for="agreeAll">이용약관, 개인정보 수집 및 이용에 모두 동의합니다. </label>
								</div>
								<div>
									<div class="nlogin_policy_wrap">
										<div class="nlogin_policy_check">
											<input name="check" type="checkbox" value="1" id="law_agree" />
											<label for="law_agree">이용약관에 동의<em>(필수)</em></label>
										</div>
										<div class="policy_content_wrap" id="terms_20161107"
											style="display: none;">
											<div class="fake_box"></div>
											<div class="policy_content">
												<p class="private_list_title">제1조 [목적]</p>
												<span>이 서비스 이용약관(이하 “약관”이라 합니다)은 ㈜KH투어(이하 “회사”라 합니다)가
													제공하는 서비스와 관련하여 회사와 회원 간에 서비스의 이용 조건 및 절차, 회사와 회원 간의 권리, 의무
													및 책임 사항 기타 필요한 사항을 규정함을 목적으로 합니다.</span>
												<p class="private_list_title">제2조 [용어의 정의]</p>
												<p>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
												<ol>
													<li>서비스: 이용 고객 또는 회원이 PC, TV, 휴대형 단말기 등 각종 유무선 기기 또는
														프로그램을 통하여 이용할 수 있도록 회사가 제공하는 모든 인터넷 서비스를 말하며, 회사가 공개한 API를
														이용하여 제3자가 개발 또는 구축한 프로그램이나 서비스를 통하여 회원에게 제공되는 경우를 포함합니다.</li>
													<li>회원: 회사의 서비스에 접속하여 이 약관에 따라 회사와 이용 계약을 체결하고 회사가
														제공하는 서비스를 이용하는 고객을 말합니다.</li>
													<li>이메일: 인터넷을 통한 우편 혹은 전기적 매체를 이용한 우편을 말합니다. 또 회원의 식별과
														서비스 이용을 위하여 회원이 정하는 아이디(ID)처럼 사용하는 것을 의미합니다.</li>
													<li>비밀번호: 회원이 부여받은 아이디와 일치되는 회원임을 확인하고 비밀보호를 위해 회원 자신이
														정한 문자 또는 숫자의 조합을 의미합니다.</li>
													<li>게시물: 회원이 서비스를 이용함에 있어 서비스상에 게시한 부호∙문자∙음성∙음향∙화상∙동영상
														등의 정보 형태의 글,사진,동영상 및 각종 파일과 링크 등을 의미합니다.</li>
													<li>운영자(관리자): 서비스의 전반적인 관리와 원활한 운영을 위하여 회사에서 선정한 사람 또는
														회사를 말합니다.</li>
													<li>가이드북과 맵북: 다운로드 받을 수 있는 PDF형태의 문서로 회사에서 회원에게 제공하는
														서비스를 의미합니다. 이는 회원이 다운로드 받아 인쇄하여 사용이 가능하고 회사에서도 배포가 가능합니다.</li>
												</ol>
												<p class="private_list_title">제3조 [약관의 효력 및 변경]</p>
												<ol>
													<li>이 약관은 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력이
														발생합니다.</li>
													<li>회사는 약관의 규제에 관한 법률, 전자상거래 등에서의 소비자보호에 관한 법률, 정보통신망
														이용촉진 및 정보보호 등에 관한 법률 등 관계법령에 위배되지 않는 범위 내에서 이 약관을 개정할 수
														있습니다.</li>
													<li>회사는 약관을 개정할 경우 그 개정 이유 및 적용 일자를 명시하여 현행 약관과 함께
														적용일자 7일전부터 적용일 전일까지 제1항의 방법으로 공지합니다. 다만, 회원의 권리 또는 의무에 관한
														중요한 규정의 변경은 최소한 30일 전에 공지하고 개정약관을 회원이 등록한 메일로 발송하여 통지합니다.</li>
													<li>회원은 변경된 약관에 동의하지 아니하는 경우 서비스의 이용을 중단하고 이용계약을 해지할 수
														있습니다</li>
													<li>회원은 약관의 변경에 대하여 주의의무를 다하여야 하며, 변경된 약관의 부지로 인한 회원의
														피해는 회사가 책임지지 않습니다.</li>
												</ol>
												<p class="private_list_title">제4조 [약관의 해석]</p>
												<span>이 약관에 명시되지 않은 사항에 대해서는 정보통신망 이용촉진 및 정보보호 등에 관한
													법률, 약관의 규제에 관한 법률, 전기통신사업법 등 관계법령 및 회사가 정한 세부이용지침 등의 규정에
													따릅니다.</span>
												<p class="private_list_title">제5조 [이용계약체결]</p>
												<ol>
													<li>서비스 이용계약은 이용고객이 이 약관 및 “개인정보처리방침”에 “동의합니다”를 선택하고,
														회사가 정한 신청양식을 작성하여 서비스의 이용을 신청한 후, 회사가 이를 승낙함으로써 성립합니다
														이용고객이 전항의 “동의합니다”를 선택하고 신청양식을 작성하는 것은 이 약관 및 “개인정보처리방침”의
														내용을 숙지하고, 회사가 서비스 이용을 위해 운영하는 각종 정책(예: 저작권 정책, 스팸 정책 등)과
														수시로 공지하는 사항을 준수하는 것에 대해 동의하는 것으로 봅니다.</li>
												</ol>
												<p class="private_list_title">제6조 [이용신청]</p>
												<ol>
													<li>회원이 신청양식에 기재하는 회원정보는 이용고객의 실제정보인 것으로 간주되고, 실제정보를
														입력하지 않은 회원은 법적인 보호를 받을 수 없으며 서비스 이용에 제한을 받을 수 있습니다.</li>
													<li>만14세 미만의 아동은 회사가 제공하는 서비스를 이용할 수 없습니다.</li>
													<li>타인의 개인정보를 도용하는 등 부정한 목적과 방법으로 이용신청을 한 회원의 ID는 사전
														통지없이 삭제될 수 있으며, 당해 회원은 관계 법령에 따라 처벌을 받을 수 있습니다.</li>
												</ol>
												<p class="private_list_title">제7조 [이용신청에 대한 승낙 및 제한]</p>
												<ol>
													<li>회사는 서비스의 이용을 신청한 이용고객에 대하여 업무상ㆍ기술상 지장이 없는 한 접수순서에
														따라 서비스의 이용을 승낙합니다.</li>
													<li>회사는 다음 각 호에 해당하는 이용신청에 대하여는 승낙을 하지 않을 수 있습니다.
														<ol>
															<li>기술상 서비스 제공이 불가능한 경우</li>
															<li>신청양식을 허위로 기재한 경우</li>
															<li>신청양식의 기재사항을 누락하거나 오기하여 신청하는 경우</li>
															<li>사회의 안녕과 질서 또는 미풍양속을 저해하거나 저해할 목적으로 신청한 경우</li>
															<li>회원의 귀책사유에 의하여 회원자격을 상실한 적이 있는 경우. 다만, 자격상실 후 6개월
																이상 경과한 자로 회사의 회원 재가입 승낙을 받은 경우는 예외로 합니다.</li>
															<li>기타 회사가 정한 이용조건에 충족되지 않았을 경우</li>
														</ol>
													</li>
													<li>회사는 서비스를 이용하는 회원에 대하여 회원의 종류 및 등급별로 구분하여 이용시간,
														이용회수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.</li>
												</ol>
												<p class="private_list_title">제8조 [회원정보의 변경]</p>
												<ol>
													<li>회원은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다.
														다만, 서비스 관리를 위해 필요한 아이디 등은 수정이 불가합니다.</li>
													<li>회원은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 이메일 등
														기타 방법으로 회사에 그 변경 사항을 알려야 합니다.</li>
													<li>제 2항의 변경사항을 회사에 알리지 않아 발생한 불이익에 대하여 회사는 책임지지 않습니다.</li>
												</ol>
												<p class="private_list_title">제9조 [서비스의 이용]</p>
												<ol>
													<li>회사는 회원의 이용신청을 승낙한 때부터 서비스를 개시합니다. 다만, 일부 서비스의 경우에는
														지정된 일자부터 서비스를 개시합니다.</li>
													<li>회사의 업무상ㆍ기술상의 장애로 인하여 서비스를 개시하지 못하는 경우에는 서비스에 공지하거나
														회원에게 이를 통지합니다.</li>
													<li>서비스의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 회사의 업무상ㆍ기술상
														또는 서비스 운영정책상 서비스가 일시 중지될 수 있습니다. 이러한 경우 회사는 사전 똔느 사후에 이를
														공지합니다.</li>
												</ol>
												<p class="private_list_title">제10조[“회원”의 “아이디(이메일)” 및
													“비밀번호”의 관리에 대한 의무]</p>
												<ol>
													<li>회원의 아이디(이메일)와 비밀번호에 관한 관리책임은 회원에게 있으며, 이를 제3자가
														이용하도록 하여서는 안됩니다.</li>
													<li>회원은 아이디(이메일)및 비밀번호가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는
														이를 즉시 회사에 통지하고 회사의 안내에 따라야 합니다.</li>
													<li>제2항의 경우 해당 회원이 회사에 그 사실을 통지하지 않거나, 통지한 경우에도 회사의
														안내에 따르지 않아 발생한 불이익에 대하여 회사는 책임지지 않습니다.</li>
												</ol>
												<p class="private_list_title">제11조[“회원”에 대한 통지]</p>
												<ol>
													<li>회사가 회원에 대한 통지를 하는 경우 본 약관에 별도 규정이 없는 한 회원이 지정한 이메일
														주소, 서비스 내 전자메모 및 쪽지 등으로 할 수 있습니다.</li>
													<li>회사는 회원 전체에 대한 통지의 경우 7일 이상 회사의 게시판에 게시함으로써 제1항의
														통지에 갈음할 수 있습니다.</li>
												</ol>
												<p class="private_list_title">제12조[“회사”의 의무]</p>
												<ol>
													<li>회사는 관련법과 본 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고
														안정적으로 서비스를 제공하기 위하여 최선을 다하여 노력합니다.</li>
													<li>회사는 서비스 제공과 관련하여 알고 있는 회원의 정보를 본인의 동의 없이 제3자에게
														제공하지 않습니다.</li>
													<li>회사는 회원의 회원정보를 보호하기 위해 보안시스템을 구축 운영하며, “개인정보처리방침”을
														공지하고 준수합니다. 또한, 회사는 “개인정보처리방침”에 따라 회원 정보를 취급함에 있어 안정성 확보에
														필요한 기술적, 관리적 대책을 수립하고 운영합니다</li>
													<li>회사는 서비스와 관련한 회원의 불만사항이 접수되는 경우 이를 신속하게 처리하여야 하며,
														신속한 처리가 곤란한 경우 그 사유와 처리 일정을 서비스 화면에 게재하거나 메일 등을 통하여 회원에게
														통지합니다.</li>
												</ol>
												<p class="private_list_title">제13조[“회원”의 의무]</p>
												<ol>
													<li>회원은 다음 행위를 하여서는 안됩니다.
														<ol>
															<li>신청 또는 변경 시 허위 내용의 등록</li>
															<li>타인의 정보도용</li>
															<li>회사에 게시된 정보의 변경</li>
															<li>회사가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시</li>
															<li>회사와 기타 제3자의 저작권 등 지적재산권에 대한 침해</li>
															<li>회사 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</li>
															<li>외설 또는 폭력적인 메시지,화상,음성,기타 공서양속에 반하는 정보를 회사에 공개 또는
																게시하는 행위</li>
															<li>회사의 동의 없이 영리를 목적으로 서비스를 사용하는 행위</li>
															<li>기타 불법적이거나 부당한 행위</li>
														</ol>
													</li>
													<li>회원은 관계법, 본 약관의 규정, 이용안내 및 서비스와 관련하여 공지한 주의사항, 회사가
														통지하는 사항 등을 준수하여야 하며, 기타 회사의 업무에 방해되는 행위를 하여서는 안됩니다.</li>
													<li>회원은 회사에서 공식적으로 인정한 경우를 제외하고는 서비스를 이용하여 상품을 판매하는 영업
														활동을 할 수 없으며, 특히 해킹, 광고를 통한 수익, 음란사이트를 통한 상업행위, 상용소프트웨어
														불법배포 등을 할 수 없습니다. 이를 위반하여 발생한 영업 활동의 결과 및 손실, 관계기관에 의한 구속
														등 법적 조치 등에 관해서는 회사가 책임을 지지 않으며, 회원은 이와 같은 행위와 관련하여 회사에 대하여
														손해배상 의무를 집니다.</li>
												</ol>
												<p class="private_list_title">제14조[서비스의 제공]</p>
												<ol>
													<li>회사는 회원에게 아래와 같은 서비스를 제공합니다.
														<ol>
															<li>KH투어: 정보 또는 자료의 관리/저장/공유를 위한 여행관련 정보 서비스</li>
															<li>기타 회사가 추가 개발하거나 다른 회사와의 제휴 계약 등을 통해 회원에게 제공하는
																일체의 서비스 (기존 서비스를 활용하기 위한 API서비스 등 포함)</li>
															<li>직접 판매하는 재화 또는 용역 등에 대한 정보 제공 및 계약의 체결 및 계약이 체결된
																재화 또는 용역 등의 배송</li>
														</ol>
													</li>
													<li>회사는 서비스를 일정 범위로 분할하여 각 범위별로 이용 가능 시간을 별도로 지정할 수
														있습니다. 다만 이러한 경우에는 그 내용을 사전에 공지합니다.</li>
												</ol>
												<p class="private_list_title">제15조[서비스의 변경]</p>
												<ol>
													<li>회사는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는
														일부 서비스를 변경할 수 있습니다.</li>
													<li>서비스의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될
														서비스의 내용 및 제공일자 등은 그 변경 전 7일 이상 해당 서비스 초기화면에 게시하여야 합니다.</li>
												</ol>
												<p class="private_list_title">제16조[정보의 제공 및 광고의 게재]</p>
												<ol>
													<li>회사는 회원이 서비스 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 이메일 등의
														방법으로 회원에게 제공할 수 있습니다. 다만, 회원은 관련법에 따른 거래관련 정보, 고객센터 답변 등을
														제외하고 언제든지 이메일 등을 통하여 수신 거절을 할 수 있습니다.</li>
													<li>제2항의 정보를 전화 및 모사전송기기에 의하여 전송하려고 하는 경우에는 회원의 사전 동의를
														받아서 전송합니다.</li>
													<li>회사는 서비스의 운영과 관련하여 서비스 화면, 홈페이지,이메일 등에 광고를 게재할 수
														있습니다. 광고가 게재된 이메일을 수신한 회원은 수신거절을 회사에게 할 수 있습니다.</li>
												</ol>
												<p class="private_list_title">제17조[게시물의 저작권]</p>
												<ol>
													<li>회원이 서비스 내에 게시한 게시물의 저작권은 해당 게시물의 저작자에게 귀속됩니다.</li>
													<li>회원이 서비스 내에 게시하는 게시물은 검색결과 내지 서비스 및 관련 프로모션 등에 노출될
														수 있으며, 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 이
														경우, 회사는 저작권법 규정을 준수하며, 회원은 언제든지 고객센터 또는 서비스 내 관리 기능을 통해 해당
														게시물에 대해 삭제, 검색결과 제외, 비공개 등의 조치를 취할 수 있습니다.</li>
													<li>회원이 서비스 내에 게시하는 게시물은 가이드북과 맵북 서비스에 노출될 수 있으며, 해당
														노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 또한 게시물이 노출된
														가이드북과 맵북, 서비스는 제3자에게 제공될 수 있으며 이때 발생되는 수익은 회원에게 돌려주지 않습니다.</li>
													<li>회사는 제2항 이외의 방법으로 회원의 게시물을 이용하고자 하는 경우에는 전화,팩스,이메일
														등을 통해 사전에 회원의 동의를 얻어야 합니다.</li>
												</ol>
												<p class="private_list_title">제18조[게시물의 관리]</p>
												<ol>
													<li>회원의 게시물이 정보통신망법 및 저작권법 등 관련법에 위반되는 내용을 포함하는 경우,
														권리자는 관련법이 정한 절차에 따라 해당 게시물의 게시 중단 및 삭제 등을 요청할 수 있으며, 회사는
														관련법에 따라 조치를 취하여야 합니다.</li>
													<li>회사는 다음 각 호에 해당하는 게시물이나 자료를 사전 동의없이 삭제하거나 이동 또는 등록
														거부를 할 수 있습니다.</li>
													<ol>
														<li>다른 회원 또는 제 3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우</li>
														<li>공공질서 및 공서양속에 위반되는 내용을 유포하거나 링크시키는 경우</li>
														<li>불법복제 또는 해킹을 조장하는 내용인 경우</li>
														<li>회사가 사전에 동의하지 아니한 영리를 목적으로 하는 광고일 경우</li>
														<li>범죄와 결부된다고 객관적으로 인정되는 내용일 경우</li>
														<li>다른회원 또는 제 3자의 저작권 등 기타 권리를 침해하는 내용이거나, 그러한 이유로 게시
															중단요청을 받은 경우</li>
														<li>회사에서 규정한 게시물 원칙에 어긋나거나, 게시판 성격에 부합하지 않는 경우</li>
														<li>사적인 정치적 판단이나 종교적 견해의 내용으로 회사의 서비스 성격에 부합하지 않는다고
															판단되는 경우</li>
														<li>회사에서 규정한 게시물 원칙에 어긋나거나, 근거없는 비방 등, 게시판 성격에 부합하지
															않는다고 회사가 판단한 경우</li>
														<li>기타 관계법령에 위배된다고 판단되는 경우</li>
													</ol>
												</ol>
												<p class="private_list_title">제19조[권리의 귀속]</p>
												<ol>
													<li>서비스에 대한 저작권 및 지적재산권은 회사에 귀속됩니다. 단, 회원의 게시물 및 제휴계약에
														따라 제공된 저작물 등은 제외합니다.</li>
													<li>회사는 서비스와 관련하여 회원에게 회사가 정한 이용조건에 따라 계정, 아이디, 콘텐츠 등을
														이용할 수 있는 이용권만을 부여하며, 회원은 이를 양도, 판매, 담보제공 등의 처분행위를 할 수
														없습니다.</li>
												</ol>
												<p class="private_list_title">제20조[“회원”의 계약 해제, 해지 등]</p>
												<ol>
													<li>회원은 언제든지 자기 정보 관리 메뉴를 통하여 서비스 탈퇴 신청을 할 수 있으며, 회사는
														관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.</li>
													<li>회원이 계약을 해지할 경우, 관련법 및 개인정보보호정책에 따라 회사가 회원정보를 보유하는
														경우를 제외하고는 해지 즉시 회원의 모든 데이터는 소멸됩니다.</li>
													<li>회원이 계약을 해지하였으나 본인 계정에 등록하고 공개된 데이터는 보존됩니다.</li>
												</ol>
												<p class="private_list_title">제21조[이용제한 등]</p>
												<ol>
													<li>회사는 회원이 본 약관의 의무를 위반하거나 서비스의 정상적인 운영을 방해한 경우, 서비스
														이용을 경고, 일시정지, 계약해지로 단계적으로 제한할 수 있습니다.</li>
													<li>회사는 전항에도 불구하고, 저작권법 및 컴퓨터프로그램보호법을 위반한 불법프로그램의 제공 및
														운영 방해, 정보통신방법을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이
														관련법을 위반한 경우에는 즉시 계약해지를 할 수 있습니다. 본 항에 따른 계약해지 시 서비스 이용을 통해
														획득한 혜택 등도 모두 소멸되며, 회사는 이에 대해 별도로 보상하지 않습니다.</li>
													<li>회사는 회원이 계속해서 3개월 이상 로그인하지 않는 경우, 회원정보의 보호 및 운영의
														효율성을 위해 이용을 제한할 수 있습니다.</li>
													<li>본 조에 따라 서비스 이용을 제한하거나 계약을 해지하는 경우에는 회사는 제11조[”회원”에
														대한 통지]에 따라 통지합니다.</li>
													<li>회원은 본 조에 따른 이용제한 등에 대해 회사가 정한 절차에 따라 이의신청을 할 수
														있습니다. 이때 이의가 정당하다고 회사가 인정하는 경우 회사는 즉시 서비스의 이용을 재개합니다.</li>
												</ol>
												<p class="private_list_title">제22조[구매신청]</p>
												<span>회사 이용자는 회사에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, 회사는
													사용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 단, 회원인 경우 제 2호
													내지 제 4호의 적용을 제외할 수도 있습니다.</span>
												<ol>
													<li>재화 등의 검색 및 선택</li>
													<li>성명, 주소, 휴대전화번호, 전자우편주소 등의 입력</li>
													<li>약관내용, 취소수수료, 배송료 등의 비용 부담과 관련한 내용에 대한 확인</li>
													<li>이 약관에 동의하고 제 3 호의 사항을 확인하거나 거부하는 표시 (예, 마우스 클릭)</li>
													<li>재화 등의 구매신청 및 이에 관한 확인 또는 회사의 확인에 대한 동의</li>
													<li>결제방법의 선택</li>
												</ol>

												<p class="private_list_title">제23조[계약의 성립]</p>
												<ol>
													<li>회사는 제22조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수
														있습니다.</li>
													<ol>
														<li>신청내용에 허위, 기재누락, 오기가 있는 경우</li>
														<li>신용카드 결제 시 소유주의 동의를 얻지 않는 불법행위로 추정 또는 확인되었을 경우</li>
													</ol>
													<li>회사는 계약이 체결되었음을 문자(카카오톡) 혹은 전자우편을 통하여 이용자에게 안내하며
														이용자에게 안내한 시점에 계약이 성립한 것으로 봅니다.</li>
												</ol>

												<p class="private_list_title">제24조[대금지급방법]</p>
												<span>회사에서 구매한 재화 또는 용역에 대한 대금지급은 다음 각 호의 방법 중 회사가
													지정하는 방식으로 이루어집니다. </span>
												<ol>
													<li>실시간 계좌이체</li>
													<li>선불카드, 직불카드, 신용카드 등의 각종 카드 결제</li>
													<li>휴대폰 결제</li>
												</ol>

												<p class="private_list_title">제25조[구매신청 변경 및 취소]</p>
												<ol>
													<li>회사는 이용자의 구매신청이 있는 경우 이용자에게 문자(카카오톡) 혹은 전자우편으 로 계약의
														체결을 알립니다.</li>
													<li>이용자는 의사표시의 불일치 등이 있는 경우에는 통지를 받은 후 즉시 구매신청 변경 및
														취소를 요청할 수 있고 회사는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만, 회사가 중개하는 현지
														여행업체에게 이미 대금을 지불하였거나 예약이 완료된 경우에는 제28조의 청약철회 등에 관한 규정에
														따릅니다. 이용자 본인의 실수, 누락 등의 개인적인 사유로 인하여 이용일 이후 구매신청 변경 및 취소를
														원하는 경우 회사는 이를 인정하지 않을 수 있습니다.</li>
												</ol>

												<p class="private_list_title">제26조[재화 등의 공급]</p>
												<ol>
													<li>회사는 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한
														날부터 7 일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 취합니다. 다만,
														회사가 이미 재화 등의 대금의 전부를 받은 경우에는 대금의 전부를 받은 날부터 3 영업일 이내에 조치를
														취합니다. 이때 회사는 이용자가 재화 등의 공급 및 진행사항을 확인할 수 있도록 적절한 조치를 합니다.
													</li>
													<li>회사는 이용자가 구매한 재화에 대해 이용방법, 이용기간 등을 명시합니다.</li>
													<li>공휴일 및 기타 휴무일 또는 천재지변 등의 불가항력적 사유가 발생하는 경우 그 해당기한은
														배송소요기간에서 제외합니다.</li>
												</ol>

												<p class="private_list_title">제27조[환급]</p>
												<span>회사는 이용자가 구매신청 한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수
													없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은
													날부터 3 영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다. 다만, 여행 상품의 특성 상 각 개별
													상품의 계약체결 시 계약한 취소 환불 규정에 의거 상품의 취소 및 환불 수수료를 공제 후 환불 합니다.</span>

												<p class="private_list_title">제28조[청약철회 등]</p>
												<ol>
													<li>회사와 재화 등의 구매에 관한 계약을 체결한 이용자는 수신확인의 통지를 받은 날부터 7 일
														이내에는 청약의 철회를 할 수 있습니다. 다만, 여행상품의 경우 계약시 체결한 각 개별 취소 환불 규정을
														따릅니다.</li>
													<li>이용자는 재화 등을 배송 받은 경우 다음 각 호의 경우에는 청약철회 및 교환을 할 수
														없습니다.</li>
													<ol>
														<li>이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우 (다만, 재화 등의 내용을
															확인하기 위하여 포장 등을 훼손한 경우에는 사전에 청약철회 제한에 관해 고지하지 않은 한 청약철회 등을
															할 수 있습니다.)</li>
														<li>이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우</li>
														<li>시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우</li>
														<li>같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한
															경우</li>
														<li>제 2 항 제 2 호 내지 제 5 호의 경우에 회사가 사전에 청약철회 등이 제한되는
															사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면
															이용자의 청약철회 등이 제한되지 않습니다.</li>
														<li>이용자는 제 1 항 및 제 2 항의 규정에 불구하고 재화 등의 내용이 광고 내용과
															다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급 받은 날부터 3 월 이내, 그 사실을 안
															날 또는 알 수 있었던 날부터 30 일 이내에 청약철회 등을 할 수 있습니다</li>
													</ol>
												</ol>

												<p class="private_list_title">제29조[청약철회 등의 효과]</p>
												<span>여행상품의 경우에는 각 개별 여행계약의 환불 규정을 따르고, 그렇지 아니한 경우에는
													아래 각 호의 규정에 의합니다. </span>
												<ol>
													<li>회사는 이용자로부터 재화 등을 반환 받은 경우 3 영업일 이내에 이미 지급 받은 재화 등의
														대금을 환급합니다. 이 경우 회사가 이용자에게 재화 등의 환급을 지연한 때에는 그 지연기간에 대하여
														전자상거래 등에서의 소비자보호에 관한 법률 시행령이 정하는 지연이자율을 곱하여 산정한 지연이자를
														지급합니다.</li>
													<li>회사는 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화
														등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를
														정지 또는 취소하도록 요청합니다.</li>
													<li>청약철회 등의 경우 공급 받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다.</li>
													<li>이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 회사는 청약철회 시 그 비용을 누가
														부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.</li>
												</ol>

												<p class="private_list_title">제30조[손해배상 및 면책]</p>
												<ol>
													<li>회사는 회사의 고의나 중대한 과실로 인하여 이용자나 제3자에게 발생한 손해에 대하여만,
														이용자가 회사에 지급한 수수료, 물품대금 등의 범위 내에서만 배상합니다.</li>
													<li>이용자가 이 약관의 규정을 위반함으로 인하여 회사에 손해가 발생하게 되는 경우, 이 약관을
														위반한 이용자는 회사에 발생하는 모든 손해를 배상하여야 합니다.</li>
													<li>회사는 다음 각 호의 경우에는 면책됩니다.</li>

													<li>회사는 천재지변, 전쟁 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는
														경우에는 서비스 제공에 대한 책임이 면제됩니다.</li>
													<li>회사는 기간통신 사업자가 전기통신 서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가
														발생한 경우 책임이 면제됩니다.</li>
													<li>회사는 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에
														대한 책임이 면제됩니다.</li>
													<li>회사는 이용자의 귀책사유로 인한 서비스 이용의 장애 또는 손해에 대하여 책임을 지지
														않습니다.</li>
													<li>회사는 이용자의 컴퓨터 오류에 의해 손해가 발생한 경우, 또는 이용자가 개인정보 및
														전자우편주소를 부실하게 기재하여 손해가 발생한 경우 책임을 지지 않습니다.</li>
													<li>회사는 이용자가 서비스를 이용하여 기대하는 수익을 얻지 못하거나 상실한 것에 대하여 책임을
														지지 않습니다.</li>
													<li>회사는 이용자가 서비스를 이용하면서 얻은 자료로 인한 손해에 대하여 책임을 지지 않습니다.
														또한 회사는 이용자가 서비스를 이용하며 타 이용자로 인해 입게 되는 정신적 피해에 대하여 보상할 책임을
														지지 않습니다.</li>
													<li>회사는 이용자가 당사에 게재한 각종 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 대하여
														책임을 지지 않습니다.</li>
													<li>회사는 이용자 상호간 및 이용자와 제 3자 상호 간에 서비스를 매개로 발생한 분쟁에 대해
														개입할 의무가 없으며, 이로 인한 손해를 배상할 책임도 없습니다. 다만 회사는 내부 지침에 따라서 분쟁의
														해결을 위한 중재를 제안하거나, 자율 분쟁 조정 센터를 운영할 수 있습니다.</li>
													<li>회사에서 이용자에게 무료로 제공하는 서비스의 이용과 관련해서는 어떠한 손해도 책임을 지지
														않습니다.</li>
												</ol>

												<p class="private_list_title">제31조[분쟁 조정 및 관할 법원]</p>
												<ol>
													<li>회원은 게시물과 관련된 저작권 침해, 명예훼손 또는 개인정보 및 서비스 이용과 관련된
														사항에 관한 문제제기 또는 문제해결은 회사가 운영하는 고객센터를 통하여 처리하여야 합니다.</li>
													<li>회사와 회원간 서비스 이용과 관련하여 발생한 분쟁에 대한 소송을 제기하는 경우에는
														민사소송법상의 법원을 관할법원으로 합니다.</li>
												</ol>

												<p>부칙</p>
												<p>본 이용약관은 2016년 11월 7일부터 적용되며, 2016년 1월 18일부터 적용되던
													종전약관은 본 약관으로 대체됩니다. 개정된 이용약관의 적용일자 이전 가입자 또한 개정된 이용약관의 적용을
													받습니다.</p>
												<p>시행일자 : 2016년 11월 7일</p>
											</div>
											<div class="fake_box" style="top: 421px"></div>
										</div>
									</div>
									<div class="nlogin_policy_wrap last">
										<div class="nlogin_policy_check">
											<input name="check" type="checkbox" value="1" id="priv_agree" />
											<label for="priv_agree">개인정보수집 및 이용동의<em>(필수)</em></label>
										</div>
										<div class="policy_content_wrap" id="person_20150818"
											style="display: none;">
											<div class="fake_box"></div>
											<div class="policy_content">
												<p class="private_policy_title">(주)KH투어는 (이하 "회사" 또는
													“KH투어”라 함)는 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 통신비밀보호법 등
													정보통신서비스제공자가 준수하여야 할 관련 법령상의 개인정보보호 규정을 준수하며, 관련 법령에 의거한
													개인정보처리방침을 정하여 이용자 권익 보호에 최선을 다하고 있습니다.</p>
												<p>
													<strong>KH투어의 개인정보처리방침은 다음과 같은 내용을 담고 있습니다.</strong>
												</p>
												<p>수집하는 개인정보의 항목 및 수집방법</p>
												<p>개인정보의 수집 및 이용목적</p>
												<p>개인정보 공유 및 제공</p>
												<p>개인정보의 취급위탁</p>
												<p>개인정보의 보유 및 이용기간</p>
												<p>개인정보 파기절차 및 방법</p>
												<p>이용자 및 법정대리인의 개인정보에 대한 권리와 그 행사방법</p>
												<p>개인정보 자동 수집 장치의 설치/운영 및 거부에 관한 사항</p>
												<p>개인정보의 기술적/관리적 보호 대책</p>
												<p>개인정보관리책임자 및 담당자의 연락처</p>
												<p>기타</p>
												<p>고지의 의무</p>
												<p class="private_list_title">1. 수집하는 개인정보의 항목 및 수집방법</p>
												<p class="private_list_title">가. 수집하는 개인정보 항목</p>
												<span> 첫째, 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 KH투어
													아이디로 회원가입 당시 아래와 같은 개인정보를 수집하고 있습니다. </span>
												<p>필수 정보: KH투어 아이디(이메일 주소), 이름(닉네임), 비밀번호, 생년월일, 성별</p>
												<p>선택 정보 : 휴대폰 번호</p>
												<p>
													둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.<br>
													서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보, 불량 이용 기록<br>
												</p>
												<p>셋째, 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자
													선택에 의해 아래와 같은 정보들이 수집될 수 있습니다.</p>
												<p>프로필 정보 : 이름, 생년월일, 성별, 이메일 주소, 블로그 주소, 학교, 회사</p>
												<p>휴대폰 설정 : 휴대폰 번호</p>
												<p>이벤트 당첨시 : 경품 제공 및 배송을 위해 필요한 정보</p>
												<p class="private_list_title">나. 개인정보 수집방법</p>
												<p>홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청</p>
												<p>협력회사로부터의 제공</p>
												<p>생성정보 수집 툴을 통한 수집</p>
												<p class="private_list_title">2. 개인정보의 수집 및 이용목적</p>
												<p class="private_list_title">가. 서비스 제공에 관한 계약 이행 및 서비스
													제공에 따른 요금정산</p>
												<span>웹사이트 및 모바일 서비스 이용을 위한 컨텐츠 제공, 물품배송 또는 청구서 등 발송,
													본인인증, 구매 및 요금 결제, 요금추심</span>
												<p class="private_list_title">나. 회원관리</p>
												<span>회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가
													사용방지, 가입의사 확인, 가입 및 가입횟수 제한, 추후 법정 대리인 본인확인, 분쟁 조정을 위한
													기록보존, 불만처리 등 민원처리, 고지사항 전달</span>
												<p class="private_list_title">다. 신규 서비스 개발, 기능 개선에 활용:</p>
												<span>신규 서비스 개발 및 맞춤 서비스 제공, 인구통계학적 특성에 따른 서비스 제공 및
													광고 게재, 서비스의 유효성 확인, 이벤트 정보 제공 및 참여기회 제공, 접속 빈도 파악 또는 회원의
													서비스 이용에 대한 통계</span>
												<p class="private_list_title">3. 개인정보의 공유 및 제공</p>
												<span> 회사는 이용자의 개인정보를 “2. 개인정보의 수집목적 및 이용목적”에서 고지한 범위
													내에서만 사용하며 이용자의 사전동의 없이 동 범위를 초과하여 사용하지 않습니다. 또한 회사는 기본적으로
													이용자의 개인정보를 외부에 공개하지 않습니다.<br>단, 아래의 경우에는 예외로 합니다.
												</span>
												<p>이용자들이 사전에 공개에 동의한 경우</p>
												<p>법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가
													있는 경우</p>
												<p class="private_list_title">4. 개인정보의 취급위탁</p>
												<span>회사는 서비스 향상을 위해서 아래와 같이 개인정보를 위탁하고 있으며, 관계 법령에
													따른 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다.</span>
												<p class="private_list_title">5. 개인정보의 보유 및 이용기간</p>
												<p class="private_list_title">가. 개인정보 이용기간</p>
												<span>회사는 이용자의 개인정보를 “2. 개인정보의 수집 및 이용목적”에서 고지한 목적이
													달성되면 지체없이 파기합니다.단, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신비밀보호법 등
													관계법령의 규정에 의하여 보존할 필요가 있는 경우에는 일정 기간 동안 개인정보를 보관합니다. 이 경우
													보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.</span>
												<p>계약 또는 청약철회 등에 관한 기록 : 5년</p>
												<p>대금결제 및 재화 등의 공급에 관한 기록 : 5년</p>
												<p>소비자의 불만 또는 분쟁처리에 관한 기록 : 5년</p>
												<p>웹사이트 방문 기록 : 3개월</p>
												<p class="private_list_title">나. 개인정보 유효기간 제도 준행</p>
												<span>회사는 개인정보 유효기간제도를 준행하며, 해당 정보통신 서비스를 1년 동안 이용하지
													않은 이용자의 개인정보를 보호하기 위하여 파기 등의 필요한 조치를 취하여 개인정보의 오, 남용 및 유출을
													방지하고 있습니다.</span> <span>회사는 1년 의 유효기간 만료가 도래하기 30일 전까지, 회사의
													보안규정 및 지침에 따라 이용자의 개인정보항목이 파기 되거나 보관이 필요 할 경우 관련 법령에 따라
													안전하게 분리 저장, 관리되는 사실을 고지합니다.</span>
												<p class="private_list_title">6. 개인정보 파기절차 및 방법</p>
												<span>이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체없이
													파기합니다. 회사의 개인정보 파기절차 및 방법은 다음과 같습니다.</span>
												<p class="private_list_title">가. 파기절차</p>
												<span>이용자가 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의 DB로
													옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및
													이용기간 참조)일정 기간 저장된 후 파기됩니다.</span>
												<p>동 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로 이용되지 않습니다</p>
												<p class="private_list_title">나. 파기방법</p>
												<span> 종이에 출력된 개인정보 및 접수된 서류는 분쇄하거나 소각을 통하여 파기합니다.<br>
													전자적 파일 형태로 저장된 개인정보는 복구할 수 없는 기술적 방법을 사용하여 삭제합니다.
												</span>
												<p class="private_list_title">7. 이용자 및 법정대리인의 개인정보에 대한
													권리와 그 행사방법</p>
												<p>이용자 및 법정대리인은 언제든지 등록되어 있는 자신의 정보를 조회하거나 수정할 수 있으며 가입
													해지를 요청할 수 있습니다.</p>
												<p>이용자의 개인정보 조회와 수정을 위해서는 '기본정보'를, 가입해지(동의철회)를 위해서는
													"회원탈퇴"를 클릭하여 직접 열람, 정정 또는 탈퇴가 가능합니다</p>
												<p>혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다</p>
												<p>이용자가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를
													이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3 자에게 이미 제공한 경우에는 정정 처리결과를
													제3자에게 지체 없이 통지하여 정정이 이루어지도록 하겠습니다.</p>
												<p>회사는 이용자 혹은 법정대리인의 요청에 의해 해지 또는 삭제된 개인정보는 "5. 개인정보의 보유
													및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.</p>
												<p class="private_list_title">8. 개인정보 자동 수집 장치의 설치/운영 및
													거부에 관한 사항</p>
												<span>회사는 회사의 홈페이지 방문자에게 적정한 서비스를 제공하기 위해서 이용자들의 정보를
													저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다. 쿠키는 웹사이트를 운영하는데 이용되는
													서버(HTTP)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터 내
													하드디스크에 저장되기도 합니다.</span>
												<p class="private_list_title">가. 쿠키의 사용 목적</p>
												<span>이용자들이 방문한 KH투어의 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기
													검색어, 이용자 규모 등을 파악하여 이용자에게 최적화된 정보 제공을 위하여 사용합니다.</span>
												<p class="private_list_title">나. 쿠키의 설치/운영 및 거부</p>
												<span>이용자는 쿠키 설정에 대한 선택권을 가지고 있습니다. 따라서 이용자는 웹브라우저의
													옵션을 설정함으로써, 쿠키가 저장될 때마다 확인하거나 모든 쿠키의 허용 또는 모든 쿠키의 저장을 거부할
													수도 있습니다.</span>
												<p>다만 쿠키의 저장을 거부할 경우에는 로그인이 필요한 일부 서비스는 이용에 어려움이 있을 수
													있습니다.</p>
												<p>쿠키 설치 허용 여부 설정방법(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 > 인터넷
													옵션 > 개인정보</p>
												<p class="private_list_title">9. 개인정보의 기술적/관리적 보호 대책</p>
												<span>회사는 이용자들의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 누출, 변조 또는
													훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적/관리적 대책을 강구하고 있습니다</span>
												<p class="private_list_title">가. 기술적 보호대책</p>
												<span>비밀번호는 암호화되어 저장 및 관리되고 있어 본인만이 알고 있으며, 개인정보의 확인
													및 변경도 비밀번호를 알고 있는 본인에 의해서만 가능합니다.</span>
												<p>회사는 해킹이나 컴퓨터 바이러스 등에 의해 회원의 개인정보가 유출되거나 훼손되는 것을 막기 위해
													최선을 다하고 있습니다.</p>
												<p>회사는 개인정보의 훼손에 대비해서 자료를 수시로 백업하고 있고, 최신 백신프로그램을 이용하여
													이용자들의 개인정보나 자료가 누출되거나 손상되지 않도록 방지하고 있습니다</p>
												<p>회사는 암호화 통신 등을 통하여 네트워크상에서 개인정보를 안전하게 송•수신할 수 있도록 하고
													있습니다.</p>
												<p>회사는 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있으며, 이외 시스템적인
													보안성을 확보하기 위해 가능한 모든 기술적 장치를 갖추려 노력하고 있습니다.</p>
												<p class="private_list_title">나. 관리적 보호대책</p>
												<span>회사는 개인정보관련 취급 직원을 담당자에 한정시키고 이를 위한 별도의 비밀번호를
													부여하고, 정기적으로 갱신하고 있습니다.</span>
												<p>회사는 주기적으로 담당자들을 교육하고 있으며, 이용자의 개인정보 취급•관리를 강조하고 있습니다.</p>
												<p>회사는 사내 개인정보보호 관련부서 등을 통해서 회사의 개인정보처리방침 이행사항 및 담당자의
													준수여부를 확인하여 문제가 발견될 경우 즉시 수정하고 바로 잡을 수 있도록 노력하고 있습니다.</p>
												<p class="private_list_title">10. 개인정보관리책임자 및 담당자의 연락처</p>
												<span>이용자는 회사의 서비스를 이용하는 과정에서 발생하는 모든 개인정보보호 관련 민원을
													개인정보관리책임자 혹은 담당부서로 신고할 수 있습니다. 회사는 이용자들의 신고사항에 대해 신속하게 답변을
													드릴 것입니다.</span>
												<p>이 름 : 이명운</p>
												<p>소 속 : KH투어</p>
												<p>직 위 : 수석</p>
												<p>전 화 : 02) 6325-5202</p>
												<p>메 일 : KHTOUR@KHTOUR.com</p>
												<p>기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.</p>
												<p>
													개인정보침해신고센터 (<a href="http://www.118.or.kr" target="_blank">www.118.or.kr</a>
													/ 118)
												</p>
												<p>
													정보보호마크인증위원회 (<a href="http://www.eprivacy.or.kr"
														target="_blank">www.eprivacy.or.kr</a> / 02-580-0533~4)
												</p>
												<p>
													대검찰청 첨단범죄수사과 (<a href="http://www.spo.go.kr"
														target="_blank">www.spo.go.kr</a> / 02-3480-2000)
												</p>
												<p>
													경찰청 사이버테러대응센터 (<a href="http://www.ctrc.go.kr"
														target="_blank">www.ctrc.go.kr</a> / 02-392-0330)
												</p>
												<p class="private_list_title">11. 고지의 의무</p>
												<span>현 개인정보처리방침의 내용 추가, 삭제 및 수정 등의 변경이 있을 시에는 시행일의
													7일 전부터 홈페이지의 공지사항을 통하여 고지할 것 입니다.</span>
												<p>공고 일자: 2015년 8월 11일</p>
												<p>시행 일자: 2015년 8월 18일</p>
											</div>
											<div class="fake_box" style="top: 421px"></div>
										</div>
									</div>
								</div>
								<div class="agreeBox agreeMail"></div>
								<div class="nlogin_join_center">
									<button class="nlogin_btn" type="submit">가입하기</button>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>

		<script>
			$("#agreeAll").on("change", function() {
				if ($(this).prop("checked") == true) {
					$("#law_agree").prop("checked", true);
					$("#priv_agree").prop("checked", true);
					$("#mail_agree").prop("checked", true);
					$("#agreeMail").prop("checked", true);
				} else {
					$("#law_agree").prop("checked", false);
					$("#mail_agree").prop("checked", false);
					$("#priv_agree").prop("checked", false);
					$("#agreeMail").prop("checked", false);
				}
			});
			$("input[type='checkbox']")
					.change(
							function() {

								if ($(this).attr('name') == 'law_agree'
										|| $(this).attr('name') == 'priv_agree'
										|| $(this).attr('name') == 'mail_agree') {
									if ($("#law_agree").is(":checked") == true
											&& $("#priv_agree").is(":checked") == true
											&& $("#mail_agree").is(":checked") == true) {
										$("#agreeAll").prop("checked", true);
									}
									if ($("#law_agree").is(":checked") == false
											|| $("#priv_agree").is(":checked") == false
											|| $("#mail_agree").is(":checked") == false) {
										$("#agreeAll").prop("checked", false);
									}

								}
							});
		</script>
	</div>

	<script type="text/javascript">
	<!-- 페이지 맨 위로 이동시켜주는 로직 -->
		var nvDisplayType = "self";
		$("#person_20150818").show();
		$("#terms_20161107").show();
	</script>
	<button type="button" onclick="javascript:window.scrollTo(0, 0);"
		class="goTop">
		<img src="//img.tourtips.com/images/cm/img_goTop.png" alt="맨위로">
	</button>
	<!-- 여기까지 -->
</body>
</html>


