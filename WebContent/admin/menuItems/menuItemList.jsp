<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>파파존스 메뉴 관리</title>
<link rel="stylesheet" href="/StrutsBoard/board/common/css/css.css"
	type="text/css"/>
	
<script type="text/javascript" language="JavaScript">
</script>

</head>


<body >
	<table width="900" border="0" cellspacing="0" cellpadding="2" align="center">
		<tr>
			<td align="center"><h2>파파존스 메뉴 관리</h2></td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
	</table> 
	
	<table width="900" border="1" cellspacing="0" cellpadding="2" align="center">
		<tr align="center" bgcolor="#F3F3F3">
			<td width="100"><strong>메뉴카테고리</strong></td>
			<td width="150"><strong>메뉴이름</strong></td>
			<td width="200"><strong>설명</strong></td>
		</tr>
		
		<c:forEach var="list" items="${lists }">
			<tr bgcolor="#FFFFFF" align="center">
				<c:if test="${list.menuid == 'pj_2002'}"><td><c:out value="${'베스트메뉴' }" /></td></c:if> <!-- 베스트메뉴 -->
				<c:if test="${list.menuid == 'pj_2003'}"><td><c:out value="${'오리지널' }" /></td></c:if> <!-- 오리지널 -->
				<c:if test="${list.menuid == 'pj_2004'}"><td><c:out value="${'골드링' }" /></td></c:if> <!-- 골드링 -->
				<c:if test="${list.menuid == 'pj_2005'}"><td><c:out value="${'치즈롤' }" /></td></c:if> <!-- 치즈롤 -->
				<c:if test="${list.menuid == 'pj_2006'}"><td><c:out value="${'씬' }" /></td></c:if> <!-- 씬 -->
				<c:if test="${list.menuid == 'pj_2008'}"><td><c:out value="${'골드링 씬' }" /></td></c:if> <!-- 골드링 씬 -->
				<c:if test="${list.menuid == 'pj_2009'}"><td><c:out value="${'하트 씬' }" /></td></c:if> <!-- 하트 씬 -->
				<c:if test="${list.menuid == 'pj_2010'}"><td><c:out value="${'파파플래터' }" /></td></c:if> <!-- 파파플래터 -->
				<c:if test="${list.menuid == 'pj_2011'}"><td><c:out value="${'세트메뉴' }" /></td></c:if> <!-- 세트메뉴 -->
				<c:if test="${list.menuid == 'pj_2012'}"><td><c:out value="${'사이드' }" /></td></c:if> <!-- 사이드 -->
				<c:if test="${list.menuid == 'pj_2013'}"><td><c:out value="${'음료' }" /></td></c:if> <!-- 음료 -->
				
				<td align="left">&nbsp; 
					<a href="menuItemViewAction.action?no=${list.no }&menuid=${list.menuid }&name=${list.name }&currentPage=${currentPage}" />
					<c:out value="${list.name }"/>
				</td>
				<td align="center"><c:out value="${list.description }" /></td>
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
			<td bgcolor="#ececec" colspan="5" align="center">
				<input type="button" value="메뉴 추가" class="inputb"
				onclick="javascript:location.href='menuItemWriteAction.action'" />
			</td>
		</tr>
	</table>
</body>
</html>

