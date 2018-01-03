<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>
<title>주문내역</title>
	<link rel="stylesheet" type="text/css" href="/khtour/css/asdf.css">
<script language="JavaScript">

function check(){
    var orderForm=eval("document.orderForm");
    
    if(!orderForm.tel.value){
      alert("연락처를 입력하세요");
      document.orderForm.tel.focus();
      return;
  }
  

}
</script>
</head>

<body>
	<div class="wrap">
		<div class="contents">
			<h1>주문내역</h1>
			<h2></h2>
			<ul><center><li><img src="/khtour/img/KHTOUR-logo.png" alt=""></li></center></ul>
			<ul class="content_info">
				<center><li>주문이 완료되었습니다. 감사합니다.</li></center>
			</ul>
			<div class="btn_wrap">
			<a href="MyPageForm.action" >마이페이지</a><a href="Main.action">홈</a>
			</div>	
		</div>
	</div>
	
</body>