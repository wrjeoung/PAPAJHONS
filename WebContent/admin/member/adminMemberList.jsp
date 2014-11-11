<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>회원 관리</title>
</head>
  
  <body>
  	<table width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td align="center"><h2>회원 관리</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
  	
 <c:if test="${totalCount > 0}"> 
	<table width="600" border="0" cellspacing="0" cellpadding="2">
	      <tr align="center" bgcolor="#F3F3F3">
      		<td width="50"><strong>번호</strong></td>
		<td width="350"><strong>제목</strong></td>
        		<td width="70"><strong>글쓴이</strong></td>
        		<td width="80"><strong>날짜</strong></td>
		<td width="50"><strong>조회</strong></td>
      	      </tr>
      	      <tr bgcolor="#777777">
        		<td height="1" colspan="5"></td>
      	      </tr>


		<c:forEach var="list" items="${list}">
			<tr bgcolor="#FFFFFF"  align="center">
				<td>
				<c:out value="${list.no}"/>
				</td>
				<td align="left"> &nbsp;<a href="/StrutsBoard/viewAction.action?no=${list.no}&currentPage=${currentPage}">${list.subject}</a></td>
				<td align="center">${list.name}</td>
				<td align="center"><fmt:formatDate value="${list.regdate}" type="date" dateStyle="short"/></td>
				<td>${list.readhit}</td>
			</tr>
      	    <tr bgcolor="#777777">
        		<td height="1" colspan="5"></td>
      	    </tr>			
		</c:forEach> 
</c:if>		
	      <c:if test="${totalCount <= 0}">
				
	      <tr bgcolor="#FFFFFF"  align="center">
		<td colspan="5">등록된 게시물이 없습니다.</td>
                  </tr>						
	      <tr bgcolor="#777777">
      		<td height="1" colspan="5"></td>
    	      </tr>
    		
	      </c:if>	
	      
	      <tr align="center">
    		<td colspan="5">${pagingHtml}</td>
    	      </tr>
    	
    	      <tr align="right">
    		<td colspan="5">
    		<input type="button" value="글쓰기" class="inputb" onClick="javascript:location.href='writeForm.action?currentPage=${currentPage}';">
		</td>
    	       </tr>	      	
	</table>
   </body>
</html>

