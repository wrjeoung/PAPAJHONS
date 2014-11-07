<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>지난 이벤트</title>
</head>
<body>
<center><b>지난 이벤트</b>
<c:if test="${totalCount==0 }">
<table width="600" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
			게시판에 저장된 글이 없습니다.
		</td>
	</tr>
</table>
</c:if>
<c:if test="${totalCount>0 }">
<table border="1" width="600" cellpadding="0" cellspacing="0" align="center">
	<tr height="30">
		<td align="center" width="50">번호</td>
		<td align="center" width="400">제목</td>
		<td align="center" width="250">기간</td>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr height="30">
			<td align="center" width="50">
				<c:out value="${vo.num }"/>
				<c:set var="num" value="${vo.num-1 }"/>
			</td>
			<td width="400">
				<a href="pastviewAction.action?num=${vo.num }&currentPage=${currentPage}&file_savname=${vo.file_savname}">${vo.subject }</a>
			</td>
			<td width="250">
				${vo.day }
			</td>
		</tr>	
	</c:forEach>
</table>
</c:if>
<tr align="center">
    <td colspan="5"><s:property value="pagingHtml"  escape="false" /></td>
</tr>
<br/>
<input type="button" value="글쓰기" onclick="document.location.href='pastwriteForm.action?currentPage=${currentPage}'">
</body>
</html>