<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>통신사 멤버쉽 카드</title>
</head>
<body>
<center><b>통신사 멤버쉽 카드</b>
<br/>
<form method="post" name="memcardWrite" action="memcardwriteAction.action" enctype="multipart/form-data" onsubmit="return validation();">
	<table width="600" border="1" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td width="70" align="center">제목</td>
			<td width="530">
				<input type="text" size="70" maxlength="50" name="subject">
			</td>
		</tr>
		<tr>
			<td width="70" align="center">내용</td>
			<td width="530">
			<textarea name="content" rows="13" cols="71"></textarea>
			</td>
		</tr>
		<tr>
			<td width="70" align="center">첨부파일</td>
			<td width="530">
			<input type="file" name="upload"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="올리기">
			</td>
		</tr>
		
	</table>
</form>
</center>
</body>
</html>