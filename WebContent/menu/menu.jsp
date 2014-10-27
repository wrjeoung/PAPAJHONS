<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 class="hidden">메뉴 안내</h1>
<form id="f1" name="f1">
	<div id="menuBoxWrap">
		<%-- 
		<c:if test="${ param.menuId eq 'pj_2013' }"> <!-- 음료 -->
			<c:forEach var="li" items="${list}" varStatus="status">
				<c:if test="${status.count % 3 == 1 }"><div class="menuBox"></c:if>
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
				<c:if test="${status.count % 3 == 0 }"></div></c:if>
			</c:forEach>
		</c:if>
		--%>
		<c:forEach var="li" items="${list}" varStatus="status">
			<c:if test="${status.count % 3 == 1 }"><div class="menuBox"></c:if>
				<div class="menu" id="menu_0">
					<p class="m_list">
						<img class="img" src="${li.imagepath1}"
							alt="${li.name}" title="${li.name}" onerror="fnNoImages($(this))" />
					</p>
					<p class="b_detail" style="cursor: pointer"
						onclick="fnMenuInfo('${li.name},<c:if test="${li.name != null}">sfaf</c:if>,1018,4001,,0,,10 ',$(this));">
						<img src="../assets/img/sub/btn_detail.gif" alt="마가리타" />
					</p>
				</div>
			<c:if test="${status.count % 3 == 0 }"></div></c:if>
		</c:forEach>
	</div>
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
		$(this).find("img").attr("src", "../assets/img/sub/btn_detail.gif");
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
		console.log(recieveMenu);
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
			return "./detail.jsp?menuName=" + this.menuName
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
