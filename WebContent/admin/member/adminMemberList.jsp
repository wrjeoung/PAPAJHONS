<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>회원 관리</title>
</head>
  
  <body>
  	<table align="center" width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td align="center"><h2>회원 관리</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
  	
<c:if test="${totalCount > 0}"> 
	<table align="center" width="1530" border="0" cellspacing="0" cellpadding="2">
		<tr align="center" bgcolor="#F3F3F3">
      		<td width="80"><strong>이름</strong></td>
        	<td width="80"><strong>아이디</strong></td>
        	<td width="150"><strong>비밀번호</strong></td>
			<td width="150"><strong>전화번호</strong></td>
			<td width="150"><strong>모바일</strong></td>
			<td width="50"><strong>SMS수신</strong></td>
			<td width="100"><strong>이메일</strong></td>
			<td width="70"><strong>이메일수신</strong></td>
			<td width="100"><strong>계정활성화</strong></td>
			<td width="200"><strong>계정활성코드</strong></td>
			<td width="400"><strong>주소</strong></td>
      	</tr>
      	
   	    <tr bgcolor="#777777">
     		<td height="1" colspan="11"></td>
   	    </tr>
   	    
		<c:forEach var="list" items="${list}">
			<tr bgcolor="#FFFFFF"  align="center" style="cursor:pointer;" onclick="javascript:location.href='adminMemberModifyAction.action?id=${list.id}';">
			<td>
				<c:out value="${list.name}"/>
			</td>
			<td>${list.id}</td>
			<td>${list.pw}</td>
			<td>${list.phone}</td>
			<td>${list.mobile}</td>
			<td>${list.sms}</td>
			<td>${list.email}</td>
			<td>${list.sendmail}</td>
			<td>${list.activation_status}</td>
			<td>${list.activation_key}</td>
			<td>${list.addr}</td>
			</tr>
      	    <tr bgcolor="#777777">
        		<td height="1" colspan="11"></td>
      	    </tr>			
		</c:forEach>    	    
</c:if>	

<c:if test="${totalCount <= 0}">
				
	<tr bgcolor="#FFFFFF"  align="center">
		<td colspan="11">등록된 게시물이 없습니다.</td>
	</tr>						
	<tr bgcolor="#777777">
		<td height="1" colspan="11"></td>
	</tr>
    		
</c:if>	
	      
<tr align="center">
	<td colspan="11">${pagingHtml}</td>
</tr>
	
	</table>
   </body>
</html>

