<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="icon" href="../assets/img/favicon.ico" />
<link type="text/css" rel="stylesheet" href="../assets/css/import.css" />
<link type="text/css" rel="stylesheet" href="../assets/css/sub.css" />
<link type="text/css" rel="stylesheet" href="../assets/css/lib_style.css" />
<!-- 0404 추가부분(달력쿼리 스타일) 시작 -->
<link type="text/css" rel="stylesheet" href="../assets/css/ui.all.css" />
<!-- 0404 추가부분(달력쿼리 스타일)끝-->
<title>파파존스-Better Ingredients.Better Pizza.</title>
<style type="text/css">
/* 메뉴화면 공통팝업 스타일 수정 20131128*/
#notice_caution {
	display: none;
	width: 340px;
	height: auto;
	min-height: 140px;
	padding: 1px;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 1000;
}

#notice_caution .header .left {
	float: left;
	width: 6px;
	background: url(../assets/img/usa/modal_header_left.png) top left
		no-repeat;
}

#notice_caution .header .center {
	float: left;
	width: 328px;
	height: 40px;
	background: url(../assets/img/usa/modal_header_center.png) top center
		repeat-x;
}

#notice_caution .header .right {
	float: right;
	width: 6px;
	height: 40px;
	background: url(../assets/img/usa/modal_header_right.png) top right
		no-repeat;
}

#notice_caution .text_body {
	width: 340px;
	height: auto;
	min-height: 90px;
	line-height: 30px;
	background: #fff;
	border: 0px none;
	padding: 8px 0px;
}

#notice_caution .footer {
	position: absolute;
	height: 32px;
	background: #fff;
}

#notice_caution .footer .button {
	bottom: 20px;
}

#notice_caution .footer .left {
	float: left;
	width: 6px;
	height: 8px;
	background: url(../assets/img/usa/modal_footer_left.png) bottom left
		no-repeat;
}

#notice_caution .footer .center {
	float: left;
	width: 328px;
	height: 8px;
	background: url(../assets/img/usa/modal_footer_center.png) bottom center
		repeat-x;
}

#notice_caution .footer .right {
	float: right;
	width: 6px;
	height: 8px;
	background: url(../assets/img/usa/modal_footer_right.png) bottom right
		no-repeat;
}
</style>
<script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../assets/js/common.min.js"></script>
<script type="text/javascript" src="../assets/js/snb.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#viewLoading').fadeOut();
		$('#viewLoading') // ajax 실행 및 완료시 'Loading 이미지'의 동작 컨트롤하기
		.ajaxStart(function() {
			$(this).fadeIn(500);
		}).ajaxStop(function() {
			$(this).fadeOut(500);
		});

		//20140527 열려있는 화면 사이즈에 따라 응모 팝업 위치 변경
		// 		var $ev_page = $("#worldCupEvent");
		// 		var top = ($(window).height()/2)-($ev_page.height()/2);
		// 		$ev_page.css("top",top+"px");
	});
</script>

<!-- 네이버지도 API START -->
<script type="text/javascript">
 try {
	 document.execCommand('BackgroundImageCache', false, true);
 } catch (e) {
 }
</script>
<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=d190d0bf37373c2045fc8f9bddc63839">
</script>
<!-- 네이버지도 API END -->

</head>
<body>
	<div id="skipNavi">
		<a href="#gnb">메뉴 바로가기</a> <a href="#contents">본문바로가기</a>
	</div>
	<!-- wrap -->
	<div id="wrap">
		<!-- header -->
		<div id="header">
			<script type="text/javascript">
				$("#header").load("../include/header.jsp?menuGb=customer&menuId=pj_5004");
			</script>
		</div>
		<!--// header -->
		<!-- container -->
		<div id="container">
			<!-- con_header -->
			<div class="con_header">
				<p >Papa John's CUSTOMER<span><img src="../assets/img/sub/conHeader_text_phone.gif" alt="온라인주문관련 상담번호"></span></p>
			</div>
			<!--// con_header -->

			<!-- con_container -->
			<div id="con_container">
				<!-- snb -->
				<div class="snb">
					<h2><img alt="고객센터" src="../assets/img/sub/snb_title_5.gif"></h2>
					<dl class="sub" id="snb4">
						<dt class="dep1 pj_5001"><a href="listAction.action"><img src="../assets/img/sub/sub_5_1.gif" alt="공지사항"></a></dt>
						<dt class="dep1 pj_5002"><a href="qnalistAction.action"><img src="../assets/img/sub/sub_5_2.gif" alt="Q&A "></a></dt>
						<!--  
						<dd class="dep2">
							<ul>
								<li><a href="/sub.jsp?menuGb=customer&menuId=pj_5002&tab=1">FAQ</a></li>
								<li><a href="/sub.jsp?menuGb=customer&menuId=pj_5002&tab=2">직접문의</a></li>
							</ul>
						</dd>
						-->
						<dt class="dep1 pj_5003"><a href="memcardlistAction.action"><img src="../assets/img/sub/sub_5_3.gif" alt="제휴 카드 안내"></a></dt>
						<dd class="dep2">
							<ul>
								<li><a href="memcardlistAction.action">통신사 멤버쉽 카드</a></li>
								<li><a href="crecardlistAction.action">신용카드</a></li>
							</ul>
						</dd>
						<dt class="dep1 pj_5004"><a href="storeAction.action"><img src="../assets/img/sub/sub_5_4.gif" alt="매장 안내"></a></dt>
					</dl>
				</div>
				<!-- //snb -->
				
				<!-- contents -->
				<div id="contents">
					<div class="top_title">
						<h2>매장 안내</h2>
					</div>
					<!-- cont -->
					<div class="cont" style="text-align: center">
						<!-- 네이버 지도 View -->
						<div id="store_section" >
							<h4 class="title"><img src="../assets/img/customer/storeDetail_title.gif" alt="선택매장 상세정보" /></h4>
							<!-- 선택매장 상세정보 -->
							<div id="store_detail" >
								<div class="store">
									<form name="form1" method="post">
										<%-- 
										<input type="hidden" id="actionFlag"   name="actionFlag"   value="name">
										<input type="hidden" id="srch_region"  name="srch_region"  value="null"><!-- 지역명 -->
										<input type="hidden" id="srch_sigungu" name="srch_sigungu" value="null"><!-- 시군구명 -->
						    			<input type="hidden" id="srch_store"   name="srch_store"   value="null">
						    			<input type="hidden" id="srch_word"    name="srch_word"    value="">
						    			<input type="hidden" id="tab"      	   name="tab"          value="1" >
						    			<input type="hidden" id="inCurPage"    name="inCurPage"    value="1"><!-- 현재 페이지 -->
										<input type="hidden" id="inCurBlock"   name="inCurBlock"   value="1"><!-- 현재 블럭 -->
										--%>
										<p class="photo"><img src="http://192.168.10.77:8000/ImageServer/Imageupload/${imagepath}" alt="" width="130px" height="85px"/></p>
										<ul class="info">
											<li><span class="tit">매장명 : </span>${storename}<span id="map_store_name"></span></li>
						        			<li><span class="tit">전화번호 : </span>${phone}<span id="map_store_phone"></span></li>
						        			<li><span class="tit">매장주소 : </span>${address}<span id="map_store_address"></span></li>
						        			<li><span class="tit">영업시간 : </span>${businesshours}<span id="map_store_time"></span></li>
						        			<li><span class="tit">매장타입 : </span>${storetype}<span id="map_store_type"></span></li>
						        			<li><span class="tit">주차여부 : </span>${storeparking}<span id="map_store_parking"></span></li>
										</ul>
									</form>
								</div>
								<p style="float:right;">
						      		<%-- <span class="btn_h23 green"><button type="button" onclick='location.href="sub.jsp?menuGb=customer&menuId=pj_5004"'>매장찾기</button></span> --%>
						      		<span class="btn_h23 red"><button type="button" onclick="document.location.href='storeAction.action'">목록보기</button></span>
   								</p>   
							</div>
							<div class="s_map" style=" margin:10px 0 0; text-align:left; border:1px #ccc solid; padding:5px; width:615px">
					  			<div id="map_iframe_area" style="position:relative;left:10px;">
					  				<!-- 네이버 지도 보이는 부분  -->
					  				<script type="text/javascript">
					  					var c = ${latitude};
					  					var d = ${longitude};
					  					
					  					var oPoint = new nhn.api.map.LatLng(d, c); //LatLng 값이 y, x 좌표
					  					nhn.api.map.setDefaultPoint('LatLng');
					  					oMap = new nhn.api.map.Map('map_iframe_area',{//표시될 div의 id 입니다.
					  						point : oPoint,  			 //지도의 최초 중심점입니다. 앞서 설정하였던 oPoint 를 사용합니다.
					  						zoom : 11, 					 //기본 지도 줌 크기
					  						enableWheelZoom : true,      //마우스 휠을 이용해 줌 인/아웃을 이용할것인지를 선택합니다 true, false
					  						enableDragPan : true,        //마우스로 드래그를 활성하 할것인지 선택합니다. true, false
					  						enableDblClickZoom : false,  //더블클릭으로 확대를 할것인가 입니다. true, false
					  						mapMode : 0,                 //최초 지도의 방식을 선택합니다 0: 일반지도 1:위성지도
					  						activateTrafficMap : false,  //교통상황을 말합니다
					  						activateBicycleMap : false,  //자전거 지도입니다.
					  						minMaxLevel : [ 1, 14 ],      //최대 축소와 확대값을 정합니다.
					  						size : new nhn.api.map.Size(600, 450) //표시될 지도 크기
					  					});
					  					
					  					//아래는 위에서 지정한 좌표에 마커를 표시하는 소스 입니다.
					  					var oSize = new nhn.api.map.Size(28, 37);
					  					var oOffset = new nhn.api.map.Size(14, 37);
					  					var oIcon = new nhn.api.map.Icon(
					  							'http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);
					  					//icon 이미지를 바꿔서 사용할 수 있습니다.
					  					var oMarker = new nhn.api.map.Marker(oIcon, {
					  						title : '${storename}'
					  					});
					  					oMarker.setPoint(oPoint);
					  					// 지도 타이틀 보이게 하기 
					  					oLabel = new nhn.api.map.MarkerLabel(); //마커 라벨 선언
					  					oMap.addOverlay(oLabel); //마커 라벨 지도에 추가, 기본은 보이지 않는 상태로 추가됨
					  					oLabel.setVisible(true, oMarker); //마커 라벨 보이기
					  					
					  					oMap.addOverlay(oMarker);
					  					//아래는 사이드에 줌 컨트롤을 추가하는 소스 입니다.
					  					var mapZoom = new nhn.api.map.ZoomControl(); // 줌 컨트롤 선언
					  					mapZoom.setPosition({
					  						left : 15,
					  						bottom : 30
					  					});		// - 줌 컨트롤 위치 지정
					  					oMap.addControl(mapZoom); // - 줌 컨트롤 추가.
					  				</script>
					  			</div>
					  		</div>
						</div>
					</div>
					<!--// cont -->
				</div>
				<!--// contents -->
			</div>
			<!--// con_container -->
		</div>
		<!--// container -->

		<!-- footer -->
		<div id="footer">
			<script type="text/javascript">
				$("#footer").load("../include/foot.jsp");
			</script>
		</div>
	</div>
	<!--// wrap -->
	
	<!-- 로딩 이미지 -->
	<div id="viewLoading">
		<img src="../assets/img/viewLoading.gif" />
		<p>Loading....</p>
	</div>
</body>
</html>