<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
<!-- css���� �� �̵������ media="only screen and (min-width:769px)" -->
<link type="text/css" rel="stylesheet" href="../assets/css/import.css" />
<link type="text/css" rel="stylesheet" href="../assets/css/main.css" />
<link type="text/css" rel="stylesheet" href="../assets/css/lib_style.css" />
<title>��������-Better Ingredients.Better Pizza.</title>
<script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
<!--���� ��ũ��Ʈ ��ũ�� ��������(min.js)�� ��� -->
<script type="text/javascript" src="../assets/js/common.min.js"></script>
<script type="text/javascript" src="../assets/js/lib.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// ���� �̺�Ʈ Fn : lib.js
		slid_event(".eventBox");
		//���� ���θ�Ʈ Fn : lib.js
		slid_prom("#carousel");

		//20140527 : �����ִ� ȭ�� ����� ���� ���� �˾� ��ġ ����
		//20140715 : �˾� ���̵� worldCupEvent -> mainEvent�� ���̵� ����
		var $ev_page = $("#mainEvent");
		var top = ($(window).height() / 2) - ($ev_page.height() / 2);
		$ev_page.css("top", top + "px");

		// 2014-08-07 : ���� �˾� ��¥ ����
		// Grand Papas Day ��¥�� �˻�
		// 2014-09-19 �ƽþȰ��� ���� 		
		if ("20141023" >= "20140919" && "20141023" <= "20141004") {
			$("#mainEvent").show();
		} else
			$("#mainEvent").remove();

		/* 20140519 : �ε� �� ���� �̺�Ʈ �׸����� üũ �Ǿ����� Ȯ�� �� ȭ�� ���� */
		if (getCookie("20141023")) //������ �����Ϸ� �����ϱ�
		{
			$("#mainEvent").hide();
		}
	});

	/* 20140519 : �ε� �� ���� �̺�Ʈ �׸����� üũ �Ǿ����� Ȯ�� �� ȭ�� ���� */
	function getCookie(name) {
		var fromIdx = document.cookie.indexOf(name + "=");
		var toIdx;
		if (fromIdx != -1) {
			fromIdx += name.length + 1;
			toIdx = document.cookie.indexOf(";", fromIdx);

			if (toIdx == -1) {
				toIdx = document.cookie.length;
			}
			return unescape(document.cookie.substring(fromIdx, toIdx));
		}
	}

	/* 20140715 : mainEvent ȭ�鿡�� ���� �׸����� üũ�ϴ� ���*/
	function eventClose($this) {
		event_setCookie("20141023", "done", 1); //��Ű�� ���� ��¥ (20140520)
	}

	//expiredays : �Ⱥ��� �Ⱓ 
	function event_setCookie(name, value, expiredays) {
		var today = new Date();
		today.setDate(today.getDate() + expiredays);
		document.cookie = name + "=" + escape(value) + ";path=/; expires="
				+ today.toGMTString() + ";";
	}
</script>
<!--[if IE 6]>
 	<script src="assets/js/DD_belatedPNG.js"></script>
   		DD_belatedPNG.fix('.png24');
 	</script>
 	<![endif]-->
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
				$("#header").load("../include/header.jsp");
			</script>
		</div>
		<!-- // header -->

		<!-- contents -->
		<div id="contents" style="height: 650px;">
			<!-- hero -->
			<div class="hero png24">
				<div class="leftHero ">
					<h1>
						<img src="../assets/img/main/main_brand_quality.png"
							alt="�ֹ� ���� ���� ���� �¶���" />
					</h1>
				</div>

				<!-- eventContainer -->
				<div class="eventContainer">
					<ul class="eventBox">
						<li>
							<p class='key'>
								<a href='#'>��۹�ư</a>
							</p>
							<div class='eventItem'>
								<p class='btnOrder4 png24'>
									<a
										href='viewAction2.action?num=592&currentPage=1&file_savname=file_592.png'><img
										src='../assets/img/btn/btn_go_link.png' /></a>
								</p>
								<p>
									<img alt="" src="../assets/img/main/rrr_1412211763393.png"
										style="height: 390px; width: 595px" />
								</p>
							</div>
						</li>
						<li>
							<p class='key'>
								<a href='#'>��۹�ư</a>
							</p>
							<div class='eventItem'>
								<p class='btnOrder4 png24'>
									<a
										href='pastviewAction.action?num=291&currentPage=1&file_savname=file_291.png'><img
										src='../assets/img/btn/btn_go_link.png' /></a>
								</p>
								<p>
									<img alt="" src="../assets/img/main/r_1412067708285.png"
										style="height: 390px; width: 595px" />
								</p>
							</div>
						</li>
						<li>
							<p class='key'>
								<a href='#'>��۹�ư</a>
							</p>
							<div class='eventItem'>
								<p class='btnOrder4 png24'>
									<a
										href='pastviewAction.action?num=289&currentPage=1&file_savname=file_289.jpg'><img
										src='../assets/img/btn/btn_go_link.png' /></a>
								</p>
								<p>
									<img alt="" src="../assets/img/main/r_1412068428139.png"
										style="height: 390px; width: 595px" />
								</p>
							</div>
						</li>
						<li>
							<p class='key'>
								<a href='#'>��۹�ư</a>
							</p>
							<div class='eventItem'>
								<p class='btnOrder4 png24'>
									<a
										href='viewAction2.action?num=590&currentPage=1&file_savname=file_590.jpg'><img
										src='../assets/img/btn/btn_go_link.png' /></a>
								</p>
								<p>
									<img alt="" src="../assets/img/main/best_1402878742424.png"
										style="height: 390px; width: 595px" />
								</p>
							</div>
						</li>
						<li>
							<p class='key'>
								<a href='#'>��۹�ư</a>
							</p>
							<div class='eventItem'>
								<p class='btnOrder4 png24'>
									<a
										href='storeAction.action'><img
										src='../assets/img/btn/btn_go_link.png' /></a>
								</p>
								<p>
									<img alt=""
										src="../assets/img/main/rrrrrrrrrrrrrrrrrrrrrrrrrr_1412763398818.png"
										style="height: 390px; width: 595px" />
								</p>
							</div>
						</li>


					</ul>
				</div>
				<!--// eventContainer -->
			</div>
			<!--// hero -->

			<!-- carousel -->
			<div id="carousel">
				<p class="prev png24">
					<a href="#carousel"><img src="../assets/img/btn/btn_prev.png"
						alt="����" /></a>
				</p>
				<p class="next png24">
					<a href="#carousel"><img src="../assets/img/btn/btn_next.png"
						alt="����" /></a>
				</p>
				<!-- promoBox -->
				<div class="promoBox">
					<ul>
						<li class="item"
							style="background: url(../assets/img/main/Android_mb.jpg) no-repeat;">
							<div class="promoContent"
								style="margin: 15px 0 0 90px; width: 152px;">
								<h2
									style="color: #414141; font-size: 1.2em; font-weight: bold; margin: 0 0 5px 0;">�ȵ���̵�
									����� ��</h2>
								<p
									style="padding: 0; border: 0; font-size: 100%; text-align: left; outline: none;">��������
									����� �ۿ��� �ֹ��ϸ� ��� 25% ����!!</p>
								<a href="https://play.google.com/store/apps/details?id=com.papa"
									target="blank_"
									style="position: absolute; top: 84px; left: 90px;"> <img
									src="../assets/img/btn/go_googleplay.gif" alt="�ȵ���̵� ���� �ٿ�ε�" /></a>
							</div>
						</li>
						<li class="item">
							<div class="promoContent" style="width: 100%;">
								<a href="storeAction.action"
									style="position: absolute; top: 0; left: 0;"> <img
									src="../assets/img/btn/store_open_thum.png" alt="���¸��� �ٷΰ���"
									width="245" height="117" /></a>
							</div>
						</li>
						<li class="item"
							style="background: url(../assets/img/main/iPhoneApp_mb_bg.jpg) no-repeat;">
							<div class="promoContent"
								style="margin: 15px 0 0 70px; width: 174px;">
								<h2
									style="color: #414141; font-size: 1.2em; font-weight: bold; margin: 0 0 5px 0;">������
									����� ��</h2>
								<p
									style="padding: 0; border: 0; font-size: 100%; text-align: left; outline: none;">��������
									����� �ۿ��� �ֹ��ϸ� ��� 25% ����!!</p>
								<a href="https://itunes.apple.com/kr/app/id488012198"
									target="blank_"
									style="position: absolute; top: 84px; left: 90px;"> <img
									src="../assets/img/btn/go_appstore.gif" alt="������ �۽���� �ٿ�ε�" /></a>
							</div>
						</li>
						<li class="item">
							<div class="promoContent" style="width: 100%;">
								<img src="../assets/img/main/discount_info.gif"
									alt="�¶����ֹ� ������� �ȳ�" width="245" height="117" />
							</div>
						</li>
					</ul>
				</div>
				<!--// promoBox -->
			</div>
			<!--// carousel -->
		</div>
		<!-- // contents -->

		<!-- footer -->
		<div id="footer">
			<script type="text/javascript">
				$("#footer").load("../include/foot.jsp");
			</script>
		</div>
		<!-- // footer -->

		<!-- 20140715 : ���� �̺�Ʈ �˾����� ��� ��û -->
		<!-- 20140807 : �׷������Ľ����� �˾����� ��� ��û 
  		<div id="mainEvent">
  			<script type="text/javascript">	$("#mainEvent").load("include/ev_main.jsp"); </script>
  		</div>
  		-->
		<!--20140218 google-analytics �ӽû��� -->
		<script>
			(function(i, s, o, g, r, a, m) {
				i['GoogleAnalyticsObject'] = r;
				i[r] = i[r] || function() {
					(i[r].q = i[r].q || []).push(arguments)
				}, i[r].l = 1 * new Date();
				a = s.createElement(o), m = s.getElementsByTagName(o)[0];
				a.async = 1;
				a.src = g;
				m.parentNode.insertBefore(a, m)
			})(window, document, 'script',
					'//www.google-analytics.com/analytics.js', 'ga');

			ga('create', 'UA-17109260-4', 'pji.co.kr');
			ga('send', 'pageview');
		</script>
	</div>
	<!--// wrap -->
</body>
</html>
