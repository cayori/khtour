<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>여행상품상세보기</title>
<link rel="stylesheet" type="text/css" href="/khtour/css/detail1.css">
<link rel="stylesheet" type="text/js" href="/khtour/css/detail1.css">


<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet"
   href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script language="javascript"> 
function len_chk(){  

  var frm = document.comment.c_content; 
  if(frm.value.length > 10){  
       alert("글자수는 10글자미만으로 제한됩니다.!");  
       frm.value = frm.value.substring(0,11);  
       frm.focus();  
  } 
} 
</script>
<script type="text/javascript">
function check1(){
if (comment.c_content.value == "") {
   alert("댓글을 입력해주세요");
   return false;
}
}

</script>
<script language="JavaScript">
   function Check(x) {
      var grade = document.getElementById("g");
      var nx = Number(x);
      for (i = 1; i <= 5; i++) {
         if (i <= nx) {
            var imgx = document.getElementById(String(i));
            imgx.src = "/khtour/img/star.jpg";
         }
         if (i > nx) {
            var imgx = document.getElementById(String(i));
            imgx.src = "/khtour/img/nostar.jpg";
         }
      }
      grade.value = nx;
   }
</script>
<script>
   function deletecheck() {
      return confirm("댓글을 삭제하시겠습니까?");
   }
</script>
<script  type="text/javascript">
function gosubmit1(){
   var f = document.frm;
   f.method = "post";
   f.action = "Pay.action";
   f.submit();
}
function gosubmit2(){
   var f = document.frm;
   f.method = "post";
   f.action = "InsertBasket.action";
   f.submit();
}
</script>
</head>
<body>
<jsp:include page="../item/SideBar.jsp" flush="false" />
   <div class="header_gab"></div>


   <div class="wrap">
      <div class="contents">

         <!--상품상세보기-->
         <div class="section1">
            <div class="content_img">
               <img src="/khtour/img2/<s:property value="item.image1"/>" alt="">
            </div>




            <div class="content_info">
               <ul>
                  <form name="frm" action="Pay.action" method="post"
                     onsubmit="return check()">
                     <s:hidden name="seq_no" value="%{item.no}" />
                     <s:hidden name="name" value="%{item.name}" />
                     <s:hidden name="price" value="%{item.price}" />
                     <s:hidden name="id" value="%{#session.id}" />
                     <s:hidden name="hai" value="%{item.hai}" />
                     <s:hidden name="no" value="%{item.no}" />
                     <s:hidden name="image1" value="%{item.image1}"/>

                     <li><h2><s:property value="%{item.name}" /></h2></li>
                     <li><span>금액</span> <s:property value="%{item.price}" />원</li>
                     <li><span>인원</span><select name="people" class="select">
                           <option value="1">1</option>
                           <option value="2">2</option>
                           <option value="3">3</option>
                           <option value="4">4</option>
                           <option value="5">5</option>
                           <option value="6">6</option>
                           <option value="7">7</option>
                           <option value="8">8</option>
                           <option value="9">9</option>
                           <option value="10">10</option>
                           <option value="11">11</option>
                           <option value="12">12</option>
                           <option value="13">13</option>
                           <option value="14">14</option>
                     </select> 명</li>

                  <li><a href="javascript:gosubmit1();" onclick="return check()">예약</a></li><li><a href="javascript:gosubmit2();">장바구니담기</a></li>
                  </form>
               </ul>
            </div>
         </div>

         <!--상품사진-->
         <!-- <div class="section2"> -->
            <img src="/khtour/img2/<s:property value="item.image2"/>" alt="">
            <img src="/khtour/img2/<s:property value="item.image3"/>" alt="">
      <!--    </div> -->


         <!--후기게시판-->
         <div class="section3">
            <h1>여행상품후기</h1>

            <ul class="write">
               <li>
                  <ul>
                     <form name="comment" action="WriteItemC.action" method="post" onsubmit="return check1()">
                     <input type="hidden" name="no" value="<s:property value="no" />"/>
                        <li>
                           <!--호텔코멘트쓰기 및 별점 주기 --> 평점&nbsp;&nbsp;:&nbsp;&nbsp; <img
                           src="/khtour/img/star.jpg" width="20px" height="20px" id="1"
                           onclick="Check(this.id)"> <img src="/khtour/img/star.jpg"
                           width="20px" height="20px" id="2" onclick="Check(this.id)">
                           <img src="/khtour/img/star.jpg" width="20px" height="20px"
                           id="3" onclick="Check(this.id)"> <img
                           src="/khtour/img/nostar.jpg" width="20px" height="20px" id="4"
                           onclick="Check(this.id)"> <img
                           src="/khtour/img/nostar.jpg" width="20px" height="20px" id="5"
                           onclick="Check(this.id)">
                        </li>
                        <s:hidden id="g" name="c_grade" value="3" />
                        <!-- 별점 값 -->
                        <s:hidden name="no" value="%{item.no}" />
                        <s:hidden name="c_no" value="%{ContentCOI.c_no}" />
                        <s:hidden name="c_id" value="%{#session.id}" />
                        <li><span>글쓴이:</span><span><s:property
                                 value='%{#session.id}' /></span></li>
                        <!--c_id와 session.id와 같아야한다  -->
                  </ul>
               </li>
               <li><textarea onKeyup="len_chk()" name="c_content" class="simple" cols="100"
                     rows="10" style="margin: 0px; width: 1008px; height: 150px;"></textarea></li>
               <li><input type="submit" value="등록"></li>
               </form>
            </ul>

            <ul class="write_list_wrap">
               <li class="write_list_title">
                  <ul>
                     <li>평점</li>
                     <li>작성자</li>
                     <li>내용</li>
                     <li>작성날짜</li>
                     <li>삭제</li>
                  </ul>
               </li>
               <!--iterator  -->
               <s:if test="ContentCOI.size()<0">
                  <li class="write_list">
                     <ul>
                        <li>등록된 게시물이 없습니다.</li>
                     </ul>
                  </li>
               </s:if>
               <s:iterator value="ContentCOI" status="stat">
                  <li class="write_list_title">
                     <ul>
                        <s:if test="%{c_grade == 1}">
                           <li class="star"><img src="/khtour/img/stars1.png"
                              width="100px" height="25px" /></li>
                        </s:if>
                        <s:elseif test="%{c_grade == 2}">
                           <li class="star"><img src="/khtour/img/stars2.png"
                              width="100px" height="25px" /></li>
                        </s:elseif>
                        <s:elseif test="%{c_grade == 3}">
                           <li class="star"><img src="/khtour/img/stars3.png"
                              width="100px" height="25px" /></li>
                        </s:elseif>
                        <s:elseif test="%{c_grade == 4}">
                           <li class="star"><img src="/khtour/img/stars4.png"
                              width="100px" height="25px" /></li>
                        </s:elseif>
                        <s:elseif test="%{c_grade == 5}">
                           <li class="star"><img src="/khtour/img/stars5.png"
                              width="100px" height="25px" /></li>
                        </s:elseif>
                        <li><s:property value="c_id" /></li>
                        <li><s:property value="c_content" /></li>
                        <li><s:property value="c_reg_date" /></li>
                        <s:if test="%{#session.id==c_id}">
                           <li><a
                              href="DeleteItemCD.action?no=<s:property value="no" />&c_no=<s:property value="c_no"/>&currentPage=<s:property value="currentPage"/>"
                              onclick="return deletecheck()">삭제</a></li>
                        </s:if>
                        <!--삭제에 이미지를 넣어주면 좋을듯  -->


                     </ul>
                  </li>
               </s:iterator>
               <li>
                  <center>
                     <s:property value="pagingHtml" escape="false" />
                  </center>
               </li>
            </ul>

         </div>

         <!--Q&A-->
         <div class="section4">
            <h1>Q&A</h1>
            <ul class="write_list_wrap">
               <li class="write_list_title">
                  <ul>
                     <li>번호</li>
                     <li>작성자</li>
                     <li>제목</li>
                     <li>작성날짜</li>
                  </ul>
               </li>
               <s:if test="itemQ.size()<=0">
                  <li class="write_list">
                     <ul>
                        <li>등록된 게시물이 없습니다.</li>
                     </ul>
                  </li>
               </s:if>
               <s:iterator value="itemQ" status="stat">
                  <li class="write_list_title">
                     <ul>
                        <li><s:property value="question_no" /></li>
                        <li><s:property value="id" /></li>
                           <li><a href="SelectQuestion.action?question_no=<s:property value="question_no"/>"><s:property value="subject"/></a></li>
                        <li><s:property value="q_reg_date" /></li>
                     </ul>
                  </li>
               </s:iterator>
               <li>
                  <center>
                     <s:property value="pagingHtmlQ" escape="false" />
                  </center>
               </li>
            </ul>


         </div>
      </div>
      <footer> </footer>
</body>
</html>