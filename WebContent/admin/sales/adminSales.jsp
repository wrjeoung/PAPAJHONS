<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>파파존스- 매출 목록 페이지</title>
</head>
<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
		<tr>
			<td align="center"><h2>매출 목록</h2></td>
		</tr>
	</table>
	
	<table width="850" border="0" cellspacing="0" cellpadding="2" align="center">
		<td align="right" colspan="3">
			<input name="list" type="button" value="1일" class="inputb">
			<input name="list" type="button" value="1주일" class="inputb">
			<input name="list" type="button" value="한달" class="inputb">
		</td>
	</table>
	
	<table width="850" border="0" cellspacing="0" cellpadding="2" align="center">
		<tr align="center" bgcolor="#F3F3F3">
			<td width="100"><strong>주문자ID</strong></td>
			<td width="200"><strong>상품명</strong></td>
			<td width="100"><strong>상품사이즈</strong></td>
			<td width="50"><strong>수량</strong></td>
			<td width="100"><strong>금액</strong></td>
			<td width="100"><strong>배송정보</strong></td>
			<td width="200"><strong>주문시간</strong></td>
		</tr>
	</table>
	
	<table width="850" border="0" cellspacing="0" cellpadding="2" align="center">
		<tr><td height="20"></td></tr>
		<td width="200"><strong>총 매출금액 : XXXXXX원</strong></td>
		<td width="200"><strong>총 매출수량 : XXXXXX개</strong></td>
		<td align="right" colspan="3">
			<input type="button" value="관리자 홈으로 가기" class="inputb" onClick="javascript:location.href='adminMainAction.action'"/>
		</td>
	</table>

</body>
</html>