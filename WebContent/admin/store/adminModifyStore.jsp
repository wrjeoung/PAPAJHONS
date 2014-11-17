<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>파파존스- 관리자 페이지 - 매장 수정</title>
</head>
<body>
	<c:choose>
		<c:when test="${ check eq 'modify'}">
			<h1 style="text-align:center;">파파존스 지점(매장) 수정</h1>
			<form action="adminStoreModifyProAction.action" name="storeModify" method="post">
				<table align="center" border="1" cellspacing="0" cellpadding="2">
					<tr bgcolor="#ececec" align="center">
						<th colspan="2">파파존스 지점(매장) 수정</th>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">매장 지역</td>
						<td><input type="text" name="location" size="30" maxlength="30" value="${dto.location}"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">매장명</td>
						<td><input type="text" name="storename" size="50" maxlength="50" value="${dto.storename}"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">전화번호</td>
						<td><input type="text" name="phone" size="30" maxlength="30" value="${dto.phone}"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">매장주소</td>
						<td><input type="text" name="address" size="50" maxlength="50" value="${dto.address}"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">영업시간</td>
						<td><input type="text" name="businesshours" size="40" maxlength="40" value="${dto.businesshours}"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">매장타입</td>
						<td><input type="text" name="storetype" size="40" maxlength="40" value="${dto.storetype}"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">주차여부</td>
						<td><input type="text" name="storeparking" size="40" maxlength="40" value="${dto.storeparking}"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">위도(x)</td>
						<td><input type="text" name="latitude" size="40" maxlength="40" value="${dto.latitude}"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">경도(y)</td>
						<td><input type="text" name="longitude" size="40" maxlength="40" value="${dto.longitude}"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">신규오픈유무</td>
						<td><input type="text" name="newopen" size="30" maxlength="30" value="${dto.newopen}"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">이미지패스</td>
						<td><input type="text" name="imagepath" size="50" maxlength="50" value="${dto.imagepath}"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" colspan="2" align="center">
							<input type="submit" value="수정하기">
							<input type="button" value="삭제하기" onclick="javascript:window.location='adminStoreDelAction.action?store=${dto.storename}&check=del'">
							<input type="button" value="매장 관리 페이지 " onclick="javascript:window.location='adminStoreAction.action'">
						</td>
					</tr>
				</table>		
				<br/><br/>
			</form>
		</c:when>
		<c:otherwise>
			<script>
				alert("매장 수정 완료!!!");
				location.href='adminStoreAction.action'
				//history.go(-1);
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>