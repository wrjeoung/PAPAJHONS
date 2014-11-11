<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

	<h1 style="text-align:center;">파파존스 관리 페이지</h1>
	<form action="" name="admin" method="post">
		<table align="center" border="1" cellspacing="0" cellpadding="2">
			<tr bgcolor="ececec" align="center">
				<th colspan="4">관리 목록</th>
			</tr>
			
			<tr>
				<td bgcolor="#ececec" align="center">회원 관리</td>
				<td><a href='adminStoreList.jsp'>[ 회원 목록 ]</a>&nbsp;&nbsp;</td>
			</tr>
			
			<tr>
				<td bgcolor="#ececec" align="center">물품 관리</td>
				<td><a href='menuItemsAction.action'>[ 물품 목록 ]</a>&nbsp;&nbsp;</td>
			</tr>
			
			<tr>
				<td bgcolor="#ececec" align="center">매장 관리</td>
				<td><a href='adminStoreAdd.jsp'>[ 매장 목록 ]</a>&nbsp;&nbsp;</td>
			</tr>	
			
			<tr>
				<td bgcolor="#ececec" align="center">공지 관리</td>
				<td><a href='adminStoreAdd.jsp'>[ 공지 목록 ]</a>&nbsp;&nbsp;</td>
			</tr>					
		</table>
	</form>
	