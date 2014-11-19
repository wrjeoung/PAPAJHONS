<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>파파존스- 관리자 페이지 - 매장 추가</title>
</head>
<body>
	<c:choose>
		<c:when test="${ check eq 'add'}">
			<h1 style="text-align:center;">파파존스 지점(매장) 추가</h1>
			<form action="adminStoreAddProAction.action" name="storeAdd" method="post" enctype="multipart/form-data">
				<table align="center" border="1" cellspacing="0" cellpadding="2">
					<tr bgcolor="#ececec" align="center">
						<th colspan="2">매장 추가</th>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">매장 지역</td>
						<td><input type="text" name="location" size="30" maxlength="30"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">매장명</td>
						<td><input type="text" name="storename" size="50" maxlength="50"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">전화번호</td>
						<td><input type="text" name="phone" size="30" maxlength="30"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">매장주소</td>
						<td><input type="text" name="address" size="50" maxlength="50"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">영업시간</td>
						<td><input type="text" name="businesshours" size="40" maxlength="40"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">매장타입</td>
						<td><input type="text" name="storetype" size="40" maxlength="40"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">주차여부</td>
						<td><input type="text" name="storeparking" size="40" maxlength="40"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">위도(x)</td>
						<td><input type="text" name="latitude" size="40" maxlength="40"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">경도(y)</td>
						<td><input type="text" name="longitude" size="40" maxlength="40"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">신규오픈유무</td>
						<td><input type="text" name="newopen" size="30" maxlength="30"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" align="center">첨부파일</td>
						<td><input type="file" name="upload" id="upload"></td>
					</tr>
					
					<tr>
						<td bgcolor="#ececec" colspan="2" align="center">
							<input type="submit" value="추가하기">
							<input type="reset" value="다시작성">
							<input type="button" value="매장 관리 페이지 " onclick="javascript:window.location='adminStoreAction.action'">
						</td>
					</tr>
				</table>		
				<br/><br/>
			</form>
		
			<table align="center" border="1" cellspacing="0" cellpadding="2">
				<tr bgcolor="#ececec" align="center">
					<th colspan="10">매장지역 값 안내</th>
				</tr>
				<tr>
					<td bgcolor="#ececec" align="center">[전체]</td>
					<td>[ 00 ]</td>
					<td bgcolor="#ececec" align="center">[서울]</td>
					<td>[ 01 ]</td>
					<td bgcolor="#ececec" align="center">[경기도]</td>
					<td>[ 02 ]</td>
					<td bgcolor="#ececec" align="center">[인천]</td>
					<td>[ 03 ]</td>
					<td bgcolor="#ececec" align="center">[대전]</td>
					<td>[ 04 ]</td>
				</tr>
				<tr>
					<td bgcolor="#ececec" align="center">[충청남도]</td>
					<td>[ 05 ]</td>
					<td bgcolor="#ececec" align="center">[충청북도]</td>
					<td>[ 06 ]</td>
					<td bgcolor="#ececec" align="center">[전라북도]</td>
					<td>[ 07 ]</td>
					<td bgcolor="#ececec" align="center">[전라남도]</td>
					<td>[ 08 ]</td>
					<td bgcolor="#ececec" align="center">[광주]</td>
					<td>[ 09 ]</td>
				</tr>
				<tr>
					<td bgcolor="#ececec" align="center">[경상남도]</td>
					<td>[ 10 ]</td>
					<td bgcolor="#ececec" align="center">[경상북도]</td>
					<td>[ 11 ]</td>
					<td bgcolor="#ececec" align="center">[부산]</td>
					<td>[ 12 ]</td>
					<td bgcolor="#ececec" align="center">[울산]</td>
					<td>[ 13 ]</td>
					<td bgcolor="#ececec" align="center">[강원도]</td>
					<td>[ 14 ]</td>
				</tr>
				<tr>
					<td bgcolor="#ececec" align="center">[대구]</td>
					<td>[ 15 ]</td>
					<td bgcolor="#ececec" align="center">[제주도]</td>
					<td>[ 16 ]</td>
				</tr>
			</table>
			<br/><br/>
			<table align="center" border="1" cellspacing="0" cellpadding="2">
				<tr bgcolor="#ececec" align="center">
					<th colspan="10">신규오픈 값 안내</th>
				</tr>
				<tr>
					<td bgcolor="#ececec" align="center">[신규]</td>
					<td>[ new ]</td>
					<td bgcolor="#ececec" align="center">[기존]</td>
					<td>[ old ]</td>
				</tr>
			</table>
		</c:when>
		<c:otherwise>
			<script>
				alert("매장 추가 완료!!!");
				location.href='adminStoreAction.action'
				//history.go(-1);
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>