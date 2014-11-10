<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<link rel="icon" href="assets/img/favicon.ico" />
<link rel="icon" href="../assets/img/favicon.ico" />
<link type="text/css" rel="stylesheet" href="../assets/css/import.css" />
<link type="text/css" rel="stylesheet" href="../assets/css/sub.css" />
<link type="text/css" rel="stylesheet" href="../assets/css/order.css" />
<link type="text/css" rel="stylesheet" href="../assets/css/lib_style.css" />

<style type="text/css">
#con_container {
	background: none;
	border: none;
	padding-left: 0;
}

#contents {
	background: none;
	border: none;
	padding-left: 0;
}

#contents .cont {
	width: 99%;
}

#container {
	padding-bottom: 0px;
}
</style>
<script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
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

 		//20140527 열려있는 화면 사이즈에 따라 응모 팝업 위치 변경
// 		var $ev_page = $("#worldCupEvent");
// 		var top = ($(window).height()/2)-($ev_page.height()/2);
// 		$ev_page.css("top",top+"px");
	});
</script>
<script type="text/javascript">
	//20140702 콘솔로그 ie 오류 막기
	var console = window.console || {log:function(){}};
</script>
<title>파파존스-Better Ingredients.Better Pizza.</title>
</head>
<body>
	<div id="skipNavi">
		<a href="#gnb">메뉴 바로가기</a> <a href="#contents">본문바로가기</a>
	</div>

	<!-- wrap -->
	<div id="wrap">
		<!-- header -->
		<div id="header">
			<script type="text/javascript">	$("#header").load("../include/header.jsp?menuGb=order");	</script>
		</div>
		<!-- header -->

		<!-- container -->
		<div id="container">
			<!-- con_header -->
			<div class="con_header">
				<p>
					<!-- 타이틀 -->
				</p>
			</div>
			<!-- //con_header -->

			<!-- include -->
			<div id="content_area">
				
				<form name="frmOrderChk" id="frmOrderChk" method="post">
					<!-- 신용카드 결제용 -->
					<input type="hidden" id="storeCode" name="storeCode" value="1038" />
					<!-- 매장코드            -->
					<input type="hidden" id="storeCardId" name="storeCardId"
						value="120600810054" />
					<!-- KG모빌리언스 매장ID -->
					<input type="hidden" id="paymentAmt" name="paymentAmt" value="" />
					<!-- 결제금액            -->
					<!-- 포인트 결제용 -->
					<input type="hidden" id="pointCardCompany" name="pointCardCompany"
						value="" />
					<!-- 포인트카드회사      -->
					<input type="hidden" id="pointCardNumber" name="pointCardNumber"
						value="" />
					<!-- 포인트카드번호      -->
					<input type="hidden" id="pointApprNumber" name="pointApprNumber"
						value="" />
					<!-- 포인트승인번호      -->
					<input type="hidden" id="pointDiscAmount" name="pointDiscAmount"
						value="0" />
					<!-- 할인포인트금액      -->
					<input type="hidden" id="pointUseAmount" name="pointUseAmount"
						value="0" />
					<!-- 사용포인트금액      -->
					<input type="hidden" id="pointUseRate" name="pointUseRate" value="0" />
					<!-- 사용포인트율        -->
					<input type="hidden" id="pointCustGrade" name="pointCustGrade" value="" />
					<!-- 포인트고객등급      -->
					<input type="hidden" id="pointCouponCode" name="pointCouponCode"
						value="" />
					<!-- 포인트쿠폰코드      -->
					<!-- 주문정보 -->
					<input type="hidden" id="beforeCardPay" name="beforeCardPay" value="" />
					<!-- 선결제정보저장      -->
					<input type="hidden" id="orderNumber" name="orderNumber" value="" />
					<!-- 주문번호            -->
					<!-- 할인선택구분 -->
					<input type="hidden" id="discountChoice" name="discountChoice" value="" />
					<input type="hidden" id="orderDiscountAmt" name="orderDiscountAmt"
						value="0" />
					<!-- 할인금액 계산(프로모션) -->
					<input type="hidden" id="promotionCouponDisAmt"
						name="promotionCouponDisAmt" value="0" />
					<!-- 할인금액 계산(프로모션할인 쿠폰 선 선택) -->
					<!-- 쿠폰적용구분 -->
					<input type="hidden" id="couponSelectedYn" name="couponSelectedYn"
						value="N" />
					<!-- 더블쿠폰구분 -->
					<input type="hidden" id="couponDoubleUsed" name="couponDoubleUsed"
						value="N" />

					<!-- con_container -->
					<div id="con_container">
						<!-- conternts -->
						<div id="contents" style="background: #fff">
							<h2 class="hidden">
								<!--오리지널 씬-->
							</h2>
							<!-- cont -->
							<div class="cont" style="min-height: 290px">
								<!-- conf_section -->
								<div id="conf_section">
									<!-- 주문내역리스트 시작(conf_ord_list)-->
									<dl id="conf_ord_list" class="border">
										<dt id="list_leader">
											<span class="name"> 제품명 </span> <span class="size"> 사이즈 </span> <span
												class="count"> 수량 </span> <span class="unit_price"> 금액 </span> <span
												class="discount"> 할인금액 </span> <span class="disc_comm">
												할인내용 </span>
										</dt>
										<dd id="list_body">
											<ul id="menu_list">
												<!--  style="overflow: auto;" -->
				
												<script type="text/javascript">
													var $arrayCouponValue     = "";
													var cartPizzaOptionSauce  = "";
													var cartPizzaOptionCheese = "";
													var cartPizzaOptionBake   = "";
													var cartPizzaOptionCut    = "";
													
													//피자 옵션 값 세팅
													if( "" == "20" ) { cartPizzaOptionSauce = "소스조금"; }
													else if( "" == "30" ) { cartPizzaOptionSauce = "소스많이"; }
													else if( "" == "40" ) { cartPizzaOptionSauce = "소스제외"; }
													
													if( "" == "20" ) { cartPizzaOptionCheese = "치즈조금"; }
													else if( "" == "30" ) { cartPizzaOptionCheese = "치즈제외"; }
													
													if( "" == "20" ) { cartPizzaOptionBake = "바싹굽기"; }
													
													if( "" == "60" ) { cartPizzaOptionCut = "사각컷팅"; }
													else if( "" == "20" ) { cartPizzaOptionCut = "6조각컷팅"; }
													else if( "" == "30" ) { cartPizzaOptionCut = "8조각컷팅"; }
													else if( "" == "40" ) { cartPizzaOptionCut = "10조각컷팅"; }
													
													var menuLi     = $("#conf_ord_list").find("#menu_list>li");
												 	var optionText = "";
													if( cartPizzaOptionSauce != "" ) { optionText = cartPizzaOptionSauce; }
													
													if( cartPizzaOptionCheese != "" && optionText != "" ) { optionText += " " + cartPizzaOptionCheese; }
													else if( cartPizzaOptionCheese != "" && optionText == "" ) { optionText = cartPizzaOptionCheese; }
													
													if( cartPizzaOptionBake != "" && optionText != "" ) { optionText += " " + cartPizzaOptionBake; }
													else if( cartPizzaOptionBake != "" && optionText == "" ) { optionText = cartPizzaOptionBake; }
													
													if( cartPizzaOptionCut != "" && optionText != "" ) { optionText += " " + cartPizzaOptionCut; }
													else if( cartPizzaOptionCut != "" && optionText == "" ) { optionText = cartPizzaOptionCut; }
												 
													menuLi.each(function(i)
													{
														var listIdCode = $(this).attr("id").split("_")[1]+"_"+$(this).attr("id").split("_")[2];
														if( "50332_1" == listIdCode )
														{
										
															//if( optionText.trim() != "" )
															if( optionText != "" )
															{
																$(this).find("ul .spc_inst").text("<옵션변경>"+optionText.replace(/\s/g,", "));	
															}
															else
															{
																$(this).find("ul .spc_inst").parent().remove();
															}
														}
													});
												</script>
												<c:forEach var="li" items="${mapLists}">
													<li id="pizzaMenu_50332_1" class="item_li"><span
														class="name product">${li.value.name }</span> <span class="size">${li.value.size}</span>
														<span class="count">${li.value.amount}</span> <span class="unit_price">${li.value.price}</span>
														<!-- 할인 전 --> <span class="discount"></span>
														<!--  할인 금액 --> <span class="disc_comm"></span> 
														<!-- 할인된 이유 예) 프로모션 할인 -->
														<span class="hidden_code" style="display: none;">50332_1</span>
														<input type="hidden" id="menuSmlCode" name="menuSmlCode"
														value="3002" /> <input type="hidden" id="menuCopCode"
														name="menuCopCode" value="" /> <!-- 20140624 쿠폰코드 --> <input
														type="hidden" id="menuCopNumber" name="menuCopNumber" value="" />
														<!-- 20140624 쿠폰번호 --> <input type="hidden" id="menuCopComp"
														name="menuCopComp" value="" /> <input type="hidden"
														id="menuCopOID" name="menuCopOID" value="" />
													</li>
												</c:forEach>
													<!-- pizzaMenu 리스트 끝 -->
													<script type="text/javascript">
														fnToppingAppend("50332_1", "1", "typePizza") ; 
													</script>
					
				
													<script type="text/javascript"> 
							             				$totalOrderAmount    = "21500";     // 주문금액 합계
							             				$totalDiscountAmount = "0";  // 할인금액 합계
							             				$totalCouponPayment  = "0";   // 선결제쿠폰할인 합계
							             				$totalNetSaleAmount  = "21500";   // 순매출금액 합계
							             				$totalPaymentAmount  = "21500";   // 결제금액 합계
							             				$totalSetMenuAmount  = "0";   // 세트메뉴금액 합계
							             				$totalECouponAmount  = "0";   // E쿠폰금액 합계
							             				
							             				//alert($totalCouponPayment + " / " + $totalECouponAmount);
							             				
							             				//20140623 결제금액 계산
							             				var totalPromotionAmount = "0"; // 프로모션할인쿠폰 할인 합계
							             				if(totalPromotionAmount !="" && totalPromotionAmount != null)
							             				{
							             					$totalPaymentAmount = parseInt($totalPaymentAmount, 10) - parseInt(totalPromotionAmount, 10); // 결제금액 합계
							             					$totalDiscountAmount = parseInt($totalDiscountAmount, 10) + parseInt(totalPromotionAmount, 10); // 할인금액 합계
							             				}
							             				
							             				// 20140623 프로모션할인(1002 쿠폰선택)
							             				$("#promotionCouponDisAmt").val($totalDiscountAmount);
							             				
							             				
							             				//20140519 플래터 여러개인 경우 팝업 겹침 수정
							             				//20140529 플래터 프로모션 종료 시 유의사항 팝업 안함
							             				if("N" == "Y" && parseInt(20141105) < 20140601)
							             				{
							            					//20140519 플래터 여러개인 경우 팝업 겹침 수정
							            					popup("#pop_guide");
							            					$("#pop_guide").find("button").focus();
							             				}
							             				
							             				//20140304 비회원 SK 비활성화 처리
							             				if(loginStatus == "C")
							             				{
							             					$("#tel_card1" ).attr("disabled", "true");
							             				}
							             				else
							             				{
							             					$("#tel_card1" ).removeAttr("disabled");	
							             				}
														$("#cred_card1").removeAttr("disabled");
														$("#cred_card2").removeAttr("disabled");
														$("#cred_card3").removeAttr("disabled");
														
							             			   	$("#payment_type").find("p").each(function()
							           			   	   	{
															$(this).parent().find('.pay_radio').removeAttr("disabled");
															
															// 20140430 주문금액이 E쿠폰 금액, 세트메뉴금액 과 같을 때
															// 장바구니에 E쿠폰, 세트메뉴(플래터포함) 만 있을 때  
															//20140613 세트나 플래터가 하나라도 포함되어 있으면 전체할인 막기 플래그 추가
							                   				if( $totalECouponAmount == $totalNetSaleAmount || $totalSetMenuAmount == $totalPaymentAmount || "Y" =="N" )
							                 				{
							        							$("#tel_card1" ).attr("disabled", "true");
							        							$("#cred_card1").attr("disabled", "true");
							        							$("#cred_card2").attr("disabled", "true");
							        							$("#cred_card3").attr("disabled", "true");
							                       				if( $totalPaymentAmount == 0 )
							                     				{
																	$(this).parent().find('.pay_radio').attr("disabled", "true");
																	//버튼 비활성 표시 : 색상 변경
																	$(this).parent().find('.pay_radio span').css("color","#ccc")	;
							                     				}
							                 				}
							           			   	   	});
							             				
							             				finalAmount();
							             				
							             				function finalAmount()
							             				{
							             					//alert("3 : " + $totalDiscountAmount);
								              				$("#ord_account_section2").find("#amount .listAmt" ).text(setComma($totalNetSaleAmount ));
								              				$("#ord_account_section2").find("#amount .dcAmt"   ).text(setComma($totalDiscountAmount));
								              				
								              				//20140304 이쿠폰 메뉴가 있는 경우 금액쓰고 없으면 안보이게!!
								              				if($totalECouponAmount == 0)
								              				{
								              					$("#ord_account_section2").find("#amount .eCouponAmt").parent().hide();
								              				}
								              				else
								              				{
								              					$("#ord_account_section2").find("#amount .eCouponAmt" ).text(setComma($totalECouponAmount));
								              				}
								              				
								              				$("#ord_account_section2").find("#amount .totalAmt").text(setComma($totalPaymentAmount ));
								              				
								              				fnDiscountAmt(); // 20140623 할인선택 > 쿠폰할인금액 계산
							
							                			}
							             				
							             			</script>
											</ul>
										</dd>
									</dl>
									<!-- //주문내역리스트 끝(conf_ord_list) -->
								</div>
								<!--// conf_section -->
							</div>
							<!--// cont -->
						
							<!-- 주문하기 -->	
							<dl id="conf_discription_section" class="border" style="margin: 10px 0">
								<dt class="conf_title padd_rl10"><img src="../assets/img/order/conf_title2.gif" alt="추가요청사항" /></dt>
								<dd>
									<p class="padd_trbl10">
										<span>
											<button type="button" onclick='fnOrderInfo($(this));'>
												<img src="../assets/img/btn/btn_order.png" alt="주문하기" />
											</button>
											<button type="button" onclick="javascript:history.back()">
												<img src="../assets/img/btn/btn_pre.png" alt="이전단계" />
											</button>
										</span>
									</p>
								</dd>
							</dl>	
						</div>
						<!--// conternts -->
					</div>
					<!--// con_container -->
				</form>
				
			</div>
			<!-- //include -->
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
		<p>Please wait...</p>
	</div>
	<!-- //로딩 이미지 -->
</body>
</html>

