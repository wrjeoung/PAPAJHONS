<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>진행중인 이벤트 리플 관리</title>
</head>
<body>
<table align="center" width="800" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td align="center"><h2>진행중인 이벤트 리플 관리</h2>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
</table>
<c:if test="${totalCount>0 }">
	<table align="center" border="1" cellspacing="0" cellpadding="2">
	<tr align="center" bgcolor="#F6F6F6">
		<td width="50"><strong>댓글번호</strong></td>
		<td width="150"><strong>댓글내용</strong></td>
		<td width="50"><strong>댓글등록일</strong></td>
		<td width="50"><strong>이벤트글번호</strong></td>
		<td width="80"><strong>작성자ID</strong></td>
		<td width="80"><strong>댓글삭제</strong></td>
		</tr>
	<c:forEach var="list" items="${list }">
		<tr align="center">
			<td>
				<c:out value="${list.num1 }"/>
			</td>
			<td>${list.content }</td>
			<td>${list.reg_date }</td>
			<td>${list.num }</td>
			<td>${list.id }</td>
			<td><input type="button" value="댓글삭제" onclick="document.location.href='redeleteAction.action?num1=${list.num1}'"/></td>
		</tr>
	
	</c:forEach>
</c:if>

<c:if test="${totalCount <= 0}">
				
	<tr bgcolor="#FFFFFF"  align="center">
		<td colspan="11">등록된 게시물이 없습니다.</td>
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
		<input type="button" value="관리자 홈으로 가기" class="inputb"
				onClick="javascript:location.href='adminMainAction.action'"/>
	</td>
</tr>
</table>
</body>
</html>