<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>	
<title>인기 상품</title>
</head>
<body>
<h1><b>인기 여행 상품</b></h1>
<br/><br/><br/>
<img src="/khtour/img/num1.jpg" width="30px" height="30px"/><br/><strong><s:property value="name1"/></strong>
<a href="SelectItem.action?no=<s:property value="no1"/>" style="display:block; width:180px; height:180px;" ><img src="<s:property value="i1"/>" width="200" height="200"/></a><br/>
<img src="/khtour/img/num2.jpg" width="30px" height="30px"/><br/><strong><s:property value="name2"/></strong>
<a href="SelectItem.action?no=<s:property value="no2"/>" style="display:block; width:180px; height:180px;" ><img src="<s:property value="i2"/>" width="200" height="200"/></a><br/>
<img src="/khtour/img/num3.jpg" width="30px" height="30px"/><br/><strong><s:property value="name3"/></strong>
<a href="SelectItem.action?no=<s:property value="no3"/>" style="display:block; width:180px; height:180px;" ><img src="<s:property value="i3"/>" width="200" height="200"/></a><br/>
</body>
</html>