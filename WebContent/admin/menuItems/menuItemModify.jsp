<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../assets/js/common.min.js"></script>

<title>파파존스 메뉴 관리</title>


<script type="text/javascript">
function selelctedItem(index) {
	var menuidTemp = document.getElementById("menuidTemp");
	menuidTemp.selectedIndex = index;
	document.getElementById("menuid").value = menuidTemp.value; 
	console.log('selelctedItem : '+document.getElementById("menuid").value);
}

</script>	
</head>

<body onload="selelctedItem('${param.menuCategory}');">
<form id="formView" name="formView" method="post" action="menuItemModifyProAction.action" enctype="multipart/form-data">
	<input type="hidden" id="no" name="no" value="${param.no }"/>
	<table width="900" border="0" cellspacing="0" cellpadding="2" align="center">
		<tr>
			<td align="center"><h2>파파존스 메뉴 관리</h2></td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
	</table>
	
	
	<table width="900" border="1" cellspacing="0" cellpadding="2" align="center">
		<tr bgcolor="#ececec" align="center">
				<th colspan="2">매뉴 수정</th>
		</tr>
		<tr>
			<td bgcolor="#F4F4F4">메뉴카테고리</td>
			<td bgcolor="#FFFFFF">
				<input type="hidden" id="menuid" name="menuid"/>
				<select id='menuidTemp' name='menuidTemp' disabled="disabled">
					<option value='pj_2002'>세트메뉴</option>
					<option value='pj_2003'>오리지날</option>
					<option value='pj_2004'>골드링</option>
					<option value='pj_2005'>치즈롤</option>
					<option value='pj_2006'>씬</option>
					<option value='pj_2008'>골드링 씬</option>
					<option value='pj_2009'>하트 씬</option>
					<option value='pj_2010'>파파플래터</option>
					<option value='pj_2011'>세트메뉴</option>
					<option value='pj_2012'>사이드</option>
					<option value='pj_2013'>음료</option>
				</select>
			</td>
		</tr>

		<c:if test="${param.name != null }">
			<tr>
				<td width="100" bgcolor="#F4F4F4">메뉴이름</td>
				<td bgcolor="#FFFFFF">
					<input id="name" name="name" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.name }" required/>
				</td>

			</tr>
		</c:if>

		<c:if test="${param.description != null }">
			<tr> 
				<td bgcolor="#F4F4F4">설명</td>
				<td bgcolor="#FFFFFF">
					<input id="description" name="description" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.description }" required/>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${param.topping != null }">
			<tr>
				<td bgcolor="#F4F4F4">토핑</td>
				<td bgcolor="#FFFFFF">
					<input id="topping" name="topping" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.topping }" required/>
				</td>
			</tr>
		</c:if>

		<c:if test="${param.rprice != null }">
			<tr>
				<td bgcolor="#F4F4F4">레귤러가격</td>
				<td bgcolor="#FFFFFF">
					<input id="rprice" name="rprice" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.rprice }" required/>
				</td>
			</tr>
		</c:if>

		<c:if test="${param.lprice != null }">
			<tr>
				<td bgcolor="#F4F4F4">라지가격</td>
				<td bgcolor="#FFFFFF">
					<input id="lprice" name="lprice" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.lprice }" required/>
				</td>
			</tr>
		</c:if>

		<c:if test="${param.fprice != null }">
			<tr>
				<td bgcolor="#F4F4F4">패밀리가격</td>
				<td bgcolor="#FFFFFF">
					<input id="fprice" name="fprice" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.fprice }" required/>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${param.pprice != null }">
			<tr>
				<td bgcolor="#F4F4F4">파티가격</td>
				<td bgcolor="#FFFFFF">
					<input id="pprice" name="pprice" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.pprice }" required/>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${param.boxprice != null }">
			<tr>
				<td bgcolor="#F4F4F4">박스가격</td>
				<td bgcolor="#FFFFFF">
					<input id="boxprice" name="boxprice" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.boxprice }" required/>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${param.onesizeprice != null }">
			<tr>
				<td bgcolor="#F4F4F4">원사이즈가격</td>
				<td bgcolor="#FFFFFF">
					<input id="onesizeprice" name="onesizeprice" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.onesizeprice }" required/>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${param.onepackprice != null }">
			<tr>
				<td bgcolor="#F4F4F4">원팩가격</td>
				<td bgcolor="#FFFFFF">
					<input id="onepackprice" name="onepackprice" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.onepackprice }" required/>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${param.setprice != null }">
			<tr>
				<td bgcolor="#F4F4F4">세트메뉴가격</td>
				<td bgcolor="#FFFFFF">
					<input id="setprice" name="setprice" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.setprice }" required/>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${param.allergy != null }">
			<tr>
				<td bgcolor="#F4F4F4">알레르기</td>
				<td bgcolor="#FFFFFF">
					<input id="allergy" name="allergy" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.allergy }" required/>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${param.consist != null }">
			<tr>
				<td bgcolor="#F4F4F4">구성</td>
				<td bgcolor="#FFFFFF">
					<input id="consist" name="consist" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.consist }" required/>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${param.presentsauce != null }">
			<tr>
				<td bgcolor="#F4F4F4">증정소스</td>
				<td bgcolor="#FFFFFF">
					<input id="presentsauce" name="presentsauce" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.presentsauce }" required/>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${param.calorie != null }">
			<tr>
				<td bgcolor="#F4F4F4">칼로리</td>
				<td bgcolor="#FFFFFF">
					<input id="calorie" name="calorie" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.calorie }" required/>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${param.nuturition != null }">
			<tr>
				<td bgcolor="#F4F4F4">영양성분</td>
				<td bgcolor="#FFFFFF">
					<input id="nuturition" name="nuturition" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.nuturition }" required/>
				</td>
			</tr>
		</c:if>
		<c:if test="${param.imagepath1 != null }">
			<tr>
				<td bgcolor="#F4F4F4">메뉴이미지</td>
				<td bgcolor="#FFFFFF">
					<input type="hidden" id="oldMenuFileName" name="oldMenuFileName" value="${param.imagepath1 }"/>
					<input type="file" id="menuImg" name="menuImg" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.imagepath1}" required/>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${param.imagepath2 != null }">
			<tr>
				<td bgcolor="#F4F4F4">상세보기이미지1</td>
				<td bgcolor="#FFFFFF">
					<input type="hidden" id="oldDetail1FileName" name="oldDetail1FileName" value="${param.imagepath2 }"/>
					<input type="file" id="detailImg1" name="detailImg1" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.imagepath2 }" required/>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${param.imagepath3 != null }">
			<tr>
				<td bgcolor="#F4F4F4">상세보기이미지2</td>
				<td bgcolor="#FFFFFF">
					<input type="hidden" id="oldDetail2FileName" name="oldDetail2FileName" value="${param.imagepath3 }"/>
					<input type="file" id="detailImg2" name="detailImg2" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.imagepath3 }" required/>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${param.imagepathorder != null }">
			<tr>
				<td bgcolor="#F4F4F4">온라인주문이미지</td>
				<td bgcolor="#FFFFFF">
					<input type="hidden" id="oldOrderFileName" name="oldOrderFileName" value="${param.imagepathorder }"/>
					<input type="file" id="orderImg" name="orderImg" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.imagepathorder }" required/>
				</td>
			</tr>
		</c:if>
		
		<tr>
			<td bgcolor="#ececec" colspan="2" align="center">
				<input type="submit" name="modify" value="수정완료" class="inputb"/>
				<input type="button" name="list" value="목록" class="inputb" onClick="javascript:location.href='menuItemsListAction.action?currentPage=${currentPage} />'"/>
			</td>
		</tr>
	</table>
</form>
</body>

</html>

