<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>파파존스 메뉴 관리</title>
<link rel="stylesheet" href="/StrutsBoard/board/common/css/css.css"
	type="text/css"/>
<script type="text/javascript">
	function open_win_noresizable(url, name) {
		var oWin = window.open(url, name,
				"scrollbars=no,status=no,resizable=no,width=300,height=150");
	}
</script>
</head>

<body >

	<table width="900" border="0" cellspacing="0" cellpadding="2" align="center">
		<tr>
			<td align="center"><h2>파파존스 메뉴 관리</h2></td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
	</table>

	<table width="900" border="1" cellspacing="0" cellpadding="0" align="center">

		<tr>
			<td bgcolor="#F4F4F4">메뉴카테고리</td>
			<td bgcolor="#FFFFFF">&nbsp;&nbsp;
				<c:if test="${list.menuid == 'pj_2002'}"><c:out value="${'베스트메뉴' }" /></c:if> <!-- 베스트메뉴 -->
				<c:if test="${list.menuid == 'pj_2003'}"><c:out value="${'오리지널' }" /></c:if> <!-- 오리지널 -->
				<c:if test="${list.menuid == 'pj_2004'}"><c:out value="${'골드링' }" /></c:if> <!-- 골드링 -->
				<c:if test="${list.menuid == 'pj_2005'}"><c:out value="${'치즈롤' }" /></c:if> <!-- 치즈롤 -->
				<c:if test="${list.menuid == 'pj_2006'}"><c:out value="${'씬' }" /></c:if> <!-- 씬 -->
				<c:if test="${list.menuid == 'pj_2008'}"><c:out value="${'골드링 씬' }" /></c:if> <!-- 골드링 씬 -->
				<c:if test="${list.menuid == 'pj_2009'}"><c:out value="${'하트 씬' }" /></c:if> <!-- 하트 씬 -->
				<c:if test="${list.menuid == 'pj_2010'}"><c:out value="${'파파플래터' }" /></c:if> <!-- 파파플래터 -->
				<c:if test="${list.menuid == 'pj_2011'}"><c:out value="${'세트메뉴' }" /></c:if> <!-- 세트메뉴 -->
				<c:if test="${list.menuid == 'pj_2012'}"><c:out value="${'사이드' }" /></c:if> <!-- 사이드 -->
				<c:if test="${list.menuid == 'pj_2013'}"><c:out value="${'음료' }" /></c:if> <!-- 음료 -->	
			</td>
		</tr>

		<c:if test="${list.name != null }">
			<tr>
				<td width="100" bgcolor="#F4F4F4">메뉴이름</td>
				<td width="500" bgcolor="#FFFFFF">&nbsp;&nbsp;${ list.name}
				</td>
			</tr>
		</c:if>

		<c:if test="${list.description != null }">
			<tr>
				<td bgcolor="#F4F4F4">설명</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${ list.description}</td>
			</tr>
		</c:if>
		
		<c:if test="${list.topping != null }">
			<tr>
				<td bgcolor="#F4F4F4">토핑</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${ list.topping}</td>
			</tr>
		</c:if>

		<c:if test="${list.rprice != null }">
			<tr>
				<td bgcolor="#F4F4F4">레귤러가격</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${ list.rprice}</td>
			</tr>
		</c:if>

		<c:if test="${list.lprice != null }">
			<tr>
				<td bgcolor="#F4F4F4">라지가격</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${ list.lprice}</td>
			</tr>
		</c:if>

		<c:if test="${list.fprice != null }">
			<tr>
				<td bgcolor="#F4F4F4">패밀리가격</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.fprice }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.pprice != null }">
			<tr>
				<td bgcolor="#F4F4F4">파티가격</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.pprice }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.boxprice != null }">
			<tr>
				<td bgcolor="#F4F4F4">박스가격</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.boxprice }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.onesizeprice != null }">
			<tr>
				<td bgcolor="#F4F4F4">원사이즈가격</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.onesizeprice }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.onepackprice != null }">
			<tr>
				<td bgcolor="#F4F4F4">원팩가격</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.onepackprice }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.setprice != null }">
			<tr>
				<td bgcolor="#F4F4F4">세트메뉴가격</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.setprice }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.allergy != null }">
			<tr>
				<td bgcolor="#F4F4F4">알레르기</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.allergy }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.consist != null }">
			<tr>
				<td bgcolor="#F4F4F4">구성</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.consist }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.presentsauce != null }">
			<tr>
				<td bgcolor="#F4F4F4">증정소스</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.presentsauce }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.calorie != null }">
			<tr>
				<td bgcolor="#F4F4F4">칼로리</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.calorie }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.nuturition != null }">
			<tr>
				<td bgcolor="#F4F4F4">영양성분</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.nuturition }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.imagepath1 != null }">
			<tr>
				<td bgcolor="#F4F4F4">이미지경로1</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.imagepath1 }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.imagepath2 != null }">
			<tr>
				<td bgcolor="#F4F4F4">이미지경로2</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.imagepath2 }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.imagepath3 != null }">
			<tr>
				<td bgcolor="#F4F4F4">이미지경로3</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.imagepath3 }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.imagepathorder != null }">
			<tr>
				<td bgcolor="#F4F4F4">주문이미지경로</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.imagepathorder }</td>
			</tr>
		</c:if>
		
		<tr>
			<td bgcolor="#F4F4F4">첨부파일</td>
			<td bgcolor="#FFFFFF">&nbsp;&nbsp; <a
				href="/StrutsBoard/fileDownloadAction.action?no=${no }"> ${ resultClass.file_orgname}
			</a>
			</td>
		</tr>

		<tr>
			<td align="right" colspan="2"><input name="list" type="button"
				value="수정" class="inputb"
				onClick="javascript:open_win_noresizable('checkForm.action?no=${resultClass.no}&currentPage=${currentPage}','modify')">

				<input name="list" type="button" value="삭제" class="inputb"
				onClick="javascript:open_win_noresizable('checkForm.action?no=${resultClass.no}&currentPage=${currentPage }','delete')">

				<input name="list" type="button" value="목록" class="inputb"
				onClick="javascript:location.href='menuItemsAction.action?currentPage=${currentPage} />'">

			</td>
		</tr>

	</table>
</body>
</html>

