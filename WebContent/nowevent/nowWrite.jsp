<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>진행중인 이벤트 글쓰기</title>
</head>
<body>
<center><b>진행중인 이벤트 글쓰기</b></center>
<br/>
<form method="post" name="nowWrite" action="writeAction2.action" enctype="multipart/form-data" onsubmit="return validation();">
	<table width=800" border="1" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td width="80" align="center">제목</td>
			<td width="420">
			<input type="text" size="70" maxlength="50" name="subject">
			</td>
		</tr>
		<tr>
			<td width="80" align="center">첨부파일1</td>
			<td width="420">
			<input type="file" name="upload"/></td>
		</tr>
		<tr>
			<td width="80" align="center">첨부파일2</td>
			<td width="420">
			<input type="file" name="upload2"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="글쓰기">
			</td>
		</tr>		
	</table>
</form>
</body>
</html>