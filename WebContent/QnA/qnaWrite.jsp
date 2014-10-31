<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>QnA</title>
</head>
<body>
<center><b>QnA</b>
<br/>
<form method="post" name="qnaWrite" action="qnawriteAction.action" onsubmit="return validation();">
	<table width="600" border="1" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td width="70" align="center">질문메뉴</td>
			<td width="530">
				<select name="qmenu">
					<option value="deli">배달관련</option>
					<option value="online">온라인주문관련</option>
					<option value="card">제휴카드관련</option>
					<option value="shop">가맹점관련</option>
					<option value="home">홈페이지관련</option>
					<option value="job">채용관련</option>
					<option value="store">매장관련</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="70" align="center">Q내용</td>
			<td width="530">
				<textarea name="qcontent" rows="13" cols="71"></textarea>
			</td>
		</tr>
		<tr>
			<td width="70" align="center">A내용</td>
			<td width="530">
				<textarea name="acontent" rows="13" cols="71"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="글쓰기"> 
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>