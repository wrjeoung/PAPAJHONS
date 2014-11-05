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
 		$('#viewLoading')	// ajax ���� �� �Ϸ�� 'Loading �̹���'�� ���� ��Ʈ���ϱ�
		.ajaxStart(function()
		{  
			$(this).fadeIn(500);
		})
		.ajaxStop(function()
		{ 
			$(this).fadeOut(500);
		});

 		//20140527 �����ִ� ȭ�� ����� ���� ���� �˾� ��ġ ����
// 		var $ev_page = $("#worldCupEvent");
// 		var top = ($(window).height()/2)-($ev_page.height()/2);
// 		$ev_page.css("top",top+"px");
	});
</script>
<script type="text/javascript">
	//20140702 �ַܼα� ie ���� ����
	var console = window.console || {log:function(){}};
</script>
<title>��������-Better Ingredients.Better Pizza.</title>
</head>
<body>
	<div id="skipNavi">
		<a href="#gnb">�޴� �ٷΰ���</a> <a href="#contents">�����ٷΰ���</a>
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
					<!-- Ÿ��Ʋ -->
				</p>
			</div>
			<!-- //con_header -->

			<!-- include -->
			<div id="content_area">
				
				<form name="frmOrderChk" id="frmOrderChk" method="post">
					<!-- �ſ�ī�� ������ -->
					<input type="hidden" id="storeCode" name="storeCode" value="1038" />
					<!-- �����ڵ�            -->
					<input type="hidden" id="storeCardId" name="storeCardId"
						value="120600810054" />
					<!-- KG������� ����ID -->
					<input type="hidden" id="paymentAmt" name="paymentAmt" value="" />
					<!-- �����ݾ�            -->
					<!-- ����Ʈ ������ -->
					<input type="hidden" id="pointCardCompany" name="pointCardCompany"
						value="" />
					<!-- ����Ʈī��ȸ��      -->
					<input type="hidden" id="pointCardNumber" name="pointCardNumber"
						value="" />
					<!-- ����Ʈī���ȣ      -->
					<input type="hidden" id="pointApprNumber" name="pointApprNumber"
						value="" />
					<!-- ����Ʈ���ι�ȣ      -->
					<input type="hidden" id="pointDiscAmount" name="pointDiscAmount"
						value="0" />
					<!-- ��������Ʈ�ݾ�      -->
					<input type="hidden" id="pointUseAmount" name="pointUseAmount"
						value="0" />
					<!-- �������Ʈ�ݾ�      -->
					<input type="hidden" id="pointUseRate" name="pointUseRate" value="0" />
					<!-- �������Ʈ��        -->
					<input type="hidden" id="pointCustGrade" name="pointCustGrade" value="" />
					<!-- ����Ʈ�����      -->
					<input type="hidden" id="pointCouponCode" name="pointCouponCode"
						value="" />
					<!-- ����Ʈ�����ڵ�      -->
					<!-- �ֹ����� -->
					<input type="hidden" id="beforeCardPay" name="beforeCardPay" value="" />
					<!-- ��������������      -->
					<input type="hidden" id="orderNumber" name="orderNumber" value="" />
					<!-- �ֹ���ȣ            -->
					<!-- ���μ��ñ��� -->
					<input type="hidden" id="discountChoice" name="discountChoice" value="" />
					<input type="hidden" id="orderDiscountAmt" name="orderDiscountAmt"
						value="0" />
					<!-- ���αݾ� ���(���θ��) -->
					<input type="hidden" id="promotionCouponDisAmt"
						name="promotionCouponDisAmt" value="0" />
					<!-- ���αݾ� ���(���θ������ ���� �� ����) -->
					<!-- �������뱸�� -->
					<input type="hidden" id="couponSelectedYn" name="couponSelectedYn"
						value="N" />
					<!-- ������������ -->
					<input type="hidden" id="couponDoubleUsed" name="couponDoubleUsed"
						value="N" />

					<!-- con_container -->
					<div id="con_container">
						<!-- conternts -->
						<div id="contents" style="background: #fff">
							<h2 class="hidden">
								<!--�������� ��-->
							</h2>
							<!-- cont -->
							<div class="cont" style="min-height: 700px">
								<!-- conf_section -->
								<div id="conf_section">
									<!-- �ֹ���������Ʈ ����(conf_ord_list)-->
									<dl id="conf_ord_list" class="border">
										<dt id="list_leader">
											<span class="name"> ��ǰ�� </span> <span class="size"> ������ </span> <span
												class="count"> ���� </span> <span class="unit_price"> �ݾ� </span> <span
												class="discount"> ���αݾ� </span> <span class="disc_comm">
												���γ��� </span>
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
													
													//���� �ɼ� �� ����
													if( "" == "20" ) { cartPizzaOptionSauce = "�ҽ�����"; }
													else if( "" == "30" ) { cartPizzaOptionSauce = "�ҽ�����"; }
													else if( "" == "40" ) { cartPizzaOptionSauce = "�ҽ�����"; }
													
													if( "" == "20" ) { cartPizzaOptionCheese = "ġ������"; }
													else if( "" == "30" ) { cartPizzaOptionCheese = "ġ������"; }
													
													if( "" == "20" ) { cartPizzaOptionBake = "�ٽϱ���"; }
													
													if( "" == "60" ) { cartPizzaOptionCut = "�簢����"; }
													else if( "" == "20" ) { cartPizzaOptionCut = "6��������"; }
													else if( "" == "30" ) { cartPizzaOptionCut = "8��������"; }
													else if( "" == "40" ) { cartPizzaOptionCut = "10��������"; }
													
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
																$(this).find("ul .spc_inst").text("<�ɼǺ���>"+optionText.replace(/\s/g,", "));	
															}
															else
															{
																$(this).find("ul .spc_inst").parent().remove();
															}
														}
													});
												</script>
				
												<li id="pizzaMenu_50332_1" class="item_li"><span
													class="name product">������Ÿ ��������</span> <span class="size">����</span>
													<span class="count">1</span> <span class="unit_price">21,500</span>
												<!-- ���� �� --> <span class="discount"></span>
												<!--  ���� �ݾ� --> <span class="disc_comm"></span> <!-- ���ε� ���� ��) ���θ�� ���� -->
				
													<span class="hidden_code" style="display: none;">50332_1</span>
													<input type="hidden" id="menuSmlCode" name="menuSmlCode"
													value="3002" /> <input type="hidden" id="menuCopCode"
													name="menuCopCode" value="" /> <!-- 20140624 �����ڵ� --> <input
													type="hidden" id="menuCopNumber" name="menuCopNumber" value="" />
													<!-- 20140624 ������ȣ --> <input type="hidden" id="menuCopComp"
													name="menuCopComp" value="" /> <input type="hidden"
													id="menuCopOID" name="menuCopOID" value="" />
				
													<ul>
														<li><span class="spc_inst"></span></li>
													</ul></li>
													<!-- pizzaMenu ����Ʈ �� -->
													<script type="text/javascript">
														fnToppingAppend("50332_1", "1", "typePizza") ; 
													</script>
					
				
													<script type="text/javascript"> 
							             				$totalOrderAmount    = "21500";     // �ֹ��ݾ� �հ�
							             				$totalDiscountAmount = "0";  // ���αݾ� �հ�
							             				$totalCouponPayment  = "0";   // �������������� �հ�
							             				$totalNetSaleAmount  = "21500";   // ������ݾ� �հ�
							             				$totalPaymentAmount  = "21500";   // �����ݾ� �հ�
							             				$totalSetMenuAmount  = "0";   // ��Ʈ�޴��ݾ� �հ�
							             				$totalECouponAmount  = "0";   // E�����ݾ� �հ�
							             				
							             				//alert($totalCouponPayment + " / " + $totalECouponAmount);
							             				
							             				//20140623 �����ݾ� ���
							             				var totalPromotionAmount = "0"; // ���θ���������� ���� �հ�
							             				if(totalPromotionAmount !="" && totalPromotionAmount != null)
							             				{
							             					$totalPaymentAmount = parseInt($totalPaymentAmount, 10) - parseInt(totalPromotionAmount, 10); // �����ݾ� �հ�
							             					$totalDiscountAmount = parseInt($totalDiscountAmount, 10) + parseInt(totalPromotionAmount, 10); // ���αݾ� �հ�
							             				}
							             				
							             				// 20140623 ���θ������(1002 ��������)
							             				$("#promotionCouponDisAmt").val($totalDiscountAmount);
							             				
							             				
							             				//20140519 �÷��� �������� ��� �˾� ��ħ ����
							             				//20140529 �÷��� ���θ�� ���� �� ���ǻ��� �˾� ����
							             				if("N" == "Y" && parseInt(20141105) < 20140601)
							             				{
							            					//20140519 �÷��� �������� ��� �˾� ��ħ ����
							            					popup("#pop_guide");
							            					$("#pop_guide").find("button").focus();
							             				}
							             				
							             				//20140304 ��ȸ�� SK ��Ȱ��ȭ ó��
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
															
															// 20140430 �ֹ��ݾ��� E���� �ݾ�, ��Ʈ�޴��ݾ� �� ���� ��
															// ��ٱ��Ͽ� E����, ��Ʈ�޴�(�÷�������) �� ���� ��  
															//20140613 ��Ʈ�� �÷��Ͱ� �ϳ��� ���ԵǾ� ������ ��ü���� ���� �÷��� �߰�
							                   				if( $totalECouponAmount == $totalNetSaleAmount || $totalSetMenuAmount == $totalPaymentAmount || "Y" =="N" )
							                 				{
							        							$("#tel_card1" ).attr("disabled", "true");
							        							$("#cred_card1").attr("disabled", "true");
							        							$("#cred_card2").attr("disabled", "true");
							        							$("#cred_card3").attr("disabled", "true");
							                       				if( $totalPaymentAmount == 0 )
							                     				{
																	$(this).parent().find('.pay_radio').attr("disabled", "true");
																	//��ư ��Ȱ�� ǥ�� : ���� ����
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
								              				
								              				//20140304 ������ �޴��� �ִ� ��� �ݾ׾��� ������ �Ⱥ��̰�!!
								              				if($totalECouponAmount == 0)
								              				{
								              					$("#ord_account_section2").find("#amount .eCouponAmt").parent().hide();
								              				}
								              				else
								              				{
								              					$("#ord_account_section2").find("#amount .eCouponAmt" ).text(setComma($totalECouponAmount));
								              				}
								              				
								              				$("#ord_account_section2").find("#amount .totalAmt").text(setComma($totalPaymentAmount ));
								              				
								              				fnDiscountAmt(); // 20140623 ���μ��� > �������αݾ� ���
							
							                			}
							             				
							             			</script>
											</ul>
										</dd>
									</dl>
									<!-- //�ֹ���������Ʈ ��(conf_ord_list) -->
								</div>
								<!--// conf_section -->
							</div>
							<!--// cont -->
						
							<!-- �ֹ��ϱ� -->	
							<dl id="conf_discription_section" class="border" style="margin: 10px 0">
								<dt class="conf_title padd_rl10"><img src="../assets/img/order/conf_title2.gif" alt="�߰���û����" /></dt>
								<dd>
									<p class="padd_trbl10">
										<span>
											<button type="button" onclick='fnOrderInfo($(this));'>
												<img src="../assets/img/btn/btn_order.png" alt="�ֹ��ϱ�" />
											</button>
											<button type="button" onclick="location.href='/order.jsp?step=step1'">
												<img src="../assets/img/btn/btn_pre.png" alt="�����ܰ�" />
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

	<!-- �ε� �̹��� -->
	<div id="viewLoading">
		<img src="../assets/img/viewLoading.gif" />
		<p>Please wait...</p>
	</div>
	<!-- //�ε� �̹��� -->
</body>
</html>

