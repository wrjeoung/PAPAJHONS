<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �̺�Ʈ ����</title>
</head>
<body>
<table align="center" width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td align="center"><h2>���� �̺�Ʈ ����</h2></td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
</table>
<c:if test="${totalCount>0 }">
	<table align="center" border="1" cellspacing="0" cellpadding="2">
		<tr align="center" bgcolor="#F6F6F6">
			<td width="80"><strong>�۹�ȣ</strong></td>
			<td width="80"><strong>����</strong></td>
			<td width="80"><strong>����</strong></td>
			<td width="150"><strong>�Ⱓ</strong></td>
			<td width="80"><strong>��ȸ��</strong></td>
			<td width="100"><strong>�����������</strong></td>
			<td width="100"><strong>�������������</strong></td>
			<td width="150"><strong>�����</strong></td>
		</tr>
		
		<c:forEach var="list" items="${list }">
			<tr align="center" style="cursor: pointer;" onclick="document.location.href='pastmodifyForm.action?num=${list.num}'">
			<td>
				<c:out value="${list.num }"/>
			</td>
			<td>${list.subject}</td>
			<td>${list.content}</td>
			<td>${list.day}</td>
			<td>${list.readhit}</td>
			<td>${list.file_orgname}</td>
			<td>${list.file_savname}</td>
			<td>${list.reg_date}</td>
			</tr>
			
		</c:forEach>
</c:if>
<c:if test="${totalCount <= 0}">
				
	<tr bgcolor="#FFFFFF"  align="center">
		<td colspan="11">��ϵ� �Խù��� �����ϴ�.</td>
	</tr>						
	<tr bgcolor="#777777">
		<td height="1" colspan="6"></td>
	</tr>
    		
</c:if>	

<tr align="center">
	<td colspan="10">${pagingHtml}</td>
</tr>
<tr align="center">
	<td colspan="10">
		<input type="button" value="�۾���" onclick="document.location.href='pastwriteForm.action?currentPage=${currentPage}'">
		<input type="button" value="������ Ȩ���� ����" class="inputb"
				onClick="javascript:location.href='adminMainAction.action'"/>
	</td>
</tr>
</table>
</body>
</html>