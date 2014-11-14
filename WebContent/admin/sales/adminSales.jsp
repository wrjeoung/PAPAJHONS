<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>파파존스- 관리자 페이지 - 매출 목록</title>
<script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../assets/js/jquery-ui.js"></script>
<link rel='stylesheet' href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>
<script type="text/javascript">
	var dt = new Date();
	var month = dt.getMonth()+1;
	var day = dt.getDate();
	var year = dt.getFullYear();
	
	if(month < 10)    { month = "0" + month; }
	if(day< 10) { day = "0" + day; }
	
	
	$(document).ready(function() {
	    $( "#sdate" ).datepicker({ 
	        inline: true, 
	        dateFormat: "yy-mm-dd",    /* 날짜 포맷 */ 
	        prevText: 'prev', 
	        nextText: 'next', 
	        showButtonPanel: true,    /* 버튼 패널 사용 */ 
	        changeMonth: true,        /* 월 선택박스 사용 */ 
	        changeYear: true,        /* 년 선택박스 사용 */ 
	       showOtherMonths: true,    /* 이전/다음 달 일수 보이기 */ 
	       selectOtherMonths: true,    /* 이전/다음 달 일 선택하기 */ 
	       showOn: "button", 
	       buttonImage: "../assets/img/common/calendar.gif", 
	      buttonImageOnly: true, 
	      minDate: '-30y', 
	      closeText: '닫기', 
	      currentText: '오늘', 
	      showMonthAfterYear: true,        /* 년과 달의 위치 바꾸기 */ 
	      /* 한글화 */ 
	      monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
	      monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
	      dayNames : ['일', '월', '화', '수', '목', '금', '토'],
	      dayNamesShort : ['일', '월', '화', '수', '목', '금', '토'],
	      dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
	      showAnim: 'slideDown', 
	      /* 날짜 유효성 체크 */ 
	      onClose: function( selectedDate ) { 
	          $('#fromDate').datepicker("option","minDate", selectedDate); 
	      } 
	  });	
	    $( "#edate" ).datepicker({ 
	        inline: true, 
	        dateFormat: "yy-mm-dd",    /* 날짜 포맷 */ 
	        prevText: 'prev', 
	        nextText: 'next', 
	        showButtonPanel: true,    /* 버튼 패널 사용 */ 
	        changeMonth: true,        /* 월 선택박스 사용 */ 
	        changeYear: true,        /* 년 선택박스 사용 */ 
	       showOtherMonths: true,    /* 이전/다음 달 일수 보이기 */ 
	       selectOtherMonths: true,    /* 이전/다음 달 일 선택하기 */ 
	       showOn: "button", 
	       buttonImage: "../assets/img/common/calendar.gif", 
	      buttonImageOnly: true, 
	      minDate: '-30y', 
	      closeText: '닫기', 
	      currentText: '오늘', 
	      showMonthAfterYear: true,        /* 년과 달의 위치 바꾸기 */ 
	      /* 한글화 */ 
	      monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
	      monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
	      dayNames : ['일', '월', '화', '수', '목', '금', '토'],
	      dayNamesShort : ['일', '월', '화', '수', '목', '금', '토'],
	      dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
	      showAnim: 'slideDown', 
	      /* 날짜 유효성 체크 */ 
	      onClose: function( selectedDate ) { 
	          $('#fromDate').datepicker("option","minDate", selectedDate); 
	      } 
	  });	        
	    
	});
	
	//페이지 이동
	function goPage(page, block) 
	{
	   f = document.form1;	
	   f.inCurPage.value  = page;        
		   f.inCurBlock.value = block;   
		   
		   f.submit();
	}
	
	//질문 입력에 따른 리스트 다시 표시
	function search_list() 
	{
		console.log("search_list");
		f = document.form1;
		f.action = 'adminSalesProAction.action';
		f.submit();
	}
	
	function fn_daySetting(sdate, edate)
	{
		f = document.form1;
		
		f.sdate.value = sdate;
		f.edate.value = edate;
	}
	
	function getAWeekAgo(){
		var changeDate = new Date();
		changeDate.setFullYear(year, month-1, day-7);
	
		var y = changeDate.getFullYear();
		var m = changeDate.getMonth() + 1;
		var d = changeDate.getDate();
		if(m < 10) { m = "0" + m; }
		if(d < 10) { d = "0" + d; }
	
		var resultDate = y + "-" + m + "-" + d;
		return resultDate;
	}
	
	function getAMonthAgo(){
	    var changeDate = new Date();
	    changeDate.setFullYear(year, month-1);
	    
	    var y = changeDate.getFullYear();
	    var m = changeDate.getMonth();
	    var d = changeDate.getDate();
	    
	    if(m < 10)    { m = "0" + m; }
	    if(d < 10) { d = "0" + d; }
	    
	    var resultDate = y + "-" + m + "-" + d;
	    return resultDate;
	}
	
	function getThreeMonthAgo(){
	    var changeDate = new Date();
	    changeDate.setFullYear(year, month-3);
	    
	    var y = changeDate.getFullYear();
	    var m = changeDate.getMonth();
	    var d = changeDate.getDate();
	    
	    if(m < 10)    { m = "0" + m; }
	    if(d < 10) { d = "0" + d; }
	    
	    var resultDate = y + "-" + m + "-" + d;
	    return resultDate;
	}	
	
	function getSixMonthAgo(){
	    var changeDate = new Date();
	    changeDate.setFullYear(year, month-6);
	    
	    var y = changeDate.getFullYear();
	    var m = changeDate.getMonth();
	    var d = changeDate.getDate();
	    
	    if(m < 10)    { m = "0" + m; }
	    if(d < 10) { d = "0" + d; }
	    
	    var resultDate = y + "-" + m + "-" + d;
	    return resultDate;
	}
	
	function getAYearAgo(){
	    var changeDate = new Date();
	    changeDate.setFullYear(year-1);
	    
	    var y = changeDate.getFullYear();
	    var m = changeDate.getMonth()+1;
	    var d = changeDate.getDate();
	    
	    if(m < 10)    { m = "0" + m; }
	    if(d < 10) { d = "0" + d; }
	    
	    var resultDate = y + "-" + m + "-" + d;
	    return resultDate;
	}		
	
	function getCurrentDate()
	{
		var resultDate = year + "-" + month + "-" + day;
		return resultDate;
	}
	
	function onload()
	{
		document.form1.sdate.value = getCurrentDate();
	 	document.form1.edate.value = getCurrentDate();
	}
</script>

<script for=window event=onload>
	//$("#sdate").val(getCurrentDate());
	//$("#edate").val("adfasdfsdfdsf");
	//document.form1.sdate.value = getCurrentDate();
 	//document.form1.edate.value = getCurrentDate();
</script>
</head>

<body onload="onload()">
	<form id="form1" name="form1" method="post" target=i1>
		<!--  
		<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
			<tr>
				<td align="center"><h2>매출 목록</h2></td>
			</tr>
		</table>
		-->
		<div id="my_ordList_section" class="list" align="center">
			<div id="search" class="txt_left">
				<td><h2>매출 목록</h2></td>
	    		<p class="padd_l10">
	      			<span class="btn_h23 gray"><button type="button" onclick="fn_daySetting(getCurrentDate(),getCurrentDate());">당일</button></span>
					<span class="btn_h23 gray"><button type="button" onclick="fn_daySetting(getAWeekAgo(),getCurrentDate());">1주일</button></span>
					<span class="btn_h23 gray"><button type="button" onclick="fn_daySetting(getAMonthAgo(),getCurrentDate());">1개월</button></span>
					<span class="btn_h23 gray"><button type="button" onclick="fn_daySetting(getThreeMonthAgo(),getCurrentDate());">3개월</button></span>
					<span class="btn_h23 gray"><button type="button" onclick="fn_daySetting(getSixMonthAgo(),getCurrentDate());">6개월</button></span>
					<span class="btn_h23 gray"><button type="button" onclick="fn_daySetting(getAYearAgo(),getCurrentDate());">1년</button></span>
				</p>
				<p class="padd_b5">
	    			<span class="bold padd_l10">기간조회</span>
						<input type="text" id="sdate" name="sdate" value="" readonly="readonly" class="inpline" style="width:110px;margin-right:4px" title="검색시작일">
						-
						<input type="text" id="edate" name="edate" value="" readonly="readonly" class="inpline" style="width:110px;margin-right:4px" title="검색종료일">
					<span class="btn_h23 gray"><button type="button" onclick="search_list()">검색</button></span>
	    		</p>
			</div>
			<p>
				<table border="1" cellspacing="0" cellpadding="2" align="center">
					<thead>
						<tr align="center" bgcolor="#F3F3F3">
							<!-- 
							<td width="100"><strong>주문자ID</strong></td>
							 -->
							<td width="200"><strong>상품명</strong></td>
							<td width="200"><strong>상품사이즈</strong></td>
							<td width="100"><strong>수량</strong></td>
							<td width="100"><strong>금액</strong></td>
							<!--  
							<td width="100"><strong>배송정보</strong></td>
							<td width="200"><strong>주문시간</strong></td>
							-->
						</tr>
					</thead>
					<tbody id="tb">
						<!--
						<tr>
							<td>상품명</td>
		      				<td>상품사이즈</td>
		      				<td>수량</td>
		      				<td>금액</td>
		      			</tr>
		      			
		      			<tr>
		      				<td colspan="9">조회된 내용이 없습니다.</td>
		      			</tr>  -->
					</tbody>
				</table>
			</p>
		</div>
	</form>
	<br/><br/>
	
	<p>
		<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
			<td width="200" id="price"></td>
			<td width="200" id="count"></td>
			<td align="right" colspan="3">
				<input type="button" value="관리자 홈으로 가기" class="inputb" onClick="javascript:location.href='adminMainAction.action'"/>
			</td>
		</table>
	</p>
	
	<iframe name=i1 src="" width="0px" height="0px" frameborder="1">아이프레임이지원되는 브라우저에서 확인할수있습니다.</iframe>
</body>
</html>