<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������� �̺�Ʈ</title>
</head>
<body>
<center><b>�������� �̺�Ʈ</b>
<br>
<form>
<table width="1000" border="1" cellspacing="0" cellpadding="0" align="center">
	<tr height="30" align="center">
		<td align="center" width="100">${vo.subject }</td>
	</tr>
	<tr height="30" align="center">
		<td align="right" width="100">${vo.day }</td>
	</tr>
	<tr height="500" align="center">
		<td align="left" width="100" colspan="3"><img src="../save2/${vo.file_savname2 }"></td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<input type="button" value="���" onClick="document.location.href='listAction2.action?currentPage=${currentPage}'">
		</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<input type="button" value="�ۼ���" onclick="document.location.href='modifyForm2.action?num=${vo.num}&currentPage=${currentPage}&file_savname=${file_savname}&file_savname2=${file_savname2}'">
			<input type="button" value="�ۻ���" onclick="document.location.href='deleteAction2.action?num=${vo.num}&currentPage=${currentPage} '">
		</td>
	</tr>
</table>
</form>
<br/>
<c:if test="${totalCount==0 }">
	<table width="900" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center">
				�Խ��ǿ� ����� ���� �����ϴ�.
			</td>
		</tr>
	</table>

</c:if>
<form action="RewriteAction.action" method="post">
	<textarea rows="5" cols="125" name="content"></textarea>
	<input type="submit" value="��۾���"/>
</form>
</body>

</html>