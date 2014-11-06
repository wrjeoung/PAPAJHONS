<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>진행중인 이벤트</title>
</head>
<body>
<center><b>진행중인 이벤트 글쓰기</b></center>
<br/>
<form method="post" name="nowModify" action="modifyAction2.action" enctype="multipart/form-data" onsubmit="return validation()">
	<input type="hidden" name="num" value="${vo.num}">
	<input type="hidden" name="currentPage" value="${currentPage }">
	<input type="hidden" name="old_file" value="${vo.file_savname }">
	<input type="hidden" name="old_file2" value="${vo.file_savname2 }">
	
	
	<table width="600" border="1" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td width="70" align="center">기간</td>
			<td width="530">
				<input type="text" size="70" maxlength="50" name="day" varlue="${vo.day }">
			</td>
		</tr>
		
		<tr>
			<td width="70" align="center">제목</td>
			<td width="530">
				<input type="text" size="70" maxlength="50" name="subject" value="${vo.subject }">
			</td>
		
		</tr>
		<tr>
			<td width="70" align="center">첨부파일1</td>
			<td width="530">
				<input type="file" name="upload"/>
				${vo.file_orgname}
			</td>
		</tr>
		<tr>
			<td width="70" align="center">첨부파일2</td>
			<td width="530">
				<input type="file" name="upload2"/>
				${vo.file_orgname2 }
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="글수정">
			</td>
		</tr>
	</table>
</form>
</body>
</html>