<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>스트럿츠2 게시판</title>
<link rel="stylesheet" href="/StrutsBoard/board/common/css/css.css"
	type="text/css">
</head>

<body >
	<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
		<tr>
			<td ><h2>파파존스 메뉴 관리</h2></td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
	</table> 


	<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
		<tr align="center" bgcolor="#F3F3F3">
			<td width="30"><strong>메뉴ID</strong></td>
			<td width="150"><strong>메뉴이름</strong></td>
			<td width="200"><strong>설명</strong></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="5"></td>
		</tr>

		<c:forEach var="list" items="${lists }">
			<tr bgcolor="#FFFFFF" align="center">
				<td><c:out value="${list.menuid }" /></td>
				<td align="left">&nbsp; 
					<a href="viewAction.action?name=${list.name }&currentPage=${currentPage}" />
					<c:out value="${list.name }" />
				</td>
				<td align="center"><c:out value="${list.description }" /></td>
			</tr>

			<tr bgcolor="#777777">
				<td height="1" colspan="5"></td>
			</tr>
		</c:forEach>

		<c:if test="${totalCount<= 0} ">
			<tr bgcolor="#FFFFFF" align="center">
				<td colspan="5">등록된 게시물이 없습니다.</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="5"></td>
			</tr>
		</c:if>

		<tr align="center">
			<td colspan="5">${ pagingHtml}</td>
		</tr>

		<tr align="right">
			<td colspan="5"><input type="button" value="글쓰기" class="inputb"
				onClick="javascript:location.href='/StrutsBoard/writeForm.action?currentPage=${currentPage}'" />
			</td>
		</tr>
	</table>
</body>
</html>

