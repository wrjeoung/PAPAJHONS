<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����� ���� �̺�Ʈ</title>
</head>
<body>
<center><b>����� ���� �̺�Ʈ</b>
<br/>
<form method="post" name="specialModify" action="specialmodifyAction.action" enctype="multipart/form-data" onsubmit="return validation();">
	<input type="hidden" name="num" value="${num }">
	<input type="hidden" name="old_file" value="${vo.file_savname }">
	
	<table width="600" border="1" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td width="70" align="center">÷������</td>
			<td width="530">
				<input type="file" name="upload"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="�ۼ���">
			</td>
		</tr>
	</table>
</form>

</center>
</body>
</html>