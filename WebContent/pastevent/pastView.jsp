<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �̺�Ʈ</title>
</head>
<body>
<center><b>���� �̺�Ʈ</b>
<br>
<form>
<table width="600" border="1" cellspacing="0" cellpadding="0" align="center">
	<tr height="30" align="center">
		<td align="center" width="100">${vo.subject }<br/><font style="margin-left: 150px">�Ⱓ:${vo.day}</font></td>
	</tr>
	<%-- <tr height="30" align="center">
		<td align="center" width="100">${vo.reg_date }</td>
	</tr> --%>
	<tr height="500" align="center"><pre>${vo.content }</pre>
		<td align="center" width="100"><img src="../save4/${vo.file_savname }"></td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<input type="button" value="���" onclick="document.location.href='pastlistAction.action?currentPage=${currentPage}'">
		</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<input type="button" value="�ۼ���" onclick="document.location.href='pastmodifyForm.action?num=${vo.num}&currentPage=${currentPage }&file_savname=${file_savname }'">
			<input type="button" value="�ۻ���" onclick="document.location.href='pastdeleteAction.action?num=${vo.num }&currentPage=${currentPage}'">
		</td>
	</tr>
</table>
</form>
</body>
</html>