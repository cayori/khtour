<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	var auto_refresh = setInterval(function() {//주기적으로 요청 응답이 발생하여 클라이언트가 특별한 작업을 하지 않아도 주기적으로 세션연장
		$('#check').load("ConfirmCheck.action").fadeIn("fast");//중복 로그인 시도가 있었는지 주기적으로 체크
		$('#check').load("AppOut.action").fadeIn("fast");//세션이 종료된 아이디가 있는지 주기적으로 체크
	}, 3000);
	
</script>
<title>KHTOUR</title>
</head>
<center>
	<body>
		<table width="1550">
		<form name="fr">
		<input type="hidden" name="ee" value="<s:property value="#session.id"/>"/>
		</form>
			<tr>
				<td height="150" width="1550"><tiles:insertAttribute
						name="header" /></td>
			</tr>
			<tr>
				<td width="1550" valign="middle" colspan="3"><tiles:insertAttribute
						name="body" /></td>
			</tr>
			<tr>
				<td height="110" width="1550" valign="bottom" align="center"
					colspan="3"><tiles:insertAttribute name="footer" /></td>
			</tr>
		</table>
	</body>
</center>
</html>

