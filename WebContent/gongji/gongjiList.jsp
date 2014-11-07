<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지사항</title>

</head>
<body>
<center><b>공지사항</b>
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
	<tr height="40">
		<td align="center" width="50">번호</td>
		<td align="center" width="400">제목</td>
		<td align="center" width="100">등록일</td>
		<td align="center" width="50">조회수</td>
	</tr>
	<c:forEach var="vo" items="${list  }">
		<tr height="30">
			<td align="center" width="50">
			<c:out value="${vo.num }"/>
			<c:set var="num" value="${vo.num-1 }"/>
			</td>
			<td width="400">
		
			<a href="viewAction.action?num=${vo.num }&currentPage=${currentPage}&file_savname=${vo.file_savname}">
			${vo.subject }
			</a>
			</td>
			<td align="center" width="100">${vo.reg_date }</td>
			<td align="center" width="50">${vo.readhit }</td>
		</tr>
	</c:forEach>
	</table>
</c:if>
<br/>
<form action="getlistAction.action" method="post">
			<select name="searchCondition">
				<option name="subject" value="SUBJECT"<c:if test="${searchCondition=='SUBJECT'}">selected</c:if>>제목
				<option name="content" value="CONTENT"<c:if test="${searchCondition=='CONTENT'}">selected</c:if>>내용
			</select>
			<input name="searchKeyword" type="text" value="${searchKeyword }">
			<input type="submit" value="검색"/>

</form>
<tr align="center">
    <td colspan="5"><s:property value="pagingHtml"  escape="false" /></td>
</tr>
<br/>
</body>
<input type="button" value="글쓰기" onclick="document.location.href='writeForm.action?currentPage=${currentPage}'">
</html>