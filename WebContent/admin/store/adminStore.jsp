<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>파파존스- 관리자 페이지</title>
</head>
<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
		<tr>
			<td align="center"><h2>매장 관리</h2></td>
		</tr>
		<tr><td height="20"></td></tr>
	</table>
	
	<table width="1120" border="0" cellspacing="0" cellpadding="2" align="center">
		<tr align="center" bgcolor="#F3F3F3">
			<td width="50"><strong>번호</strong></td>
			<td width="70"><strong>지역명</strong></td>
			<td width="200"><strong>매장명</strong></td>
			<td width="200"><strong>전화번호</strong></td>
			<td width="300"><strong>매장주소</strong></td>
			<td width="200"><strong>영업시간</strong></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="6"></td>
		</tr>
		
		<c:forEach var="store" items="${list}">			
			<tr bgcolor="#FFFFFF" align="center">
				<td><c:out value="${store.no}"/></td>
				<td><c:out value="${store.location}"/></td>
				<td>
					<a href="adminStoreModifyAction.action?store=${store.storename}&check=modify">${store.storename}</a>
				</td>
				<td><c:out value="${store.phone}" /></td>
				<td><c:out value="${store.address}"/></td>
				<td><c:out value="${store.businesshours}"/></td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="6"></td>
			</tr>
		</c:forEach>
		
		<c:if test="${totalCount <= 0}">
			<tr bgcolor="#FFFFFF" align="center">
				<td colspan="6">등록된 게시물이 없습니다.</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="6"></td>
			</tr>
		</c:if>
		
		<tr align="center">
			<td colspan="6">${pagingHtml}</td>
		</tr>
		
		<tr align="right">
			<td colspan="6">
				<input type="button" value="매장추가" class="inputb"
				onClick="javascript:location.href='adminStoreAddAction.action?check=add';"/>
			</td>
		</tr>
		
		<tr align="right">
			<td colspan="6">
				<input type="button" value="관리자 홈으로 가기" class="inputb"
				onClick="javascript:location.href='adminMainAction.action'"/>
			</td>
		</tr>
		
	</table>
</body>
</html>