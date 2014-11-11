<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Description"
	content="Order Papa John's Pizza online for fast pizza delivery or pickup. Get Papa John's Special Offers or use Papa John's promo codes for online pizza orders." />
<meta http-equiv="Keywords"
	content="Papa john's, papa johns, papa johns pizza, papa johns online, pizza, papa johns menu, order papa johns, pizza delivery, order pizza online, pizza specials, papa johns coupons, papa johns promo codes, papa johns specials, pizza coupons, fast order, papa's picks, papas picks" />
<link rel="icon" href="assets/img/favicon.ico" />
<link type="text/css" rel="stylesheet" href="../assets/css/import.css" />
<link type="text/css" rel="stylesheet" href="../assets/css/sub.css" />
<link type="text/css" rel="stylesheet" href="../assets/css/lib_style.css" />
<title>파파존스-Better Ingredients.Better Pizza.</title>
<style type="text/css"></style>
<script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
<!-- <script type="text/javascript" src="assets/js/common.js"></script> -->
<script type="text/javascript" src="../assets/js/common.min.js"></script>
<script type="text/javascript" src="../assets/js/snb.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{	
 		$('#viewLoading').fadeOut();
 		$('#viewLoading')	// ajax 실행 및 완료시 'Loading 이미지'의 동작 컨트롤하기

 		
		.ajaxStart(function()
		{  
			$(this).fadeIn(500);
		})
		.ajaxStop(function()
		{ 
			$(this).fadeOut(500);
		});
	});
</script>
</head>

<body>
	<div id="skipNavi">
		<a href="#gnb">메뉴 바로가기</a> <a href="#contents">본문바로가기</a>
	</div>

	<!-- wrap -->
	<div id="wrap">

		<!-- header -->
		<div id="header">
			<script type="text/javascript"> $("#header").load("../include/header.jsp?menuGb=member&menuId=pj_0009"); </script>
		</div>
		<!-- // header -->

		<!-- container -->
		<div id="container">
			<!-- con_header -->
    		<div class="con_header">
      			<p style="background: url(http://www.pji.co.kr/assets/img/sub/conHeader_text_bg.png);">
      				Papa John's SITEMAP
      				<span><img src="../assets/img/sub/conHeader_text_phone.gif" alt="온라인주문관련 상담번호"></span>
      			</p>
    		</div>
    		<!-- //con_header -->
	  
    		<!-- content_area -->
    		<div id="content_area" style="width: 800px; padding: 20px 10px; margin: 0px auto; background: rgb(255, 255, 255);">
    			<div id="sitemap_area">
    				<h2><img src="../assets/img/sitemap/sitemap_title.gif" alt="사이트맵"></h2>
	    			<dl class="sitemap1" style=" height:310px;">
	    				<dt><img src="../assets/img/sitemap/sitemap_t1.gif" alt="온라인주문"></dt>
						<dd><a href="orderAction.action?menuId=pj_2003&pizzaSelIdx=1"><img src="../assets/img/sitemap/sitemap1_1.gif" alt="피자주문하기"></a></dd>
						<!--  <dd><a href="/cont.jsp?menuGb=member&amp;menuId=pj_0001&amp;step=step5"><img src="/assets/img/sitemap/sitemap1_2.gif" alt="온라인주문확인"></a></dd> -->
					</dl>
	
					<dl class="sitemap2" style=" height:310px;">
						<dt><img src="../assets/img/sitemap/sitemap_t2.gif" alt="메뉴"></dt>
						<!--  <dd><a href="/sub.jsp?menuGb=menu&amp;menuId=pj_2001"><img src="/assets/img/sitemap/sitemap2_1.gif" alt="이달의 프로모션"></a></dd> -->
						<dd><a href="subAction.action?menuId=pj_2002"><img src="../assets/img/sitemap/sitemap2_2.gif" alt="베스트메뉴"></a></dd>
						<dd><a href="subAction.action?menuId=pj_2003"><img src="../assets/img/sitemap/sitemap2_3.gif" alt="오리지널"></a></dd>
						<dd><a href="subAction.action?menuId=pj_2004"><img src="../assets/img/sitemap/sitemap2_4.gif" alt="골드링"></a></dd>
						<dd><a href="subAction.action?menuId=pj_2005"><img src="../assets/img/sitemap/sitemap2_5.gif" alt="치즈롤"></a></dd>
						<dd><a href="subAction.action?menuId=pj_2006"><img src="../assets/img/sitemap/sitemap2_6.gif" alt="씬"></a></dd>
						
						<dd><a href="subAction.action?menuId=pj_2008"><img src="../assets/img/sitemap/sitemap2_8.gif" alt="골드링 씬"></a></dd>
						<dd><a href="subAction.action?menuId=pj_2009"><img src="../assets/img/sitemap/sitemap2_9.gif" alt="하트 씬"></a></dd>
						<dd><a href="subAction.action?menuId=pj_2010"><img src="../assets/img/sitemap/sitemap2_10.gif" alt="파파플래터"></a></dd>
						<dd><a href="subAction.action?menuId=pj_2011"><img src="../assets/img/sitemap/sitemap2_11.gif" alt="세트메뉴"></a></dd>
						<dd><a href="subAction.action?menuId=pj_2012"><img src="../assets/img/sitemap/sitemap2_12.gif" alt="사이드"></a></dd>
						<dd><a href="subAction.action?menuId=pj_2013"><img src="../assets/img/sitemap/sitemap2_13.gif" alt="음료"></a></dd>
						<!--  <dd><a href="/sub.jsp?menuGb=menu&amp;menuId=pj_2014"><img src="/assets/img/sitemap/sitemap2_14.gif" alt="소스&amp;피클"></a></dd> -->
					</dl>
	
					<dl class="sitemap3" style=" height:310px;">
						<dt><img src="../assets/img/sitemap/sitemap_t3.gif" alt="프로모션"></dt>
						<dd><a href="listAction2.action"><img src="../assets/img/sitemap/sitemap3_1.gif" alt="진행중인 이벤트"></a></dd>
						<dd><a href="pastlistAction.action"><img src="../assets/img/sitemap/sitemap3_2.gif" alt="지난 이벤트"></a></dd>
						<dd><a href="storelistAction.action"><img src="../assets/img/sitemap/sitemap3_3.gif" alt="매장 이벤트"></a></dd>
						<dd><a href="speciallistAction.action"><img src="../assets/img/sitemap/sitemap3_4.gif" alt="스페셜 할인이벤트"></a></dd>
					</dl>
					<!--  
					<dl class="sitemap4" style=" height:310px;">
						<dt><img src="/assets/img/sitemap/sitemap_t4.gif" alt="파파존스이야기"></dt>
						<dd>
							<a href="/sub.jsp?menuGb=story&amp;menuId=pj_4001"><img src="/assets/img/sitemap/sitemap4_1.gif" alt="회사소개"></a>
							<ul>
								<li><a href="/sub.jsp?menuGb=story&amp;menuId=pj_4001&amp;tab=1">Papa John's History</a></li>
								<li><a href="/sub.jsp?menuGb=story&amp;menuId=pj_4001&amp;tab=2">핵심가치</a></li>
								<li><a href="/sub.jsp?menuGb=story&amp;menuId=pj_4001&amp;tab=3">수상내역</a></li>
							</ul>
						</dd>
						<dd><a href="/sub.jsp?menuGb=story&amp;menuId=pj_4002"><img src="/assets/img/sitemap/sitemap4_2.gif" alt="피자이야기"></a></dd>
						<dd><a href="/sub.jsp?menuGb=story&amp;menuId=pj_4003"><img src="/assets/img/sitemap/sitemap4_3.gif" alt="창립이야기"></a></dd>
						<dd>
							<a href="/sub.jsp?menuGb=story&amp;menuId=pj_4004"><img src="/assets/img/sitemap/sitemap4_4.gif" alt="홍보센터"></a>
							<ul>
								<li><a href="/sub.jsp?menuGb=story&amp;menuId=pj_4004&amp;tab=1">TV광고</a></li>
								<li><a href="/sub.jsp?menuGb=story&amp;menuId=pj_4004&amp;tab=2">사회공헌활동소개</a></li>
								<li><a href="/sub.jsp?menuGb=story&amp;menuId=pj_4004&amp;tab=3">파파존스 매직카</a></li>
								<li><a href="/sub.jsp?menuGb=story&amp;menuId=pj_4004&amp;tab=4">보도자료</a></li>
							</ul>
						</dd>
						<dd>
							<a href="/sub.jsp?menuGb=story&amp;menuId=pj_4005"><img src="/assets/img/sitemap/sitemap4_5.gif" alt="채용공고"></a>
							<ul>
								<li><a href="/sub.jsp?menuGb=story&amp;menuId=pj_4005&amp;tab=1">정규직원 입사지원</a></li>
								<li><a href="/sub.jsp?menuGb=story&amp;menuId=pj_4005&amp;tab=2">아르바이트입사지원</a></li>
							</ul>
						</dd>
					</dl>
					-->
					<dl class="sitemap5">
						<dt><img src="../assets/img/sitemap/sitemap_t5.gif" alt="고객센터"></dt>
						<dd>
							<a href="listAction.action"><img src="../assets/img/sitemap/sitemap5_1.gif" alt="공지사항"></a>
						</dd>
						<dd>
							<a href="qnalistAction.action"><img src="../assets/img/sitemap/sitemap5_2.gif" alt="qna"></a>
							<!--  
							<ul>
								<li><a href="/sub.jsp?menuGb=customer&amp;menuId=pj_5002&amp;tab=1">FAQ</a></li>
								<li><a href="/sub.jsp?menuGb=customer&amp;menuId=pj_5002&amp;tab=2">직접문의</a></li>
							</ul>
							-->
						</dd>
						<dd>
							<a href="memcardlistAction.action"><img src="../assets/img/sitemap/sitemap5_3.gif" alt="제휴 카드 안내"></a>
							<ul>
								<li><a href="memcardlistAction.action">통신사 멤버쉽카드</a></li>
								<li><a href="crecardlistAction.action">신용카드</a></li>
							</ul>
						</dd>
						<dd>
							<a href="storeAction.action"><img src="../assets/img/sitemap/sitemap5_4.gif" alt="매장안내"></a>
						</dd>
					</dl>
					<!--  
					<dl class="sitemap6">
						<dt><img src="/assets/img/sitemap/sitemap_t6.gif" alt="가맹안내"></dt>
						<dd><a href="/cont.jsp?menuGb=franch&amp;menuId=pj_6001"><img src="/assets/img/sitemap/sitemap6_1.gif" alt="가맹조건"></a></dd>
						<dd><a href="/cont.jsp?menuGb=franch&amp;menuId=pj_6002"><img src="/assets/img/sitemap/sitemap6_2.gif" alt="가맹절차"></a></dd>
						<dd><a href="/cont.jsp?menuGb=franch&amp;menuId=pj_6003"><img src="/assets/img/sitemap/sitemap6_3.gif" alt="상담신청 및 문의"></a></dd>
						<dd><a href="/cont.jsp?menuGb=franch&amp;menuId=pj_6004"><img src="/assets/img/sitemap/sitemap6_4.gif" alt="가맹점 성공스토리"></a></dd>
					</dl>
				
					<dl class="sitemap7">
						<dt><img src="/assets/img/sitemap/sitemap_t7.gif" alt="멤버쉽"></dt>
						<dd><a href="/cont.jsp?menuGb=member&amp;menuId=pj_0001"><img src="/assets/img/sitemap/sitemap7_1.gif" alt="로그인"></a></dd>
						<dd><a href="/cont.jsp?menuGb=member&amp;menuId=pj_0003"><img src="/assets/img/sitemap/sitemap7_2.gif" alt="회원가입"></a></dd>
						<dd><a href="/cont.jsp?menuGb=member&amp;menuId=pj_0002"><img src="/assets/img/sitemap/sitemap7_3.gif" alt="아이디/패스워드찾기"></a></dd>
						<dd><a href="/cont.jsp?menuGb=member&amp;menuId=pj_0007"><img src="/assets/img/sitemap/sitemap7_4.gif" alt="개인정보취급방침"></a></dd>
						<dd><a href="/cont.jsp?menuGb=member&amp;menuId=pj_0008"><img src="/assets/img/sitemap/sitemap7_5.gif" alt="이용약관"></a></dd>
					</dl>
					-->
					<dl class="sitemap8">
						<dt><img src="../assets/img/sitemap/sitemap_t8.gif" alt="마이페이지"></dt><br/>
						<dt align="center"><img src="../assets/img/sitemap/sitemap8_1.gif" alt="이전주문내역"></dt><br/>
						<!--  <dd><a href="/sub.jsp?menuGb=mypage&amp;menuId=pj_7002"><img src="/assets/img/sitemap/sitemap8_2.gif" alt="쿠폰확인/등록"></a></dd> -->
						<dt align="center"><img src="../assets/img/sitemap/sitemap8_3.gif" alt="개인정보수정"></dt>
					</dl>
				</div>
			</div>
	    	<!--// content_area -->
  		</div>
		<!-- //container -->

		<!-- footer -->
		<div id="footer">
			<script type="text/javascript">	$("#footer").load("../include/foot.jsp"); </script>
		</div>
		<!-- // footer -->

	</div>
	<!-- //wrap -->

	<!-- 로딩 이미지 -->
	<div id="viewLoading">
		<img src="../assets/img/viewLoading.gif" />
		<p>Loading....</p>
	</div>
</body>
</html>