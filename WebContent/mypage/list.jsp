<!-- 달력쿼리 -->
<link rel='stylesheet' href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/> 
<script type="text/javascript" src="../assets/js/jquery-ui.js"></script>
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
		f = document.form1;
		
		
		f.inCurPage.value = "1";
		f.inCurBlock.value = "1";
		f.action = 'myorderListProAction.action';
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
</script>

<script for=window event=onload>
	document.form1.sdate.value = getCurrentDate();
 	document.form1.edate.value = getCurrentDate();
</script>

<form id="form1" name="form1" method="post" target=i1>
	<input type="hidden" name="inCurPage"      value="1"		>  <!-- 현재 페이지 -->
	<input type="hidden" name="inCurBlock"     value="1"		>  <!-- 현재 블럭 -->
	<input type="hidden" name="inRowPerPage"   value="10"	>  <!-- 한 페이지당 표시할 레코드 수 -->
	<input type="hidden" name="inPagePerBlock" value="10"	>  <!-- 한 블럭당 할당된 페이지 수 -->	

	<div id="my_ordList_section" class="list">
		<p class="txt_c9 txt_left padd_b10">
  			1.  주문내역 확인은 <span class="txt_point">온라인 및 모바일 웹</span>에서 주문한 <span class="txt_point">내역만 확인</span>이 가능 합니다.<br />
			2.  온라인에서는 주문취소를 바로 하실수 없으며 <span class="txt_point">주문취소는 고객센터(1566-0889)</span>로 해주시기 바랍니다.<br />
			3.  온라인 <span class="txt_point">당일 주문 확인은 주문직 후  <span class="bold">온라인주문확인</span></span> 화면에서 하실 수 있습니다.<br />
			4.  온라인 <span class="txt_point">예약 주문 확인은 주문직 후 <span class="bold">온라인주문확인</span></span>화면에서 가능하며,<br> 주문내역 변경 및 취소는 <span class="txt_point">고객센터(1577-8142)</span>로 문의 해 주시기 바랍니다.<br />
		</p>
  		<div id="search" class="txt_left">
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
  			<table class="table_list">
    			<thead>
    				<tr>
      					<th>주문번호</th>
        				<th>주문일자</th>
        				<th>상품명</th>
        				<th>수량</th>
        				<th>금액</th>
        				<th>상태</th>
        				<!-- <th>삭제</th> -->
      				</tr>
    			</thead>
    			<tbody>
    			    <!--  <tr>
      					<td>번호</td>
        				<td>주문일자</td>
        				<td>주문번호</td>
        				<td>주문금액</td>
        				<td>할인금액</td>
        				<td>최종금액</td>
        				<td>주문매장</td>
        				<td>상태</td>
        				<td>상세내역</td>
      				</tr>  

	      			<tr>
	      				<td colspan="9">조회된 내용이 없습니다.</td>
	      			</tr>
					-->
    			</tbody>
  			</table>
  		</p>
	</div>
</form>

<iframe name=i1 src="" width="0px" height="0px" frameborder="1">아이프레임이지원되는 브라우저에서 확인할수있습니다.</iframe>
