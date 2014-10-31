<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>진행중인 이벤트</title>
</head>
<body>
<center><b>진행중인 이벤트</b>
<br/>
<c:if test="${totalCount==0 }">
<table width="1000" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
		게시판에 저장된 글이 없습니다.
		</td>
	</tr>
</table>
</c:if>

<c:if test="${totalCount>0 }">
	<c:forEach var="vo" items="${list }">
		<tr height="250">
			<td width="250">
				<a href="viewAction2.action?num=${vo.num }&currentPage=${currentPage}&file_savname=${vo.file_savname}"><img src="../save2/${vo.file_savname }"></a>
				이벤트 : ${vo.subject }<br/>
				기간 : ${vo.day }
			</td>
		</tr>
		<br/>
	</c:forEach>
</c:if>
</body>
<input type="button" value="글쓰기" onclick="document.location.href='writeForm2.action?currentPage=${currentPage}'">
</html>