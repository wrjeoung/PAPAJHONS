<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<h1 class="hidden">메뉴 안내</h1>
<form id="f1" name="f1">
	<div id="menuBoxWrap">
		<div class="menuBox">
			<div class="menu" id="menu_0">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1018.png"
						alt="마가리타" title="마가리타" onerror="fnNoImages($(this))" />
				</p>

				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('마가리타,10,1018,4001,,0,,10 ',$(this));">
					<img src="../assets/img/sub/btn_detail.gif" alt="마가리타" />
				</p>
			</div>

			<div class="menu" id="menu_1">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1049.png"
						alt="프리미엄직화불고기" title="프리미엄직화불고기" onerror="fnNoImages($(this))" />
				</p>

				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('프리미엄직화불고기,10,1049,4001,,1,,10 ',$(this));">
					<img src="../assets/img/sub/btn_detail.gif" alt="프리미엄직화불고기" />
				</p>
			</div>


			<div class="menu" id="menu_2">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1019.png"
						alt="수퍼 파파스" title="수퍼 파파스" onerror="fnNoImages($(this))" />
				</p>

				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('수퍼 파파스,10,1019,4001,,2,,10 ',$(this));">
					<img src="../assets/img/sub/btn_detail.gif" alt="수퍼 파파스" />
				</p>
			</div>
		</div>
		<!--  
		<div class="menuBox">
			<div class="menu" id="menu_3">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1035.png"
						alt="아이리쉬 포테이토" title="아이리쉬 포테이토" onerror="fnNoImages($(this))" />
				</p>

				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('아이리쉬 포테이토,10,1035,4001,,3,,10 ',$(this));">
					<img src="assets/img/sub/btn_detail.gif" alt="아이리쉬 포테이토" />
				</p>
			</div>

			<div class="menu" id="menu_4">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1016.png"
						alt="존스 페이버릿 피자" title="존스 페이버릿 피자" onerror="fnNoImages($(this))" />
				</p>
				
				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('존스 페이버릿 피자,10,1016,4001,,4,,10 ',$(this));">
					<img src="assets/img/sub/btn_detail.gif" alt="존스 페이버릿 피자" />
				</p>
			</div>

			<div class="menu" id="menu_5">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1033.png"
						alt="스파이시 치킨 랜치" title="스파이시 치킨 랜치" onerror="fnNoImages($(this))" />
				</p>

				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('스파이시 치킨 랜치,10,1033,4001,,5,,10 ',$(this));">
					<img src="assets/img/sub/btn_detail.gif" alt="스파이시 치킨 랜치" />
				</p>
			</div>
		</div>

		<div class="menuBox">
			<div class="menu" id="menu_6">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1028.png"
						alt="식스 치즈 피자" title="식스 치즈 피자" onerror="fnNoImages($(this))" />
				</p>

				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('식스 치즈 피자,10,1028,4001,,6,,10 ',$(this));">
					<img src="assets/img/sub/btn_detail.gif" alt="식스 치즈 피자" />
				</p>
			</div>

			<div class="menu" id="menu_7">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1031.png"
						alt="치킨바베큐" title="치킨바베큐" onerror="fnNoImages($(this))" />
				</p>

				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('치킨바베큐,10,1031,4001,,7,,10 ',$(this));">
					<img src="assets/img/sub/btn_detail.gif" alt="치킨바베큐" />
				</p>
			</div>


			<div class="menu" id="menu_8">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1013.png"
						alt="올미트" title="올미트" onerror="fnNoImages($(this))" />
				</p>

				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('올미트,10,1013,4001,,8,,10 ',$(this));">
					<img src="assets/img/sub/btn_detail.gif" alt="올미트" />
				</p>
			</div>
		</div>

		<div class="menuBox">
			<div class="menu" id="menu_9">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1006.png"
						alt="페페로니" title="페페로니" onerror="fnNoImages($(this))" />
				</p>

				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('페페로니,10,1006,4001,,9,,10 ',$(this));">
					<img src="assets/img/sub/btn_detail.gif" alt="페페로니" />
				</p>
			</div>


			<div class="menu" id="menu_10">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1022.png"
						alt="하와이안" title="하와이안" onerror="fnNoImages($(this))" />
				</p>

				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('하와이안,10,1022,4001,,10,,10 ',$(this));">
					<img src="assets/img/sub/btn_detail.gif" alt="하와이안" />
				</p>
			</div>


			<div class="menu" id="menu_11">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1020.png"
						alt="가든 스페셜" title="가든 스페셜" onerror="fnNoImages($(this))" />
				</p>

				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('가든 스페셜,10,1020,4001,,11,,10 ',$(this));">
					<img src="assets/img/sub/btn_detail.gif" alt="가든 스페셜" />
				</p>
			</div>
		</div>

		<div class="menuBox">
			<div class="menu" id="menu_12">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1037.png"
						alt="치킨 수퍼파파스" title="치킨 수퍼파파스" onerror="fnNoImages($(this))" />
				</p>

				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('치킨 수퍼파파스,10,1037,4001,,12,,10 ',$(this));">
					<img src="assets/img/sub/btn_detail.gif" alt="치킨 수퍼파파스" />
				</p>
			</div>


			<div class="menu" id="menu_13">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1042.png"
						alt="멜로우 머쉬룸" title="멜로우 머쉬룸" onerror="fnNoImages($(this))" />
				</p>

				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('멜로우 머쉬룸,10,1042,4001,,13,,10 ',$(this));">
					<img src="assets/img/sub/btn_detail.gif" alt="멜로우 머쉬룸" />
				</p>
			</div>


			<div class="menu" id="menu_14">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1021.png"
						alt="핫앤스파이시 멕시칸" title="핫앤스파이시 멕시칸" onerror="fnNoImages($(this))" />
				</p>

				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('핫앤스파이시 멕시칸,10,1021,4001,,14,,10 ',$(this));">
					<img src="assets/img/sub/btn_detail.gif" alt="핫앤스파이시 멕시칸" />
				</p>
			</div>
		</div>

		<div class="menuBox">
			<div class="menu" id="menu_15">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1041.png"
						alt="트윈 크러스트 딜라이트" title="트윈 크러스트 딜라이트"
						onerror="fnNoImages($(this))" />
				</p>

				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('트윈 크러스트 딜라이트,10,1041,4001,,15,,10 ',$(this));">
					<img src="assets/img/sub/btn_detail.gif" alt="트윈 크러스트 딜라이트" />
				</p>
			</div>

			<div class="menu" id="menu_16">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1007.png"
						alt="스파이시 이탈리안" title="스파이시 이탈리안" onerror="fnNoImages($(this))" />
				</p>

				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('스파이시 이탈리안,10,1007,4001,,16,,10 ',$(this));">
					<img src="assets/img/sub/btn_detail.gif" alt="스파이시 이탈리안" />
				</p>
			</div>

			<div class="menu" id="menu_17">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1047.png"
						alt="치킨 까르보나라" title="치킨 까르보나라" onerror="fnNoImages($(this))" />
				</p>

				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('치킨 까르보나라,10,1047,4001,,17,,10 ',$(this));">
					<img src="assets/img/sub/btn_detail.gif" alt="치킨 까르보나라" />
				</p>
			</div>
		</div>

		<div class="menuBox">
			<div class="menu" id="menu_18">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1046.png"
						alt="베이컨 치즈버거" title="베이컨 치즈버거" onerror="fnNoImages($(this))" />
				</p>

				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('베이컨 치즈버거,10,1046,4001,,18,,10 ',$(this));">
					<img src="assets/img/sub/btn_detail.gif" alt="베이컨 치즈버거" />
				</p>
			</div>


			<div class="menu" id="menu_19">
				<p class="m_list">
					<img class="img" src="/assets/img/menu/img/10/list_img_1048.png"
						alt="스파이시 삼바" title="스파이시 삼바" onerror="fnNoImages($(this))" />
				</p>

				<p class="b_detail" style="cursor: pointer"
					onclick="fnMenuInfo('스파이시 삼바,10,1048,4001,,19,,10 ',$(this));">
					<img src="assets/img/sub/btn_detail.gif" alt="스파이시 삼바" />
				</p>
			</div>
		</div>
		-->
</form>
<!-- ///////////////////////////// 20131108 알림 팝업 적용 /////////////////////////////-->
<!-- ///////////////////////////// 메뉴추가알림, 장바구니 수량제한 알림 /////////////////////////////-->
<div class="notice" id="notice_caution">
	<div class="header">
		<div class="left"></div>
		<div class="center">
			<h2>알림!!</h2>
		</div>
		<div class="right"></div>
	</div>
	<div id="alertText" class="text_body"></div>
	<!-- //comm_list -->
	<div class="footer">
		<div class="button">
			<button class="alertBtn gray" type="button"
				onclick="del_pop2('#notice_caution');">확 인</button>
		</div>
		<div class="left"></div>
		<div class="center"></div>
		<div class="right"></div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		//페이지 시작 시로딩 이미지 숨기기
		$('#viewLoading').hide();
		$('#viewLoading') // ajax 실행 및 완료시 'Loading 이미지'의 동작 컨트롤하기
		.ajaxStart(function() {
			$(this).fadeIn(500);
		}).ajaxStop(function() {
			$(this).fadeOut(500);
		});
	});

	var $container = $("#menuBoxWrap");
	var $box = $container.find(".menuBox").children();
	var $btn = $(".b_detail");
	var $btn_close = $container.find($(".btn_close"));
	var $active = $container.find(".active");
	var state = false;

	function details_close() {
		$btn.removeClass("active");
		$("#detail_con").remove();
		state = false;

		menuLoad();
	}

	$box.each(function(i) {
		$box.eq(i).addClass("box" + i);

	});

	$btn.bind("mouseenter", fn_over);
	function fn_over() {
		$(this).find("img").attr("src", "../assets/img/sub/btn_detail_on.gif");
	};

	$btn.bind("mouseleave", fn_out);
	function fn_out() {
		$(this).find("img").attr("src", "assets/img/sub/btn_detail.gif");
	}

	function menuLoad() {
		$btn.each(function(i) {
			if ($btn.eq(i).hasClass("active")) {
				$btn.eq(i).find("img").attr("src",
						"../assets/img/sub/btn_detail_on.gif");
				$btn.eq(i).unbind("mouseenter", fn_over);
				$btn.eq(i).unbind("mouseleave", fn_out);
			} else {
				$btn.eq(i).find("img").attr("src",
						"../assets/img/sub/btn_detail.gif");
				$btn.eq(i).bind("mouseenter", fn_over);
				$btn.eq(i).bind("mouseleave", fn_out);
			}
		});
	}

	/*  0401 수정부분 시작  */
	function removeActive() {
		$btn.each(function(i) {
			if ($btn.eq(i).hasClass("active")) {
				$(this).removeClass("active");
			}
		});
	}

	$btn.click(function() {
		//20130415 onclick > fnMenuInfo로 대체함
	});

	function fnMenuInfo(menu_info, $this) {
		var thisMenu = new MenuClass(menu_info);
		var srcUrl = thisMenu.srcUrl();

		if (state == false) {
			$("#detail_con").remove();
			var html = '<div id="detail_con" style="width:100%; height:auto; clear:both; border-bottom:dotted 1px #ccc;  border-bottom:dotted 1px #ccc; border-top:dotted 1px #ccc; padding:0 0 5px 0;"><iframe width="100%" src="'
					+ srcUrl
					+ '" frameborder=0>아이프레임이 지원하는 브라우저에서 확인가능합니다.</iframe></div>';
			$this.parent().parent().append(html);
			removeActive();
			$this.addClass("active");
			menuLoad();
		}
	}

	function MenuClass(menu_info) {
		var recieveMenu = menu_info.split(",");

		//		this.menuName     = recieveMenu[0];  // 메뉴명
		this.menuName = ""; // 메뉴명
		this.menuLagCode = recieveMenu[1]; // 메뉴대분류코드
		this.menuMidCode = recieveMenu[2]; // 메뉴중분류코드
		this.menuSubCode = recieveMenu[3]; // 메뉴세분류코드
		this.menuDtlImage = recieveMenu[4]; // 온라인메뉴상세이미지파일
		this.menuSeq = recieveMenu[5]; // 메뉴순번
		this.menuCode = recieveMenu[6]; // 메뉴코드
		this.onGrpCode = recieveMenu[7]; // 온라인메뉴그룹코드

		// 20140429 베스트메뉴 구분값 추가
		this.srcUrl = function() {
			return "../menu/contentDetail.jsp?menuName=" + this.menuName
					+ "&menuLagCode=" + this.menuLagCode + "&menuMidCode="
					+ this.menuMidCode + "&menuSubCode=" + this.menuSubCode
					+ "&menuDtlImage=" + this.menuDtlImage + "&menuSeq="
					+ this.menuSeq + "&menuCode=" + this.menuCode
					+ "&onGrpCode=" + this.onGrpCode + "&bestOnlineGroupCd="
					+ 10;
		};
	}

	//image not found 처리 
	//$this : ".m_list>img"  
	function fnNoImages($this) {
		$this.css("display", "none");
		$this
				.parent()
				.append(
						"<div style='width:198px; height:213px; margin-bottom:5px; border:2px solid #eee;'><br><span style='font-weight: bold; font-size:14px;'>"
								+ $this.attr("alt")
								+ "</span><br><img src='/assets/img/menu/img/list_noImage2.png' alt='"
								+ $this.attr("alt")
								+ "' title='"
								+ $this.attr("alt") + "'></div>");
	}
</script>