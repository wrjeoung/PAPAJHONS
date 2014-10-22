<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 0313 추가 부분 시작 
   - 아래의 <script type="text/javascript">snb("#snb1")</script> 부분 모두 삭제 
   - dep2 클래스 아래 a 태그 href에 tab 파라미터 변수 보내기
-->
<script type="text/javascript">
	var menuGb  = "null";
	var menuId  = "null";
	var tab     = "null";
	var $menuGb = $("#"+menuGb);
	var $meuId  = $("."+menuId);
	
	// 2014.07.17.월드컵이벤트




	$meuId.next().find(">ul>li>a").eq(tab-1).addClass("active");

	//현재 메뉴그룹에 맞는 서브부분 보이기
	$menuGb.show();
		
	//현재 들어온 2차메뉴에 클래스 active를 추가시켜 메뉴 활성화하기
	if( menuId == "pj_3001_view" || menuId == "pj_3002_view" || menuId == "pj_3003_view")
	{
		//20140319 이벤트 페이지 예외처리
		menuId = menuId.split("_")[0] + "_" + menuId.split("_")[1];
	}
	//20140410 이전주문내역 상세 화면  버튼 활성 처리
	if(menuGb =="mypage" && menuId == "view")
	{
		menuId = "pj_7001";
	}
	$("."+menuId).addClass("active");
	snb("#"+menuGb);
	
	
	// tab메뉴가 null일경우 dep1의 이미지 alt에서 타이틀 값가져오기/ tab값이 있을경우 tab번호에 맞는 텍스트값 불러오기
	if( tab == "null" )
	{
		var title = $meuId.find("img").attr("alt");
	}
	else
	{
		var title = $meuId.next().find("li").eq(tab-1).text();
	}

	$("#contents .top_title h2").text(title);

	//20140319 페이스북 like 버튼 추가 & 제외
	if(menuGb == "menu" || menuGb == "mypage")
	{
		$("#contents .top_title").find(".fb-like").hide();
		
		//20140520 마이페이지에 월드컵 이벤트 확인 버튼 삽입
		//20140530 이벤트 기간동안만 화면 보이기
		//20140627 마이페이지 이벤트 버튼 삭제 (한국 경기 종료)
	}
</script>
<!-- 0313 추가 부분 끝 -->

<form id="f1" name="f1">
	<div id="menu" style="display:none">
  		<!--  1메뉴 서브 : menuGd=menu -->
  		<h2><img alt="메뉴" src="/assets/img/sub/snb_title_2.gif"></h2>
  		<dl class="sub" id="snb1">
    		<dt class="dep1 pj_2001"><a href="/sub.jsp?menuGb=menu&menuId=pj_2001"><img src="/assets/img/sub/sub_2_1.gif" alt="이 달의 프로모션"></a></dt>
    		<dt class="dep1 pj_2002"><a href="/sub.jsp?menuGb=menu&menuId=pj_2002"><img src="/assets/img/sub/sub_2_2.gif" alt="베스트 메뉴"></a></dt>
    		<dt class="dep1 pj_2003"><a href="/sub.jsp?menuGb=menu&menuId=pj_2003"><img src="/assets/img/sub/sub_2_3.gif" alt="오리지널"></a></dt>
    		<dt class="dep1 pj_2004"><a href="/sub.jsp?menuGb=menu&menuId=pj_2004"><img src="/assets/img/sub/sub_2_4.gif" alt="골드링"></a></dt>
    		<dt class="dep1 pj_2005"><a href="/sub.jsp?menuGb=menu&menuId=pj_2005"><img src="/assets/img/sub/sub_2_5.gif" alt="치즈롤 크러스트"></a></dt>
    		<dt class="dep1 pj_2006"><a href="/sub.jsp?menuGb=menu&menuId=pj_2006"><img src="/assets/img/sub/sub_2_6.gif" alt="씬"></a></dt>
    		<dt class="dep1 pj_2007" style="display:none;"><a href="/sub.jsp?menuGb=menu&menuId=pj_2007"><img src="/assets/img/sub/sub_2_7.gif" alt="오리지널 씬"></a></dt>
    		<dt class="dep1 pj_2008"><a href="/sub.jsp?menuGb=menu&menuId=pj_2008"><img src="/assets/img/sub/sub_2_8.gif" alt="골드링 씬"></a></dt>
    		<dt class="dep1 pj_2009"><a href="/sub.jsp?menuGb=menu&menuId=pj_2009"><img src="/assets/img/sub/sub_2_9.gif" alt="하트 씬"></a></dt>
    		<!-- 20140425 파파플래터 -->
    		<dt class="dep1 pj_2010"><a href="/sub.jsp?menuGb=menu&menuId=pj_2010"><img src="/assets/img/sub/sub_2_10.gif" alt="파파플래터"></a></dt>
    		<dt class="dep1 pj_2011"><a href="/sub.jsp?menuGb=menu&menuId=pj_2011"><img src="/assets/img/sub/sub_2_11.gif" alt="세트메뉴"></a></dt>
    		<dt class="dep1 pj_2012"><a href="/sub.jsp?menuGb=menu&menuId=pj_2012"><img src="/assets/img/sub/sub_2_12.gif" alt="사이드"></a></dt>
    		<dt class="dep1 pj_2013"><a href="/sub.jsp?menuGb=menu&menuId=pj_2013"><img src="/assets/img/sub/sub_2_13.gif" alt="음료"></a></dt>
    		<dt class="dep1 pj_2014"><a href="/sub.jsp?menuGb=menu&menuId=pj_2014"><img src="/assets/img/sub/sub_2_14.gif" alt="소스&피클"></a></dt>
  		</dl>
	</div>

	<div id="event" style="display:none">
  		<!--  2프로모션 서브: menuGd=event -->
  		<h2><img alt="프로모션" src="/assets/img/sub/snb_title_3.gif"></h2>
  		<dl class="sub" id="snb2">
    		<dt class="dep1 pj_3001"><a href="/sub.jsp?menuGb=event&menuId=pj_3001"><img src="/assets/img/sub/sub_3_1.gif" alt="진행중인 이벤트"></a></dt>
    		<dt class="dep1 pj_3002"><a href="/sub.jsp?menuGb=event&menuId=pj_3002"><img src="/assets/img/sub/sub_3_2.gif" alt="지난 이벤트"></a></dt>
    		<dt class="dep1 pj_3003"><a href="/sub.jsp?menuGb=event&menuId=pj_3003"><img src="/assets/img/sub/sub_3_3.gif" alt="매장별 이벤트"></a></dt>
    		<dt class="dep1 pj_3004"><a href="/sub.jsp?menuGb=event&menuId=pj_3004"><img src="/assets/img/sub/sub_3_4.gif" alt="스페셜 할인 이벤트"></a></dt>
  		</dl>
	</div>

	<div id="story" style="display:none">
  		<!--  3파파존스 이야기 서브: menuGd=story -->
  		<h2><img alt="파파존스이야기" src="/assets/img/sub/snb_title_4.gif"></h2>
  		<dl class="sub" id="snb3">
    		<dt class="dep1 pj_4001"><a href="/sub.jsp?menuGb=story&menuId=pj_4001"><img src="/assets/img/sub/sub_4_1.gif" alt="회사 소개"></a></dt>
    		<dd class="dep2">
    			<ul>
       				<li class=""><a href="/sub.jsp?menuGb=story&menuId=pj_4001&tab=1">Papa John's History</a></li>
       				<li class=""><a href="/sub.jsp?menuGb=story&menuId=pj_4001&tab=2">핵심가치</a></li>
       				<li class=""><a href="/sub.jsp?menuGb=story&menuId=pj_4001&tab=3">수상내역</a></li> 
    			</ul>
    		</dd>
    		<dt class="dep1 pj_4002"><a href="/sub.jsp?menuGb=story&menuId=pj_4002"><img src="/assets/img/sub/sub_4_2.gif" alt="피자 이야기"></a></dt>
    		<dt class="dep1 pj_4003"><a href="/sub.jsp?menuGb=story&menuId=pj_4003"><img src="/assets/img/sub/sub_4_3.gif" alt="창립 이야기"></a></dt>
    		<dt class="dep1 pj_4004"><a href="/sub.jsp?menuGb=story&menuId=pj_4004"><img src="/assets/img/sub/sub_4_4.gif" alt="홍보 센터"></a></dt>
    		<dd class="dep2">
    			<ul>
       				<li><a href="/sub.jsp?menuGb=story&menuId=pj_4004&tab=1">TV광고</a></li>
       				<li><a href="/sub.jsp?menuGb=story&menuId=pj_4004&tab=2">사회공헌활동소개</a></li>
       				<li><a href="/sub.jsp?menuGb=story&menuId=pj_4004&tab=3">파파존스 매직카</a></li>
       				<li><a href="/sub.jsp?menuGb=story&menuId=pj_4004&tab=4">보도자료</a></li>
    			</ul>
    		</dd>
    		<dt class="dep1 pj_4005"><a href="/sub.jsp?menuGb=story&menuId=pj_4005"><img src="/assets/img/sub/sub_4_5.gif" alt="채용 공고"></a></dt>
    		<dd class="dep2">
    			<ul>
       				<li><a href="/sub.jsp?menuGb=story&menuId=pj_4005&tab=1">정규직원 입사지원</a></li>
       				<li><a href="/sub.jsp?menuGb=story&menuId=pj_4005&tab=2">아르바이트입사지원</a></li>
    			</ul>
    		</dd>
		</dl>
	</div>

	<div id="customer" style="display:none">
  		<!--  4고객센터 서브: menuGd=customer -->
  		<h2><img alt="고객센터" src="/assets/img/sub/snb_title_5.gif"></h2>
  		<dl class="sub" id="snb4">
    		<dt class="dep1 pj_5001"><a href="/sub.jsp?menuGb=customer&menuId=pj_5001"><img src="/assets/img/sub/sub_5_1.gif" alt="공지사항"></a></dt>
    		<dt class="dep1 pj_5002"><a href="/sub.jsp?menuGb=customer&menuId=pj_5002&tab=1"><img src="/assets/img/sub/sub_5_2.gif" alt="Q&A "></a></dt>
    		<dd class="dep2">
      			<ul>
        			<li><a href="/sub.jsp?menuGb=customer&menuId=pj_5002&tab=1">FAQ</a></li>
        			<li><a href="/sub.jsp?menuGb=customer&menuId=pj_5002&tab=2">직접문의</a></li>
      			</ul>
    		</dd>
    		<dt class="dep1 pj_5003"><a href="/sub.jsp?menuGb=customer&menuId=pj_5003"><img src="/assets/img/sub/sub_5_3.gif" alt="제휴 카드 안내"></a></dt>
     		<dd class="dep2">
      			<ul>
        			<li><a href="/sub.jsp?menuGb=customer&menuId=pj_5003&tab=1">통신사 멤버쉽 카드</a></li>
        			<li><a href="/sub.jsp?menuGb=customer&menuId=pj_5003&tab=2">신용카드</a></li>
      			</ul>
    		</dd>
    		<dt class="dep1 pj_5004"><a href="/sub.jsp?menuGb=customer&menuId=pj_5004"><img src="/assets/img/sub/sub_5_4.gif" alt="매장 안내"></a></dt>
  		</dl>
	</div>

	<div id="mypage" style="display:none">
  		<!--  5마이페이지 서브: menuGd=mypage -->
  		<h2><img alt="마이페이지" src="/assets/img/sub/snb_title_6.gif"></h2>
  		<dl class="sub" id="snb5">
    		<dt class="dep1 pj_7001"><a href="/sub.jsp?menuGb=mypage&menuId=pj_7001"><img src="/assets/img/sub/sub_6_1.gif" alt="이전 주문 내역"></a></dt>
    		<dt class="dep1 pj_7002"><a href="/sub.jsp?menuGb=mypage&menuId=pj_7002"><img src="/assets/img/sub/sub_6_2.gif" alt="보유 쿠폰 확인 "></a></dt>
    		<dt class="dep1 pj_7003"><a href="/sub.jsp?menuGb=mypage&menuId=pj_7003"><img src="/assets/img/sub/sub_6_3.gif" alt="개인정보수정 "></a></dt>
    	</dl>
	</div>
</form>