<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����� ���� �̺�Ʈ</title>
</head>
<body>
<center><b>����� ���� �̺�Ʈ</b>
<br/>
<c:forEach var="vo" items="${list }">
	<tr height="600">
		<td width="600">
			<img src="../save5/${vo.file_savname }"></a><br/>
			<input type="button" value="�ۼ���" onclick="document.location.href='specialmodifyForm.action?num=${vo.num}&file_savname=${file_savname}'">
			<input type="button" value="�ۻ���" onclick="document.location.href='specialdeleteAction.action?num=${vo.num}'">
			<br/>
		</td>
	</tr>
	
</c:forEach>
</body>
<td align="center">
<input type="button" value="�۾���" onclick="document.location.href='specialwriteForm.action?currentPage=${currentPage}'">
</center>
</html>