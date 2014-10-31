<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>매장별 이벤트</title>
</head>
<body>
<center><b>매장별 이벤트</b>
<br>
<form>
<table width="600" border="1" cellpadding="0" cellspacing="0" align="center">
	<tr height="30" align="center">
		<td align="center" width="100">${vo.subject }<br/><font style="margin-left: 150px">작성일:${vo.day}</font></td>
	</tr>
	<%-- <tr height="30" align="center">
		<td align="center" width="100">기간 : ${vo.day }</td>
	</tr> --%>
	<tr height="500" align="center">
		<td align="center" width="100"><pre>${vo.content }</pre>
		
		<img src="../save3/${file_savname }"></td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<input type="button" value="목록" onclick="document.location.href='storelistAction.action?currentPage=${currentPage}'">
		</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<input type="button" value="글수정" onclick="document.location.href='storemodifyForm.action?num=${vo.num}&currentPage=${currentPage}&file_savname=${file_savname}'">
			<input type="button" value="글삭제" onclick="document.location.href='storedeleteAction.action?num=${vo.num}&currentPage=${currentPage }'">
		</td>
	</tr>
</table>	
</form>

</center>
</body>
</html>