<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" media="all" href='css/jquery_air.css' />
<!--[if IE]>
<link rel="stylesheet" type="text/css" media="all" href='css/ie_fixes.css' />
<![endif]-->
<script type="text/javascript" src="preset.js"></script>
<script type="text/javascript" src="jquery.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<!-- <script type="text/javascript" src="global.js"></script> -->
<script>
 $(function(){
    var textShow="",name="",sum=0;
    $('a').click(function(){
        $(this).toggleClass('blue'); //클릭한 부분 파란색 배경
        name=$(this).text(); //변수 name 에 클릭한 위치의 텍스트 저장
        if(sum==0) textShow = name; 
    });
    $('a').click(function(){  //[선택] 버튼을 눌렀을 때의 동작 함수
    	$('#show').val(textShow); // class="show"인 위치에 textShow 값을 text한다.(<==이게 가능하네!?!)
    });
});
  
 $('button').click(function(){
       self.close();
 });
   
 
 
</script>
<title>jQuery Air</title>
</head>
<body>
<div id="container">
   
   <img src="/khtour/img/KHTOUR-logo.png" alt="KH TOUR" id="logo" />
   <span id="info">
      <strong>Charter Flight</strong><br />
      Passenger Management
   </span>
   <ul id="airplane">
      <li id="master">
         
      </li>

      <li class="seat_01 A"><a href="#row_01" title="01A">01A</a></li>
      <li class="seat_01 B"><a href="#row_01" title="01B">01B</a></li>
      <li class="seat_01 C"><a href="#row_01" title="01C">01C</a></li>
      <li class="seat_01 D"><a href="#row_01" title="01D">01D</a></li>
      <li class="seat_01 E"><a href="#row_01" title="01E">01E</a></li>
      <li class="seat_01 F"><a href="#row_01" title="01F">01F</a></li>

      <li class="seat_02 A"><a href="#row_02" title="02A">02A</a></li>
      <li class="seat_02 B"><a href="#row_02" title="02B">02B</a></li>
      <li class="seat_02 C"><a href="#row_02" title="02C">02C</a></li>
      <li class="seat_02 D"><a href="#row_02" title="02D">02D</a></li>
      <li class="seat_02 E"><a href="#row_02" title="02E">02E</a></li>
      <li class="seat_02 F"><a href="#row_02" title="02F">02F</a></li>

      <li class="seat_03 A"><a href="#row_03" title="03A">03A</a></li>
      <li class="seat_03 B"><a href="#row_03" title="03B">03B</a></li>
      <li class="seat_03 C"><a href="#row_03" title="03C">03C</a></li>
      <li class="seat_03 D"><a href="#row_03" title="03D">03D</a></li>
      <li class="seat_03 E"><a href="#row_03" title="03E">03E</a></li>
      <li class="seat_03 F"><a href="#row_03" title="03F">03F</a></li>

      <li class="seat_04 A"><a href="#row_04" title="04A">04A</a></li>
      <li class="seat_04 B"><a href="#row_04" title="04B">04B</a></li>
      <li class="seat_04 C"><a href="#row_04" title="04C">04C</a></li>
      <li class="seat_04 D"><a href="#row_04" title="04D">04D</a></li>
      <li class="seat_04 E"><a href="#row_04" title="04E">04E</a></li>
      <li class="seat_04 F"><a href="#row_04" title="04F">04F</a></li>

      <li class="seat_05 A"><a href="#row_05" title="05A">05A</a></li>
      <li class="seat_05 B"><a href="#row_05" title="05B">05B</a></li>
      <li class="seat_05 C"><a href="#row_05" title="05C">05C</a></li>
      <li class="seat_05 D"><a href="#row_05" title="05D">05D</a></li>
      <li class="seat_05 E"><a href="#row_05" title="05E">05E</a></li>
      <li class="seat_05 F"><a href="#row_05" title="05F">05F</a></li>

      <li class="seat_06 A"><a href="#row_06" title="06A">06A</a></li>
      <li class="seat_06 B"><a href="#row_06" title="06B">06B</a></li>
      <li class="seat_06 C"><a href="#row_06" title="06C">06C</a></li>
      <li class="seat_06 D"><a href="#row_06" title="06D">06D</a></li>
      <li class="seat_06 E"><a href="#row_06" title="06E">06E</a></li>
      <li class="seat_06 F"><a href="#row_06" title="06F">06F</a></li>

      <li class="seat_07 A"><a href="#row_07" title="07A">07A</a></li>
      <li class="seat_07 B"><a href="#row_07" title="07B">07B</a></li>
      <li class="seat_07 C"><a href="#row_07" title="07C">07C</a></li>
      <li class="seat_07 D"><a href="#row_07" title="07D">07D</a></li>
      <li class="seat_07 E"><a href="#row_07" title="07E">07E</a></li>
      <li class="seat_07 F"><a href="#row_07" title="07F">07F</a></li>

      <li class="seat_08 A"><a href="#row_08" title="08A">08A</a></li>
      <li class="seat_08 B"><a href="#row_08" title="08B">08B</a></li>
      <li class="seat_08 C"><a href="#row_08" title="08C">08C</a></li>
      <li class="seat_08 D"><a href="#row_08" title="08D">08D</a></li>
      <li class="seat_08 E"><a href="#row_08" title="08E">08E</a></li>
      <li class="seat_08 F"><a href="#row_08" title="08F">08F</a></li>

      <li class="seat_09 A"><a href="#row_09" title="09A">09A</a></li>
      <li class="seat_09 B"><a href="#row_09" title="09B">09B</a></li>
      <li class="seat_09 C"><a href="#row_09" title="09C">09C</a></li>
      <li class="seat_09 D"><a href="#row_09" title="09D">09D</a></li>
      <li class="seat_09 E"><a href="#row_09" title="09E">09E</a></li>
      <li class="seat_09 F"><a href="#row_09" title="09F">09F</a></li>

      <li class="seat_10 A"><a href="#row_10" title="10A">10A</a></li>
      <li class="seat_10 B"><a href="#row_10" title="10B">10B</a></li>
      <li class="seat_10 C"><a href="#row_10" title="10C">10C</a></li>
      <li class="seat_10 D"><a href="#row_10" title="10D">10D</a></li>
      <li class="seat_10 E"><a href="#row_10" title="10E">10E</a></li>
      <li class="seat_10 F"><a href="#row_10" title="10F">10F</a></li>

      <li class="seat_11 A"><a href="#row_11" title="11A">11A</a></li>
      <li class="seat_11 B"><a href="#row_11" title="11B">11B</a></li>
      <li class="seat_11 C"><a href="#row_11" title="11C">11C</a></li>
      <li class="seat_11 D"><a href="#row_11" title="11D">11D</a></li>
      <li class="seat_11 E"><a href="#row_11" title="11E">11E</a></li>
      <li class="seat_11 F"><a href="#row_11" title="11F">11F</a></li>

      <li class="seat_12 A"><a href="#row_12" title="12A">12A</a></li>
      <li class="seat_12 B"><a href="#row_12" title="12B">12B</a></li>
      <li class="seat_12 C"><a href="#row_12" title="12C">12C</a></li>
      <li class="seat_12 D"><a href="#row_12" title="12D">12D</a></li>
      <li class="seat_12 E"><a href="#row_12" title="12E">12E</a></li>
      <li class="seat_12 F"><a href="#row_12" title="12F">12F</a></li>

      <li class="seat_13 A"><a href="#row_13" title="13A">13A</a></li>
      <li class="seat_13 B"><a href="#row_13" title="13B">13B</a></li>
      <li class="seat_13 C"><a href="#row_13" title="13C">13C</a></li>
      <li class="seat_13 D"><a href="#row_13" title="13D">13D</a></li>
      <li class="seat_13 E"><a href="#row_13" title="13E">13E</a></li>
      <li class="seat_13 F"><a href="#row_13" title="13F">13F</a></li>

      <li class="seat_14 A"><a href="#row_14" title="14A">14A</a></li>
      <li class="seat_14 B"><a href="#row_14" title="14B">14B</a></li>
      <li class="seat_14 C"><a href="#row_14" title="14C">14C</a></li>
      <li class="seat_14 D"><a href="#row_14" title="14D">14D</a></li>
      <li class="seat_14 E"><a href="#row_14" title="14E">14E</a></li>
      <li class="seat_14 F"><a href="#row_14" title="14F">14F</a></li>

      <li class="seat_15 A"><a href="#row_15" title="15A">15A</a></li>
      <li class="seat_15 B"><a href="#row_15" title="15B">15B</a></li>
      <li class="seat_15 C"><a href="#row_15" title="15C">15C</a></li>
      <li class="seat_15 D"><a href="#row_15" title="15D">15D</a></li>
      <li class="seat_15 E"><a href="#row_15" title="15E">15E</a></li>
      <li class="seat_15 F"><a href="#row_15" title="15F">15F</a></li>

      <li class="seat_16 A"><a href="#row_16" title="16A">16A</a></li>
      <li class="seat_16 B"><a href="#row_16" title="16B">16B</a></li>
      <li class="seat_16 C"><a href="#row_16" title="16C">16C</a></li>
      <li class="seat_16 D"><a href="#row_16" title="16D">16D</a></li>
      <li class="seat_16 E"><a href="#row_16" title="16E">16E</a></li>
      <li class="seat_16 F"><a href="#row_16" title="16F">16F</a></li>

      <li class="seat_17 A"><a href="#row_17" title="17A">17A</a></li>
      <li class="seat_17 B"><a href="#row_17" title="17B">17B</a></li>
      <li class="seat_17 C"><a href="#row_17" title="17C">17C</a></li>
      <li class="seat_17 D"><a href="#row_17" title="17D">17D</a></li>
      <li class="seat_17 E"><a href="#row_17" title="17E">17E</a></li>
      <li class="seat_17 F"><a href="#row_17" title="17F">17F</a></li>

      <li class="seat_18 A"><a href="#row_18" title="18A">18A</a></li>
      <li class="seat_18 B"><a href="#row_18" title="18B">18B</a></li>
      <li class="seat_18 C"><a href="#row_18" title="18C">18C</a></li>
      <li class="seat_18 D"><a href="#row_18" title="18D">18D</a></li>
      <li class="seat_18 E"><a href="#row_18" title="18E">18E</a></li>
      <li class="seat_18 F"><a href="#row_18" title="18F">18F</a></li>

      <li class="seat_19 A"><a href="#row_19" title="19A">19A</a></li>
      <li class="seat_19 B"><a href="#row_19" title="19B">19B</a></li>
      <li class="seat_19 C"><a href="#row_19" title="19C">19C</a></li>
      <li class="seat_19 D"><a href="#row_19" title="19D">19D</a></li>
      <li class="seat_19 E"><a href="#row_19" title="19E">19E</a></li>
      <li class="seat_19 F"><a href="#row_19" title="19F">19F</a></li>

      <li class="seat_20 A"><a href="#row_20" title="20A">20A</a></li>
      <li class="seat_20 B"><a href="#row_20" title="20B">20B</a></li>
      <li class="seat_20 C"><a href="#row_20" title="20C">20C</a></li>
      <li class="seat_20 D"><a href="#row_20" title="20D">20D</a></li>
      <li class="seat_20 E"><a href="#row_20" title="20E">20E</a></li>
      <li class="seat_20 F"><a href="#row_20" title="20F">20F</a></li>

      <li class="seat_21 A"><a href="#row_21" title="21A">21A</a></li>
      <li class="seat_21 B"><a href="#row_21" title="21B">21B</a></li>
      <li class="seat_21 C"><a href="#row_21" title="21C">21C</a></li>
      <li class="seat_21 D"><a href="#row_21" title="21D">21D</a></li>
      <li class="seat_21 E"><a href="#row_21" title="21E">21E</a></li>
      <li class="seat_21 F"><a href="#row_21" title="21F">21F</a></li>

      <li class="seat_22 A"><a href="#row_22" title="22A">22A</a></li>
      <li class="seat_22 B"><a href="#row_22" title="22B">22B</a></li>
      <li class="seat_22 C"><a href="#row_22" title="22C">22C</a></li>
      <li class="seat_22 D"><a href="#row_22" title="22D">22D</a></li>
      <li class="seat_22 E"><a href="#row_22" title="22E">22E</a></li>
      <li class="seat_22 F"><a href="#row_22" title="22F">22F</a></li>

      <li class="seat_23 A"><a href="#row_23" title="23A">23A</a></li>
      <li class="seat_23 B"><a href="#row_23" title="23B">23B</a></li>
      <li class="seat_23 C"><a href="#row_23" title="23C">23C</a></li>
      <li class="seat_23 D"><a href="#row_23" title="23D">23D</a></li>
      <li class="seat_23 E"><a href="#row_23" title="23E">23E</a></li>
      <li class="seat_23 F"><a href="#row_23" title="23F">23F</a></li>

      <li class="seat_24 A"><a href="#row_24" title="24A">24A</a></li>
      <li class="seat_24 B"><a href="#row_24" title="24B">24B</a></li>
      <li class="seat_24 C"><a href="#row_24" title="24C">24C</a></li>
      <li class="seat_24 D"><a href="#row_24" title="24D">24D</a></li>
      <li class="seat_24 E"><a href="#row_24" title="24E">24E</a></li>
      <li class="seat_24 F"><a href="#row_24" title="24F">24F</a></li>

      <li class="seat_25 A"><a href="#row_25" title="25A">25A</a></li>
      <li class="seat_25 B"><a href="#row_25" title="25B">25B</a></li>
      <li class="seat_25 C"><a href="#row_25" title="25C">25C</a></li>
      <li class="seat_25 D"><a href="#row_25" title="25D">25D</a></li>
      <li class="seat_25 E"><a href="#row_25" title="25E">25E</a></li>
      <li class="seat_25 F"><a href="#row_25" title="25F">25F</a></li>
   </ul>
   <!-- end #airplane -->
         <p>
         <form name="form" method="post" action="SelectAir.action" target="joinair">
         <center><p>아래에 나타난 번호는 고객님께서 선택한 좌석번호입니다.<br/>
         <input type="text" name="se" id="show"/>
         <input type="hidden" name="no" value="<%=request.getParameter("no")%>"/>
         <input type=button value="완료" class="button" onclick="javascript:send()"> 
         </form>
      </p>
</div>
<script type="text/javascript">
function send(){
	document.form.submit();
	self.close();
}
</script>
<!-- end #container -->
</body>
</html>