<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지사항</title>
</head>
<body>
<center><b>공지사항</b>
<br>
<form>
<table width="1000" border="1" cellspacing="0" cellpadding="0" align="center">
	<tr height="30" align="center">
		<td align="center" width="100">${vo.subject }<font style="margin-left: 350px">작성일:${vo.reg_date }</font></td>
	</tr>
	<tr height="500" align="center">
		
		<td align="left" width="100" colspan="3"><pre>${vo.content }</pre>
		<c:if test="${vo.file_savname }!=null">
		<img src="../save/${file_savname }"></td>
		</c:if>
	</tr>
	<%-- <tr>
		<td align="left" width="125">${vo.file_orgname }
	</tr> --%>
	
	<tr>
		<td align="right" colspan="2">
				
				<input type="button" value="글수정" onclick="document.location.href='modifyForm.action?num=${vo.num}&currentPage=${currentPage}&file_savname=${file_savname}'">
				<input type="button" value="글삭제" onclick="document.location.href='deleteAction.action?num=${vo.num}&currentPage=${currentPage} '">
				<input type="button" value="목록" onClick="document.location.href='listAction.action?currentPage=${currentPage}'">
		</td>
	</tr>
</table>
	
</form>
</body>
</html>