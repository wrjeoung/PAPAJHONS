<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �̺�Ʈ</title>
</head>
<body>
<center><b>���� �̺�Ʈ</b>
<br/>
<form method="post" name="pastWrite" action="pastwriteAction.action" enctype="multipart/form-data" onsubmit="return validation();">
	<table width="600" border="1" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td width="70" align="center">�Ⱓ</td>
			<td width="530">
				<input type="text" size="70" maxlength="50" name="day">
			</td>
		</tr>	
		<tr>
			<td width="70" align="center">����</td>
			<td width="530">
				<input type="text" size="70" maxlength="50" name="subject">
			</td>
		</tr>
		<tr>
			<td width="70" align="center">����</td>
			<td width="530">
				<textarea name="content" rows="13" cols="71"></textarea>
			</td>
		</tr>
		<tr>
			<td width="70" align="center">÷������</td>
			<td width="530">
				<input type="file" name="upload">
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