<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../assets/js/common.min.js"></script>

<title>파파존스 메뉴 관리</title>
<link rel="stylesheet" href="/StrutsBoard/board/common/css/css.css"
	type="text/css"/>
<script type="text/javascript">
	function startModifyPage() {
		document.formView.action = "menuItemModifyAction.action";
		document.formView.submit();
	}
</script>
</head>

<body >
<form id="formView" name="formView" method="post" onsubmit="return false;">
	<table width="900" border="0" cellspacing="0" cellpadding="2" align="center">
		<tr>
			<td align="center"><h2>파파존스 메뉴 관리</h2></td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
	</table>
	
	<input type="hidden" id="no" name="no" value="${list.no }"/>
	<table width="900" border="1" cellspacing="0" cellpadding="0" align="center">
		<tr bgcolor="#ececec" align="center">
				<th colspan="2">상세 보기</th>
		</tr>
		<tr>
			<td bgcolor="#F4F4F4">메뉴카테고리</td>
			<td bgcolor="#FFFFFF">&nbsp;&nbsp;
				<c:if test="${list.menuid == 'pj_2002'}"><input type="hidden" id="menuCategory" name="menuCategory" value="${'0' }"/><c:out value="${'베스트메뉴' }" /></c:if> <!-- 베스트메뉴 -->
				<c:if test="${list.menuid == 'pj_2003'}"><input type="hidden" id="menuCategory" name="menuCategory" value="${'1' }"/><c:out value="${'오리지널' }" /></c:if> <!-- 오리지널 -->
				<c:if test="${list.menuid == 'pj_2004'}"><input type="hidden" id="menuCategory" name="menuCategory" value="${'2' }"/><c:out value="${'골드링' }" /></c:if> <!-- 골드링 -->
				<c:if test="${list.menuid == 'pj_2005'}"><input type="hidden" id="menuCategory" name="menuCategory" value="${'3' }"/><c:out value="${'치즈롤' }" /></c:if> <!-- 치즈롤 -->
				<c:if test="${list.menuid == 'pj_2006'}"><input type="hidden" id="menuCategory" name="menuCategory" value="${'4' }"/><c:out value="${'씬' }" /></c:if> <!-- 씬 -->
				<c:if test="${list.menuid == 'pj_2008'}"><input type="hidden" id="menuCategory" name="menuCategory" value="${'5' }"/><c:out value="${'골드링 씬' }" /></c:if> <!-- 골드링 씬 -->
				<c:if test="${list.menuid == 'pj_2009'}"><input type="hidden" id="menuCategory" name="menuCategory" value="${'6' }"/><c:out value="${'하트 씬' }" /></c:if> <!-- 하트 씬 -->
				<c:if test="${list.menuid == 'pj_2010'}"><input type="hidden" id="menuCategory" name="menuCategory" value="${'7' }"/><c:out value="${'파파플래터' }" /></c:if> <!-- 파파플래터 -->
				<c:if test="${list.menuid == 'pj_2011'}"><input type="hidden" id="menuCategory" name="menuCategory" value="${'8' }"/><c:out value="${'세트메뉴' }" /></c:if> <!-- 세트메뉴 -->
				<c:if test="${list.menuid == 'pj_2012'}"><input type="hidden" id="menuCategory" name="menuCategory" value="${'9' }"/><c:out value="${'사이드' }" /></c:if> <!-- 사이드 -->
				<c:if test="${list.menuid == 'pj_2013'}"><input type="hidden" id="menuCategory" name="menuCategory" value="${'10' }"/><c:out value="${'음료' }" /></c:if> <!-- 음료 -->	
			</td>
		</tr>
		
		<c:if test="${list.name != null }">
			<input type="hidden" id="name" name="name" value="${list.name }"/>
			<tr>				
				<td width="100" bgcolor="#F4F4F4">메뉴이름</td>				
				<td width="500" bgcolor="#FFFFFF">&nbsp;&nbsp;${ list.name}
				</td>
			</tr>
		</c:if>

		<c:if test="${list.description != null }">
			<input type="hidden" id="description" name="description" value="${list.description }"/>
			<tr> 
				<td bgcolor="#F4F4F4">설명</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${ list.description}</td>
			</tr>
		</c:if>
		
		<c:if test="${list.topping != null }">
			<input type="hidden" id="topping" name="topping" value="${list.topping }"/>
			<tr>
				<td bgcolor="#F4F4F4">토핑</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${ list.topping}</td>
			</tr>
		</c:if>

		<c:if test="${list.rprice != null }">
			<input type="hidden" id="rprice" name="rprice" value="${list.rprice }"/>
			<tr>
				<td bgcolor="#F4F4F4">레귤러가격</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${ list.rprice}</td>
			</tr>
		</c:if>

		<c:if test="${list.lprice != null }">
			<input type="hidden" id="lprice" name="lprice" value="${list.lprice }"/>
			<tr>
				<td bgcolor="#F4F4F4">라지가격</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${ list.lprice}</td>
			</tr>
		</c:if>

		<c:if test="${list.fprice != null }">
			<input type="hidden" id="fprice" name="fprice" value="${list.fprice }"/>
			<tr>
				<td bgcolor="#F4F4F4">패밀리가격</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.fprice }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.pprice != null }">
			<input type="hidden" id="pprice" name="pprice" value="${list.pprice }"/>
			<tr>
				<td bgcolor="#F4F4F4">파티가격</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.pprice }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.boxprice != null }">
			<input type="hidden" id="boxprice" name="boxprice" value="${list.boxprice }"/>
			<tr>
				<td bgcolor="#F4F4F4">박스가격</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.boxprice }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.onesizeprice != null }">
			<input type="hidden" id="onesizeprice" name="onesizeprice" value="${list.onesizeprice }"/>
			<tr>
				<td bgcolor="#F4F4F4">원사이즈가격</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.onesizeprice }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.onepackprice != null }">
			<input type="hidden" id="onepackprice" name="onepackprice" value="${list.onepackprice }"/>
			<tr>
				<td bgcolor="#F4F4F4">원팩가격</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.onepackprice }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.setprice != null }">
			<input type="hidden" id="setprice" name="setprice" value="${list.setprice }"/>
			<tr>
				<td bgcolor="#F4F4F4">세트메뉴가격</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.setprice }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.allergy != null }">
			<input type="hidden" id="allergy" name="allergy" value="${list.allergy }"/>
			<tr>
				<td bgcolor="#F4F4F4">알레르기</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.allergy }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.consist != null }">
			<input type="hidden" id="consist" name="consist" value="${list.consist }"/>
			<tr>
				<td bgcolor="#F4F4F4">구성</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.consist }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.presentsauce != null }">
			<input type="hidden" id="presentsauce" name="presentsauce" value="${list.presentsauce }"/>
			<tr>
				<td bgcolor="#F4F4F4">증정소스</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.presentsauce }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.calorie != null }">
			<input type="hidden" id="calorie" name="calorie" value="${list.calorie }"/>
			<tr>
				<td bgcolor="#F4F4F4">칼로리</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.calorie }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.nuturition != null }">
			<input type="hidden" id="nuturition" name="nuturition" value="${list.nuturition }"/>
			<tr>
				<td bgcolor="#F4F4F4">영양성분</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.nuturition }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.orgmenufilename != null }">
			<input type="hidden" id="imagepath1" name="imagepath1" value="${list.orgmenufilename }"/>
			<tr>
				<td bgcolor="#F4F4F4">메뉴이미지</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.orgmenufilename }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.orgdetail1filename != null }">
			<input type="hidden" id="imagepath2" name="imagepath2" value="${list.orgdetail1filename }"/>
			<tr>
				<td bgcolor="#F4F4F4">상세보기이미지1</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.orgdetail1filename }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.orgdetail2filename != null }">
			<input type="hidden" id="imagepath3" name="imagepath3" value="${list.orgdetail2filename }"/>
			<tr>
				<td bgcolor="#F4F4F4">상세보기이미지2</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.orgdetail2filename }</td>
			</tr>
		</c:if>
		
		<c:if test="${list.orgordername != null }">
			<input type="hidden" id="imagepathorder" name="imagepathorder" value="${list.orgordername }"/>
			<tr>
				<td bgcolor="#F4F4F4">온라인주문이미지</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;${list.orgordername }</td>
			</tr>
		</c:if>
		
		<tr>
			<td bgcolor="#ececec" colspan="2" align="center">
				
				<input name="list" type="button"
				value="수정" class="inputb" onclick="javascript:startModifyPage()"/>

				<input name="list" type="button" value="삭제" class="inputb"
				onclick="javascript:location.href='menuItemDeleteAction.action?no=${list.no}'"/>

				<input name="list" type="button" value="목록" class="inputb"
				onclick="javascript:location.href='menuItemsListAction.action?currentPage=${currentPage}'"/>
			</td>
		</tr>

	</table>
</form>
</body>

</html>

