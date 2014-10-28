<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div id="store_section">
	<h1 class="title"><img src="../assets/img/customer/openStore_title.gif" alt="신규오픈매장" /></h1>
	<div id="openStore_section">
		<p class="prev" style="">
			<button type="button"><img src="../assets/img/btn/slideBtn_up.gif" alt="이전매장" /></button>
		</p>
		<p class="next">
			<button type="button"><img src="../assets/img/btn/slideBtn_down.gif" alt="다음매장" /></button>
		</p>
		
		<ul class="list_box">
			<li class="item">
				<div class="store">
					<p class="photo">
						<img src="assets/img/customer/store_photo/str_1114.jpg" alt="" width="130px" height="85px"
							onerror="this.src='/assets/img/customer/store_photo/str_img.jpg'" />
					</p>
					<ul class="info">
						<li>
							<span class="tit">매장명 : </span>
							<span id="new_list_storeNm">부산시청점</span>
							<span class="btn_h23 green">
								<button type="button" id="부산시청점a" name="부산시청점a" 	onclick="goMap(this.id);">지도보기</button>
								<input type="hidden" id="storeCode" name="storeCode" value="1114">
								<input type="hidden" id="StoreNm_X" name="StoreNm_X" value="129.0745495">
								<input type="hidden" id="StoreNm_Y" name="StoreNm_Y" value="35.1767099">
							</span>
						</li>
						<li><span class="tit">전화번호 : </span><span>051-866-8082</span></li>
						<li><span class="tit">매장주소 : </span><span>부산광역시 부산진구 양정동 147-8</span></li>
						<li><span class="tit">영업시간 : </span><span>오전 11:00 ~ 오후 10:30</span></li>
						<li><span class="tit">매장타입 : </span><span>Delivery</span></li>
						<li><span class="tit">주차여부 : </span><span>주차불가</span></li>
					</ul>
				</div>
				<p class="new"><img src="../assets/img/customer/new.png" alt="new" /></p>
			</li>

			<li class="item">
				<div class="store">
					<p class="photo">
						<img src="assets/img/customer/store_photo/str_1117.jpg" alt="" width="130px" height="85px"
							onerror="this.src='/assets/img/customer/store_photo/str_img.jpg'" />
					</p>
					<ul class="info">
						<li>
							<span class="tit">매장명 : </span>
							<span id="new_list_storeNm">원주단구점</span>
							<span class="btn_h23 green">
								<button type="button" id="원주단구점a" name="원주단구점a" onclick="goMap(this.id);">지도보기</button>
								<input type="hidden" id="storeCode" name="storeCode" value="1117">
								<input type="hidden" id="StoreNm_X" name="StoreNm_X" value="127.9595151">
								<input type="hidden" id="StoreNm_Y" name="StoreNm_Y" value="37.3245189">
							</span>
						</li>
						<li><span class="tit">전화번호 : </span><span>033-764-8050</span></li>
						<li><span class="tit">매장주소 : </span><span>강원도 원주시 단구동 128-15</span></li>
						<li><span class="tit">영업시간 : </span><span>오전 11:00 ~ 오후 10:30</span></li>
						<li><span class="tit">매장타입 : </span><span>Delivery + Dine-in</span></li>
						<li><span class="tit">주차여부 : </span><span>주차불가</span></li>
					</ul>
				</div>
				<p class="new"><img src="../assets/img/customer/new.png" alt="new" /></p>
			</li>

			<li class="item">
				<div class="store">
					<p class="photo">
						<img src="assets/img/customer/store_photo/str_1115.jpg" alt="" width="130px" height="85px"
							onerror="this.src='/assets/img/customer/store_photo/str_img.jpg'" />
					</p>
					<ul class="info">
						<li>
							<span class="tit">매장명 : </span>
							<span id="new_list_storeNm">망우점</span>
							<span class="btn_h23 green">
								<button type="button" id="망우점a" name="망우점a" onclick="goMap(this.id);">지도보기</button>
								<input type="hidden" id="storeCode" name="storeCode" value="1115">
								<input type="hidden" id="StoreNm_X" name="StoreNm_X" value="127.0931612">
								<input type="hidden" id="StoreNm_Y" name="StoreNm_Y" value="37.5984870">
							</span>
						</li>
						<li><span class="tit">전화번호 : </span><span>02-435-8045</span></li>
						<li><span class="tit">매장주소 : </span><span>서울특별시 중랑구 상봉동 74-10</span></li>
						<li><span class="tit">영업시간 : </span><span>오전 11:00 ~ 오후 10:30</span></li>
						<li><span class="tit">매장타입 : </span><span>Delivery + Dine-in</span></li>
						<li><span class="tit">주차여부 : </span><span>주차불가</span></li>
					</ul>
				</div>
				<p class="new"><img src="../assets/img/customer/new.png" alt="new" /></p>
			</li>
		</ul>
	</div>

	<script type="text/javascript">
		newStore("#openStore_section")
		//20140219 검색버튼 enter key 이벤트 처리
		function CheckEnt(val) {
			if (event.keyCode == 13) {
				fnSearchStrName();
			}
		}
	</script>

	<!-- 매장 검색 -->
	<h1 class="title"><img src="../assets/img/customer/storeSearch_title.gif" alt="매장검색" /></h1>
	<div id="search_store">
		<ul class="search_map">
			<li><img src="../assets/img/map/m0.gif" alt="전체지도" usemap="#Map" /></li>
			<li><img src="../assets/img/map/m1.gif" alt="서울" usemap="#Map" /></li>
			<li><img src="../assets/img/map/m2.gif" alt="경기도" usemap="#Map" /></li>
			<li><img src="../assets/img/map/m3.gif" alt="인천" usemap="#Map" /></li>
			<li><img src="../assets/img/map/m4.gif" alt="대전" usemap="#Map" /></li>
			<li><img src="../assets/img/map/m5.gif" alt="충청남도" usemap="#Map" /></li>
			<li><img src="../assets/img/map/m6.gif" alt="충청북도" usemap="#Map" /></li>
			<li><img src="../assets/img/map/m7.gif" alt="전라북도" usemap="#Map" /></li>
			<li><img src="../assets/img/map/m8.gif" alt="전라남도" usemap="#Map" /></li>
			<li><img src="../assets/img/map/m9.gif" alt="광주" usemap="#Map" /></li>
			<li><img src="../assets/img/map/m10.gif" alt="경상남도" usemap="#Map" /></li>
			<li><img src="../assets/img/map/m11.gif" alt="경상북도" usemap="#Map" /></li>
			<li><img src="../assets/img/map/m12.gif" alt="부산" usemap="#Map" /></li>
			<li><img src="../assets/img/map/m13.gif" alt="울산" usemap="#Map" /></li>
			<li><img src="../assets/img/map/m14.gif" alt="강원도" usemap="#Map" /></li>
			<li><img src="../assets/img/map/m15.gif" alt="대구" usemap="#Map" /></li>
			<li><img src="../assets/img/map/m16.gif" alt="제주도" usemap="#Map" /></li>
		</ul>
		<map name="Map" id="Map">
			<area shape="poly" coords="54,66,69,55,76,68,70,79,54,73,51,65" href="JavaScript:;" id="11" alt="서울"
				onclick="search_Address_Map(this.id);" title="#m1" />
			<area shape="poly"
				coords="57,67,50,69,43,57,51,45,58,29,75,25,91,56,101,65,104,88,101,90,85,105,57,106,45,95,51,76,77,74,78,64,67,57,56,76"
				href="JavaScript:;" id="41" alt="경기도" onclick="search_Address_Map(this.id);" title="#m2" />
			<area shape="poly" coords="52,72,44,67,36,43,23,59,35,76,43,77" href="JavaScript:;" id="28" alt="인천" onclick="search_Address_Map(this.id);" title="#m3" />
			<area shape="circle" coords="84,142,11" href="JavaScript:;" id="30" alt="대전" onclick="search_Address_Map(this.id);" title="#m4" />
			<area shape="poly" coords="82,119,76,110,30,100,18,125,44,163,63,153,78,157,72,144"
				href="JavaScript:;" id="44" alt="충청남도" onclick="search_Address_Map(this.id);" title="#m5" />
			<area shape="poly" coords="83,124,83,108,110,89,132,90,144,98,129,112,108,123,116,153,99,163,98,138" href="JavaScript:;" id="43" alt="충청북도"
				onclick="search_Address_Map(this.id);" title="#m6" />
			<area shape="circle" coords="46,226,11" href="JavaScript:;" id="29" alt="광주" onclick="search_Address_Map(this.id);" title="#m9" />
			<area shape="poly" coords="85,205,63,200,39,202,40,166,67,156,85,162,106,167,96,191,95,198" 
				href="JavaScript:;" id="45" alt="전라북도" onclick="search_Address_Map(this.id);" title="#m7" />
			<area shape="poly" coords="43,201,16,219,11,254,8,279,105,251,100,225,90,209,46,200" href="JavaScript:;" id="46" alt="전라남도"
				onclick="search_Address_Map(this.id);" title="#m8" />
			<area shape="poly" coords="112,244,96,199,107,173,141,186,166,202,137,226,144,235,143,252,129,238" 
				href="JavaScript:;" id="48" alt="경상남도" onclick="search_Address_Map(this.id);" title="#m10" />
			<area shape="poly" coords="113,164,124,146,112,123,133,113,182,92,190,152,190,179,164,179,154,157"
				href="JavaScript:;" id="47" alt="경상북도" onclick="search_Address_Map(this.id);" title="#m11" />
			<area shape="circle" coords="180,193,12" href="JavaScript:;" id="31" alt="울산" onclick="search_Address_Map(this.id);" title="#m13" />
			<area shape="poly" coords="141,227,170,203,181,208,162,226" href="JavaScript:;" id="26" alt="부산" onclick="search_Address_Map(this.id);" title="#m12" />
			<area shape="circle" coords="146,175,15" href="JavaScript:;" id="27" alt="대구" onclick="search_Address_Map(this.id);" title="#m15" />
			<area shape="poly" coords="74,22,132,13,185,91,156,97,117,89,107,70" href="JavaScript:;" id="42" alt="강원도" onclick="search_Address_Map(this.id);" title="#m14" />
			<area shape="circle" coords="42,298,18" href="JavaScript:;" id="50" alt="제주도" onclick="search_Address_Map(this.id);" title="#m16" />
		</map>

		<div class="form" id="store_search_form">
			<form id="searchForm" name="searchForm" method="post"
				onsubmit="return false;">
				<!--   onsubmit="return false;" -->
				<input type="hidden" id="actionFlag" name="actionFlag" value="null">
				<input type="hidden" id="srch_region" name="srch_region" value="null">
				<!-- 지역명 -->
				<input type="hidden" id="srch_sigungu" name="srch_sigungu" value="null">
				<!-- 시군구명 -->
				<input type="hidden" id="srch_store" name="srch_store" value="null">
				<!-- 매장코드 -->
				<input type="hidden" id="srch_word" name="srch_word" value="null">
				<!-- 검색어 -->
				<input type="hidden" id="xMap" name="xMap" value="">
				<!-- 지도 x좌표 -->
				<input type="hidden" id="yMap" name="yMap" value="">
				<!-- 지도 y좌표 -->
				<input type="hidden" id="tab" name="tab" value="">
				<!-- 탭번호 -->
				<input type="hidden" id="storecd" name="storecd" value="">
				<!-- 매장코드 -->
				<input type="hidden" id="inCurPage" name="inCurPage" value="1">
				<!-- 현재 페이지 -->
				<input type="hidden" id="inCurBlock" name="inCurBlock" value="1">
				<!-- 현재 블럭 -->
				<input type="hidden" id="inRowPerPage" name="inRowPerPage" value="5">
				<!-- 한 페이지당 표시할 레코드 수 -->
				<input type="hidden" id="inPagePerBlock" name="inPagePerBlock" value="3">
				<!-- 한 블럭당 할당된 페이지 수 -->
				<input type="hidden" id="enterFlag" name="enterFlag" value="">

				<fieldset style="border: 10x solid #f00;">
					<legend>매장검색</legend>
					<h5><img src="../assets/img/customer/resion_title.gif" alt="지역검색" /></h5>
					<p>
						<label for="select_region" style="display: none">지역선택</label>
						<select id="select_region" name="select_region" style="width: 100px">
							<option value="">시/도 선택</option>
							<option value="42">강원도</option>
							<option value="41">경기도</option>
							<option value="48">경상남도</option>
							<option value="47">경상북도</option>
							<option value="29">광주광역시</option>
							<option value="27">대구광역시</option>
							<option value="30">대전광역시</option>
							<option value="26">부산광역시</option>
							<option value="11">서울특별시</option>
							<option value="31">울산광역시</option>
							<option value="28">인천광역시</option>
							<option value="46">전라남도</option>
							<option value="45">전라북도</option>
							<option value="50">제주특별자치</option>
							<option value="44">충청남도</option>
							<option value="43">충청북도</option>
						</select> 
						<label for="select_gu" style="display: none">구/군선택</label>
						<select id="select_gu" name="select_gu" style="width: 120px">
							<option value="">구 또는 군을 선택하세요.</option>
							<option value="29200">광산구</option>
							<option value="29155">남구</option>
							<option value="29110">동구</option>
							<option value="29170">북구</option>
							<option value="29140">서구</option>
						</select>
						</select>
						<label for="select_store" style="display: none;">매장선택</label>
						<select id="select_store" name="select_store" style="width: 170px">
							<option value="">지역을 먼저 선택해 주세요</option>
						</select>
					</p>
					<p>
						<label for="store_name">
						<img src="../assets/img/forms/store_name.gif" alt="매장명검색" /></label>
						<input type="text" id="store_name" name="store_name" style="width: 150px" onkeydown="CheckEnt()" />
						<span class="btn_h23 gray">
							<button type="button" id="btn_searchAdd" name="btn_searchAdd" onclick="fnSearchStrName();">검색</button>
						</span>
					</p>
				</fieldset>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		searchMap(".search_map");
	</script>

	<!-- 매장 리스트 -->
	<h4 class="title"><img src="../assets/img/customer/listStore_title.gif" alt="매장리스트" /></h4>
	<div id="store_list">
		<ul class="store">
			<li class="list">
				<p class="photo">
					<img src="assets/img/customer/store_photo/str_1068.jpg" alt="강남CGV점 사진" width="100px" height="75px"
						onerror="this.src=&quot;/assets/img/customer/store_photo/str_img.jpg&quot;">
				</p>
				<ul class="info">
					<li><span class="tit">매장명 : </span><span>강남CGV점</span></li>
					<li><span class="tit">전화번호 : </span><span>02-501-5245</span></li>
					<li><span class="tit">매장주소 : </span><span>서울특별시 강남구 역삼동(역삼1동) 814-6</span></li>
					<li><span class="tit">영업시간 : </span><span>오전 11:00 ~ 오후 10:30</span></li>
					<li><span class="tit">매장타입 : </span><span>Full Dine-in</span></li>
					<li><span class="tit">주차여부 : </span><span>주차불가</span></li>
				</ul>
				<p class="map">
					<span class="btn_h23 green">
					<button type="button" id="강남CGV점" name="강남CGV점" onclick="goMap(this.id);">지도보기</button>
					<input type="hidden" id="StoreNm_X" name="StoreNm_X" value="127.026339"><input type="hidden" id="StoreNm_Y" name="StoreNm_Y" value="37.501709">
					<input type="hidden" id="storeCode" name="storeCode" value="1068"></span>
				</p>
			</li>
			
			<li class="list">
				<p class="photo">
					<img src="assets/img/customer/store_photo/str_1113.jpg" alt="개봉점 사진" width="100px" height="75px" 
						onerror="this.src=&quot;/assets/img/customer/store_photo/str_img.jpg&quot;">
				</p>
				<ul class="info">
					<li><span class="tit">매장명 : </span><span>개봉점</span></li>
					<li><span class="tit">전화번호 : </span><span>02-2614-0814</span></li>
					<li><span class="tit">매장주소 : </span><span>서울특별시 구로구 개봉동 	146-5</span></li>
					<li><span class="tit">영업시간 : </span><span>오전 11:00 ~ 오후 10:30</span></li>
					<li><span class="tit">매장타입 : </span><span>Delivery + Dine-in</span></li>
					<li><span class="tit">주차여부 : </span><span>주차불가</span></li>
				</ul>
				<p class="map">
					<span class="btn_h23 green"><button type="button" id="개봉점" name="개봉점" onclick="goMap(this.id);">지도보기</button>
						<input type="hidden" id="StoreNm_X" name="StoreNm_X" value="126.8552931">
						<input type="hidden" id="StoreNm_Y" name="StoreNm_Y" value="37.4975539">
						<input type="hidden" id="storeCode" name="storeCode" value="1113"></span>
				</p>
			</li>
			
			<li class="list"><p class="photo">
					<img src="assets/img/customer/store_photo/str_1089.jpg" alt="개포점 사진" width="100px" height="75px"
						onerror="this.src=&quot;/assets/img/customer/store_photo/str_img.jpg&quot;">
				</p>
				<ul class="info">
					<li><span class="tit">매장명 : </span><span>개포점</span></li>
					<li><span class="tit">전화번호 : </span><span>02-572-4894</span></li>
					<li><span class="tit">매장주소 : </span><span>서울특별시 강남구 개포동(개포4동) 1229-12</span></li>
					<li><span class="tit">영업시간 : </span><span>오전 11:00 ~ 오후 10:30</span></li>
					<li><span class="tit">매장타입 : </span><span>Delivery + Dine-in</span></li>
					<li><span class="tit">주차여부 : </span><span>주차불가</span></li>
				</ul>
				<p class="map">
					<span class="btn_h23 green"><button type="button" id="개포점" name="개포점" onclick="goMap(this.id);">지도보기</button>
						<input type="hidden" id="StoreNm_X" name="StoreNm_X" value="127.046425"><input type="hidden" id="StoreNm_Y"
						name="StoreNm_Y" value="37.4763263"><input type="hidden" id="storeCode" name="storeCode" value="1089"></span>
				</p>
			</li>	
		</ul>
		
		<p class="page">
			<img src="../assets/img/btn/btn_first.gif" alt="처음페이지">
			<img src="../assets/img/btn/btn_prev.gif" alt="이전페이지">&nbsp;
			<a href="JavaScript:;">1</a>&nbsp;
			<a href="JavaScript:goSearchPage('2','1','name');" onfocus="this.blur()">2</a>&nbsp;
			<a href="JavaScript:goSearchPage('3','1','name');" onfocus="this.blur()">3</a>&nbsp;
			<a href="JavaScript:goSearchPage('4','2','name');" onfocus="this.blur()">
			<img src="../assets/img/btn/btn_next.gif" alt="다음페이지"></a>
			<a href="JavaScript:goSearchPage('17','6','name');" onfocus="this.blur()">
			<img src="../assets/img/btn/btn_last.gif" alt="마지막페이지"></a>
		</p>
	</div>
</div>

<!--20131212  알럿 변경-->
<div class="notice" id="notice_store"
	style="display: none; width: 340px; height: auto; min-height: 140px; padding: 1px; position: absolute; top: 0; left: 0; z-index: 1000;">
	<div class="header">
		<div class="left"
			style="float: left; width: 6px; background: url(../assets/img/usa/modal_header_left.png) top left no-repeat;"></div>
		<div class="center"
			style="float: left; width: 328px; height: 40px; background: url(../assets/img/usa/modal_header_center.png) top center repeat-x;">
			<h2>알림!!</h2>
		</div>
		<div class="right"
			style="float: right; width: 6px; height: 40px; background: url(../assets/img/usa/modal_header_right.png) top right no-repeat;"></div>
	</div>
	<div id="alertText" class="text_body"
		style="width: 340px; height: auto; min-height: 90px; line-height: 30px; background: #fff; border: 0px none; padding: 8px 0px;">
		<br>
		<p></p>
	</div>
	<div class="footer"
		style="position: absolute; height: 32px; background: #fff;">
		<div class="button" style="bottom: 20px;">
			<button class="alertBtn gray" type="button"
				onclick="del_pop2('#notice_store'); $('#store_name').focus();">확
				인</button>
		</div>
		<div class="left"
			style="float: left; width: 6px; height: 8px; background: url(../assets/img/usa/modal_footer_left.png) bottom left no-repeat;"></div>
		<div class="center"
			style="float: left; width: 328px; height: 8px; background: url(../assets/img/usa/modal_footer_center.png) bottom center repeat-x;"></div>
		<div class="right"
			style="float: right; width: 6px; height: 8px; background: url(../assets/img/usa/modal_footer_right.png) bottom right no-repeat;"></div>
	</div>
</div>
<script type="text/javascript">
	isSubmitted = false;
	var alertFrame = $("#notice_store");
	$(document).ready(
			function() {
				//페이지 시작 시 로딩 이미지 숨기기
				$('#viewLoading').hide();
				$('#viewLoading') // ajax 실행 및 완료시 'Loading 이미지'의 동작 컨트롤하기
				.ajaxStart(function() {
					$(this).fadeIn(500);
				}).ajaxStop(function() {
					$(this).fadeOut(500);
				});

				var inCurPage = $("#inCurPage").val();
				var inCurBlock = $("#inCurBlock").val();
				var actionFlag = $("#actionFlag").val();
				var region = $("#srch_region").val();
				var sigungu = $("#srch_sigungu").val();
				var store = $("#srch_store").val();

				//지역, 매장 콤보리스트 생성
				$.getJSON("customer/combo_region_list.jsp", function(data) {
					var str = "<option value=''>시/도 선택</option>";

					for (var i = 0; i < data.store.length; i++) {
						var sto = data.store[i];

						str = str + "<option value='" + sto.code + "'>"
								+ sto.name + "</option>";
					}

					$("#select_region").html(str);
					$("#select_gu").html("<option value=''>구/군선택</option>");
					$("#select_store").html(
							"<option vlaue=''>지역을 먼저 선택해 주세요</option>");
				});

				if (actionFlag != "" && actionFlag != "null") {
					goSearchPage(inCurPage, inCurBlock, actionFlag);
				} else {
					if ($("#srch_word").val("") == "null") {
						$("#srch_word").val("");
					}
					goSearchPage('1', '1', 'name'); // 20140305 초기 로드시 전체매장 검색
				}

			});

	//지역 선택시 시군구리스트 생성
	$("#select_region").change(
			function() {
				var region = $("#select_region option:selected").val();
				var region_text = $("#select_region option:selected").text();

				$("#srch_region").val(region);
				$("#srch_sigungu").val("");
				$("#srch_store").val("");
				$("#srch_word").val("");

				if ($("#srch_region").val() == "") {
					goSearchPage('1', '1', 'combo');
				} else {
					goSearchPage('1', '1', 'map');
				}

				$("#srch_region").val(region);
				$("#srch_store").val("");
				$("#srch_word").val("");

				$("#select_gu").val("");
				$("#select_gu").html("<option value=''>구/군선택</option>");
				$("#select_store").html(
						"<option value=''>지역을 먼저 선택해 주세요</option>");

				$.getJSON("customer/combo_sigungu_list.jsp?addrSiCode="
						+ region, function(data) {
					var str = "<option value=''>구 또는 군을 선택하세요.</option>";

					for (var i = 0; i < data.store.length; i++) {
						var sto = data.store[i];

						str = str + "<option value='" + sto.code + "'>"
								+ sto.name + "</option>";
					}
					$("#select_gu").html(str);
				});

				//goSearchPage('1', '1', 'combo');

			});

	//시군구 선택시 지역별 매장콤보리스트와 매장리스트 생성
	$("#select_gu").change(
			function() {
				var region = $("#select_region option:selected").val();
				var region_text = $("#select_region option:selected").text();
				var sigungu = $("#select_gu option:selected").val();
				var sigungu_text = $("#select_gu option:selected").text();
				var $store_list = $("#store_list ul.store");

				$("#srch_region").val(region);
				$("#srch_sigungu").val(sigungu);
				$("#srch_store").val("");
				$("#srch_word").val("");

				$.getJSON("customer/combo_detail_list.jsp?addrGuCode="
						+ sigungu, function(data) {
					var str = "<option value=''>매장을 선택하세요.</option>";

					for (var i = 0; i < data.store.length; i++) {
						var sto = data.store[i];

						str = str + "<option value='" + sto.code + "'>"
								+ sto.name + "</option>";
					}
					$("#select_store").html(str);
				});

				//시,도 전체 검색
				if ($("#srch_sigungu").val() == "") {
					goSearchPage('1', '1', 'map');
				} else {
					goSearchPage('1', '1', 'combo');
				}

			});

	//선택한 매장의 매장리스트
	$("#select_store").change(function() {
		var region = $("#select_region option:selected").val();
		var sigungu = $("#select_gu option:selected").val();
		var store = $("#select_store option:selected").val();

		$("#srch_region").val(region);
		$("#srch_sigungu").val(sigungu);
		$("#srch_store").val(store);
		$("#srch_word").val("");

		//if( store == "매장을 선택하세요." )
		if (store == "") {
			goSearchPage('1', '1', 'combo');
		} else {
			goSearchPage('1', '1', 'code');
		}
	});

	function fnSearchStrName() {
		var $store_name = $("input[id=store_name]").val();
		$("#srch_region").val("");
		$("#srch_sigungu").val("");
		$("#srch_store").val("");
		$("#srch_word").val($store_name);

		if ($store_name == "") {
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>검색하실 매장명을 입력하세요.</p>");
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			return;
		}
		//지역, 매장 콤보리스트 리셋
		$.getJSON("customer/combo_region_list.jsp",
				function(data) {
					var str = "<option value=''>시/도 선택</option>";

					for (var i = 0; i < data.store.length; i++) {
						var sto = data.store[i];

						str = str + "<option value='" + sto.code + "'>"
								+ sto.name + "</option>";
					}

					$("#select_region").html(str);
					$("#select_gu").html("<option value=''>구/군선택</option>");
					$("#select_store").html(
							"<option value=''>지역을 먼저 선택해 주세요</option>");
				});
		goSearchPage('1', '1', 'name');
		$("input[id=store_name]").focus();
	}

	//전국지도에서 선택시
	function search_Address_Map(region) {
		//지역, 매장 콤보리스트 생성
		$.getJSON("customer/combo_region_list.jsp",
				function(data) {
					var str = "<option value=''>시/도 선택</option>";

					for (var i = 0; i < data.store.length; i++) {
						var sto = data.store[i];

						str = str + "<option value='" + sto.code + "'>"
								+ sto.name + "</option>";
					}

					$("#select_region").html(str);
					$("#select_gu").html("<option value=''>구/군선택</option>");
					$("#select_store").html(
							"<option value=''>지역을 먼저 선택해 주세요</option>");
				});

		$("#srch_region").val(region);
		$("#srch_sigungu").val("");
		$("#srch_store").val("");
		$("#srch_word").val("");

		goSearchPage('1', '1', 'map');
	}

	//지역이나 매장등을 선택시 매장 리스트에 보여줄 매장들을 검색
	function goSearchPage(page, block, actionFlag) {
		$("#inCurPage").val(page);
		$("#inCurBlock").val(block);
		$("#actionFlag").val(actionFlag);

		var actionFlag = $("#actionFlag").val();
		var region_code = $("#srch_region").val();
		var sigungu_code = $("#srch_sigungu").val();
		var store_code = $("#srch_store").val();
		var store_word = $("#srch_word").val();
		var inCurPage = $("#inCurPage").val() * 1;
		var inCurBlock = $("#inCurBlock").val() * 1;
		var inPagePerBlock = $("#inPagePerBlock").val() * 1;
		var inRowPerPage = $("#inRowPerPage").val() * 1;
		var $store_list = $("#store_list ul.store");
		var $page_area = $("p.page");

		//
		$
				.getJSON(
						"customer/address_list.jsp?actionFlag=" + actionFlag
								+ "&srch_region=" + region_code
								+ "&srch_sigungu=" + sigungu_code
								+ "&srch_store=" + store_code + "&inCurPage="
								+ inCurPage + "&inCurBlock=" + inCurBlock,
						{
							srch_word : encodeURIComponent(store_word)
						},
						function(data) {
							var str = "";
							var firstblock = "";
							var lastblock = "";
							var prevblock = "";
							var nextblock = "";
							var page = "";
							var parkCnt = "";
							var errorSrc = "/assets/img/customer/store_photo/str_img.jpg";
							if (data.detail.length == 0) {
								alertFrame.find("#alertText p").remove();
								alertFrame.find("#alertText").append(
										"<p>검색 결과가 없습니다.</p>");
								popAlert(alertFrame);
								//alert("검색어를 입력하세요.");
								alertFrame.find(".alertBtn").focus();
							}
							for (var i = 0; i < data.detail.length; i++) {
								var sto = data.detail[i];

								parkCnt = sto.park;

								if (parkCnt == "" || parkCnt == null
										|| parkCnt == "0") {
									parkCnt = "주차불가";
								} else {
									parkCnt = parkCnt + "대 주차가능";
								}

								if (sto.phone.length == 9) {
									sto.phone = sto.phone.substring(0, 2) + "-"
											+ sto.phone.substring(2, 5) + "-"
											+ sto.phone.substring(5, 9);
								} else if (sto.phone.length == 10) {
									if (sto.phone.substring(0, 2) == "02") {
										sto.phone = sto.phone.substring(0, 2)
												+ "-"
												+ sto.phone.substring(2, 6)
												+ "-"
												+ sto.phone.substring(6, 10);
									} else {
										sto.phone = sto.phone.substring(0, 3)
												+ "-"
												+ sto.phone.substring(3, 6)
												+ "-"
												+ sto.phone.substring(6, 10);
									}
								} else if (sto.phone.length == 11) {
									sto.phone = sto.phone.substring(0, 3) + "-"
											+ sto.phone.substring(3, 7) + "-"
											+ sto.phone.substring(7, 11);
								}

								str += "<li class='list'>";
								/* 				str += "<p class='photo'><img src='assets/img/customer/store_photo/m_87.jpg' alt='" + sto.name + " 사진' width='100px'/></p>"; */
								str += "<p class='photo'><img src='assets/img/customer/store_photo/str_" + sto.code + ".jpg' alt='" + sto.name + " 사진' width='100px' height='75px' onerror='this.src=\""+errorSrc+"\"'/></p>";
								str += "<ul class='info'>";
								str += "<li><span class='tit'>매장명 : </span><span>"
										+ sto.name + "</span></li>";
								str += "<li><span class='tit'>전화번호 : </span><span>"
										+ sto.phone + "</span></li>";
								str += "<li><span class='tit'>매장주소 : </span><span>"
										+ sto.address + "</span></li>";
								str += "<li><span class='tit'>영업시간 : </span><span>"
										+ sto.time + "</span></li>";
								str += "<li><span class='tit'>매장타입 : </span><span>"
										+ sto.stype + "</span></li>";
								str += "<li><span class='tit'>주차여부 : </span><span>"
										+ parkCnt + "</span></li>";
								str += "</ul>";
								str += "<p class='map'><span class='btn_h23 green'>";
								str += "<button type='button' id='"
										+ sto.name
										+ "' name='"
										+ sto.name
										+ "' onclick='goMap(this.id);'>지도보기</button>";
								str += "<input type='hidden' id='StoreNm_X' name='StoreNm_X' value='" + sto.xMap + "'>";
								str += "<input type='hidden' id='StoreNm_Y' name='StoreNm_Y' value='" + sto.yMap + "'>";
								str += "<input type='hidden' id='storeCode' name='storeCode' value='" + sto.code + "'></span></p>";
								str += "</li>";
							}

							$store_list.html(str);

							inCurPage = data.inCurPage * 1;
							inCurBlock = data.inCurBlock * 1;

							var inPrevBlock = data.inPrevBlock * 1;
							var inNextBlock = data.inNextBlock * 1;
							var inPrevPage = data.inPrevPage * 1;
							var inNextPage = data.inNextPage * 1;
							var inTotalCnt = data.inTotalCnt * 1;
							var inTotalPageCount = data.inTotalPageCount * 1;
							var inTotalPageBlockCount = data.inTotalPageBlockCount * 1;

							if (inTotalPageCount > 0) {
								if (inCurBlock == 1) {
									firstblock += "<img src='../assets/img/btn/btn_first.gif' alt='처음페이지' />";
								} else {
									firstblock += '<a href=\"JavaScript:goSearchPage(\'1\',\'1\',\''
											+ actionFlag
											+ '\');\" onFocus=\"this.blur()\"><img src=\"../assets/img/btn/btn_first.gif\" alt=\"처음페이지\" /></a>';
								}

								if (inPrevBlock == inCurBlock) {
									prevblock += "<img src='../assets/img/btn/btn_prev.gif' alt='이전페이지' />&nbsp;";
								} else {
									prevblock += '<a href=\"JavaScript:goSearchPage(\''
											+ inPrevPage
											+ '\',\''
											+ inPrevBlock
											+ '\',\''
											+ actionFlag
											+ '\');\" onFocus=\"this.blur()\"><img src=\"../assets/img/btn/btn_prev.gif\" alt=\"이전페이지\" /></a>&nbsp;';
								}

								var nPageIndex = 0;

								for (var j = 0; j < inPagePerBlock; j++) {
									nPageIndex = inCurBlock * inPagePerBlock
											- inPagePerBlock + (j + 1);

									if (nPageIndex <= inTotalPageCount) {
										if (nPageIndex == inCurPage) {
											page += '<a href=\"JavaScript:;\">'
													+ nPageIndex + '</a>&nbsp;';
										} else {
											page += '<a href=\"JavaScript:goSearchPage(\''
													+ nPageIndex
													+ '\',\''
													+ inCurBlock
													+ '\',\''
													+ actionFlag
													+ '\');\" onFocus=\"this.blur()\">'
													+ nPageIndex + '</a>&nbsp;';
										}
									}
								}

								if (inNextBlock == inCurBlock) {
									nextblock += "<img src='../assets/img/btn/btn_next.gif' alt='다음페이지' />";
								} else {
									nextblock += '<a href=\"JavaScript:goSearchPage(\''
											+ inNextPage
											+ '\',\''
											+ inNextBlock
											+ '\',\''
											+ actionFlag
											+ '\');\"  onFocus=\"this.blur()\"><img src=\"../assets/img/btn/btn_next.gif\" alt=\"다음페이지\" /></a>';
								}

								if (inTotalPageBlockCount == inCurBlock) {
									lastblock += "<img src='../assets/img/btn/btn_last.gif' alt='마지막페이지' />";
								} else {
									lastblock += '<a href=\"JavaScript:goSearchPage(\''
											+ inTotalPageCount
											+ '\',\''
											+ inTotalPageBlockCount
											+ '\',\''
											+ actionFlag
											+ '\');\" onFocus=\"this.blur()\"><img src=\"../assets/img/btn/btn_last.gif\" alt=\"마지막페이지\" /></a>';
								}
							}
							$page_area.html(firstblock).append(prevblock)
									.append(page).append(nextblock).append(
											lastblock);
						});
	}

	//지도보기
	function goMap(storeNm) {
		var storeName = "#" + storeNm;
		var x = $(storeName).siblings("input[id=StoreNm_X]").val();
		var y = $(storeName).siblings("input[id=StoreNm_Y]").val();
		var storecd = $(storeName).siblings("input[id=storeCode]").val();

		$("#xMap").val(x);
		$("#yMap").val(y);
		$("#storecd").val(storecd);
		$("#tab").val("2");

		var f = document.searchForm;

		if (isSubmitted == false) {
			//엔터키 포커스 때문에 자동 submit 막은 부분 일시 해제 
			$("#searchForm").removeAttr("onsubmit");
			isSubmitted = true;
			$("#searchForm").submit();
		} else {
			return;
		}
		//엔터키 검색버튼에 적용해야하므로 지도 정보만 넘기고 다시 자동 submit 막음 
		$("#searchForm").attr("onsubmit", "return false");
	}
</script>