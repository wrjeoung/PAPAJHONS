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
<title>��������-Better Ingredients.Better Pizza.</title>
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

/* ���ڸ޴� (�ҽ�,ġ��,����,�� )�ɼ� ��ư ���� */
.spcInstruction_btn {
	position: relative;
	top: 2px;
	float: left;
	padding: 3px 5px;
}

.spcInstruction_btn img {
	cursor: pointer;
}
/* special Instruction �ɼ� & ������ ��ǳ�� */
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

/* (�ҽ�,ġ��,����,�� )�ɼǹڽ� ���� */
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
		//������ ���� �÷ε� �̹��� �����
		$('#viewLoading').hide();
		// ajax ���� �� �Ϸ�� 'Loading �̹���'�� ���� ��Ʈ���ϱ�
		$('#viewLoading').ajaxStart(function() {
			$(this).fadeIn(500);
		}).ajaxStop(function() {
			$(this).fadeOut(500);
		});

		$('.menu_opt_radio').click(function() {
			set_opt_radio($(this));
		});
		//���� ��ư �ʱⰪ default ����
		$(".option_box .spcInstructions .option").each(function(i) {
			var $btn = $(this).find(".menu_opt_radio").eq(0);
			set_opt_radio($btn);
		});
	});

	window.onload = function() {
		//20130415 �� �޴��� ������ ������ ũ�� ����!!
		var $ifr = $(parent.document.getElementById("detail_con"));
		var hei = $('#iframe_detail').css('height');
		$ifr.find('iframe').css('height', hei);
	};

	//���� ��ư üũ�� ����
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

	/* ���� �յ� �������� */
	function trim(s) {
		s += ''; // ���ڶ� ���ڿ��� ��ȯ
		return s.replace(/^\s*|\s*$/g, '');
	}
</script>
</head>

<body>
	<div id="iframe_detail">
		<script type="text/javascript">
			var $mainType = "10";
			var $doughType = "��������";
		</script>
		<div class="db_img">
			<img src="/assets/img/menu/img/10/detail_img_1018.png" alt="������Ÿ"
				title="������Ÿ"
				onerror="this.src='/assets/img/menu/img/detail_noImage.png'" />
		</div>
		<div class="comment">
			<!--  0401 �߰��κ� ����  -->
			<p class="close">
				<button type="button">
					<img src="../assets/img/sub/btn_detail_close.gif" alt="�ݱ�" />
				</button>
			</p>
			<!-- 0401 �߰��κ� �� -->

			<h4>������Ÿ</h4>
			<p class="comm">���� ������ ���� �丶��ҽ��� 100% ��� õ�� ġ�� �޺� ������ ���� ��ȭ</p>

			<p class="comm">
				<span class="bold">Create your own Pizza: </span>������Ÿ ���ڸ� Base�� ������
				���ڸ� ���� �� �ֽ��ϴ�.
			</p>

			<div class="detail_comm">
				<dl>
					<dt>
						<img src="../assets/img/menu/detail_title_topping.gif" alt="�������">
					</dt>
					<dd>�丶�� �ҽ�, ��¥���� ġ��</dd>
					<dt>
						<img src="../assets/img/menu/detail_title_size.gif" alt="����� ����">
					</dt>
					<dd>
						<ul>
							<li><span class="size_img"><img
									src="../assets/img/menu/detail_size_R.gif" alt="9 ��ġ������" /></span> <span
								class="����">15900��</span></li>
							<li><span class="size_img"><img
									src="../assets/img/menu/detail_size_L.gif" alt="12 ��ġ������" /></span> <span
								class="����">21500��</span></li>
							<li><span class="size_img"><img
									src="../assets/img/menu/detail_size_F.gif" alt="14 ��ġ������" /></span> <span
								class="����">25900��</span></li>
							<li><span class="size_img"><img
									src="../assets/img/menu/detail_size_P.gif" alt="16 ��ġ������" /></span> <span
								class="����">34500��</span></li>
						</ul>
					</dd>

					<dt>
						<img src="../assets/img/menu/detail_title_alre.gif" alt="�˷����� ����ǥ��">
					</dt>
					<dd>ġ��(����),���,��,�������,�丶��</dd>
					<dt class="hidden">����ǥ��</dt>
					<dd>
						<table>
							<tr>
								<th scope="col">Į�θ�</th>
								<th scope="col">��������</th>
							</tr>
							<tr>
								<td>250kcal(100g ����)</td>
								<td style="text-align: left">ź��ȭ��(39g), �ܹ���(10g). ����(6g),
									��Ʈ��(1g), ���(8g), �ݷ����׷�(16g), Ʈ��������(0), ��ȭ����(4g)</td>
							</tr>
						</table>
					</dd>

				</dl>
			</div>

			<!-- //detail_comm -->
			<form action="">
				<div class="cart_order">
					<label for="select_size" class="hidden">������ ����</label> <select
						id="select_size">
						<option value="50330,10,3001">R-15900</option>
						<option value="50332,10,3002">L-21500</option>
						<option value="50329,10,3003">F-25900</option>
						<option value="50322,10,3005">P-34500</option>
					</select>

					<div class="spcInstruction_btn">
						<p class="btn">
							<img src="../assets/img/order/btn_opt_off.gif" alt="�ɼǺ���" />
						</p>
						<div class="spcInstruction_comment">
							<p class="center">
								<span>special instructions :</span> <br>��ư Ŭ�� �� <span>sauce,
										cheese, bake, cut </span><br>���¸� �����Ͻ� �� �ֽ��ϴ�. <br>��ٱ��Ͽ� ����
											�� �����Ͻ÷��� �޴��� <br>��ٱ��Ͽ��� ���� �� �ٽ� �����ž� �մϴ�!! 
							</p>
						</div>
						<!-- �ɼǺ��� ��ǳ�� -->
					</div>

					<!-- 20131004 �ҽ�&ġ��&Ŀ��&����ũ �ɼ��ֱ� -->
					<div id="option_box_0" class="option_box">
						<!--  display: none; -->
						<ul class="spcInstructions">
							<li>
								<p onclick="fnAdjustMenu('0_1',$(this));">
									�ҽ� ���� <span class="imgsp">��</span>
								</p>
								<div id="0_1" class="option">
									<p class="menu_opt_radio">
										<input type="radio" id="0_regularSauce" name="0_sau_radio"
											value="" /> <label for="0_regular">�ҽ� ����(Normal)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_lightSauce" name="0_sau_radio"
											value="20" /> <label for="0_light">�ҽ� ����(LS)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_extraSauce" name="0_sau_radio"
											value="30" /> <label for="0_extra">�ҽ� ����(XS)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_noSauce" name="0_sau_radio"
											value="40" /> <label for="0_no">�ҽ� ����(NS)</label>
									</p>
								</div>
							</li>
							<li>
								<p onclick="fnAdjustMenu('0_2',$(this));">
									ġ�� ���� <span class="imgsp">��</span>
								</p>
								<div id="0_2" class="option">
									<p class="menu_opt_radio">
										<input type="radio" id="0_normalCheese" name="0_chee_radio"
											value="" /> <label for="0_normal">ġ�� ����(Normal)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_lightCheese" name="0_chee_radio"
											value="20" /> <label for="0_light">ġ�� ����(LC)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_noCheese" name="0_chee_radio"
											value="30" /> <label for="0_no">ġ�� ����(NC)</label>
									</p>
								</div>
							</li>
							<li>
								<p onclick="fnAdjustMenu('0_3',$(this));">
									���� ���� <span class="imgsp">��</span>
								</p>
								<div id="0_3" class="option">
									<p class="menu_opt_radio">
										<input type="radio" id="0_normalBake" name="0_bake_radio"
											value="" /> <label for="0_normal">�⺻ ����(Normal)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_wellDone" name="0_bake_radio"
											value="20" /> <label for="0_well">�ٽ� ����(WD)</label>
									</p>
								</div>
							</li>
							<li>
								<p onclick="fnAdjustMenu('0_4',$(this));">
									���� ���� <span class="imgsp">��</span>
								</p>
								<div id="0_4" class="option">
									<p class="menu_opt_radio">
										<input type="radio" id="0_normalCut" name="0_cut_radio"
											value="" /> <label for="0_normal">�⺻����(Normal)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_squareCut" name="0_cut_radio"
											value="60" /> <label for="0_square">�簢����(SC)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_sixCut" name="0_cut_radio"
											value="20" /> <label for="0_sixCut">6��������(6C)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_eightCut" name="0_cut_radio"
											value="30" /> <label for="0_eightCut">8��������(8C)</label>
									</p>
									<p class="menu_opt_radio">
										<input type="radio" id="0_tenCut" name="0_cut_radio"
											value="40" /> <label for="0_tenCut">10��������(10C)</label>
									</p>
								</div>
							</li>
						</ul>
					</div>

					<button class="cart" type="button"
						onclick="fnGetPizzaCnt('10','10','1018','4001','��������','addCart')">
						<img src="../assets/img/menu/dtaile_btn_cart.gif" alt="��ٱ��� ���" />
					</button>
					<button class="order" type="button"
						onclick="fnGetPizzaCnt('10','10','1018','4001','��������','addCartNgo')">
						<img src="../assets/img/menu/dtaile_btn_order.gif" alt="�ٷ� �ֹ��ϱ�" />
					</button>
				</div>
			</form>
		</div>
	</div>

	<!--   0401 �߰��κ� ����  -->
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
		//20131004 ���� �ɼ� ����	
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
					$(this).text("��");
				});
				$(".option").slideUp(); //�ȿ� ��ó���ִ� �ɼǵ�
				box.stop().slideUp();
				$(this).find("img").attr("src",
						root + "../assets/img/order/btn_opt_off.gif");
			}
		}

		//�ɼǹڽ����� �ɼǰ� ����
		var old_sid = "";
		$(".option").slideUp();

		function swapimg(old_sid, $this) {
			var prevIndex = parseInt(old_sid.substr(old_sid.length - 1, 1)) - 1; //������ Ŭ���� �ɼ��� �ε��� ���ϱ�
			$this.parent().parent().find("li").eq(prevIndex).find("span").text(
					"��");
		}

		function fnAdjustMenu(sid, $this) {
			// ���� ���� �ɼ��� ���� ���ÿɼǰ� �ٸ���
			if (old_sid != sid) {
				// ���� ������ �ɼ��� ó�� ������ �ƴϸ�
				if (old_sid != "") {
					$this.parent().parent().find('#' + old_sid).stop()
							.slideUp(); //���� �ɼ��� �����  
					swapimg(old_sid, $this); // swapimg �Լ��� ȣ��. 
				}

				$this.parent().parent().find('#' + sid).stop().slideDown(); // ���� Ŭ���� �ɼ��� ������ 
				old_sid = sid; // ���� �ɼ� ������ ���� �ɼ� ��ȣ�� ����  
				$this.find("span").text("��");
			}
			// ���� Ŭ���� ���� Ŭ���� �ɼǰ� ������
			else {
				$this.parent().parent().find('#' + sid).stop().slideUp();// ���� �ɼ��� ����� 
				old_sid = "";
				$this.find("span").text("��");
			}
		}

		////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/////* mainType >> 10:����, 20:���̵�, 30:�ҽ�, 40:����, 50:��Ʈ,	55: ����, 90:��Ÿ  *///////// 

		//step1 : ���ǿ� ����� ���� ���� üũ 
		function fnGetPizzaCnt(onlineGrpCode, menuLagCode, menuMidCode,
				menuSubCode, menuDough, actionFlag) {
			//		console.log("fnGetPizzaCnt : " +onlineGrpCode + " / " +  menuLagCode, actionFlag);

			//���ڴ� �����ɼ� ���� ������ 1��
			var orderQty = 1;

			//���ڰ� �ƴϸ� �����ɼ� ��
			//20140429 �����÷��� ���� �ɼ� �߰�
			if (menuLagCode != "10" || onlineGrpCode == "11") {
				orderQty = $("#select_count option:selected").text();
				//			fnGetCartIndex(menuLagCode, menuMidCode, menuSubCode, menuDough, orderQty, actionFlag);
			}

			//���� �Ǵ� ��Ʈ�޴� ���� �˻� (limit 5��)
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
														"<p>�¶��� �ֹ��� ���� 5�Ǳ����� �����մϴ�.<br>��ٱ��ϸ� Ȯ���ϼ���~<br>5�� �̻� ��ü �ֹ��� �ݼ��͸� �̿����ּ���!!</p>");
										alertFrame.height(172); //text�� 3���� ���
										parent.popAlert(alertFrame);
									}
								});
			} else {
				fnGetCartIndex(menuLagCode, menuMidCode, menuSubCode,
						menuDough, orderQty, actionFlag);
			}
		}

		//step2 : ��ٱ��� ������ �ε��� ���ϱ� 
		function fnGetCartIndex(menuLagCode, menuMidCode, menuSubCode,
				menuDough, orderQty, actionFlag) {
			//		alert("fnGetCartIndex()");
			var cartIndex = 0; // ��ٱ��� ����(������ �ε���)

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

		//step3 : ���ǿ� ���� Send������ ����� > ����
		function fnSendMenu(menuLagCode, menuMidCode, menuSubCode, menuDough,
				orderQty, cartIndex, actionFlag) {
			//		alert("fnSendMenu()");
			var cartSendDataInfo = null; // ��ٱ��� ���� ����
			var cartAction = ""; // ��ٱ���ó��
			var cartMenuType = ""; // �޴�Ÿ��
			var cartMenuCode = ""; // �޴��ڵ�
			var cartMenuName = ""; // �޴���
			var cartMenuOrdCode = ""; // �޴��ֹ������ڵ�(10:����,20:����,30:����(����))
			var cartMenuDivCode = ""; // �޴������ڵ�(10:��ǰ,20:��Ʈ,30:����&����)
			var cartMenuLagCode = ""; // �޴���з��ڵ�
			var cartMenuMidCode = ""; // �޴��ߺз��ڵ�
			var cartMenuSmlCode = ""; // �޴��Һз��ڵ�
			var cartMenuSubCode = ""; // �޴����з��ڵ�
			var cartMenuPrice = ""; // �޴��ֹ��ܰ�
			var cartMenuQty = ""; // �޴��ֹ�����
			var cartMenuAmt = ""; // �޴��ֹ��ݾ�
			var cartMenuDisRate = ""; // �޴�������
			var cartMenuDisAmt = ""; // �޴����αݾ�
			var cartMenuCopDisAmt = ""; // �޴���������������
			var cartMenuNetSaleAmt = ""; // �޴�������ݾ�
			var cartMenuPayAmt = ""; // �޴������ݾ�
			var cartMenuBakeCode = ""; // �޴�����ũ�ڵ�
			var cartMenuCutCode = ""; // �޴����ڵ�
			var cartMenuCheeseCode = ""; // �޴�ġ���ڵ�
			var cartMenuSauceCode = ""; // �޴��ҽ��ڵ�
			var cartMenuMessage = ""; // �޴����޸޼���
			var cartMenuSize = ""; // �޴�������
			var cartMenuDough = ""; // �޴���������
			var cartMenuOption = ""; // �޴� �ɼ�
			var cartECouponCompany = ""; // E�������޻�
			var cartECouponCode = ""; // E�����ڵ�
			var cartECouponNumber = ""; // E������ȣ

			//��Ʈ�޴��� ���
			if (menuLagCode == "50") {
				//    		alert("menuLagCode >>> "+menuLagCode);
				var jsonSetMenu = $.parseJSON(setMenuInfo);
				//    		alert("jsonSetMenu >>> "+jsonSetMenu);

				cartAction = "addMenu"; // ��ٱ���ó��
				cartMenuType = "typeSet"; // �޴�Ÿ��
				cartMenuCode = jsonSetMenu.menuCode + "_" + cartIndex; // �޴��ڵ�
				cartMenuName = jsonSetMenu.menuName; // �޴���
				cartMenuOrdCode = "10"; // �޴��ֹ������ڵ�(10:����,20:����,30:����(����))
				cartMenuDivCode = jsonSetMenu.menuDivCode; // �޴������ڵ�(10:��ǰ,20:��Ʈ,30:����&����)
				cartMenuLagCode = jsonSetMenu.menuLagCode; // �޴���з��ڵ�
				cartMenuMidCode = jsonSetMenu.menuMidCode; // �޴��ߺз��ڵ�
				cartMenuSmlCode = jsonSetMenu.menuSmlCode; // �޴��Һз��ڵ�
				cartMenuSubCode = jsonSetMenu.menuSubCode; // �޴����з��ڵ�
				cartMenuPrice = jsonSetMenu.menuSaleAmt; // �޴��ֹ��ܰ�
				cartMenuQty = orderQty; // �޴��ֹ�����
				cartMenuAmt = jsonSetMenu.menuSaleAmt; // �޴��ֹ��ݾ�
				cartMenuDisRate = "0"; // �޴�������
				cartMenuDisAmt = "0"; // �޴����αݾ�
				cartMenuCopDisAmt = "0"; // �޴���������������
				cartMenuNetSaleAmt = jsonSetMenu.menuSaleAmt; // �޴�������ݾ�
				cartMenuPayAmt = jsonSetMenu.menuSaleAmt; // �޴������ݾ�
				cartMenuBakeCode = ""; // �޴�����ũ�ڵ�
				cartMenuCutCode = ""; // �޴����ڵ�
				cartMenuCheeseCode = ""; // �޴�ġ���ڵ�
				cartMenuSauceCode = ""; // �޴��ҽ��ڵ�
				cartMenuMessage = ""; // �޴����޸޼���
				cartMenuSize = jsonSetMenu.menuSize; // �޴�������
				cartMenuDough = ""; // �޴���������
				cartMenuOption = ""; // �޴��ɼ�
				cartECouponCompany = ""; // E�������޻�
				cartECouponCode = ""; // E�����ڵ�
				cartECouponNumber = ""; // E������ȣ
				/*
				var menuAmt = parseInt(cartMenuPrice) * parseInt(cartMenuQty);
				cartMenuAmt    = String(menuAmt);  // �޴��ֹ��ݾ�
				cartMenuPayAmt = String(menuAmt);  // �޴������ݾ�
				 */

				//    		alert("cartMenuName >>> "+cartMenuName);
				var cartSetMenuDetail = [];
				var setMenuCount = jsonSetMenu.menu.length; // ��Ʈ�� �޴� ����
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
					cartAction : cartAction, // ��ٱ���ó��
					cartMenuType : cartMenuType, // �޴�Ÿ��
					cartMenuCode : cartMenuCode, // �޴��ڵ�
					cartMenuName : cartMenuName, // �޴���
					cartMenuOrdCode : cartMenuOrdCode, // �޴��ֹ������ڵ�(10:����,20:����,30:����(����))
					cartMenuDivCode : cartMenuDivCode, // �޴������ڵ�(10:��ǰ,20:��Ʈ,30:����&����)
					cartMenuLagCode : cartMenuLagCode, // �޴���з��ڵ�
					cartMenuMidCode : cartMenuMidCode, // �޴��ߺз��ڵ�
					cartMenuSmlCode : cartMenuSmlCode, // �޴��Һз��ڵ�
					cartMenuSubCode : cartMenuSubCode, // �޴����з��ڵ�
					cartMenuPrice : cartMenuPrice, // �޴��ֹ��ܰ�
					cartMenuQty : cartMenuQty, // �޴��ֹ�����
					cartMenuAmt : cartMenuAmt, // �޴��ֹ��ݾ�
					cartMenuDisRate : cartMenuDisRate, // �޴�������
					cartMenuDisAmt : cartMenuDisAmt, // �޴����αݾ�
					cartMenuCopDisAmt : cartMenuCopDisAmt, // �޴���������������
					cartMenuNetSaleAmt : cartMenuNetSaleAmt, // �޴�������ݾ�
					cartMenuPayAmt : cartMenuPayAmt, // �޴������ݾ�
					cartMenuBakeCode : cartMenuBakeCode, // �޴�����ũ�ڵ�
					cartMenuCutCode : cartMenuCutCode, // �޴����ڵ�
					cartMenuCheeseCode : cartMenuCheeseCode, // �޴�ġ���ڵ�
					cartMenuSauceCode : cartMenuSauceCode, // �޴��ҽ��ڵ�
					cartMenuMessage : cartMenuMessage, // �޴����޸޼���
					cartMenuSize : cartMenuSize, // �޴�������
					cartMenuDough : cartMenuDough, // �޴���������
					cartMenuOption : cartMenuOption, // �޴� �ɼ�
					cartECouponCompany : cartECouponCompany, // E�������޻�
					cartECouponCode : cartECouponCode, // E�����ڵ�
					cartECouponNumber : cartECouponNumber, // E������ȣ
					cartSetMenuDetail : cartSetMenuDetail
				// ��Ʈ�޴���
				};
				//    		alert("objSetMenuInfo >>> "+objSetMenuInfo);

				var jsonSetMenuInfo = JSON.stringify(objSetMenuInfo); //json ���·� ��ȯ 
				cartSendDataInfo = {
					cartAction : cartAction, // ��ٱ���ó��
					cartMenuType : cartMenuType, // �޴�Ÿ��
					cartSetMenuInfo : jsonSetMenuInfo
				// ��Ʈ�޴�
				};
			}
			//��Ʈ�޴��� �ƴ� ��� �޴�
			else {
				var selected = $("#select_size option:selected"); //���ÿɼ�(������&����)

				cartAction = "addMenu"; // ��ٱ���ó��
				cartMenuType = ""; // �޴�Ÿ��
				cartMenuCode = selected.attr("value").split(",")[0] + "_"
						+ cartIndex; // �޴��ڵ�
				cartMenuName = $("h4").text(); // �޴���

				/* 20140428 �����÷��� �޴��� �ѱ۸� ǥ�� */
				if (cartMenuName.indexOf(")") > 0) {
					cartMenuName = cartMenuName.split("(")[0];
				}

				cartMenuOrdCode = "10"; // �޴��ֹ������ڵ�(10:����,20:����,30:����(����))
				cartMenuDivCode = selected.attr("value").split(",")[1]; // �޴������ڵ�(10:��ǰ,20:��Ʈ,30:����&����)
				cartMenuLagCode = menuLagCode; // �޴���з��ڵ�
				cartMenuMidCode = menuMidCode; // �޴��ߺз��ڵ�
				cartMenuSmlCode = selected.attr("value").split(",")[2]; // �޴��Һз��ڵ�
				cartMenuSubCode = menuSubCode; // �޴����з��ڵ�
				cartMenuPrice = selected.text().split("-")[1].replace(",", ""); // �޴��ֹ��ܰ�
				cartMenuQty = orderQty; // �޴��ֹ�����
				cartMenuAmt = selected.text().split("-")[1].replace(",", ""); // �޴��ֹ��ݾ�
				cartMenuDisRate = "0"; // �޴�������
				cartMenuDisAmt = "0"; // �޴����αݾ�
				cartMenuCopDisAmt = "0"; // �޴���������������
				cartMenuNetSaleAmt = selected.text().split("-")[1].replace(",",
						""); // �޴�������ݾ�
				cartMenuPayAmt = selected.text().split("-")[1].replace(",", ""); // �޴������ݾ�
				cartMenuBakeCode = ""; // �޴�����ũ�ڵ�
				cartMenuCutCode = ""; // �޴����ڵ�
				cartMenuCheeseCode = ""; // �޴�ġ���ڵ�
				cartMenuSauceCode = ""; // �޴��ҽ��ڵ�
				cartMenuMessage = ""; // �޴����޸޼���
				cartMenuSize = selected.text().split("-")[0]; // �޴�������
				cartMenuDough = menuDough; // �޴���������
				cartMenuOption = ""; // �޴��ɼ�
				cartECouponCompany = ""; // E�������޻�
				cartECouponCode = ""; // E�����ڵ�
				cartECouponNumber = ""; // E������ȣ

				// �޴���з��ڵ庰 �޴�Ÿ�� ����
				if (menuLagCode == "10") {
					cartMenuType = "typePizza";
				} // ����
				else if (menuLagCode == "20") {
					cartMenuType = "typeSide";
				} // ���̵�
				else if (menuLagCode == "30") {
					cartMenuType = "typeSauce";
				} // �ҽ�
				else if (menuLagCode == "40") {
					cartMenuType = "typeBever";
				} // ����
				/* 
				var menuAmt = parseInt(cartMenuPrice) * parseInt(cartMenuQty);
				cartMenuAmt    = String(menuAmt);  // �޴��ֹ��ݾ�
				cartMenuPayAmt = String(menuAmt);  // �޴������ݾ�
				 */
				var findMenuOptions = $(".option_box .spcInstructions li");
				var selMenuOptions = [];
				findMenuOptions.each(function(i, e) {
					selMenuOptions[i] = $(this).find("input:radio:checked")
							.val();
					if (i == 0) {
						cartMenuSauceCode = selMenuOptions[i];
					} // �޴��ҽ��ڵ� 
					if (i == 1) {
						cartMenuCheeseCode = selMenuOptions[i];
					} // �޴�ġ���ڵ� 
					if (i == 2) {
						cartMenuBakeCode = selMenuOptions[i];
					} // �޴�����ũ�ڵ� 
					if (i == 3) {
						cartMenuCutCode = selMenuOptions[i];
					} // �޴����ڵ�
				});
				cartMenuOption = selMenuOptions.join("/"); // �޴� �ɼ�

				cartSendDataInfo = {
					cartAction : cartAction, // ��ٱ���ó��
					cartMenuType : cartMenuType, // �޴�Ÿ��
					cartMenuCode : cartMenuCode, // �޴��ڵ�
					cartMenuName : cartMenuName, // �޴���
					cartMenuOrdCode : cartMenuOrdCode, // �޴��ֹ������ڵ�(10:����,20:����,30:����(����))
					cartMenuDivCode : cartMenuDivCode, // �޴������ڵ�(10:��ǰ,20:��Ʈ,30:����&����)
					cartMenuLagCode : cartMenuLagCode, // �޴���з��ڵ�
					cartMenuMidCode : cartMenuMidCode, // �޴��ߺз��ڵ�
					cartMenuSmlCode : cartMenuSmlCode, // �޴��Һз��ڵ�
					cartMenuSubCode : cartMenuSubCode, // �޴����з��ڵ�
					cartMenuPrice : cartMenuPrice, // �޴��ֹ��ܰ�
					cartMenuQty : cartMenuQty, // �޴��ֹ�����
					cartMenuAmt : cartMenuAmt, // �޴��ֹ��ݾ�
					cartMenuDisRate : cartMenuDisRate, // �޴�������
					cartMenuDisAmt : cartMenuDisAmt, // �޴����αݾ�
					cartMenuCopDisAmt : cartMenuCopDisAmt, // �޴���������������
					cartMenuNetSaleAmt : cartMenuNetSaleAmt, // �޴�������ݾ�
					cartMenuPayAmt : cartMenuPayAmt, // �޴������ݾ�
					cartMenuBakeCode : cartMenuBakeCode, // �޴�����ũ�ڵ�
					cartMenuCutCode : cartMenuCutCode, // �޴����ڵ�
					cartMenuCheeseCode : cartMenuCheeseCode, // �޴�ġ���ڵ�
					cartMenuSauceCode : cartMenuSauceCode, // �޴��ҽ��ڵ�
					cartMenuMessage : cartMenuMessage, // �޴����޸޼���
					cartMenuSize : cartMenuSize, // �޴�������
					cartMenuDough : cartMenuDough, // �޴���������
					cartMenuOption : cartMenuOption, // �޴� �ɼ�
					cartECouponCompany : cartECouponCompany, // E�������޻�
					cartECouponCode : cartECouponCode, // E�����ڵ�
					cartECouponNumber : cartECouponNumber
				// E������ȣ
				};
			}

			//���ǿ� ����
			$.ajax({
				url : "/order/newCart.jsp",
				type : "POST",
				data : cartSendDataInfo,
				dataType : "html",
				complete : function(result) {
					//�ٷ� �ֹ� ��ư�� ���� ��� ������ �̵� 
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
								"<p>��ٱ��Ͽ� �޴��� �߰��Ͽ����ϴ�!!<br>��ٱ��ϸ� Ȯ���ϼ���~</p>");
						//alertFrame.height(152);	//text�� 2���� ���
						parent.popAlert(alertFrame);
					} else {
						//alert("��ٱ��Ͽ� �޴��� �߰��Ͻ� �� �����ϴ�!!");
					}
				}
			});
		}
		////////////////////////////////////////////////////////////////////////////////////////////////////////////
	</script>
</body>
</html>