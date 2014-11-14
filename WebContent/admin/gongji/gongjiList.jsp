<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>공지 관리</title>
</head>
  
  <body>
  	<table align="center" width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td align="center"><h2>공지 관리</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
  	
<c:if test="${totalCount > 0}"> 
	<table align="center" border="0" cellspacing="0" cellpadding="2">
		<tr align="center" bgcolor="#F3F3F3">
      		<td width="80"><strong>글번호</strong></td>
        	<td width="80"><strong>제목</strong></td>
        	<td width="150"><strong>등록일</strong></td>
			<td width="150"><strong>조회수</strong></td>
			<td width="50"><strong>원본파일</strong></td>
			<td width="100"><strong>저장된파일</strong></td>
      	</tr>
      	
   	    <tr bgcolor="#777777">
     		<td height="1" colspan="6"></td>
   	    </tr>
   	    
		<c:forEach var="list" items="${list}">
			<tr bgcolor="#FFFFFF"  align="center" style="cursor:pointer;" onclick="javascript:location.href='adminGongjiModifyAction.action?num=${list.num}';">
			<td>
				<c:out value="${list.num}"/>
			</td>
			<td>${list.subject}</td>
			<td>${list.reg_date}</td>
			<td>${list.readhit}</td>
			<td>${list.file_orgname}</td>
			<td>${list.file_savname}</td>
			</tr>
      	    <tr bgcolor="#777777">
        		<td height="1" colspan="6"></td>
      	    </tr>			
		</c:forEach>    	    
</c:if>	

<c:if test="${totalCount <= 0}">
				
	<tr bgcolor="#FFFFFF"  align="center">
		<td colspan="11">등록된 게시물이 없습니다.</td>
	</tr>						
	<tr bgcolor="#777777">
		<td height="1" colspan="6"></td>
	</tr>
    		
</c:if>	
	      
<tr align="center">
	<td colspan="6">${pagingHtml}</td>
</tr>
	
	</table>
   </body>
</html>

