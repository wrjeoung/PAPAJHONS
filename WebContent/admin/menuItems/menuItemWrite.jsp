<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
function init() {
	var count = document.getElementById("menuTable").rows.length;
	
	for(var i=2; i<count-1; i++)
	{
		document.getElementById("menuTable").rows[i].style.display = 'none';
	}
}

function removeRequired() {
	var count = document.getElementById("menuTable").rows.length;
	
	for(var i=2; i<count-1; i++)
	{
		var row = document.getElementById("menuTable").rows[i];
//		console.log("menuItemWrite display : "+row.getElementsByTagName("input")[0].id);
		if(row.style.display=='none')
			row.getElementsByTagName("input")[0].required=false;

	}	
}

function isPizzaMenu(menuid) {
	if(    menuid == 'pj_2002'  // 베스트 메뉴
		|| menuid == 'pj_2003'  // 오리지널
		|| menuid == 'pj_2004'  // 골드링
		|| menuid == 'pj_2006'  // 씬
		|| menuid == 'pj_2008'  // 골드링 씬
		|| menuid == 'pj_2009'  // 하트 씬
		|| menuid == 'pj_2005') // 치즈롤	
		return true;	
	else
		return false;
}

function setSelect(menuid) {
	console.log("menuItemWrite setSelect() : "+menuid);
	//document.getElementById("menuid").selectedIndex = menuid;
	init();
	if(isPizzaMenu(menuid))
	{
		document.getElementById("trname").style.display = 'table-row';
		document.getElementById("trimagepath1").style.display = 'table-row';
		document.getElementById("trimagepath2").style.display = 'table-row';
		document.getElementById("trdescription").style.display = 'table-row';
		document.getElementById("trtopping").style.display = 'table-row';
		document.getElementById("trrprice").style.display = 'table-row';
		document.getElementById("trlprice").style.display = 'table-row';
		document.getElementById("trfprice").style.display = 'table-row';
		document.getElementById("trpprice").style.display = 'table-row';
		document.getElementById("trallergy").style.display = 'table-row';
		document.getElementById("trcalorie").style.display = 'table-row';
		document.getElementById("trnuturition").style.display = 'table-row';
		document.getElementById("trimagepathorder").style.display = 'table-row';
	}
	else if(menuid == 'pj_2013')  // 음료
	{
		document.getElementById("trname").style.display = 'table-row';
		document.getElementById("trimagepath1").style.display = 'table-row';
		document.getElementById("trimagepath2").style.display = 'table-row';
		document.getElementById("trrprice").style.display = 'table-row';
		document.getElementById("trlprice").style.display = 'table-row';
		document.getElementById("trimagepathorder").style.display = 'table-row';
	}
	else if(menuid == 'pj_2012')  // 사이드 메뉴
	{
		document.getElementById("trname").style.display = 'table-row';
		document.getElementById("trimagepath1").style.display = 'table-row';
		document.getElementById("trimagepath2").style.display = 'table-row';
		document.getElementById("trtopping").style.display = 'table-row';
		document.getElementById("trpresentsauce").style.display = 'table-row';
		document.getElementById("tronesizeprice").style.display = 'table-row';
		document.getElementById("trallergy").style.display = 'table-row';
		document.getElementById("trcalorie").style.display = 'table-row';
		document.getElementById("trnuturition").style.display = 'table-row';
		document.getElementById("trimagepathorder").style.display = 'table-row';
	}
	else if(menuid == 'pj_2011' || menuid == 'pj_2010')  // 세트메뉴 & 파파 플래터
	{
		document.getElementById("trname").style.display = 'table-row';
		document.getElementById("trimagepath1").style.display = 'table-row';
		document.getElementById("trimagepath2").style.display = 'table-row';
		document.getElementById("trimagepath3").style.display = 'table-row';
		document.getElementById("trconsist").style.display = 'table-row';
		document.getElementById("trboxprice").style.display = 'table-row';
		document.getElementById("trimagepathorder").style.display = 'table-row';
	}
	removeRequired();
}


</script>	
</head>

<body onload="init();">
<form action="menuItemWriteProAction.action" id="formView" name="formView" method="post" enctype="multipart/form-data" ">
	<table width="900" border="0" cellspacing="0" cellpadding="2" align="center">
		<tr>
			<td align="center"><h2>파파존스 메뉴 관리</h2></td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
	</table>
	
	
	<table width="900" border="1" cellspacing="0" cellpadding="2" align="center" id="menuTable">
		<tr bgcolor="#ececec" align="center">
				<th colspan="2">매뉴 추가</th>
		</tr>
		
		<tr>
			<td bgcolor="#F4F4F4">메뉴카테고리</td>
			<td bgcolor="#FFFFFF">
				<select id='menuid' name='menuid' onchange="setSelect(this.value)">
					<option value='pj_noSelected'>##선택하기##</option>
					<option value='pj_2002'>베스트메뉴</option>
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


		<tr id="trname" >
			<td bgcolor="#F4F4F4">메뉴이름</td>
			<td bgcolor="#FFFFFF">
				<input type="text" id="name" name="name" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.name }"  required/>
			</td>
		</tr>

		<tr id="trdescription" > 
			<td bgcolor="#F4F4F4">설명</td>
			<td bgcolor="#FFFFFF">
				<input id="description" name="description" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.description }"  required/>
			</td>
		</tr>

		<tr id="trtopping" >
			<td bgcolor="#F4F4F4">토핑</td>
			<td bgcolor="#FFFFFF">
				<input id="topping" name="topping" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.topping }"  required/>
			</td>
		</tr>
	

	
		<tr id="trrprice" >
			<td bgcolor="#F4F4F4">레귤러가격</td>
			<td bgcolor="#FFFFFF">
				<input id="rprice" name="rprice" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.rprice }"  required/>
			</td>
		</tr>
	

	
		<tr id="trlprice" >
			<td bgcolor="#F4F4F4">라지가격</td>
			<td bgcolor="#FFFFFF">
				<input id="lprice" name="lprice" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.lprice }"  required/>
			</td>
		</tr>
	

	
		<tr id="trfprice" >
			<td bgcolor="#F4F4F4">패밀리가격</td>
			<td bgcolor="#FFFFFF">
				<input id="fprice" name="fprice" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.fprice }"  required/>
			</td>
		</tr>
	
	
	
		<tr id="trpprice" >
			<td bgcolor="#F4F4F4">파티가격</td>
			<td bgcolor="#FFFFFF">
				<input id="pprice" name="pprice" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.pprice }"  required/>
			</td>
		</tr>
	
	
	
		<tr id="trboxprice" >
			<td bgcolor="#F4F4F4">박스가격</td>
			<td bgcolor="#FFFFFF">
				<input id="boxprice" name="boxprice" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.boxprice }"  required/>
			</td>
		</tr>
	
	
		<tr id="tronesizeprice" >
			<td bgcolor="#F4F4F4">원사이즈가격</td>
			<td bgcolor="#FFFFFF">
				<input id="onesizeprice" name="onesizeprice" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.onesizeprice }"  required/>
			</td>
		</tr>
	
	
	
		<tr id="tronepackprice" >
			<td bgcolor="#F4F4F4">원팩가격</td>
			<td bgcolor="#FFFFFF">
				<input id="onepackprice" name="onepackprice" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.onepackprice }" required/>
			</td>
		</tr>
	
	
	
		<tr id="trsetprice" >
			<td bgcolor="#F4F4F4">세트메뉴가격</td>
			<td bgcolor="#FFFFFF">
				<input id="setprice" name="setprice" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.setprice }" required/>
			</td>
		</tr>
	
	
	
		<tr id="trallergy" >
			<td bgcolor="#F4F4F4">알레르기</td>
			<td bgcolor="#FFFFFF">
				<input id="allergy" name="allergy" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.allergy }" required/>
			</td>
		</tr>
	
	
	
		<tr id="trconsist" >
			<td bgcolor="#F4F4F4">구성</td>
			<td bgcolor="#FFFFFF">
				<input id="consist" name="consist" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.consist }" required/>
			</td>
		</tr>
	
	
	
		<tr id="trpresentsauce" >
			<td bgcolor="#F4F4F4">증정소스</td>
			<td bgcolor="#FFFFFF">
				<input id="presentsauce" name="presentsauce" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.presentsauce }" required/>
			</td>
		</tr>
	
	
	
		<tr id="trcalorie" >
			<td bgcolor="#F4F4F4">칼로리</td>
			<td bgcolor="#FFFFFF">
				<input id="calorie" name="calorie" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.calorie }" required/>
			</td>
		</tr>
	
	
	
		<tr id="trnuturition" >
			<td bgcolor="#F4F4F4">영양성분</td>
			<td bgcolor="#FFFFFF">
				<input id="nuturition" name="nuturition" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.nuturition }" required/>
			</td>
		</tr>
	
	
	
		<tr id="trimagepath1" >
			<td bgcolor="#F4F4F4">메뉴이미지</td>
			<td bgcolor="#FFFFFF">
				<input type="file" id="menuImg" name="menuImg" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.imagepath1 }" required/>
			</td>
		</tr>
	
	
		<tr id="trimagepath2" >
			<td bgcolor="#F4F4F4">상세보기이미지1</td>
			<td bgcolor="#FFFFFF">
				<input type="file" id="detailImg1" name="detailImg1" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.imagepath2 }" required/>
			</td>
		</tr>
	
	
	
		<tr id="trimagepath3" >
			<td bgcolor="#F4F4F4">상세보기이미지2</td>
			<td bgcolor="#FFFFFF">
				<input type="file" id="detailImg2" name="detailImg2" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.imagepath3 }" required/>
			</td>
		</tr>
	
	
	
		<tr id="trimagepathorder" >
			<td bgcolor="#F4F4F4">온라인주문이미지</td>
			<td bgcolor="#FFFFFF">
				<input type="file" id="orderImg" name="orderImg" size="80" style="width: 500; background-color: #FFFFFF"  value="${param.imagepathorder }" required/>
			</td>
		</tr>
		
		
		<tr id="trName" >
			<td bgcolor="#ececec" colspan="2" align="center">
				<input type="submit" name="submit" value="추가완료" class="inputb"/>
				<input type="button" name="list" value="목록" class="inputb" onclick="javascript:location.href='menuItemsListAction.action?currentPage=${currentPage}'"/>
			</td>
		</tr>
	</table>
</form>
</body>

</html>

