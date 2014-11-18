<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>파파존스- 관리자 페이지 - 주문 관리</title>
</head>
<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
		<tr>
			<td align="center"><h2>주문 목록</h2></td>
		</tr>
		<tr><td height="20"></td></tr>
	</table>
	
	<table width="950" border="1" cellspacing="0" cellpadding="2" align="center">
		<tr align="center" bgcolor="#F3F3F3">
			<td width="50"><strong>주문번호</strong></td>
			<td width="100"><strong>ID</strong></td>
			<td width="200"><strong>주문일자</strong></td>
			<td width="250"><strong>상품명</strong></td>
			<td width="100"><strong>수량</strong></td>
			<td width="100"><strong>금액</strong></td>
			<td width="150"><strong>상태</strong></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="7"></td>
		</tr>
		
		
		<c:forEach var="order" items="${list}">			
			<tr bgcolor="#FFFFFF" align="center">
				<td><c:out value="${order.no}"/></td>
				<td><c:out value="${order.userid}"/></td>
				<td>
					<fmt:formatDate value="${order.regdate}" pattern="yyyy-MM-dd a hh:mm"/>
				</td>
				<td>
					<a href="adminOrderModifyAction.action?no=${order.no}&check=modify">${order.ordername}</a>
				</td>
				<td><c:out value="${order.amount}"/></td>
				<td><c:out value="${order.price}" /></td>
				<td><c:out value="${order.deliveryinfo}"/></td>
			</tr>
		</c:forEach>
		
		<c:if test="${totalCount <= 0}">
			<tr bgcolor="#FFFFFF" align="center">
				<td colspan="7">등록된 게시물이 없습니다.</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="7"></td>
			</tr>
		</c:if>
		
		<tr align="center">
			<td colspan="7">${pagingHtml}</td>
		</tr>
		
		<tr bgcolor="#FFFFFF" align="right">
			<td colspan="7">
				<input type="button" value="관리자 홈으로 가기" class="inputb"
				onClick="javascript:location.href='adminMainAction.action'"/>
			</td>
		</tr>
	</table>
</body>
</html>