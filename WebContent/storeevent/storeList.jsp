<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���庰 �̺�Ʈ</title>
</head>
<body>
<center><b>���庰 �̺�Ʈ</b>
<c:if test="${totalCount==0 }">
<table width="1000" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
		�Խ��ǿ� ����� ���� �����ϴ�.
		</td>
	</tr>
</table>
</c:if>
<c:if test="${totalCount>0 }">
<table border="1" width="1000" cellpadding="0" cellspacing="0" align="center">
	<tr height="30">
		<td align="center" width="50">��ȣ</td>
		<td align="center" width="100">����</td>
		<td align="center" width="250">����</td>
		<td align="center" width="200">�Ⱓ</td>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr height="30">
			<td align="center" width="50">
				<c:out value="${vo.num }"/>
				<c:set var="num" value="${vo.num-1 }"/>
				
			</td>
			<td width="100" align="center">${vo.store }</td>
			<td width="250" align="center"><a href="storeviewAction.action?num=${vo.num }&currentPage=${currentPage}&file_savname=${vo.file_savname}">${vo.subject }</a></td>
			<td width="200" align="center">${vo.day }</td>
		</tr>
	</c:forEach>	
</table>
</c:if>
</body>
<input type="button" value="�۾���" onclick="document.location.href='storewriteForm.action?currentPage=${currentPage}'">
</center>
</html>