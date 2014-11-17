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

	<form name="myform" action="adminGongjiWriteProAction.action" method="post" enctype="multipart/form-data">
		<table align="center" border="1" cellspacing="0" cellpadding="0">
			<tr bgcolor="#ececec" align="center">
    			<th colspan="2">공지  추가</th>
   			</tr>
			
	        <tr>
	          <td width="100" align="center" bgcolor="#F4F4F4">제목</td>
	          <td width="500" bgcolor="#FFFFFF">
	          	<input type="text" id="subject" name="subject" value="" maxlength="50"/>
	          </td>
	        </tr>
        	     
	        <tr>
	          <td width="100" align="center" bgcolor="#F4F4F4">내용</td>
	          <td bgcolor="#FFFFFF">
				<div style="border: 1px solid #dedede; padding: 3px;">
				<textarea style="overflow:hidden;resize:none; border: 0; width: 100%; height:100px" name="content" cols="50" rows="10">${data.content }</textarea>
				</div>	          
	          </td>
	        </tr>

	        <tr>
	          <td bgcolor="#F4F4F4">  첨부파일 </td>
	          <td bgcolor="#FFFFFF">
		          <input type="file" name="upload" id="upload" />
        	  </td>
         	</tr>
			<tr bgcolor="#ececec" align="center">
				<td colspan="2">
   					<input type="submit" value="추가"/>
   				</td>
   			</tr>
		</table>
   	</form>
 </body>
</html>

