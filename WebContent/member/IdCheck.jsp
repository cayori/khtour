<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>아이디 중복확인</title>
</head>
<body> 	
<s:if test='%{confirmidcheck == "yes"}'>
<form name="frm" method="post" action="JoinForm.action" target="joinwin">
<input type="hidden" name="confirmidcheck" value="<s:property value="confirmidcheck"/>"/>
<input type="hidden" name="id" value="<s:property value="id"/>"/>
</form>
<script type="text/javascript">
alert("해당 아이디는 사용 가능합니다.");
document.frm.submit();
self.close();
</script>
</s:if>
<s:elseif test='%{confirmidcheck == "no"}'>
<form name="frm" method="post" action="JoinForm.action" target="joinwin">
<input type="hidden" name="confirmidcheck" value="<s:property value="confirmidcheck"/>"/>
<input type="hidden" name="id" value="<s:property value="id"/>"/>
</form>
<script type="text/javascript">
alert("해당 아이디가 존재합니다.");
document.frm.submit();
self.close();
</script>
</s:elseif>
</body>
</html>