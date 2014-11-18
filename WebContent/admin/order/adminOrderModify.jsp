<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>파파존스- 관리자 페이지 - 주문 목록 수정</title>
</head>
<body>
	<c:choose>
		<c:when test="${ check eq 'modify'}">
			<h1 style="text-align:center;">주문 목록 수정</h1>
			<form action="adminOrderModifyProAction.action?no=${dto.no}" name="orderModify" method="post">
				<table align="center" border="1" cellspacing="0" cellpadding="2">
					<tr bgcolor="#ececec" align="center">
						<th colspan="7">수정</th>
					</tr>
					
					<tr align="center" bgcolor="#F3F3F3">
						<td width="50"><strong>주문번호</strong></td>
						<td width="100"><strong>ID</strong></td>
						<td width="200"><strong>주문일자</strong></td>
						<td width="250"><strong>상품명</strong></td>
						<td width="100"><strong>수량</strong></td>
						<td width="100"><strong>금액</strong></td>
						<td width="150"><strong>상태</strong></td>
					</tr>
					
					<tr align="center" bgcolor="#FFFFFF">
						<td><c:out value="${dto.no}" /></td>
						<td><c:out value="${dto.userid}" /></td>
						<td>
							<fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a hh:mm"/>
						</td>
						<td><c:out value="${dto.ordername}" /></td>
						<td><c:out value="${dto.amount}" /></td>
						<td><c:out value="${dto.price}" /></td>
						<td>
							<select id="deliveryinfo" name="deliveryinfo">
								<option value="배송 준비중"  <c:if test="${dto.deliveryinfo eq '배송 준비중' }">SELECTED</c:if>  >배송 준비중</option>
								<option value="배송중"     <c:if test="${dto.deliveryinfo eq '배송중' }" >SELECTED</c:if>     >배송중</option>
								<option value="배송 완료"   <c:if test="${dto.deliveryinfo eq '배송 완료' }" >SELECTED</c:if>   >배송 완료</option>
							</select> 
						</td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" colspan="7" align="center">
							<input type="submit" value="수정하기">
							<input type="button" value="주문 목록 페이지 " onclick="javascript:window.location='adminOrderAction.action'">
						</td>
					</tr>
				</table>		
				<br/><br/>
			</form>
		</c:when>
		<c:otherwise>
			<script>
				alert("주문 목록 수정 완료!!!");
				location.href='adminOrderAction.action'
				//history.go(-1);
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>