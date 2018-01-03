<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>메인</title>
	<link rel="stylesheet" type="text/css" href="/khtour/css/index.css">
	<link rel="stylesheet" type="text/css" href="/khtour/css/header_footer.css">
	<!-- jQuery library (served from Google) -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<!-- bxSlider Javascript file -->
	<script src="/khtour/css/jquery.bxslider.min.js"></script>
	<!-- bxSlider CSS file -->
	<link href="/khtour/css/jquery.bxslider.css" rel="stylesheet" />
</head>
<body>
	 
	<div class="header_gab">
	<!-- visualWrap -->
		<div id="visualWrap"
			style="background-image: url('//img.tourtips.com/images/pc/cityBg/SIN.jpg?u=0002216');">

			<!-- videoWrap -->
			<div class="videoWrap" style="display: none;">
				<video class="view player" autoplay="" loop="" muted="false">
					<source
						src="http://player.vimeo.com/external/123814489.hd.mp4?s=ae1239bd2138784d2012486167d34a13&profile_id=113"
						type="video/mp4">
				</video>
				<script type="text/javascript">
					$(window).load(function() {//메인 동영상 재생
						var is_viedo_checked = false;
						$(".view.player").bind("timeupdate", function(e) {
							var obj = e.target;
							if (!is_viedo_checked && obj.currentTime > 1) {
								is_viedo_checked = true;
								if (obj.paused) {
									obj.play();
								}
								$(obj).parent().fadeIn(850);
								$(obj).unbind("timeupdate");
							}
						});
					});
				</script>
			</div>
			<!-- //videoWrap -->
	</div>

	<div class="wrap">


	<!--메인 슬라이드 섹션-->
<div class="title_slide">
	<div class="slide_wrap">
		<ul class="bxslider">
 			<li><img src="/khtour/img2/jeju.jpg" title="caption value pic2"/></li>
 			<li><img src="/khtour/img2/bapa.jpg" title="caption value pic3"/></li>
 			<li><img src="/khtour/img2/jejuu.jpg" title="caption value pic4"/></li>
		</ul>
	</div>
</div>
<script>
$('.bxslider').bxSlider({
  mode:'horizontal', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
  speed:1000, //default:500 이미지변환 속도
  auto: true, //default:false 자동 시작
  captions: false, // 이미지의 title 속성이 노출된다.
  autoControls: true, //default:false 정지,시작 콘트롤 노출, css 수정이 필요
});
</script>

		<s:url id="SelectItem" action="SelectItem" >
			<s:param name="no">
			<s:property value="item.no"/>
			</s:param>
			</s:url><!--여행상품상세  --> 
			<s:url id="SelectAir" action="SelectAir" >
			<s:param name="no">
			<s:property value="air.no"/>
			</s:param>
			</s:url><!--항공권상품상세  -->
			<s:url id="SelectHotel" action="SelectHotel" >
			<s:param name="no">
			<s:property value="hotel.no"/>
			</s:param>
			</s:url><!--호텔상세  -->
		<!--컨텐츠 섹션-->
		<div class="section1">
			<div class="content">
				<h1>추천 상품</h1>
				<ul class="content_wrap">
					<li class="content_list">
					 <ul>
							<li><a href="SelectHotel.action?no=<s:property value="hotel.no"/>"><img src="/khtour/img2/<s:property value="hotel.image1"/>" alt=""></a></li><!--상세보기로 이동  -->
							<br/>
							<li>호텔 : <s:property value="hotel.name"/></li>
							<br/><br/>
							<li>가격:<s:property value="hotel.price"/></li>
						</ul> 
					</li>
					<li class="content_list">
						<ul>
							<li><a href="SelectAir.action?no=<s:property value="air.no"/>"><img src="/khtour/img2/<s:property value="air.image1"/>" alt=""></a></li><!--상세보기로 이동  -->
							<br/>
							<li>항공권 : <s:property value="air.name"/></li>
							<br/><br/>
							<li>가격:<s:property value="air.price"/></li>
						</ul>
					</li>
					<li class="content_list">
						<ul>
							<li><a href="SelectItem.action?no=<s:property value="item.no"/>"><img src="/khtour/img2/<s:property value="item.image1"/>" alt=""></a></li><!--상세보기로 이동  -->
							<br/>
							<li>여행상품 : <s:property value="item.name"/></li>
							<br/><br/>
							<li>가격:<s:property value="item.price"/></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	
	</div>
	<footer>
	</footer>
</body>
</html>