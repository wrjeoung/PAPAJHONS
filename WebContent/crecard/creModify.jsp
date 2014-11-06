<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>신용카드</title>
</head>
<body>
<center><b>신용카드</b>
<form method="post" name="crecardModify" action="crecardmodifyAction.action" enctype="multipart/form-data" onsubmit="return validation();">
	<input type="hidden" name="num" value="${num }">
	<input type="hidden" name="oldfile" value="${vo.file_savname }">
	
	<table width="600" border="1" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td width="70" align="center">제목</td>
			<td width="530">
				<input type="text" size="70" maxlength="50" name="subject" value="${vo.subject }">
			</td>
		</tr>
		<tr>
			<td width="70" align="center">내용</td>
			<td width="530">
				<textarea name="content" rows="13" cols="71">${vo.content }</textarea>
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
				<input type="submit" value="글수정">
			</td>
		</tr>
	</table>
</form>

</center>
</body>
</html>