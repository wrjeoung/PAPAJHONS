<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>신용카드</title>
</head>
<body>
<center><b>신용카드</b>
<table width="800" cellpadding="1" cellspacing="1" align="center">
	<c:forEach var="vo" items="${list }">
		<tr height="250">
			<td width="100" align="center">
				${vo.subject }<br/>
				<img src="../ccfile/${vo.file_savname }">
			</td>
			<td width="450" align="left">
				${vo.content }
			</td>
			</tr>
			<tr>
			<td align="right">
			<input type="button" value="글수정" onclick="document.location.href='crecardmodifyForm.action?num=${vo.num}&file_savname=${file_savname}'">
			<input type="button" value="글삭제" onclick="document.location.href='crecarddeleteAction.action?num=${vo.num}'">
			</td>
			</tr>
	</c:forEach>
<input type="button" value="글쓰기" onclick="document.location.href='crecardwriteForm.action'">
</table>
</center>
</body>

</html>