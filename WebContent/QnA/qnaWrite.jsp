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
			<td width="70" align="center">�����޴�</td>
			<td width="530">
				<select name="qmenu">
					<option value="deli">��ް���</option>
					<option value="online">�¶����ֹ�����</option>
					<option value="card">����ī�����</option>
					<option value="shop">����������</option>
					<option value="home">Ȩ����������</option>
					<option value="job">ä�����</option>
					<option value="store">�������</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="70" align="center">Q����</td>
			<td width="530">
				<textarea name="qcontent" rows="13" cols="71"></textarea>
			</td>
		</tr>
		<tr>
			<td width="70" align="center">A����</td>
			<td width="530">
				<textarea name="acontent" rows="13" cols="71"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="�۾���"> 
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>