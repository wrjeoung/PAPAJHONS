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
<!-- 0404 �߰��κ�(�޷����� ��Ÿ��) ���� -->
<link type="text/css" rel="stylesheet" href="../assets/css/ui.all.css" />
<!-- 0404 �߰��κ�(�޷����� ��Ÿ��)��-->
<title>��������-Better Ingredients.Better Pizza.</title>
<style type="text/css">
/* �޴�ȭ�� �����˾� ��Ÿ�� ���� 20131128*/
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
		$('#viewLoading') // ajax ���� �� �Ϸ�� 'Loading �̹���'�� ���� ��Ʈ���ϱ�
		.ajaxStart(function() {
			$(this).fadeIn(500);
		}).ajaxStop(function() {
			$(this).fadeOut(500);
		});

		//20140527 �����ִ� ȭ�� ����� ���� ���� �˾� ��ġ ����
		// 		var $ev_page = $("#worldCupEvent");
		// 		var top = ($(window).height()/2)-($ev_page.height()/2);
		// 		$ev_page.css("top",top+"px");
	});
</script>

<!-- ���̹����� API START -->
<script type="text/javascript">
 try {
	 document.execCommand('BackgroundImageCache', false, true);
 } catch (e) {
 }
</script>
<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=d190d0bf37373c2045fc8f9bddc63839">
</script>
<!-- ���̹����� API END -->

</head>
<body>
	<div id="skipNavi">
		<a href="#gnb">�޴� �ٷΰ���</a> <a href="#contents">�����ٷΰ���</a>
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
				<p >Papa John's CUSTOMER<span><img src="../assets/img/sub/conHeader_text_phone.gif" alt="�¶����ֹ����� ����ȣ"></span></p>
			</div>
			<!--// con_header -->

			<!-- con_container -->
			<div id="con_container">
				<!-- snb -->
				<div class="snb">
					<h2><img alt="������" src="../assets/img/sub/snb_title_5.gif"></h2>
					<dl class="sub" id="snb4">
						<dt class="dep1 pj_5001"><a href="listAction.action"><img src="../assets/img/sub/sub_5_1.gif" alt="��������"></a></dt>
						<dt class="dep1 pj_5002"><a href="qnalistAction.action"><img src="../assets/img/sub/sub_5_2.gif" alt="Q&A "></a></dt>
						<!--  
						<dd class="dep2">
							<ul>
								<li><a href="/sub.jsp?menuGb=customer&menuId=pj_5002&tab=1">FAQ</a></li>
								<li><a href="/sub.jsp?menuGb=customer&menuId=pj_5002&tab=2">��������</a></li>
							</ul>
						</dd>
						-->
						<dt class="dep1 pj_5003"><a href="memcardlistAction.action"><img src="../assets/img/sub/sub_5_3.gif" alt="���� ī�� �ȳ�"></a></dt>
						<dd class="dep2">
							<ul>
								<li><a href="memcardlistAction.action">��Ż� ����� ī��</a></li>
								<li><a href="crecardlistAction.action">�ſ�ī��</a></li>
							</ul>
						</dd>
						<dt class="dep1 pj_5004"><a href="storeAction.action"><img src="../assets/img/sub/sub_5_4.gif" alt="���� �ȳ�"></a></dt>
					</dl>
				</div>
				<!-- //snb -->
				
				<!-- contents -->
				<div id="contents">
					<div class="top_title">
						<h2>���� �ȳ�</h2>
					</div>
					<!-- cont -->
					<div class="cont" style="text-align: center">
						<!-- ���̹� ���� View -->
						<div id="store_section" >
							<h4 class="title"><img src="../assets/img/customer/storeDetail_title.gif" alt="���ø��� ������" /></h4>
							<!-- ���ø��� ������ -->
							<div id="store_detail" >
								<div class="store">
									<form name="form1" method="post">
										<%-- 
										<input type="hidden" id="actionFlag"   name="actionFlag"   value="name">
										<input type="hidden" id="srch_region"  name="srch_region"  value="null"><!-- ������ -->
										<input type="hidden" id="srch_sigungu" name="srch_sigungu" value="null"><!-- �ñ����� -->
						    			<input type="hidden" id="srch_store"   name="srch_store"   value="null">
						    			<input type="hidden" id="srch_word"    name="srch_word"    value="">
						    			<input type="hidden" id="tab"      	   name="tab"          value="1" >
						    			<input type="hidden" id="inCurPage"    name="inCurPage"    value="1"><!-- ���� ������ -->
										<input type="hidden" id="inCurBlock"   name="inCurBlock"   value="1"><!-- ���� �� -->
										--%>
										<p class="photo"><img src="http://192.168.10.77:8000/ImageServer/Imageupload/${imagepath}" alt="" width="130px" height="85px"/></p>
										<ul class="info">
											<li><span class="tit">����� : </span>${storename}<span id="map_store_name"></span></li>
						        			<li><span class="tit">��ȭ��ȣ : </span>${phone}<span id="map_store_phone"></span></li>
						        			<li><span class="tit">�����ּ� : </span>${address}<span id="map_store_address"></span></li>
						        			<li><span class="tit">�����ð� : </span>${businesshours}<span id="map_store_time"></span></li>
						        			<li><span class="tit">����Ÿ�� : </span>${storetype}<span id="map_store_type"></span></li>
						        			<li><span class="tit">�������� : </span>${storeparking}<span id="map_store_parking"></span></li>
										</ul>
									</form>
								</div>
								<p style="float:right;">
						      		<%-- <span class="btn_h23 green"><button type="button" onclick='location.href="sub.jsp?menuGb=customer&menuId=pj_5004"'>����ã��</button></span> --%>
						      		<span class="btn_h23 red"><button type="button" onclick="document.location.href='storeAction.action'">��Ϻ���</button></span>
   								</p>   
							</div>
							<div class="s_map" style=" margin:10px 0 0; text-align:left; border:1px #ccc solid; padding:5px; width:615px">
					  			<div id="map_iframe_area" style="position:relative;left:10px;">
					  				<!-- ���̹� ���� ���̴� �κ�  -->
					  				<script type="text/javascript">
					  					var c = ${latitude};
					  					var d = ${longitude};
					  					
					  					var oPoint = new nhn.api.map.LatLng(d, c); //LatLng ���� y, x ��ǥ
					  					nhn.api.map.setDefaultPoint('LatLng');
					  					oMap = new nhn.api.map.Map('map_iframe_area',{//ǥ�õ� div�� id �Դϴ�.
					  						point : oPoint,  			 //������ ���� �߽����Դϴ�. �ռ� �����Ͽ��� oPoint �� ����մϴ�.
					  						zoom : 11, 					 //�⺻ ���� �� ũ��
					  						enableWheelZoom : true,      //���콺 ���� �̿��� �� ��/�ƿ��� �̿��Ұ������� �����մϴ� true, false
					  						enableDragPan : true,        //���콺�� �巡�׸� Ȱ���� �Ұ����� �����մϴ�. true, false
					  						enableDblClickZoom : false,  //����Ŭ������ Ȯ�븦 �Ұ��ΰ� �Դϴ�. true, false
					  						mapMode : 0,                 //���� ������ ����� �����մϴ� 0: �Ϲ����� 1:��������
					  						activateTrafficMap : false,  //�����Ȳ�� ���մϴ�
					  						activateBicycleMap : false,  //������ �����Դϴ�.
					  						minMaxLevel : [ 1, 14 ],      //�ִ� ��ҿ� Ȯ�밪�� ���մϴ�.
					  						size : new nhn.api.map.Size(600, 450) //ǥ�õ� ���� ũ��
					  					});
					  					
					  					//�Ʒ��� ������ ������ ��ǥ�� ��Ŀ�� ǥ���ϴ� �ҽ� �Դϴ�.
					  					var oSize = new nhn.api.map.Size(28, 37);
					  					var oOffset = new nhn.api.map.Size(14, 37);
					  					var oIcon = new nhn.api.map.Icon(
					  							'http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);
					  					//icon �̹����� �ٲ㼭 ����� �� �ֽ��ϴ�.
					  					var oMarker = new nhn.api.map.Marker(oIcon, {
					  						title : '${storename}'
					  					});
					  					oMarker.setPoint(oPoint);
					  					// ���� Ÿ��Ʋ ���̰� �ϱ� 
					  					oLabel = new nhn.api.map.MarkerLabel(); //��Ŀ �� ����
					  					oMap.addOverlay(oLabel); //��Ŀ �� ������ �߰�, �⺻�� ������ �ʴ� ���·� �߰���
					  					oLabel.setVisible(true, oMarker); //��Ŀ �� ���̱�
					  					
					  					oMap.addOverlay(oMarker);
					  					//�Ʒ��� ���̵忡 �� ��Ʈ���� �߰��ϴ� �ҽ� �Դϴ�.
					  					var mapZoom = new nhn.api.map.ZoomControl(); // �� ��Ʈ�� ����
					  					mapZoom.setPosition({
					  						left : 15,
					  						bottom : 30
					  					});		// - �� ��Ʈ�� ��ġ ����
					  					oMap.addControl(mapZoom); // - �� ��Ʈ�� �߰�.
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
	
	<!-- �ε� �̹��� -->
	<div id="viewLoading">
		<img src="../assets/img/viewLoading.gif" />
		<p>Loading....</p>
	</div>
</body>
</html>