<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

	<h1 style="text-align:center;">파파존스 관리 페이지</h1>
	<form action="" name="admin" method="post">
		<table align="center" border="1" cellspacing="0" cellpadding="2">
			<tr bgcolor="ececec" align="center">
				<th colspan="2">관리 목록</th>
			</tr>
			
			<tr>
				<td bgcolor="#ececec" align="center">회원 관리</td>
				<td><a href='adminMemberAction.action'>[ 회원 목록 ]</a>&nbsp;&nbsp;</td>
			</tr>
			
			<tr>
				<td bgcolor="#ececec" align="center">물품 관리</td>
				<td><a href='menuItemsListAction.action'>[ 물품 목록 ]</a>&nbsp;&nbsp;</td>
			</tr>
			
			<tr>
				<td bgcolor="#ececec" align="center">매장 관리</td>
				<td><a href='adminStoreAction.action'>[ 매장 목록 ]</a>&nbsp;&nbsp;</td>
			</tr>	
			
			<tr>
				<td bgcolor="#ececec" align="center">공지 관리</td>
				<td><a href='adminGongjiAction.action'>[ 공지 목록 ]</a>&nbsp;&nbsp;</td>
			</tr>
			
			<tr>
				<td bgcolor="#ececec" align="center">매출 관리</td>
				<td><a href='adminSalesAction.action'>[ 매출 목록 ]</a>&nbsp;&nbsp;</td>
			</tr>

			<tr>
				<td bgcolor="#ececec" align="center">주문 관리</td>
				<td><a href='adminOrderAction.action'>[ 주문 목록 ]</a>&nbsp;&nbsp;</td>
			</tr>
			
			<tr>
				<td bgcolor="#ececec" align="center">진행중인 이벤트 관리</td>
				<td><a href='adminnowAction.action'>[ 진행중인 이벤트 목록 ]</a>&nbsp;&nbsp;</td>
			</tr>	
			
			<tr>
				<td bgcolor="#ececec" align="center">지난 이벤트 관리</td>
				<td><a href='adminpastAction.action'>[ 지난 이벤트 목록 ]</a>&nbsp;&nbsp;</td>
			</tr>
			
			<tr>
				<td bgcolor="#ececec" align="center">매장별 이벤트 관리</td>
				<td><a href='adminstoreeventAction.action'>[ 매장별 이벤트 목록 ]</a>&nbsp;&nbsp;</td>
			</tr>
			
			<tr>
				<td bgcolor="#ececec" align="center">스페셜 할인 이벤트 관리</td>
				<td><a href='adminspecialeventAction.action'>[ 스페셜 할인 이벤트 목록 ]</a>&nbsp;&nbsp;</td>
			</tr>
			
			<tr>
				<td bgcolor="#ececec" align="center">멤버쉽 카드 관리</td>
				<td><a href='adminmemcardAction.action'>[ 멤버쉽 카드 관리 ]</a>&nbsp;&nbsp;</td>
			</tr>
					
			<tr>
				<td bgcolor="#ececec" align="center">신용 카드 관리</td>
				<td><a href='crecardAdminAction.action'>[ 신용 카드 관리 ]</a>&nbsp;&nbsp;</td>
			</tr>	
			
			<tr>
				<td bgcolor="#ececec" align="center">진행중인 이벤트 댓글 관리</td>
				<td><a href='repleAdminAction.action'>[ 진행중인 이벤트 댓글 관리 ]</a>&nbsp;&nbsp;</td>
			</tr>		
			
			<tr>
				<td bgcolor="#ececec" align="center">지난 이벤트 댓글 관리</td>
				<td><a href='reple2AdminAction.action'>[ 지난 이벤트 댓글 관리 ]</a>&nbsp;&nbsp;</td>
			</tr>	
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="홈으로 가기" class="inputb"
					onClick="javascript:location.href='mainAction.action'"/>
				</td>
			</tr>	
							
		</table>
	</form>
	