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
<script  type="text/javascript">
function gosubmit1(){
   var f = document.orderForm;
   f.method = "post";
   f.action = "PayUpdate.action";
   f.submit();
}
function gosubmit2(){
   var f = document.orderForm;
   f.method = "post";
   f.action = "PayDelete.action";
   f.submit();
}
</script>
</head>

<body>
   <div class="wrap">
      <div class="contents">
         <h1>주문내역</h1>
         <form name="orderForm" >
  <s:hidden name="id" value="%{#session.id}" />
   <s:hidden name="seq_no" value="%{orderVO.seq_no}" />
   <s:hidden name="name" value="%{orderVO.name}" />
         <h2>상품번호- <span> <s:property value="orderVO.seq_no" /></span></h2>
         <ul class="content_info">
            <li class="content_name">상품정보</li>
            <li class="content_info_1">
               <ul>
                  <li>상품명</li>
                  <li><s:property value="orderVO.name" /></li>
               </ul>
            </li>
            <li class="content_info_1">
               <ul>
                  <li>상품수량</li>
                  <li> <s:property value="orderVO.amount" /></li>
               </ul>
            </li>
            <li class="content_info_1">
               <ul>
                  <li>가격</li>
                  <li><s:property value="orderVO.price" /></li>
               </ul>
            </li>
            <s:if test="orderVO.kinds!=null">
         <li class="content_info_1">
               <ul>
                  <li>옵션</li>
                  <li><s:property value="orderVO.kinds" />    </li>
               </ul>
            </li> 
            </s:if>
            <s:if test="orderVO.ad!=null">
            <li class="content_info_1">
               <ul>
                  <li>출발일</li>
                  <li><s:property value="orderVO.ad" /></li>
               </ul>
            </li>
            <li class="content_info_1">
               <ul>
                  <li>도착일</li>
                  <li><s:property value="orderVO.dd" /></li>
               </ul>
            </li>
            </s:if>
            <s:if test="orderVO.checkin!=null">
            <li class="content_info_1">
               <ul>
                  <li>체크인</li>
                  <li><s:property value="orderVO.checkin" /></li>
               </ul>
            </li>
            <li class="content_info_1">
               <ul>
                  <li>체크아웃</li>
                  <li><s:property value="orderVO.checkout" /></li>
               </ul>
            </li>
            </s:if>
            <li class="content_name">예약정보</li>
            <li class="content_info_1">
               <ul>
                  <li>예약자</li>
                  <li> <s:property value="member.name" /></li>
               </ul>
               
            </li>
            <li class="content_info_1">
               <ul>
                  <li>연락처</li>
                  <li>
            <s:textfield theme="simple" name="tel" size="30" maxlength="50"   value="%{member.tel}" />
                  </li>
               </ul>
            </li>
               <li class="content_info_1">
               <ul>
                  <li>입금 은행</li>
                  <li>
                  &nbsp;&nbsp;&nbsp;농협(79004484253982)
                  </li>
               </ul>
            </li>
            <li class="content_info_1">
               <ul>
                  <li>예금주</li>
                  <li>
                  &nbsp;&nbsp;&nbsp;(주)KHTOUR
                  </li>
               </ul>
            </li>
         </ul>
         <div class="btn_wrap">
         <style>
         .button {
display: block;
      display: block;
    float: right;
    width: 100px;
    height: 40px;
    background: none;
    margin-top: 10px;
    margin-left: 20px;
    text-align: center;
    line-height: 40px;
    border: 1px solid #e9871f;
    color: #666;
    text-decoration: none;
    color: #232323;
    cursor: pointer;
    text-decoration: none;
}
}
</style>
      <li><a href="javascript:gosubmit1();">예약</a></li><li><a href="javascript:gosubmit2();">구매취소</a></li>       
         </div>
      </form> 
      </div>
   </div>
   
</body>
</html>