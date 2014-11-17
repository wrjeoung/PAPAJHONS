<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<title>공지 관리</title>
	<SCRIPT type="text/javascript">
		function setObjSize(obj){
			obj.setAttribute("size",obj.value.length+10);
		}
		
		function init()
		{
			var addr1 = document.getElementById("subject");
			setObjSize(addr1);
		}
		
		function deleteRecord()
		{
			alert("삭제되었습니다.");
			location.href="adminGongjiDeleteAction.action?num=${data.num}";
		}
	</SCRIPT>
</head>
  
<body onload="init()">
  	<table align="center" width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td align="center"><h2>공지 관리</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>

	<form name="myform" action="adminGongjiModifyProAction.action" target=ifr_hidden method="post" enctype="multipart/form-data">
		<input type="hidden" name="old_file" value="${data.file_savname}">
		<input type="hidden" name="num" value="${data.num}">
		
		<table align="center" border="1" cellspacing="0" cellpadding="0">
			<tr bgcolor="#ececec" align="center">
    			<th colspan="2">공지  수정</th>
   			</tr>
			
	        <tr>
	          <td width="100" align="center" bgcolor="#F4F4F4">글번호</td>
	          <td bgcolor="#FFFFFF">
				<c:out value="${data.num}"/>
			  </td>
	        </tr>			
			
	        <tr>
	          <td width="100" align="center" bgcolor="#F4F4F4">제목</td>
	          <td width="500" bgcolor="#FFFFFF">
	          	<input type="text" id="subject" name="subject" value="${data.subject}" maxlength="50"/>
	          </td>
	        </tr>
	        
	        <tr>
	          <td width="100" align="center" bgcolor="#F4F4F4">최근수정일</td>
	          <td width="500" bgcolor="#FFFFFF">
	            <fmt:formatDate value="${data.reg_date}" pattern="yyyy-MM-dd a hh:mm"/>
	          </td>
	        </tr>
	        
	        <tr>
	          <td width="100" align="center" bgcolor="#F4F4F4">조회수</td>
	          <td bgcolor="#FFFFFF">
				<c:out value="${data.readhit}"/>
			  </td>
	        </tr>		        
	        	     
	        <tr>
	          <td width="100" align="center" bgcolor="#F4F4F4">내용</td>
	          <td bgcolor="#FFFFFF">
				<div style="border: 1px solid #dedede; padding: 3px;">
				<textarea style="overflow:hidden;resize:none; border: 0; width: 100%; height:100px" name="content">${data.content }</textarea>
				</div>	          
	          </td>
	        </tr>

	        <tr>
	          <td bgcolor="#F4F4F4">  첨부파일 </td>
	          <td bgcolor="#FFFFFF">
		          <input type="file" name="upload" id="upload" />
		          <c:if test="${data.file_orgname !=null}">
		          &nbsp; * <c:out value="${data.file_orgname}"/> 파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
		          </c:if>
        	  </td>
         	</tr>
			<tr bgcolor="#ececec" align="center">
				<td colspan="2">
   					<input type="submit" value="수정"/>
   					<input type="button" value="삭제" onclick="deleteRecord()"/>
   				</td>
  			</tr> 	         	
		</table>
   	</form>
<iframe name="ifr_hidden"  src="" style="width:0;height:0;visibility: hidden;">   	
 </body>
</html>

