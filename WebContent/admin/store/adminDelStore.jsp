<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${ check eq 'del'}">
			<form action="adminStoreDelProAction.action?storename=${store}" name="storeDel" method="post">
				<table align="center" border="1" cellspacing="0" cellpadding="2">
					<tr bgcolor="#ececec" align="center">
			    		<th colspan="2">[ 매장 삭제 ]</th>
			   		</tr>
			   		<tr bgcolor="#ececec" align="center">
			    		<th colspan="2">${store} 을 삭제 하시겠습니까 ????</th>
			   		</tr>  	
			   		<tr>
						<td bgcolor="#ececec" colspan="2" align="center">
							<input type="submit" name="modify" value="삭 제" >
		       				<input type="button" value="취  소" onclick="javascript:window.location='adminStoreAction.action'">
						</td>
					</tr>	
				</table>
			</form>
		</c:when>
		<c:otherwise>
			<script>
				alert("매장 삭제 완료!!!");
				location.href='adminStoreAction.action'
				//history.go(-1);
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>