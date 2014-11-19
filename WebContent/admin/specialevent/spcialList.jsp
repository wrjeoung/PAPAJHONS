<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>스페셜 할인 이벤트 관리</title>
</head>
<body>
<table align="center" width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td align="center"><h2>스페셜 할인 이벤트 관리</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
<c:if test="${totalCount>0 }">
	<table align="center" border="1" cellspacing="0" cellpadding="2">
		<tr align="center" bgcolor="#F6F6F6">
			<td width="50"><strong>글번호</strong></td>
			<td width="100"><strong>이벤트이미지원본파일</strong></td>
			<td width="100"><strong>이벤트이미지저장된파일</strong></td>
			<td width="50"><strong>등록일</strong></td>
		</tr>
		<c:forEach var="list" items="${list }">
			<tr align="center" style="cursor: pointer;" onclick="document.location.href='specialmodifyForm.action?num=${list.num}&file_savname=${list.file_savname}'">
			<td>
				<c:out value="${list.num }"/>
			</td>
			<td>${list.file_orgname }</td>
			<td>${list.file_savname }</td>
			<td>${list.reg_date }
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
		<input type="button" value="글쓰기" onclick="document.location.href='specialwriteForm.action?currentPage=${currentPage}'">
	</td>
</tr>
</table>
</body>
</html>