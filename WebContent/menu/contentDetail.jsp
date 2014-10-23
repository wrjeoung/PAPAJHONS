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
<title>파파존스-Better Ingredients.Better Pizza.</title>
<link type="text/css" rel="stylesheet" href="../assets/css/reset.css" />
<link type="text/css" rel="stylesheet" href="../assets/css/sub.css" />
<link type="text/css" rel="stylesheet" href="../assets/css/lib_style.css" />

<style type="text/css">
#iframe_detail {
	font-size: 11px;
	width: 648px;
}

#iframe_detail:after {
	content: '';
	clear: both;
	display: block;
}

#iframe_detail .db_img {
	width: 169px;
	float: left;
}

#iframe_detail .comment {
	width: 450px;
	float: left;
	position: relative;
	top: 0;
	left: 20px;
}

#iframe_detail .comment h4 {
	padding: 10px 0 2px 0;
	font-size: 1.5em;
	width: 430px;
}

#iframe_detail .comment .close {
	position: absolute;
	right: 0px;
	top: 10px;
}

#iframe_detail .comment .detail_comm {
	padding: 10px;
	width: 450px;
	height: 180px;
	background: #f2f2f2;
}

#iframe_detail .comment .detail_comm dt {
	padding: 2px 0;
}

#iframe_detail .comment .detail_comm dd ul {
	height: 20px;
}

#iframe_detail .comment .detail_comm dd li {
	float: left;
	padding: 0 10px;
}

#iframe_detail .comment .detail_comm .size_img {
	padding: 0 4px 0 0;
}

#iframe_detail .comment .detail_comm table {
	width: 440px;
}

#iframe_detail .comment .detail_comm table td, #iframe_detail .comment .detail_comm table th
	{
	border: solid 1px #0d6347;
	padding: 0 3px;
}

#iframe_detail .comment .detail_comm table th {
	background: #0d6045;
	color: #fff;
	text-align: center;
}

#iframe_detail .comment .detail_comm table td {
	background: #fff;
	text-align: right;
}

#iframe_detail .cart_order {
	padding: 10px 0 0 0;
}

input, select, img {
	vertical-align: middle;
}

.bold {
	font-weight: bold !important;
}

/* 피자메뉴 (소스,치즈,굽기,컷 )옵션 버튼 영역 */
.spcInstruction_btn {
	position: relative;
	top: 2px;
	float: left;
	padding: 3px 5px;
}

.spcInstruction_btn img {
	cursor: pointer;
}
/* special Instruction 옵션 & 상세정보 말풍선 */
.spcInstruction_btn .spcInstruction_comment {
	position: absolute;
	top: -98px;
	left: 8px;
	width: 252px;
	height: 100px;
	line-height: 1.3em;
	background: url("../assets/img/menu/spc_comment_bg.png") no-repeat 0 0;
	z-index: 800;
	padding: 3px;
	display: none;
}

.spcInstruction_btn .spcInstruction_comment .center {
	position: absolute;
	font-size: 11px;
	padding: 3px;
	word-break: break-all;
}

.spcInstruction_btn .spcInstruction_comment .center span {
	font-weight: bold;
	padding: 2px;
	font-size: 12px;
}

/* (소스,치즈,굽기,컷 )옵션박스 설정 */
.option_box {
	background: #eee;
	position: absolute;
	bottom: 5px;
	left: -128px;
	z-index: 800;
	border: 2px solid #ea263f;
	display: none;
}

.option_box .spcInstructions {
	position: relative;
	width: 128px;
	height: auto;
	clear: both;
	padding-top: 2px;
	padding-left: 1px;
	list-style: none;
	font-size: 11px;
}

.option_box .spcInstructions li {
	cursor: pointer;
}

.option_box .spcInstructions li .option {
	z-index: 900;
	position: relative;
	width: 124px;
	border: 1px solid #fcc;
	background: #fff;
	font-size: 11px;
	border: 1px solid #fcc;
	padding: 3px 0px 1px 2px;
}
</style>
<script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../assets/js/common.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//페이지 시작 시로딩 이미지 숨기기
		$('#viewLoading').hide();
		// ajax 실행 및 완료시 'Loading 이미지'의 동작 컨트롤하기
		$('#viewLoading').ajaxStart(function() {
			$(this).fadeIn(500);
		}).ajaxStop(function() {
			$(this).fadeOut(500);
		});

		$('.menu_opt_radio').click(function() {
			set_opt_radio($(this));
		});
		//라디오 버튼 초기값 default 설정
		$(".option_box .spcInstructions .option").each(function(i) {
			var $btn = $(this).find(".menu_opt_radio").eq(0);
			set_opt_radio($btn);
		});
	});

	window.onload = function() {
		//20130415 각 메뉴별 디테일 프레임 크기 조절!!
		var $ifr = $(parent.document.getElementById("detail_con"));
		var hei = $('#iframe_detail').css('height');
		$ifr.find('iframe').css('height', hei);
	};

	//라디오 버튼 체크값 변경
	function set_opt_radio(radio_btn) {
		radio_btn.parent().find('.menu_opt_radio').removeClass("r_on");
		radio_btn.find('input').removeAttr("checked");
		radio_btn.addClass("r_on");
		radio_btn.find("input").attr("checked", "checked");

	}

	function convertJSON(value) {
		value = value.replace(/\"/g, "\\\"");
		return value;
	}

	/* 문자 앞뒤 공백제거 */
	function trim(s) {
		s += ''; // 숫자라도 문자열로 변환
		return s.replace(/^\s*|\s*$/g, '');
	}
</script>
</head>

<body>
	<div id="iframe_detail">
		<script type="text/javascript">
			var $mainType = "10";
			var $doughType = "오리지널";
		</script>
		<div class="db_img">
			<img src="/assets/img/menu/img/10/detail_img_1018.png" alt="마가리타"
				title="마가리타"
				onerror="this.src='/assets/img/menu/img/detail_noImage.png'" />
		</div>
		<div class="comment">
			<!--  0401 추가부분 시작  -->
			<p class="close">
				<button type="button">
					<img src="../assets/img/sub/btn_detail_close.gif" alt="닫기" />
				</button>
			</p>
			<!-- 0401 추가부분 끝 -->

			<h4>마가리타</h4>
			<p class="comm">파파 존스의 진한 토마토소스와 100% 고급 천연 치즈 콤비가 만들어내는 맛의 조화</p>

			<p class="comm">
				<span class="bold">Create your own Pizza: </span>마가리타 피자를 Base로 나만의
				피자를 만들 수 있습니다.
			</p>

			<div class="detail_comm">
				<dl>
					<dt>
						<img src="../assets/img/menu/detail_title_topping.gif" alt="토핑재료">
					</dt>
					<dd>토마토 소스, 모짜렐라 치즈</dd>
					<dt>
						<img src="../assets/img/menu/detail_title_size.gif" alt="사이즈별 가격">
					</dt>
					<dd>
						<ul>
							<li><span class="size_img"><img
									src="../assets/img/menu/detail_size_R.gif" alt="9 인치사이즈" /></span> <span
								class="가격">15900원</span></li>
							<li><span class="size_img"><img
									src="../assets/img/menu/detail_size_L.gif" alt="12 인치사이즈" /></span> <span
								class="가격">21500원</span></li>
							<li><span class="size_img"><img
									src="../assets/img/menu/detail_size_F.gif" alt="14 인치사이즈" /></span> <span
								class="가격">25900원</span></li>
							<li><span class="size_img"><img
									src="../assets/img/menu/detail_size_P.gif" alt="16 인치사이즈" /></span> <span
								class="가격">34500원</span></li>
						</ul>
					</dd>

					<dt>
						<img src="../assets/img/menu/detail_title_alre.gif" alt="알레르기 음식표기">
					</dt>
					<dd>치즈(우유),대두,밀,돼지고기,토마토</dd>
					<dt class="hidden">성분표시</dt>
					<dd>
						<table>
							<tr>
								<th scope="col">칼로리</th>
								<th scope="col">영양정보</th>
							</tr>
							<tr>
								<td>250kcal(100g 기준)</td>
								<td style="text-align: left">탄수화물(39g), 단백질(10g). 지방(6g),
									나트륨(1g), 당류(8g), 콜레스테롤(16g), 트렌스지방(0), 포화지방(4g)</td>
							</tr>
						</table>
					</dd>

				</dl>
			</div>

			<!-- //detail_comm -->
			<form action="">
				<div class="cart_order">
					<label for="select_size" class="hidden">사이즈 선택</label> <select
						id="select_size">
						<option value="50330,10,3001">R-15900</option>
						<option value="50332,10,3002">L-21500</option>
						<option value="50329,10,3003">F-25900</option>
						<option value="50322,10,3005">P-34500</option>
					</select>

					<div class="spcInstruction_btn">
						<p class="btn">
							<img src="../assets/img/order/btn_opt_off.gif" alt="옵션변경" />
						</p>
						<div class="spcInstruction_comment">
							<p class="center">
								<span>special instructions :</span> <br>버튼 클릭 시 <span>sauce,
										cheese, bake, cut </span><br>상태를 조절하실 수 있습니다. <br>장바구니에 담은
											후 변경하시려면 메뉴를 <br>장바구니에서 삭제 후 다시 담으셔야 합니다!! 
							</p>
						</div>
						<!-- 옵션변경 말풍선 -->
					</div>

					<!-- 20131004 소스&치즈&커팅&베이크 옵션주기 -->
					<div id="option_box_0" class="option_box">
						<!--  display: none; -->
						<ul class="spcInstructions">
							<li>
								<p onclick="fnAdjustMenu('0_1',$(this));">
									소스 조절 <span class="imgsp">▼</span>
								</p>
								<div id="0_1" class="option">
									<p class="menu_opt_radio">
										<input type="radio" id="0_regularSauce" name="0_sau_radio"
											value="" /> <label for="0_regular">소스 보통(Normal)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_lightSauce" name="0_sau_radio"
											value="20" /> <label for="0_light">소스 조금(LS)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_extraSauce" name="0_sau_radio"
											value="30" /> <label for="0_extra">소스 많이(XS)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_noSauce" name="0_sau_radio"
											value="40" /> <label for="0_no">소스 제외(NS)</label>
									</p>
								</div>
							</li>
							<li>
								<p onclick="fnAdjustMenu('0_2',$(this));">
									치즈 조절 <span class="imgsp">▼</span>
								</p>
								<div id="0_2" class="option">
									<p class="menu_opt_radio">
										<input type="radio" id="0_normalCheese" name="0_chee_radio"
											value="" /> <label for="0_normal">치즈 보통(Normal)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_lightCheese" name="0_chee_radio"
											value="20" /> <label for="0_light">치즈 조금(LC)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_noCheese" name="0_chee_radio"
											value="30" /> <label for="0_no">치즈 제외(NC)</label>
									</p>
								</div>
							</li>
							<li>
								<p onclick="fnAdjustMenu('0_3',$(this));">
									굽기 조절 <span class="imgsp">▼</span>
								</p>
								<div id="0_3" class="option">
									<p class="menu_opt_radio">
										<input type="radio" id="0_normalBake" name="0_bake_radio"
											value="" /> <label for="0_normal">기본 굽기(Normal)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_wellDone" name="0_bake_radio"
											value="20" /> <label for="0_well">바싹 굽기(WD)</label>
									</p>
								</div>
							</li>
							<li>
								<p onclick="fnAdjustMenu('0_4',$(this));">
									조각 컷팅 <span class="imgsp">▼</span>
								</p>
								<div id="0_4" class="option">
									<p class="menu_opt_radio">
										<input type="radio" id="0_normalCut" name="0_cut_radio"
											value="" /> <label for="0_normal">기본컷팅(Normal)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_squareCut" name="0_cut_radio"
											value="60" /> <label for="0_square">사각컷팅(SC)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_sixCut" name="0_cut_radio"
											value="20" /> <label for="0_sixCut">6조각컷팅(6C)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_eightCut" name="0_cut_radio"
											value="30" /> <label for="0_eightCut">8조각컷팅(8C)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_tenCut" name="0_cut_radio"
											value="40" /> <label for="0_tenCut">10조각컷팅(10C)</label>
									</p>
								</div>
							</li>
						</ul>
					</div>

					<button class="cart" type="button"
						onclick="fnGetPizzaCnt('10','10','1018','4001','오리지널','addCart')">
						<img src="../assets/img/menu/dtaile_btn_cart.gif" alt="장바구니 담기" />
					</button>
					<button class="order" type="button"
						onclick="fnGetPizzaCnt('10','10','1018','4001','오리지널','addCartNgo')">
						<img src="../assets/img/menu/dtaile_btn_order.gif" alt="바로 주문하기" />
					</button>
				</div>
			</form>
		</div>
	</div>

	<!--   0401 추가부분 시작  -->
	<script type="text/javascript" src="/assets/js/cart.js"></script>
	<script type="text/javascript">
		var root = "";
		var setMenuInfo = '';
		var $detail_con = $(parent.document.getElementById("detail_con"));

		$(".close button").bind("click", function() {
			parent.removeActive();
			parent.menuLoad();
			$detail_con.hide();
		});

		///////////////////////////////////////////////////////////////////////////////////
		//20131004 피자 옵션 설정	
		var $btn_instructions = $(".spcInstruction_btn .btn");

		$btn_instructions.bind("mouseenter", menu_detail);
		$btn_instructions.bind("mouseleave", menu_detail_out);
		$btn_instructions.bind("click", adjust_click);

		function menu_detail() {
			var $comm_detail = $(this).parent().find(".spcInstruction_comment");
			$comm_detail.show();
		}

		function menu_detail_out() {
			var $comm_detail = $(this).parent().find(".spcInstruction_comment");
			$comm_detail.hide();
		}

		function adjust_click() {
			var box = $(this).parent().next(); //option_box

			if (box.css("display") == 'none') {
				box.stop().slideDown();
				box.css("display", "block");
				old_sid = "";
				$(this).find("img").attr("src",
						root + "/assets/img/order/btn_opt_on.gif");
			} else {
				box.find("span").each(function() {
					$(this).text("▼");
				});
				$(".option").slideUp(); //안에 펼처져있는 옵션들
				box.stop().slideUp();
				$(this).find("img").attr("src",
						root + "../assets/img/order/btn_opt_off.gif");
			}
		}

		//옵션박스안의 옵션값 변경
		var old_sid = "";
		$(".option").slideUp();

		function swapimg(old_sid, $this) {
			var prevIndex = parseInt(old_sid.substr(old_sid.length - 1, 1)) - 1; //이전에 클릭한 옵션의 인덱스 구하기
			$this.parent().parent().find("li").eq(prevIndex).find("span").text(
					"▼");
		}

		function fnAdjustMenu(sid, $this) {
			// 이전 선택 옵션이 지금 선택옵션과 다르면
			if (old_sid != sid) {
				// 지금 선택한 옵션이 처음 선택이 아니면
				if (old_sid != "") {
					$this.parent().parent().find('#' + old_sid).stop()
							.slideUp(); //이전 옵션을 숨기고  
					swapimg(old_sid, $this); // swapimg 함수를 호출. 
				}

				$this.parent().parent().find('#' + sid).stop().slideDown(); // 현재 클릭한 옵션을 보여줌 
				old_sid = sid; // 예전 옵션 변수에 현재 옵션 번호를 저장  
				$this.find("span").text("▲");
			}
			// 이전 클릭이 지금 클릭한 옵션과 같으면
			else {
				$this.parent().parent().find('#' + sid).stop().slideUp();// 현재 옵션을 숨기고 
				old_sid = "";
				$this.find("span").text("▼");
			}
		}

		////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/////* mainType >> 10:피자, 20:사이드, 30:소스, 40:음료, 50:셋트,	55: 하프, 90:기타  *///////// 

		//step1 : 세션에 저장된 피자 개수 체크 
		function fnGetPizzaCnt(onlineGrpCode, menuLagCode, menuMidCode,
				menuSubCode, menuDough, actionFlag) {
			//		console.log("fnGetPizzaCnt : " +onlineGrpCode + " / " +  menuLagCode, actionFlag);

			//피자는 수량옵션 없이 무조건 1개
			var orderQty = 1;

			//피자가 아니면 수량옵션 값
			//20140429 파파플래터 수량 옵션 추가
			if (menuLagCode != "10" || onlineGrpCode == "11") {
				orderQty = $("#select_count option:selected").text();
				//			fnGetCartIndex(menuLagCode, menuMidCode, menuSubCode, menuDough, orderQty, actionFlag);
			}

			//피자 또는 세트메뉴 수량 검사 (limit 5개)
			if (menuLagCode == "10" || menuLagCode == "50") {
				$
						.post(
								root
										+ "/order/newCart.jsp?cartAction=getPizzaCount",
								function(quantity) {
									var getPizzaQty = trim(quantity);
									if ((parseInt(getPizzaQty) + parseInt(orderQty)) <= 5) {
										fnGetCartIndex(menuLagCode,
												menuMidCode, menuSubCode,
												menuDough, orderQty, actionFlag);
									} else {
										var alertFrame = $(parent.document
												.getElementById("notice_caution"));
										alertFrame.find("#alertText p")
												.remove();
										alertFrame
												.find("#alertText")
												.append(
														"<p>온라인 주문은 피자 5판까지만 가능합니다.<br>장바구니를 확인하세요~<br>5개 이상 단체 주문은 콜센터를 이용해주세요!!</p>");
										alertFrame.height(172); //text가 3줄인 경우
										parent.popAlert(alertFrame);
									}
								});
			} else {
				fnGetCartIndex(menuLagCode, menuMidCode, menuSubCode,
						menuDough, orderQty, actionFlag);
			}
		}

		//step2 : 장바구니 마지막 인덱스 구하기 
		function fnGetCartIndex(menuLagCode, menuMidCode, menuSubCode,
				menuDough, orderQty, actionFlag) {
			//		alert("fnGetCartIndex()");
			var cartIndex = 0; // 장바구니 순번(마지막 인덱스)

			$.ajax({
				url : root + "/order/newCart.jsp?cartAction=getCartIndex",
				type : "POST",
				beforeSend : function() {
				},
				complete : function() {
					fnSendMenu(menuLagCode, menuMidCode, menuSubCode,
							menuDough, orderQty, cartIndex, actionFlag);
				},
				success : function(index) {
					cartIndex = trim(index);
					cartIndex = parseInt(cartIndex) + 1;
				}
			});
		}

		//step3 : 세션에 보낼 Send데이터 만들기 > 저장
		function fnSendMenu(menuLagCode, menuMidCode, menuSubCode, menuDough,
				orderQty, cartIndex, actionFlag) {
			//		alert("fnSendMenu()");
			var cartSendDataInfo = null; // 장바구니 전송 내역
			var cartAction = ""; // 장바구니처리
			var cartMenuType = ""; // 메뉴타입
			var cartMenuCode = ""; // 메뉴코드
			var cartMenuName = ""; // 메뉴명
			var cartMenuOrdCode = ""; // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
			var cartMenuDivCode = ""; // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
			var cartMenuLagCode = ""; // 메뉴대분류코드
			var cartMenuMidCode = ""; // 메뉴중분류코드
			var cartMenuSmlCode = ""; // 메뉴소분류코드
			var cartMenuSubCode = ""; // 메뉴세분류코드
			var cartMenuPrice = ""; // 메뉴주문단가
			var cartMenuQty = ""; // 메뉴주문수량
			var cartMenuAmt = ""; // 메뉴주문금액
			var cartMenuDisRate = ""; // 메뉴할인율
			var cartMenuDisAmt = ""; // 메뉴할인금액
			var cartMenuCopDisAmt = ""; // 메뉴선결제쿠폰할인
			var cartMenuNetSaleAmt = ""; // 메뉴순매출금액
			var cartMenuPayAmt = ""; // 메뉴결제금액
			var cartMenuBakeCode = ""; // 메뉴베이크코드
			var cartMenuCutCode = ""; // 메뉴컷코드
			var cartMenuCheeseCode = ""; // 메뉴치즈코드
			var cartMenuSauceCode = ""; // 메뉴소스코드
			var cartMenuMessage = ""; // 메뉴전달메세지
			var cartMenuSize = ""; // 메뉴사이즈
			var cartMenuDough = ""; // 메뉴도우종류
			var cartMenuOption = ""; // 메뉴 옵션
			var cartECouponCompany = ""; // E쿠폰제휴사
			var cartECouponCode = ""; // E쿠폰코드
			var cartECouponNumber = ""; // E쿠폰번호

			//세트메뉴인 경우
			if (menuLagCode == "50") {
				//    		alert("menuLagCode >>> "+menuLagCode);
				var jsonSetMenu = $.parseJSON(setMenuInfo);
				//    		alert("jsonSetMenu >>> "+jsonSetMenu);

				cartAction = "addMenu"; // 장바구니처리
				cartMenuType = "typeSet"; // 메뉴타입
				cartMenuCode = jsonSetMenu.menuCode + "_" + cartIndex; // 메뉴코드
				cartMenuName = jsonSetMenu.menuName; // 메뉴명
				cartMenuOrdCode = "10"; // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
				cartMenuDivCode = jsonSetMenu.menuDivCode; // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
				cartMenuLagCode = jsonSetMenu.menuLagCode; // 메뉴대분류코드
				cartMenuMidCode = jsonSetMenu.menuMidCode; // 메뉴중분류코드
				cartMenuSmlCode = jsonSetMenu.menuSmlCode; // 메뉴소분류코드
				cartMenuSubCode = jsonSetMenu.menuSubCode; // 메뉴세분류코드
				cartMenuPrice = jsonSetMenu.menuSaleAmt; // 메뉴주문단가
				cartMenuQty = orderQty; // 메뉴주문수량
				cartMenuAmt = jsonSetMenu.menuSaleAmt; // 메뉴주문금액
				cartMenuDisRate = "0"; // 메뉴할인율
				cartMenuDisAmt = "0"; // 메뉴할인금액
				cartMenuCopDisAmt = "0"; // 메뉴선결제쿠폰할인
				cartMenuNetSaleAmt = jsonSetMenu.menuSaleAmt; // 메뉴순매출금액
				cartMenuPayAmt = jsonSetMenu.menuSaleAmt; // 메뉴결제금액
				cartMenuBakeCode = ""; // 메뉴베이크코드
				cartMenuCutCode = ""; // 메뉴컷코드
				cartMenuCheeseCode = ""; // 메뉴치즈코드
				cartMenuSauceCode = ""; // 메뉴소스코드
				cartMenuMessage = ""; // 메뉴전달메세지
				cartMenuSize = jsonSetMenu.menuSize; // 메뉴사이즈
				cartMenuDough = ""; // 메뉴도우종류
				cartMenuOption = ""; // 메뉴옵션
				cartECouponCompany = ""; // E쿠폰제휴사
				cartECouponCode = ""; // E쿠폰코드
				cartECouponNumber = ""; // E쿠폰번호
				/*
				var menuAmt = parseInt(cartMenuPrice) * parseInt(cartMenuQty);
				cartMenuAmt    = String(menuAmt);  // 메뉴주문금액
				cartMenuPayAmt = String(menuAmt);  // 메뉴결제금액
				 */

				//    		alert("cartMenuName >>> "+cartMenuName);
				var cartSetMenuDetail = [];
				var setMenuCount = jsonSetMenu.menu.length; // 세트상세 메뉴 개수
				for (var i = 0; i < setMenuCount; i++) {
					var setCode = jsonSetMenu.menu[i].setCode + "_" + cartIndex;
					var setSeqNumber = jsonSetMenu.menu[i].setSeqNumber;
					var setMenuCode = jsonSetMenu.menu[i].setMenuCode;
					var setMenuName = jsonSetMenu.menu[i].setMenuName;
					var setMenuDivCode = jsonSetMenu.menu[i].setMenuDivCode;
					var setMenuLagCode = jsonSetMenu.menu[i].setMenuLagCode;
					var setMenuMidCode = jsonSetMenu.menu[i].setMenuMidCode;
					var setMenuSmlCode = jsonSetMenu.menu[i].setMenuSmlCode;
					var setMenuSubCode = jsonSetMenu.menu[i].setMenuSubCode;
					var setMenuPrice = jsonSetMenu.menu[i].setMenuPrice;
					var setMenuQty = jsonSetMenu.menu[i].setMenuQty;
					var setMenuAmount = jsonSetMenu.menu[i].setMenuAmount;
					var setMenuDisRate = jsonSetMenu.menu[i].setMenuDisRate;
					var setMenuDisAmt = jsonSetMenu.menu[i].setMenuDisAmt;
					var setMenuCopDis = jsonSetMenu.menu[i].setMenuCopDis;
					var setMenuNetSale = jsonSetMenu.menu[i].setMenuNetSale;

					var objSetMenu = {
						"setCode" : setCode,
						"setSeqNumber" : setSeqNumber,
						"setMenuCode" : setMenuCode,
						"setMenuName" : setMenuName,
						"setMenuDivCode" : setMenuDivCode,
						"setMenuLagCode" : setMenuLagCode,
						"setMenuMidCode" : setMenuMidCode,
						"setMenuSmlCode" : setMenuSmlCode,
						"setMenuSubCode" : setMenuSubCode,
						"setMenuPrice" : setMenuPrice,
						"setMenuQty" : setMenuQty,
						"setMenuAmount" : setMenuAmount,
						"setMenuDisRate" : setMenuDisRate,
						"setMenuDisAmt" : setMenuDisAmt,
						"setMenuCopDis" : setMenuCopDis,
						"setMenuNetSale" : setMenuNetSale
					};
					cartSetMenuDetail.push(objSetMenu);
				}

				var objSetMenuInfo = {
					cartAction : cartAction, // 장바구니처리
					cartMenuType : cartMenuType, // 메뉴타입
					cartMenuCode : cartMenuCode, // 메뉴코드
					cartMenuName : cartMenuName, // 메뉴명
					cartMenuOrdCode : cartMenuOrdCode, // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
					cartMenuDivCode : cartMenuDivCode, // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
					cartMenuLagCode : cartMenuLagCode, // 메뉴대분류코드
					cartMenuMidCode : cartMenuMidCode, // 메뉴중분류코드
					cartMenuSmlCode : cartMenuSmlCode, // 메뉴소분류코드
					cartMenuSubCode : cartMenuSubCode, // 메뉴세분류코드
					cartMenuPrice : cartMenuPrice, // 메뉴주문단가
					cartMenuQty : cartMenuQty, // 메뉴주문수량
					cartMenuAmt : cartMenuAmt, // 메뉴주문금액
					cartMenuDisRate : cartMenuDisRate, // 메뉴할인율
					cartMenuDisAmt : cartMenuDisAmt, // 메뉴할인금액
					cartMenuCopDisAmt : cartMenuCopDisAmt, // 메뉴선결제쿠폰할인
					cartMenuNetSaleAmt : cartMenuNetSaleAmt, // 메뉴순매출금액
					cartMenuPayAmt : cartMenuPayAmt, // 메뉴결제금액
					cartMenuBakeCode : cartMenuBakeCode, // 메뉴베이크코드
					cartMenuCutCode : cartMenuCutCode, // 메뉴컷코드
					cartMenuCheeseCode : cartMenuCheeseCode, // 메뉴치즈코드
					cartMenuSauceCode : cartMenuSauceCode, // 메뉴소스코드
					cartMenuMessage : cartMenuMessage, // 메뉴전달메세지
					cartMenuSize : cartMenuSize, // 메뉴사이즈
					cartMenuDough : cartMenuDough, // 메뉴도우종류
					cartMenuOption : cartMenuOption, // 메뉴 옵션
					cartECouponCompany : cartECouponCompany, // E쿠폰제휴사
					cartECouponCode : cartECouponCode, // E쿠폰코드
					cartECouponNumber : cartECouponNumber, // E쿠폰번호
					cartSetMenuDetail : cartSetMenuDetail
				// 세트메뉴상세
				};
				//    		alert("objSetMenuInfo >>> "+objSetMenuInfo);

				var jsonSetMenuInfo = JSON.stringify(objSetMenuInfo); //json 형태로 변환 
				cartSendDataInfo = {
					cartAction : cartAction, // 장바구니처리
					cartMenuType : cartMenuType, // 메뉴타입
					cartSetMenuInfo : jsonSetMenuInfo
				// 세트메뉴
				};
			}
			//세트메뉴가 아닌 모든 메뉴
			else {
				var selected = $("#select_size option:selected"); //선택옵션(사이즈&가격)

				cartAction = "addMenu"; // 장바구니처리
				cartMenuType = ""; // 메뉴타입
				cartMenuCode = selected.attr("value").split(",")[0] + "_"
						+ cartIndex; // 메뉴코드
				cartMenuName = $("h4").text(); // 메뉴명

				/* 20140428 파파플래터 메뉴명 한글만 표시 */
				if (cartMenuName.indexOf(")") > 0) {
					cartMenuName = cartMenuName.split("(")[0];
				}

				cartMenuOrdCode = "10"; // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
				cartMenuDivCode = selected.attr("value").split(",")[1]; // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
				cartMenuLagCode = menuLagCode; // 메뉴대분류코드
				cartMenuMidCode = menuMidCode; // 메뉴중분류코드
				cartMenuSmlCode = selected.attr("value").split(",")[2]; // 메뉴소분류코드
				cartMenuSubCode = menuSubCode; // 메뉴세분류코드
				cartMenuPrice = selected.text().split("-")[1].replace(",", ""); // 메뉴주문단가
				cartMenuQty = orderQty; // 메뉴주문수량
				cartMenuAmt = selected.text().split("-")[1].replace(",", ""); // 메뉴주문금액
				cartMenuDisRate = "0"; // 메뉴할인율
				cartMenuDisAmt = "0"; // 메뉴할인금액
				cartMenuCopDisAmt = "0"; // 메뉴선결제쿠폰할인
				cartMenuNetSaleAmt = selected.text().split("-")[1].replace(",",
						""); // 메뉴순매출금액
				cartMenuPayAmt = selected.text().split("-")[1].replace(",", ""); // 메뉴결제금액
				cartMenuBakeCode = ""; // 메뉴베이크코드
				cartMenuCutCode = ""; // 메뉴컷코드
				cartMenuCheeseCode = ""; // 메뉴치즈코드
				cartMenuSauceCode = ""; // 메뉴소스코드
				cartMenuMessage = ""; // 메뉴전달메세지
				cartMenuSize = selected.text().split("-")[0]; // 메뉴사이즈
				cartMenuDough = menuDough; // 메뉴도우종류
				cartMenuOption = ""; // 메뉴옵션
				cartECouponCompany = ""; // E쿠폰제휴사
				cartECouponCode = ""; // E쿠폰코드
				cartECouponNumber = ""; // E쿠폰번호

				// 메뉴대분류코드별 메뉴타입 세팅
				if (menuLagCode == "10") {
					cartMenuType = "typePizza";
				} // 피자
				else if (menuLagCode == "20") {
					cartMenuType = "typeSide";
				} // 사이드
				else if (menuLagCode == "30") {
					cartMenuType = "typeSauce";
				} // 소스
				else if (menuLagCode == "40") {
					cartMenuType = "typeBever";
				} // 음료
				/* 
				var menuAmt = parseInt(cartMenuPrice) * parseInt(cartMenuQty);
				cartMenuAmt    = String(menuAmt);  // 메뉴주문금액
				cartMenuPayAmt = String(menuAmt);  // 메뉴결제금액
				 */
				var findMenuOptions = $(".option_box .spcInstructions li");
				var selMenuOptions = [];
				findMenuOptions.each(function(i, e) {
					selMenuOptions[i] = $(this).find("input:radio:checked")
							.val();
					if (i == 0) {
						cartMenuSauceCode = selMenuOptions[i];
					} // 메뉴소스코드 
					if (i == 1) {
						cartMenuCheeseCode = selMenuOptions[i];
					} // 메뉴치즈코드 
					if (i == 2) {
						cartMenuBakeCode = selMenuOptions[i];
					} // 메뉴베이크코드 
					if (i == 3) {
						cartMenuCutCode = selMenuOptions[i];
					} // 메뉴컷코드
				});
				cartMenuOption = selMenuOptions.join("/"); // 메뉴 옵션

				cartSendDataInfo = {
					cartAction : cartAction, // 장바구니처리
					cartMenuType : cartMenuType, // 메뉴타입
					cartMenuCode : cartMenuCode, // 메뉴코드
					cartMenuName : cartMenuName, // 메뉴명
					cartMenuOrdCode : cartMenuOrdCode, // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
					cartMenuDivCode : cartMenuDivCode, // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
					cartMenuLagCode : cartMenuLagCode, // 메뉴대분류코드
					cartMenuMidCode : cartMenuMidCode, // 메뉴중분류코드
					cartMenuSmlCode : cartMenuSmlCode, // 메뉴소분류코드
					cartMenuSubCode : cartMenuSubCode, // 메뉴세분류코드
					cartMenuPrice : cartMenuPrice, // 메뉴주문단가
					cartMenuQty : cartMenuQty, // 메뉴주문수량
					cartMenuAmt : cartMenuAmt, // 메뉴주문금액
					cartMenuDisRate : cartMenuDisRate, // 메뉴할인율
					cartMenuDisAmt : cartMenuDisAmt, // 메뉴할인금액
					cartMenuCopDisAmt : cartMenuCopDisAmt, // 메뉴선결제쿠폰할인
					cartMenuNetSaleAmt : cartMenuNetSaleAmt, // 메뉴순매출금액
					cartMenuPayAmt : cartMenuPayAmt, // 메뉴결제금액
					cartMenuBakeCode : cartMenuBakeCode, // 메뉴베이크코드
					cartMenuCutCode : cartMenuCutCode, // 메뉴컷코드
					cartMenuCheeseCode : cartMenuCheeseCode, // 메뉴치즈코드
					cartMenuSauceCode : cartMenuSauceCode, // 메뉴소스코드
					cartMenuMessage : cartMenuMessage, // 메뉴전달메세지
					cartMenuSize : cartMenuSize, // 메뉴사이즈
					cartMenuDough : cartMenuDough, // 메뉴도우종류
					cartMenuOption : cartMenuOption, // 메뉴 옵션
					cartECouponCompany : cartECouponCompany, // E쿠폰제휴사
					cartECouponCode : cartECouponCode, // E쿠폰코드
					cartECouponNumber : cartECouponNumber
				// E쿠폰번호
				};
			}

			//세션에 저장
			$.ajax({
				url : "/order/newCart.jsp",
				type : "POST",
				data : cartSendDataInfo,
				dataType : "html",
				complete : function(result) {
					//바로 주문 버튼을 누른 경우 페이지 이동 
					if (actionFlag == "addCartNgo") {
						parent.location.href = root + "/order.jsp";
					}
				},
				success : function(result) {
					if (trim(result) != null && trim(result) == "true") {
						var alertFrame = $(parent.document
								.getElementById("notice_caution"));
						alertFrame.find("#alertText p").remove();
						alertFrame.find("#alertText").append(
								"<p>장바구니에 메뉴를 추가하였습니다!!<br>장바구니를 확인하세요~</p>");
						//alertFrame.height(152);	//text가 2줄인 경우
						parent.popAlert(alertFrame);
					} else {
						//alert("장바구니에 메뉴를 추가하실 수 없습니다!!");
					}
				}
			});
		}
		////////////////////////////////////////////////////////////////////////////////////////////////////////////
	</script>
</body>
</html>