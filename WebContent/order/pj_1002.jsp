<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript" src="../assets/js/json2.js"></script>
<script type="text/javascript" src="../assets/js/cart.js"></script>
<script type="text/javascript" src="../assets/js/topping.js"></script>
<link type="text/css" rel="stylesheet" href="../assets/css/order.css" />
<script type="text/javascript">
    var root = ""; 
	var sessionOrdInfo = null;
	var toPrc = 0;  //초기값a  //장바구니 최종 금액
	
	head_title("ORDER");
	
 	//페이지 시작시 처리
    $(document).ready(function()
    {
	 	//페이지 시작 시로딩 이미지 숨기기
	 	$('#viewLoading').hide();
	 	/* $('#viewLoading')	// ajax 실행 및 완료시 'Loading 이미지'의 동작 컨트롤하기
		.ajaxStart(function()
		{
			$(this).fadeIn(500);
		})
		.ajaxStop(function()
		{
			$(this).fadeOut(500);
		}); */
	 
 		// 메뉴리스트 아이템 상세설명
 		/* 20130926 옵션변경 코멘트 추가 */
 		var $btn_detail=$("#menuList_section .item .detail .btn");
 		var $btn_instructions=$("#menuList_section .item .spcInstruction .btn");
 		var $btn_half_spcInstruction=$("#half_section .half_spcInstruction p");

 		var $btn_prom_spcInstruction=$("#prom_section .prom_spcInstruction p");
 		

 		$btn_instructions.bind("mouseenter",menu_detail);
 		$btn_instructions.bind("mouseleave",menu_detail_out);
 		$btn_instructions.bind("click", adjust_click);
 		
 		
 		$btn_half_spcInstruction.bind("mouseenter",menu_detail);
 		$btn_half_spcInstruction.bind("mouseleave",menu_detail_out);
 		$btn_half_spcInstruction.bind("click", adjust_click);

 		$btn_prom_spcInstruction.bind("mouseenter",menu_detail);
 		$btn_prom_spcInstruction.bind("mouseleave",menu_detail_out);
 		$btn_prom_spcInstruction.bind("click", adjust_click);
 		
 		$btn_detail.bind("mouseenter",menu_detail);
 		$btn_detail.bind("mouseleave",menu_detail_out);
 	
 		
 		//
 		function menu_detail()
 		{
 			
 			var $comm_detail=$(this).parent().find(".comment");
 		 	$comm_detail.show();
 			var comm_pos=-($comm_detail.height()+20);
 			$comm_detail.css("top",comm_pos);
 			
 		}
 		
 		//
 		function menu_detail_out()
 		{
 			
 			var $comm_detail=$(this).parent().find(".comment");
 		 	$comm_detail.hide();
 		 	
 		}
 	
 		//
 		function adjust_click()
 		{
 			var box = $(this).parent().parent().next(); //option_box 
 			if( box.css("display") == 'none' )
 			{ 
 				box.stop().slideDown();
 				box.css("display","block");
 				old_sid = "";
 				$(this).find("img").attr("src",root+"../assets/img/order/btn_opt_on.gif");  
			}
 			else
 			{
				$(".spcInstructions").find("span").each(function() { $(this).text("▼"); }	);
				$(".option").slideUp();	//안에 펼처져있는 옵션들
				box.stop().slideUp(); 
 				$(this).find("img").attr("src",root+"../assets/img/order/btn_opt_off.gif"); 
			}
 			
 		} 

 		// 라디오/체크박스 버튼 스타일 변경
 		$('#menuList_section .item').addClass('has-js');
 		$('.menu_size_radio').click(function(){
			$(this).parent().find('.menu_size_radio').removeClass("r_on");
			ra_check($(this));
 		});
 		$('.menu_opt_radio').click(function(){  
       		set_opt_radio($(this));
   		}); 
 		//라디오 버튼 초기값 default 설정
 		//$(".option_box .spcInstructions .option").each(function(i){
		
		/* $(".spcInstructions .option").each(function(i){
		  	var $btn = $(this).find(".menu_opt_radio").eq(0);  
		  	set_opt_radio($btn);	  
	  	}); */
 		fnReset_spcOption();
 	    opt_cont_reset();
 	}); 
 		
 		
	// 20140702 이벤트 화면에서 링크로 온 경우 프로모션 화면으로 바로 진입
	// 링크 url : "root/order.jsp?step=promotion"
	//20140703 프로모션 링크로 들어오는 경우 URL 파라미터 추가 
	if( 10== "00" ) 
	{
		fnViewDiv("prom");
	}
 			
 	//20140730 8월 전사 프로모션 알림 추가
 	var sysDate = parseInt( "201410291437".substring(0, 8) );
 	if(sysDate >= "20140801" && sysDate <= "20140831")
 	{
	 	popup("#pop_guide_coupon");
		$("#pop_guide_coupon").find("button").focus();		
 	}
 		
 	//////////////////////////////////////////////	
 	//20140129 수정
 	function fnReset_spcOption_up($this){
 		fnReset_spcOption();
 		//alert($this.parent().parent().next().attr("class"));
 		var box = $this.parent().parent().parent().find(".option_box");
 		if($this.parent().next().hasClass("half_option_box"))
 		{
 			box = $this.parent().next();
 		}
 		
 		// 20140619 프로모션 쿠폰메뉴 옵션 추가
 		if( $this.parent().next().hasClass("prom_option_box") )
 		{
 			box = $this.parent().next();
 		}
 		
 		if( box.css("display") == 'block' )
		{
			$(".spcInstructions").find("span").each(function() { $(this).text("▼"); }	);
			$(".option").slideUp();	//안에 펼처져있는 옵션들
			box.stop().slideUp(); //해당 메뉴의 옵션박스만 : 하프섹션 또는 피자박스
			
			$(".option_box").slideUp();	//모든 옵션박스
			$(".spcInstruction").find(".btn img").attr("src",root+"../assets/img/order/btn_opt_off.gif");	//피자박스(단품)인경우만 
		}
 	}
 	
 	//spcInstructions 리셋하기!! (초기화)
    function fnReset_spcOption(){
		$(".spcInstructions .option").each(function(i){
		  	var $btn = $(this).find(".menu_opt_radio").eq(0);  
		  	set_opt_radio($btn);	  
	  	});
	}	
    //옵션라디오 버튼 체크값 변경
	function set_opt_radio(radio_btn)
    {
		radio_btn.parent().find('.menu_opt_radio').removeClass("r_on");
		radio_btn.find('input').removeAttr("checked");
		radio_btn.addClass("r_on");
		radio_btn.find("input").attr("checked","checked");
	} 	
    // 옵션에 들어가는 컨텐츠 초기화
    function opt_cont_reset()
    {
    	$mem_info.hide();
    	$select_addr.hide();
    	$frame.hide();
   		$ord_opt.find("#map_area").remove();
   		
    	if( sessionOrdInfo == null ) {
    		$ord_time.text(""); 
    	}
    	$("#sele_reserv").hide();
    	
    	//장바구니 영역 화면 리사이징
    	contents_resize();
    }	


    // 온라인메뉴그룹별 메뉴그룹 검색
	function fnSelMenuGroup(pizzaSelIdx, onlineGroupCd)
    {	
    	document.frmOrder.onlineGroupCd.value = onlineGroupCd;  // 온라인메뉴그룹
    	document.frmOrder.pizzaSelIdx.value   = pizzaSelIdx;    // 선택피자그룹메뉴
    	document.frmOrder.action              = "orderAction.action";
    	document.frmOrder.target              = "_self";
    	document.frmOrder.submit();
	}
    
    
	// 세트메뉴, 파파 플래터 장바구니
	
	function fnOrderSet_plater(menuid,imagepathorder,price,consist,name)
    {
		var size = $("input:hidden[id=_size]").val();
		if(!sessionStorage.addCount)
			sessionStorage.addCount=0;
		
		document.frmOrder.onlineGroupCd.value = onlineGroupCd;							// 온라인메뉴그룹
    	document.frmOrder.pizzaSelIdx.value   = pizzaSelIdx;							// 선택피자그룹메뉴
    	document.frmOrder._menuid.value = menuid; 										// 메뉴 id
    	document.frmOrder._imagepathorder.value = imagepathorder; 						// 온라인주문 메뉴 이미지경로
    	document.frmOrder._name.value = name;											// 제품명
    	if(menuid == 'pj_2010')
    		document.frmOrder._size.value = "(BOX)";									// 사이즈
    	else
    		document.frmOrder._size.value = "(2-3인용)";									// 사이즈
    	
    	document.frmOrder._cnt_opt.value = document.getElementById("cnt_opt").value; 	// 수량
    	document.frmOrder._price.value = price; 										// 가격
    	document.frmOrder._consist.value = consist; 									// 구성요소
//    	document.frmOrder._randomString.value = getRandomString();
//    	document.frmOrder.action              = "pj_1003ActionAddItem.action";
    	document.frmOrder.action              = "pj_1003ActionAddItem.action?addCount="+sessionStorage.addCount;
    	sessionStorage.addCount++;
    	document.frmOrder.target              = "_self";
    	alert("name : "+name+"\nprice : "+price+"\ncont_opt : "+document.getElementById("cnt_opt").value+"\nsize : "+document.frmOrder._size.value) ;
    	document.frmOrder.submit();
    	
	}
	
	// 사이드 장바구니
	function fnOrderSide(menuid,imagepathorder,price,consist,name)
    {
		alert("name : "+name+"\nprice : "+price+"\ncont_opt : "+document.getElementById("cnt_opt1").value) ;
		if(!sessionStorage.addCount)
			sessionStorage.addCount=0;
		document.frmOrder.onlineGroupCd.value = onlineGroupCd;							// 온라인메뉴그룹
    	document.frmOrder.pizzaSelIdx.value   = pizzaSelIdx;							// 선택피자그룹메뉴
    	document.frmOrder._menuid.value = menuid; 										// 메뉴 id
    	document.frmOrder._imagepathorder.value = imagepathorder; 						// 온라인주문 메뉴 이미지경로
    	document.frmOrder._name.value = name;											// 제품명
    	document.frmOrder._size.value = "원사이즈";										// 사이즈 
    	document.frmOrder._cnt_opt.value = document.getElementById("cnt_opt1").value; 	// 수량
    	document.frmOrder._price.value = price; 										// 가격
    	document.frmOrder._consist.value = consist; 									// 구성요소
//    	document.frmOrder._randomString.value = getRandomString();
//    	document.frmOrder.action              = "pj_1003ActionAddItem.action";
    	document.frmOrder.action              = "pj_1003ActionAddItem.action?addCount="+sessionStorage.addCount;
    	sessionStorage.addCount++;
    	document.frmOrder.target              = "_self";
    	document.frmOrder.submit();
	}
	

	// 피자 장바구니	
	function fnOrderPizza(menuid,imagepathorder,consist,name)
    {
		var price = $("input:radio[name=pSize_1]:checked").val();
		var bt = $('input:radio[name=pSize_1]').attr("checked",true);
		var size = $("input:hidden[id=_size]").val();		//alert("name : "+name+"\nprice : "+price+"\nsize : "+size ) ;
		if(!sessionStorage.addCount)
			sessionStorage.addCount=0;
		//alert(menuid + '\n' + imagepathorder + '\n'+ price + '\n' + consist + '\n' + bt) ;
		document.frmOrder.onlineGroupCd.value = onlineGroupCd;							// 온라인메뉴그룹
    	document.frmOrder.pizzaSelIdx.value   = pizzaSelIdx;							// 선택피자그룹메뉴
    	document.frmOrder._menuid.value = menuid; 										// 메뉴 id
    	document.frmOrder._imagepathorder.value = imagepathorder; 						// 온라인주문 메뉴 이미지경로
    	document.frmOrder._name.value = name;											// 제품명
    	document.frmOrder._cnt_opt.value = "1"; 										// 수량
    	document.frmOrder._price.value = price; 										// 가격
    	document.frmOrder._consist.value = consist; 									// 구성요소
//    	document.frmOrder._randomString.value = getRandomString();
//    	document.frmOrder.action              = "pj_1003ActionAddItem.action";
    	document.frmOrder.action              = "pj_1003ActionAddItem.action?addCount="+sessionStorage.addCount;
    	sessionStorage.addCount++;
    	document.frmOrder.target              = "_self";
    	alert("제품명 : " + document.frmOrder._name.value + "  사이즈 : " + size + " 수량 : " + document.frmOrder._cnt_opt.value + " 금액 : " + document.frmOrder._price.value );
    	
    	document.frmOrder.submit();
	}
	
	// 음료 장바구니
	function fnOrderBever(menuid,imagepathorder,consist,name)
    {
		var price = $("input:radio[name=pSize_1]:checked").val();
		var size = $("input:hidden[id=_size]").val();
		if(!sessionStorage.addCount)
			sessionStorage.addCount=0;
		//alert(menuid + '\n' + imagepathorder + '\n'+ price + '\n' + consist + '\n' + name) ;
		document.frmOrder.onlineGroupCd.value = onlineGroupCd;							// 온라인메뉴그룹
    	document.frmOrder.pizzaSelIdx.value   = pizzaSelIdx;							// 선택피자그룹메뉴
    	document.frmOrder._menuid.value = menuid; 										// 메뉴 id
    	document.frmOrder._imagepathorder.value = imagepathorder; 						// 온라인주문 메뉴 이미지경로
    	document.frmOrder._name.value = name;											// 제품명
    	//document.frmOrder._cnt_opt.value = document.getElementById("cnt_opt_bever").value;	// 수량
    	document.frmOrder._price.value = price; 										// 가격
    	document.frmOrder._consist.value = consist; 									// 구성요소
//    	document.frmOrder._randomString.value = getRandomString();
//    	document.frmOrder.action              = "pj_1003ActionAddItem.action";
    	document.frmOrder.action              = "pj_1003ActionAddItem.action?addCount="+sessionStorage.addCount;
    	sessionStorage.addCount++;
    	document.frmOrder.target              = "_self";
    	alert("name : "+name+"\nprice : "+price+"\nsize : "+size+"\ncnt_opt1 : "+document.frmOrder._cnt_opt.value ) ;
    	document.frmOrder.submit();
	}
	
	function setSelect(value)
	{
		// 주문 수량 저장
		document.frmOrder._cnt_opt.value = value;
	}
    
    // 세트메뉴, 하프&하프, E쿠폰 화면표시 및 검색
    function fnViewDiv(val)
    {
    	var listDiv   = document.getElementById("menuList_section");  // 메뉴
    	var setDiv    = document.getElementById("set_section");       // 세트메뉴
    	var halfDiv   = document.getElementById("half_section");      // 하프&하프
    	var couponDiv = document.getElementById("ecoup_section");     // E쿠폰
    	var platDiv   = document.getElementById("plat_section");      // 파파플래터 
    	
    	// 20140616 프로모션 메뉴 화면 호출
    	var promDiv   = document.getElementById("prom_section");      // 프로모션 메뉴 

    	if( val == "set" )
    	{
    		fnSelSetMenu();  // 세트메뉴 검색
    		
    		listDiv.style.display   = "none";
    		setDiv.style.display    = "block"; 
    		halfDiv.style.display   = "none";
			couponDiv.style.display = "none";
			platDiv.style.display   = "none";
    		promDiv.style.display   = "none";
    	} 
    	else if( val == "half" )
    	{
    		fnSelHalfAndHalf();  // 하프&하프 검색
    		
    		listDiv.style.display   = "none";
    		setDiv.style.display    = "none";
    		halfDiv.style.display   = "block";
			couponDiv.style.display = "none";	
			platDiv.style.display   = "none";
    		promDiv.style.display   = "none";
    	}
    	else if( val == "coupon" )
    	{
    		listDiv.style.display   = "none";
    		setDiv.style.display    = "none";
    		halfDiv.style.display   = "none";
			couponDiv.style.display = "block";
			platDiv.style.display   = "none";
    		promDiv.style.display   = "none";
    	}
    	else if( val == "plat" ) // 20140424 테스트 중 파파플래터 
    	{
    		
    		fnPaPaPlat("11");  // 20140424 파파플래터	
    	
    		listDiv.style.display   = "none";
    		setDiv.style.display    = "none";
    		halfDiv.style.display   = "none";
			couponDiv.style.display = "none";
			platDiv.style.display   = "block";
    		promDiv.style.display   = "none";
    	}
    	// 20140616 프로모션 메뉴 화면 호출
    	else if( val == "prom" ) 
    	{
    		
    		fnGetPromotionCouponList();
    	
    		promDiv.style.display   = "block";
    		listDiv.style.display   = "none";
    		setDiv.style.display    = "none";
    		halfDiv.style.display   = "none";
			couponDiv.style.display = "none";
			platDiv.style.display   = "none";
    	}
    	else
    	{
    		listDiv.style.display   = "block";
    		setDiv.style.display    = "none";
    		halfDiv.style.display   = "none";
			couponDiv.style.display = "none";
			platDiv.style.display   = "none";
    		promDiv.style.display   = "none";
    	}
    	
		contents_resize();
		
    }
    
    
 	// 세트메뉴 검색
    function fnSelSetMenu()
    {
    	
		var $menu_sect = $("#set_section");
		var height     = 0;
		
    	$.ajax(
    	{ 
	   		type: 'post',
	   		url: "../order/setMenu.jsp", // ?????????
			beforeSend: function() 
			{              
				//통신을 시작할때 처리             
				$('#viewLoading').show().fadeIn(500);          
			},
	   		complete: function() 
			{             
				//통신이 완료된 후 처리              
				$('#viewLoading').fadeOut();  
				contents_resize();
			},
	   		success:function(data)
	   		{
	   			if( trim(data) != "" && trim(data) != null && trim(data) != "NO" && trim(data) != "]" )
	   			{
		   			var receiveData = trim(data);
					//스트링 데이터를 제이슨 오브젝트로 변형
					var setMenuInfo = $.parseJSON(receiveData); 
					
					$menu_sect.contents().remove();
					 
					if( setMenuInfo.length > 0 )
					{
						for( var i = 0; i < setMenuInfo.length; i++ )
						{
							var html = '';

							html  = '<div class="set_items has-js" id="set_'+ setMenuInfo[i].menuCode +'"> ';
							html += '<p class="image" >';
							html += '<img src="../assets/img/order/menu/' + setMenuInfo[i].onlineGroupCd + '/' + setMenuInfo[i].menuCode + '_ord.png" width="220" height="140" alt="'+ setMenuInfo[i].menuName +'" title="'+ setMenuInfo[i].menuName +'" /></p>';
							html += '<p class="name" id="setNm">'+ setMenuInfo[i].menuName +'<span class="size">('+ setMenuInfo[i].menuSize +')</span></p>';
							html += '<p class="btn_cart" onclick="fnAddSet($(this),\''+setMenuInfo[i].menuCode+'\',\''+setMenuInfo[i].menuDivCode+'\',\''+setMenuInfo[i].menuLagCode+'\',\''+setMenuInfo[i].menuMidCode+'\',\''+setMenuInfo[i].menuSmlCode+'\',\''+setMenuInfo[i].menuSubCode+'\');"><button type="button">장바구니에담기</button></p>';
							html += '<p class="description"><img src="../assets/img/order/ord_menuList_size_set.png" alt="라지세트" title="라지세트"/>상세 <br>';  
							html += '<span> : ';
							    
							for( var m = 0; m < setMenuInfo[i].setMenuDetail.length; m++ )
							{
								html += '<span class="hiddenData">';
								html +=      setMenuInfo[i].setMenuDetail[m].setCode        + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setSeqNumber   + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuCode    + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuName    + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuDivCode + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuLagCode + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuMidCode + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuSmlCode + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuSubCode + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuPrice   + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuQty     + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuAmount  + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuDisRate + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuDisAmt  + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuCopDis  + '/';
								html +=      setMenuInfo[i].setMenuDetail[m].setMenuNetSale 
								html += '</span>'; 
								html +=      setMenuInfo[i].setMenuDetail[m].setMenuName    + ' + ';  
							}
							
							html = html.toString().substring(0, html.toString().length-2); 
							html += '</span></p><div class="size_prc">'; 
							html += '<input type="hidden" name=" " value=" " />';
	                        html += '<p class="set_price">' + setComma(setMenuInfo[i].menuSaleAmt)+' </p>';
							html += '<p style="width:40px; position:absolute; top:10px; left:140px;">수량 : </p>';
							html += '<p class="selcet_count"><select id="cnt_opt" name="cnt_opt">';
							html += '<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option>';
							html += '</select></p>';
							html += '</div></div>';
							
							$menu_sect.append(html);  
						}
					}
					else
					{
						$menu_sect.contents().remove();
			   			$menu_sect.append("주문 가능한 메뉴가 없습니다.");
					}
	   			}
	   			else
	   			{
	   				$menu_sect.contents().remove();
	   				$menu_sect.append("주문 가능한 메뉴가 없습니다.");
	   			} 	 
   			}
   		});
    	
    }
 	
 	// 20140424 파파플래터
    function fnPaPaPlat(onlineGroupCd)
 	{
    	var $plat_sect = $("#plat_section");
		var height     = 0;
		
    	$.ajax(
    	{ 
	   		type: 'post',
	   		url: "/order/platMenu.jsp?onlineGroupCd="+onlineGroupCd, // ????????
			beforeSend: function() 
			{              
				//통신을 시작할때 처리             
				$('#viewLoading').show().fadeIn(500);          
			},
	   		complete: function() 
			{             
				//통신이 완료된 후 처리              
				$('#viewLoading').fadeOut();  
				contents_resize();
			},
	   		success:function(data)
	   		{
	   			if( trim(data) != "" && trim(data) != null && trim(data) != "NO" && trim(data) != "]" )
	   			{
		   			var receiveData = trim(data);

		   			//스트링 데이터를 제이슨 오브젝트로 변형
					var platMenuInfo = $.parseJSON(receiveData);
					
					$plat_sect.contents().remove();
					 
					if( platMenuInfo.length > 0 )
					{
						for( var i = 0; i < platMenuInfo.length; i++ )
						{
							var mIndex = i+1;
							
							// 단품상품정보
							var platMenuHiddenVal = platMenuInfo[i].menuCode+","+platMenuInfo[i].menuName+","+platMenuInfo[i].menuSizeKor+","+platMenuInfo[i].menuSaleAmt+","+platMenuInfo[i].menuDough+","+platMenuInfo[i].menuLagCode+","+platMenuInfo[i].menuMidCode+","+platMenuInfo[i].menuSmlCode+","+platMenuInfo[i].menuSubCode+","+platMenuInfo[i].menuDivCode; 
						
//							console.log(platMenuInfo[i]);
							
							var html = '';

							//html  = '<div class="item has-js" id="menu_'+ mIndex +'"> ';
							html  = '<div class="item has-js" id="menu_'+ platMenuInfo[i].menuCode +'"> '; // 순번에서 메뉴코드로 수정
							html += '<p class="image" >';
							html += '<img src="/assets/img/order/menu/' + platMenuInfo[i].menuGroupCd + '/' + platMenuInfo[i].menuMidCode + '_ord.png" width="220" height="140" alt="'+ platMenuInfo[i].menuName +'" title="'+ platMenuInfo[i].menuName +'" /></p>';
							//html += '<p class="name" id="pName_'+ mIndex +'">'+platMenuInfo[i].menuName +" "+ platMenuInfo[i].menuSize +'<span class="size">(BOX)</span></p>';
							html += '<p class="name" id="pName_'+ platMenuInfo[i].menuCode +'">'+platMenuInfo[i].menuName +" "+ platMenuInfo[i].menuSizeKor +'<span class="size">(BOX)</span></p>';
							html += '<p class="btn_cart" onclick="fnAddSet($(this), \''+ platMenuHiddenVal +'\', \'\', \'\', \'\', \'\', \'\');""><button type="button">장바구니에담기</button></p>';
							html += '<p class="description"><img src="/assets/img/order/ord_menuList_size_box.png" alt="플래터세트"/>구성 <br>';  
							html += '<span> :' + platMenuInfo[i].menuDesDtl ;
							html += '</span></p><div class="size_prc">'; 
	                        html += '<p class="price">' + setComma(platMenuInfo[i].menuSaleAmt)+' </p>';
							html += '<p style="width:40px; position:absolute; top:10px; left:140px;">수량 : </p>';
							html += '<p class="selcet_count"><select id="cnt_opt" name="cnt_opt">';
							html += '<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option>';
							html += '</select></p>';
							html += '</div></div>';
							
							$plat_sect.append(html);  
						}
					}
					else
					{
						$plat_sect.contents().remove();
			   			$plat_sect.append("주문 가능한 메뉴가 없습니다.");
					}
	   			}
	   			else
	   			{
	   				$plat_sect.contents().remove();
	   				$plat_sect.append("주문 가능한 메뉴가 없습니다.");
	   			} 	 
   			}
   		});
    }
 	
 	
 	// 하프&하프 검색 _ 하프&하프 사이즈 선택 Combo List 생성 	
    function fnSelHalfAndHalf()
    {
    	
    	$.ajax(
    	{ 
    		type       : 'post',
    		data       : "flag=top",
    		url        : "/order/half.jsp", // ???????
    		dataType   : "json",
			beforeSend : function() 
			{              
				//통신을 시작할때 처리             
				$('#viewLoading').show().fadeIn(500);          
			}
    		,complete : function() 
    		{             
				//통신이 완료된 후 처리              
				$('#viewLoading').fadeOut();         
			}
    		,success : function(data)
    		{
    			var str = "<option value=''>피자 사이즈를 선택해주세요.</option>";			
    			for( var i = 0; i < data.half.length; i++ )
    			{
    				var d= data.half[i];
    				str = str + "<option value='" + d.code + "'>" + d.name + "</option>";				
    			}					
    			$("#pro_size").html(str);
    		}
    	});
    	
    	$("#half1 option").remove();
    	var str = "<option value=''>피자1 선택해주세요.</option>";		
		$("#half1").html(str);
		
		$("#half2 option").remove();
    	var str = "<option value=''>피자2 선택해주세요.</option>";		
		$("#half2").html(str);
    	
		fnClearHalfAndHalf(1);
		fnClearHalfAndHalf(2);
    	
    }
 	

 	// 하프&하프 검색 _ 하프&하프 왼쪽 피자선택 Combo List 생성
    function fnSelLeftHalfAndHalf(val)
    {
    	
    	$("#half2 option").remove();
    	var str = "<option value=''>피자2 선택해주세요.</option>";		
		$("#half2").html(str);
		
    	$(".right").find(".select_price").text("");
    	
    	//fnClearHalfAndHalf(1);
		//fnClearHalfAndHalf(2);
		//2014.02.18. 하프&하프 사이즈 선택때 왼쪽 오른쪽 목록 초기화 
    	fnClearHalfAndHalfLeftRight(1);
    	fnClearHalfAndHalfLeftRight(2);
    	
    	if( val != "" )
    	{
    	    $.ajax(
    	    { 
		   		type       : 'post',
		   		data       : "flag=left&code="+val,
		   		url        : "/order/half.jsp",
		   		dataType   : "json",
				beforeSend : function() 
				{              
					//통신을 시작할때 처리             
					$('#viewLoading').show().fadeIn(500);          
				}
		   		,complete : function() 
		   		{             
					//통신이 완료된 후 처리              
					$('#viewLoading').fadeOut(); 
				}
		   		,success : function(data)
		   		{
		   			var str = "<option value=''>피자1 선택해주세요.</option>";
		   			for( var i = 0; i < data.left.length; i++ )
		   			{
		   				var d= data.left[i];
		   				str = str + "<option value='" + d.code+","+ d.img + "'>" + d.name + "</option>";				
		   			}	
		   			$("#half1").html(str);
		   		}
		   	});
    	}
    	else
    	{
    		fnClearHalfAndHalf(1);
    		fnClearHalfAndHalf(2);
    	}
    	
    }
    
    
 	// 하프&하프 검색 _ 하프&하프 왼쪽 피자선택 매장품절 체크
    function fnSelRightHalfAndHalf(val,num)
    {
    	
    	$(".right").find(".select_price").text("");
		fnClearHalfAndHalf(2);

    	var code = $("#pro_size").val();  // 메뉴소분류코드, 메뉴세분류코드
    	
    	var array1 = new Array();
    	var array2 = new Array();
    	array1 = code.split(",");  // 메뉴소분류코드, 메뉴세분류코드
    	array2 = val.split(",");   // 메뉴중분류코드
    	
    	var $ord_info = $("#ord_optInfo_section");
		var storeCode = document.frmOrder.cartOrdStoreCode.value;  // 매장코드
		var storeName = $ord_info.find(".store_name");
		var mCode     = array2[0];
		var sCode     = array1[0];
		var dCode     = array1[1];

		var alertFrame = $("#notice_1002");
		
		if( code != "" && val != "" )
    	{
			if( storeCode != "" && storeCode != null )
			{
				$.ajax(
				{
					url      : "/order/checkStoreMenu.jsp?flag=halfMenu&storeCode="+storeCode+"&mCode="+mCode+"&sCode="+sCode+"&dCode="+dCode,
					dataType : "html",
					type     : "post",
					success  : function(data)
					{
						if( "N" == trim(data) )
						{
							alertFrame.find("#alertText p").remove();
							alertFrame.find("#alertText").append("<p>선택하신 메뉴는<br>\"" + storeName.text() +"\"점에서 현재 주문이 불가능합니다.</p>").css("line-height","35px"); 
							popAlert(alertFrame);
							alertFrame.find(".alertBtn").focus();
							return;
						}
					
						fnSelRightHalfAndHalfComp(val,num);
					},	
					error : function( jqXHR, textStatus, errorThrown )
	         		{
					
	         		}
				});	
			}
			else
			{
				fnSelRightHalfAndHalfComp(val,num);
			}
		}
    	else
    	{
    		fnClearHalfAndHalf(1);
    		fnClearHalfAndHalf(2);
		}
    	
    }
 	
 	
 	// 하프&하프 검색 _ 하프&하프 오른쪽 피자선택 Combo List 생성
 	//                  하프&하프 왼쪽 피자선택 Image 표시
    function fnSelRightHalfAndHalfComp(val,num)
    {
    	
    	$(".right").find(".select_price").text("");
		fnClearHalfAndHalf(2);

    	var imgSrc = "";
    	var $img = $("#half1Img");
    	var code = $("#pro_size").val();  // 메뉴소분류코드, 메뉴세분류코드
    	
    	var array1 = new Array();
    	var array2 = new Array();
    	array1 = code.split(",");  // 메뉴소분류코드, 메뉴세분류코드
    	array2 = val.split(",");   // 메뉴중분류코드
    	
   		if( code != "" && val != "" )
    	{
    		var doughType = array1[1];   
    		var errorSrc = "/assets/img/order/menu/55/error_img.png";
	        	
        	imgSrc = "/assets/img/order/menu/55/"+ doughType + "/half_" + array2[0] + "_ord.png";
        	$img.html('<img src="'+ imgSrc + '" alt="' + array2[0] + '" onerror="this.src=\''+errorSrc+'\'"/>');
	        	
        	$(".plus").find("img").show();  // (+)그림표시
	    		
        	//오른쪽 정보 불러오기
	     	$.ajax(
	     	{ 
	 	   		type       : 'post',
	 	   		data       : "flag=right&val="+val+"&code="+code,
		   		url        : "/order/half.jsp",
		   		dataType   : "json",
				beforeSend : function() 
				{              
					//통신을 시작할때 처리             
					$('#viewLoading').show().fadeIn(500);          
				}
		   		,complete : function() 
		   		{             
					//통신이 완료된 후 처리              
					$('#viewLoading').fadeOut(); 
				}
		   		,success : function(data)
		   		{
	 	   			var str = "<option value=''>피자2 선택해주세요.</option>";			
	 	   			for( var i = 0; i < data.left.length; i++ )
	 	   			{
	 	   				var d= data.left[i];
	 	   				str = str + "<option value='" + d.code+","+ d.img + "'>" + d.name + "</option>";				
	 	   			}	
	 	   			$("#half2").html(str);

	 	   			fnSelMenuHalfAndHalf(val, num);  // 하프&하프 검색 _ 하프&하프 피자선택 메뉴 검색
	   		 	}
	   		});
    	}
    	else
    	{
    		fnClearHalfAndHalf(1);
    		fnClearHalfAndHalf(2);
   		}
    	
    }
 	
 	
 	// 하프&하프 검색 _ 하프&하프 오른쪽 피자선택 Image 표시
    function fnSelImageHalfandHalf(val, num)
    {
		var code = $("#pro_size").val();  // 메뉴소분류코드, 메뉴세분류코드
		
    	var array1 = new Array();
    	var array2 = new Array();
    	array1 = code.split(",");  // 메뉴소분류코드, 메뉴세분류코드
    	array2 = val.split(",");   // 메뉴중분류코드
    	
    	var $ord_info = $("#ord_optInfo_section");
		var storeCode = document.frmOrder.cartOrdStoreCode.value;  // 매장코드
		var storeName = $ord_info.find(".store_name");
		var mCode     = array2[0];
		var sCode     = array1[0];
		var dCode     = array1[1];

		var alertFrame = $("#notice_1002");
		
    	if( $("#half1").val() != "" && $("#pro_size").val() != "" )
    	{
			if( storeCode != "" && storeCode != null )
			{
				$.ajax(
				{
					url      : "/order/checkStoreMenu.jsp?flag=halfMenu&storeCode="+storeCode+"&mCode="+mCode+"&sCode="+sCode+"&dCode="+dCode,
					dataType : "html",
					type     : "post",
					success  : function(data)
					{
						if( "N" == trim(data) )
						{
							alertFrame.find("#alertText p").remove();
							alertFrame.find("#alertText").append("<p>선택하신 메뉴는<br>\"" + storeName.text() +"\"점에서 현재 주문이 불가능합니다.</p>").css("line-height","35px"); 
							popAlert(alertFrame);
							return;
						}
					
						fnSelImageHalfandHalfComp(val,num);
					},	
					error : function( jqXHR, textStatus, errorThrown )
	         		{
					
	         		}
				});	
			}
			else
			{
				fnSelImageHalfandHalfComp(val,num);
			}
		}
    	else
    	{
    		fnClearHalfAndHalf(2);
		}
    	
    }
 	
 	
 	// 하프&하프 검색 _ 하프&하프 오른쪽 피자선택 Image 표시
    function fnSelImageHalfandHalfComp(val, num)
    {
    	var imgSrc = "";
    	var $img = $("#half2Img");
		var code   = $("#pro_size").val();  // 메뉴소분류코드, 메뉴세분류코드
		
    	var array1 = new Array();
    	var array2 = new Array();
    	array1 = code.split(",");  // 메뉴소분류코드, 메뉴세분류코드
    	array2 = val.split(",");   // 메뉴중분류코드
    	
    	if( $("#half1").val() != "" && $("#pro_size").val() != "" )
    	{
    		if( val != "" )
    		{
        		var doughType = array1[1];  
        		var errorSrc = "/assets/img/order/menu/55/error_img.png";
	        		
        		imgSrc = "/assets/img/order/menu/55/"+ doughType + "/half_" + array2[0] + "_ord.png";
        		$img.html('<img src="'+ imgSrc + '" alt="' + array2[0] + '" onerror="this.src=\''+errorSrc+'\'"/>');
		    		
    			fnSelMenuHalfAndHalf(val, num);  // 하프&하프 검색 _ 하프&하프 피자선택 메뉴 검색
    		}
    		else
    		{
	    		fnClearHalfAndHalf(2);
    		}
    	}
    	else
    	{
    		fnClearHalfAndHalf(2);
    	}
    	
    }
 	
 	
 	// 하프&하프 검색 _ 하프&하프 피자선택 Combo List 초기화
    function fnClearHalfAndHalf(num)
    {
    	var sel0 = $("#pro_size").val();  // 상단 
    	var sel1 = $("#half1").val();     // 왼쪽 
    	var sel2 = $("#half2").val();     // 오른쪽
    	var $img = $("#half"+num+"Img");
    	
    	$img.html("");
		$(".half"+num).find(".name").text("");
    	$(".half"+num).find(".price").text("");
    	$(".half"+num).find(".t_block").text("");
    	$(".plus").find("img").hide();
    	$(".right").find(".select_price").text("");
    	
    	if( sel0 == "" )
    	{
			$("#half1 option").remove();
	    	var str = "<option value=''>피자1 선택해주세요.</option>";		
			$("#half1").html(str);
			
			$("#half2 option").remove();
	    	var str = "<option value=''>피자2 선택해주세요.</option>";		
			$("#half2").html(str);
    	}
    	else if( sel0 != "" && sel1 == "" )
    	{
    		$("#half2 option").remove();
	    	var str = "<option value=''>피자2 선택해주세요.</option>";		
			$("#half2").html(str);
    	}
    	
    }
 	
 	// 하프&하프 사이즈 선택 때 왼쪽 오른족 Combo List 초기화
 	function fnClearHalfAndHalfLeftRight(num)
 	{
    	var $img = $("#half"+num+"Img");
 	
 		$img.html("");
		$(".half"+num).find(".name").text("");
    	$(".half"+num).find(".price").text("");
    	$(".half"+num).find(".t_block").text("");
    	$(".plus").find("img").hide();
    	$(".right").find(".select_price").text("");
    	
    	$("#half1 option").remove();
    	var str = "<option value=''>피자1 선택해주세요.</option>";		
		$("#half1").html(str);
		
		$("#half2 option").remove();
    	var str = "<option value=''>피자2 선택해주세요.</option>";		
		$("#half2").html(str);
 	}
 	
 	
 	// 하프&하프 검색 _ 하프&하프 피자선택 검사 (품절여부, 판매여부)
 	function fnChkStoreMenuHalfAndHalf(mCode, sCode, dCode)
  	{
    	var $ord_info = $("#ord_optInfo_section");
		var storeCode = document.frmOrder.cartOrdStoreCode.value;  // 매장코드
		var storeName = $ord_info.find(".store_name");
		var rtnTxt    = "Y";
	
		/*	
		if( storeCode != "" && storeCode != null )
		{
			$.ajax(
			{
				url      : "</%=root%>/order/checkStoreMenu.jsp?flag=halfMenu&storeCode="+storeCode+"&mCode="+mCode+"&sCode="+sCode+"&dCode="+dCode,
				dataType : "html",
				type     : "post",
				success  : function(data)
				{
					rtnTxt = trim(data);
					
					if( "N" == trim(data) )
					{
						rtnTxt = "N";
						alert("선택하신 상품은 ["+ storeName.text() +"]에서 주문하실 수 없습니다.");
					}
					else
					{
						rtnTxt ="Y";
					}
//					return rtnTxt;
				}
				,error : function( jqXHR, textStatus, errorThrown )
	         	{
					
	         	}
			});	
		}
		else
		{
			return rtnTxt;
		}
		*/		
		return rtnTxt;
		
 	}

 	
 	// 하프&하프 검색 _ 하프&하프 피자선택 메뉴 검색
    function fnSelMenuHalfAndHalf(val, num)
    {
    	
    	var code    = $("#pro_size").val();             // 메뉴소분류코드, 메뉴세분류코드
    	var $menuNm = $(".half"+num).find(".name");     // 메뉴이름
    	var $price  = $(".half"+num).find(".price");    // 가격
    	var $won    = $(".half"+num).find(".t_block");  // 단위표시
    	
        $.ajax(
        { 
	 	   	type       : 'post',
	 	   	data       : "flag=menu&code="+code+"&val="+val,
		   	url        : "/order/half.jsp",
		   	dataType   : "json",
			beforeSend : function() 
			{              
				//통신을 시작할때 처리             
				$('#viewLoading').show().fadeIn(500);          
			},
		   	complete : function() 
		   	{             
				//통신이 완료된 후 처리              
				$('#viewLoading').fadeOut();
				fnCompPriceHalfAndHalf();  // 하프&하프 검색 _ 하프&하프 선택메뉴 가격합산 표시
			},
		   	success : function(data)
		   	{
	 	   		var d= data.halfMenu[0];
	 	   		$menuNm.text(d.menuMidName);	
	 	   		$price.text( won(d.menuSaleAmt));
	 	   		$won.text("원");
	 	   					
	 	   		//전송용 값 설정
	 	   		$("#halfMenuCode"   +num).val(d.menuCode   );  // 하프메뉴코드       : num = 1 -> (왼쪽), num = 2 -> (오른쪽)
	 	   		$("#halfMenuName"   +num).val(d.menuName   );  // 하프메뉴명         : num = 1 -> (왼쪽), num = 2 -> (오른쪽)
	 	   		$("#halfMenuLagCode"+num).val(d.menuLagCode);  // 하프메뉴대분류코드 : num = 1 -> (왼쪽), num = 2 -> (오른쪽)
	 	   		$("#halfMenuMidCode"+num).val(d.menuMidCode);  // 하프메뉴중분류코드 : num = 1 -> (왼쪽), num = 2 -> (오른쪽)
	 	   		$("#halfMenuSmlCode"+num).val(d.menuSmlCode);  // 하프메뉴소분류코드 : num = 1 -> (왼쪽), num = 2 -> (오른쪽)
	 	   		$("#halfMenuSubCode"+num).val(d.menuSubCode);  // 하프메뉴세분류코드 : num = 1 -> (왼쪽), num = 2 -> (오른쪽)
	 	   		$("#halfMenuPrice"  +num).val(d.menuPrice  );  // 하프메뉴단가       : num = 1 -> (왼쪽), num = 2 -> (오른쪽)
	 	   		$("#halfMenuQty"    +num).val("0.5"        );  // 하프메뉴수량       : num = 1 -> (왼쪽), num = 2 -> (오른쪽)
	 	   		$("#halfMenuAmt"    +num).val(d.menuSaleAmt);  // 하프메뉴금액       : num = 1 -> (왼쪽), num = 2 -> (오른쪽)
	 	   		$("#halfMenuSize"   +num).val(d.menuSize   );  // 하프메뉴사이즈     : num = 1 -> (왼쪽), num = 2 -> (오른쪽)
	 	   		$("#halfMenuDough"  +num).val(d.menuDough  );  // 하프메뉴도우종류   : num = 1 -> (왼쪽), num = 2 -> (오른쪽)
			},
			error:function(request,status,error)
			{   
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			}
	   	});
   		
    }
    
 	// 하프&하프 검색 _ 하프&하프 선택메뉴 가격합산 표시
    function fnCompPriceHalfAndHalf()
    {
    	
    	var halfPrcVal1 = $("#halfMenuAmt1").val();
		var halfPrcVal2 = $("#halfMenuAmt2").val();
		
		if( $("#half1").val() != "" && $("#half2").val() != "" && $("#pro_size").val() != "" )
		{
			var completPrc = won( (parseInt(halfPrcVal1)+parseInt(halfPrcVal2)).toString() );
			$(".right").find(".select_price").text( completPrc.replace("원", ""));
			$(".half_spcInstruction").css("display","block");
		}
    }
 	
 	
 	// E쿠폰 검색
    function fnSelECoupon(code)
    {
    	
    	if( $("#coup_id").val() == "" || $("#coup_id").val() == null )
    	{
			var alertFrame = $("#notice_1002");
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>구매하신 쿠폰번호를 먼저 입력 후<br>조회버튼을 눌러 주세요!</p>").css("line-height","35px"); 
			popAlert(alertFrame);
    		
			$("#coup_id").focus();
    		return;
    	}

    	// 화면 Clear
		$("#eCouponCompany").val("");  // E쿠폰제휴사
		$("#eCouponCode"   ).val("");  // E쿠폰코드
		$("#eCouponName"   ).val("");  // E쿠폰명
	    $("#eCouponNumber" ).val("");  // E쿠폰번호
		var image      = $("#ecoup_section .right img");
		var couponName = $("#ecoup_section .right .name");
    	image.attr("src", "/assets/img/order/menu/eCoupon_img_none.png");
    	couponName.text("");
    	
    	$.ajax(
    	{
			url        : "/order/newCart.jsp?cartAction=getECouponCount&cartECouponNumber="+$("#coup_id").val(),
  			type       : "post",
  			dataType   : "html",
  			beforeSend : function() 
  			{              
  				//통신을 시작할때 처리             
  				$('#viewLoading').show().fadeIn(500);          
  			},
			complete : function() 
			{             
  				//통신이 완료된 후 처리              
  				$('#viewLoading').fadeOut();         
  			},
			success : function(data)
			{
  				if( trim(data) == "1" )
  				{
					popAlert("#notice_eCopCart");
  				}
  				else
  				{
  			    	// 쿠폰번호 처음3자리를 잘라서 체크
  			    	var couponNumber = $("#coup_id").val().substring(0, 3);
  					if( couponNumber == "800" )
  					{
  						fnSelInterfaceCoopmarket();  //  E쿠폰 검색 쿠프마케팅 인터페이스 처리
  					}
  					else if( couponNumber == "900" )
  					{
  						fnSelInterfaceGiftshow();  //  E쿠폰 검색 기프티쇼 인터페이스 처리
  					}
  					else
  					{
  						fnSelInterfacePapajohns();  //  E쿠폰 검색 파파존스 인터페이스 처리
  					}
  				}
  			}
  		});
    	
    }


	//  E쿠폰 검색 쿠프마케팅 인터페이스 처리
 	function fnSelInterfaceCoopmarket()
    {
    	
    	var command    = "L0";                 // 처리요청코드 L0 : 쿠폰조회  L1 : 쿠폰인증  L2 : 쿠폰인증취소
    	var couponNo   = $("#coup_id").val();  // 쿠폰번호
    	//var branchCode = "1234567890";         // 매장코드(선택값)
    	var branchCode = $("#cartOrdStoreCode").val();
    	
    	if(branchCode == "" || branchCode == null){
    		branchCode = "1234567890";   
    	}
    	
    	$.ajax(
    	{
			url      : "/order/couponCheck.jsp?flag=gmarket&command="+command+"&couponNo="+couponNo+"&branchCode="+branchCode,
  			dataType : "json",
  			type     : "post",
  			
			complete : function() 
			{             
  				//통신이 완료된 후 처리              
  				$('#viewLoading').fadeOut();         
  			},
  			success  : function(data)
  			{
				var returnValue = data.gmarket[0];
				
  				if( returnValue.resultCode == "11" )
  				{
					popAlert("#notice_eCopErr");
  				}
				else if( returnValue.resultCode == "22" )
				{
					popAlert("#notice_eCopUse");
				}
				else if( returnValue.resultCode == "00" )
  				{
					var image      = $("#ecoup_section .right img");
					var couponName = $("#ecoup_section .right .name");
			    	image.attr("src", "/assets/img/order/menu/eCoupon_img_default.png");
			    	couponName.text(returnValue.couponName);

			    	var menuCode = returnValue.productCode;
			        fnSelECouponMenu(menuCode);  // E쿠폰 메뉴 검색
  				}
				else if( returnValue.resultCode == "ER" )
				{
					popAlert("#notice_eCopErr_NW");
				}
				else
  				{
					popAlert("#notice_eCopErr");
  				}
  			}
			,error: function(jqXHR, textStatus, errorThrown)
            {
            	
            }
  		});
    	
    }

 	
 	// E쿠폰 검색 기프티쇼 인터페이스 처리
    function fnSelInterfaceGiftshow()
    {
    	
    	var command    = "100";                         // 기능코드 : 100=쿠폰조회, 101=쿠폰승인요청, 102=쿠폰취소요청
    	var couponNo   = $("#coup_id").val();           // 쿠폰번호
		var branchCode = $("#cartOrdStoreCode").val();  // 매장코드
    	
    	$.ajax(
    	{
			url      : "/order/couponCheck.jsp?flag=giftiShow&command="+command+"&couponNo="+couponNo+"&branchCode="+branchCode,
  			dataType : "json",
  			type     : "post",
			complete : function() 
			{             
  				//통신이 완료된 후 처리              
  				$('#viewLoading').fadeOut();         
  			},
  			success  : function(data)
  			{
  				var returnValue = data.giftiShow[0];
				
				if( returnValue.headStatusCode == "000" )
  				{
					var image      = $("#ecoup_section .right img");
					var couponName = $("#ecoup_section .right .name");
			    	image.attr("src", "/assets/img/order/menu/eCoupon_img_default.png");
			    	couponName.text($("#eCouponName").val());

			    	var menuCode = returnValue.bodyProductID;
			        fnSelECouponMenu(menuCode);  // E쿠폰 메뉴 검색
  				}
				else if( returnValue.headFailCode == "E0006" )
				{
					popAlert("#notice_eCopUse");
				}
				else if( returnValue.headFailCode == "E00NW" )
				{
					popAlert("#notice_eCopErr_NW");
				}
  				else
  				{
					popAlert("#notice_eCopErr");
  				}
  			}
			,error: function( jqXHR, textStatus, errorThrown )
            {
            	
            }
  		});
    	
    }
 	
 	
	//  E쿠폰 검색 파파존스 인터페이스 처리
    function fnSelInterfacePapajohns()
    {
    	var couponNo = $("#coup_id").val();  // 쿠폰번호
    	
    	$.ajax(
    	{
    		url      : "/order/couponCheck.jsp?flag=papajohns&couponNo="+couponNo,
    		dataType : "json",
    		type     : "post",
			complete : function() 
			{             
  				//통신이 완료된 후 처리              
  				$('#viewLoading').fadeOut();         
  			},
    		success  : function(data)
    		{
				var returnValue = data.papajohns[0];
				
  				if( returnValue.resultCode == "11" )
  				{
					popAlert("#notice_eCopErr"); //에러
  				}
				else if( returnValue.resultCode == "22" )
				{
					popAlert("#notice_eCopUse"); //사용
				}
				else if( returnValue.resultCode == "33" )
				{
					popAlert("#notice_eDate"); //기간지남
				}
				else if( returnValue.resultCode == "00" ) //가능
  				{
					var image      = $("#ecoup_section .right img");
			    	image.attr("src", "/assets/img/order/menu/eCoupon_img_default.png");

			    	var menuCode = returnValue.menuCode;
			    	
			        fnSelECouponMenu(menuCode);  // E쿠폰 메뉴 검색
  				}
  				else
  				{
					popAlert("#notice_eCopErr");
  				}
    		}
    		,error: function( jqXHR, textStatus, errorThrown )
    	    {
    	            	
    	    }
    	});
    }
 	
 	
 	// E쿠폰 메뉴 검색
    function fnSelECouponMenu(menuCode)
    {
    	
		var $menu_sect = $("#ecoup_section");
		var height     = 0;
		
    	$.ajax(
    	{ 
	   		type       : 'post',
			url        : "/order/couponCheck.jsp?flag=selectMenu&menuCode="+menuCode,
			beforeSend : function() 
			{              
				//통신을 시작할때 처리             
				//$('#viewLoading').show().fadeIn(500);          
			},
	   		complete: function() 
			{             
				//통신이 완료된 후 처리              
				$('#viewLoading').fadeOut();  
			},
	   		success:function(data)
	   		{
	   			if( trim(data) != "" && trim(data) != null && trim(data) != "NO" && trim(data) != "]" )
	   			{
		   			var receiveData = trim(data);
					//스트링 데이터를 제이슨 오브젝트로 변형
					var setMenuInfo = $.parseJSON(receiveData); 
					
					$menu_sect.find(".eCouponDetail").remove();
					 
					if( setMenuInfo.length > 0 )
					{
						for( var i = 0; i < setMenuInfo.length; i++ )
						{
		  	  				$("#ecopMenuCode"   ).val(setMenuInfo[i].menuCode   );  // E쿠폰메뉴코드
		  	  				$("#ecopMenuName"   ).val(setMenuInfo[i].menuName   );  // E쿠폰메뉴명
		  	  				$("#ecopMenuDivCode").val(setMenuInfo[i].menuDivCode);  // E쿠폰메뉴구분코드
		  	  				$("#ecopMenuLagCode").val(setMenuInfo[i].menuLagCode);  // E쿠폰메뉴대분류코드
		  	  				$("#ecopMenuMidCode").val(setMenuInfo[i].menuMidCode);  // E쿠폰메뉴중분류코드
		  	  				$("#ecopMenuSmlCode").val(setMenuInfo[i].menuSmlCode);  // E쿠폰메뉴소분류코드
		  	  				$("#ecopMenuSubCode").val(setMenuInfo[i].menuSubCode);  // E쿠폰메뉴세분류코드
		  	  				$("#ecopMenuPrice"  ).val(setMenuInfo[i].menuPrice  );  // E쿠폰메뉴단가
		  	  				$("#ecopMenuDiscAmt").val(setMenuInfo[i].menuDiscAmt);  // E쿠폰메뉴할인금액
		  	  				$("#ecopMenuSaleAmt").val(setMenuInfo[i].menuSaleAmt);  // E쿠폰메뉴판매금액
		  	  				$("#ecopMenuSize"   ).val(setMenuInfo[i].menuSize   );  // E쿠폰메뉴사이즈
							$("#eCouponCompany" ).val(setMenuInfo[i].couponComp );  // E쿠폰제휴사
							$("#eCouponCode"    ).val(setMenuInfo[i].couponCode );  // E쿠폰코드
							$("#eCouponName"    ).val(setMenuInfo[i].couponName );  // E쿠폰명
						    $("#eCouponNumber"  ).val($("#coup_id").val()       );  // E쿠폰번호
						    
							var couponName = $("#ecoup_section .right .name");
					    	couponName.text($("#eCouponName").val().split(")")[1]);
						    
							var html = '<p class="eCouponDetail">';
							for( var m = 0; m < setMenuInfo[i].setMenuDetail.length; m++ )
							{
								html += '<span class="hiddenData">';
								html +=      setMenuInfo[i].setMenuDetail[m].setCode        + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setSeqNumber   + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuCode    + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuName    + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuDivCode + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuLagCode + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuMidCode + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuSmlCode + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuSubCode + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuPrice   + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuQty     + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuAmount  + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuDisRate + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuDisAmt  + '/';
								html += '' + setMenuInfo[i].setMenuDetail[m].setMenuCopDis  + '/';
								html +=      setMenuInfo[i].setMenuDetail[m].setMenuNetSale + '</span>';  
							} 
							html += '</p>'
							$menu_sect.find(".right").append(html); 
						}
					}
	   			}
   			}
   		});

    }
 	
 	
	/********************* 장바구니 저장할 데이터 만들기 *********************/  // Rjeong
	// 피자 : pizzaMenu_9999 / 세트 : setMenu_ /사이드 : sideMenu_9999 /음료 : etcMenu_99999 /하프앤하프 : halfMenu_ /e쿠폰 : couponMenu_
    //num : 카테고리별 제품 인덱스
    function makeSendData(menuIdx)
	{ 

    	document.frmOrder.cartAction.value         = "";  // 장바구니처리
    	document.frmOrder.cartMenuType.value       = "";  // 메뉴타입
    	document.frmOrder.cartMenuCode.value       = "";  // 메뉴코드
    	document.frmOrder.cartMenuName.value       = "";  // 메뉴명
    	document.frmOrder.cartMenuOrdCode.value    = "";  // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
    	document.frmOrder.cartMenuDivCode.value    = "";  // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
    	document.frmOrder.cartMenuLagCode.value    = "";  // 메뉴대분류코드
    	document.frmOrder.cartMenuMidCode.value    = "";  // 메뉴중분류코드
    	document.frmOrder.cartMenuSmlCode.value    = "";  // 메뉴소분류코드
    	document.frmOrder.cartMenuSubCode.value    = "";  // 메뉴세분류코드
    	document.frmOrder.cartMenuPrice.value      = "";  // 메뉴주문단가
    	document.frmOrder.cartMenuQty.value        = "";  // 메뉴주문수량
    	document.frmOrder.cartMenuAmt.value        = "";  // 메뉴주문금액
    	document.frmOrder.cartMenuDisRate.value    = "";  // 메뉴할인율
    	document.frmOrder.cartMenuDisAmt.value     = "";  // 메뉴할인금액
    	document.frmOrder.cartMenuCopDisAmt.value  = "";  // 메뉴선결제쿠폰할인
    	document.frmOrder.cartMenuNetSaleAmt.value = "";  // 메뉴순매출금액
    	document.frmOrder.cartMenuPayAmt.value     = "";  // 메뉴결제금액
    	document.frmOrder.cartMenuBakeCode.value   = "";  // 메뉴베이크코드
    	document.frmOrder.cartMenuCutCode.value    = "";  // 메뉴컷코드
    	document.frmOrder.cartMenuCheeseCode.value = "";  // 메뉴치즈코드
    	document.frmOrder.cartMenuSauceCode.value  = "";  // 메뉴소스코드
    	document.frmOrder.cartMenuMessage.value    = "";  // 메뉴전달메세지
    	document.frmOrder.cartMenuSize.value       = "";  // 메뉴사이즈
    	document.frmOrder.cartMenuDough.value      = "";  // 메뉴도우종류
    	document.frmOrder.cartECouponCompany.value = "";  // E쿠폰제휴사
    	document.frmOrder.cartECouponCode.value    = "";  // E쿠폰코드
    	document.frmOrder.cartECouponNumber.value  = "";  // E쿠폰번호

     	var cartSendDataInfo = null;                                            // 장바구니 전송 내역
    	var checkMenuSize    = document.getElementsByName("pSize_" + menuIdx);  // 선택한 피자 사이즈 체크
    	var selMenuValue     = document.getElementsByName("pCode_" + menuIdx);  // 선택한 피자 메뉴 
    	var cartIndex        = setCartIndex();	                                 // 장바구니 순번
     	
     	// 피자메뉴가 아닌 경우 해당 메뉴 수량
     	var currMenuDiv = $("#menuList_section").find("#menu_" + menuIdx); 
      	var menuCntBox  = currMenuDiv.find(".item_right .select_count");
      	var selMenuQty  = menuCntBox.find("select option:selected").val();
      	
     	var currMenuOptions = $("#option_box_" + menuIdx);
     	var findMenuOptions = currMenuOptions.find(".spcInstructions li");
     	var selMenuOptions  = [];
     	findMenuOptions.each(function(i,e) 
     	{ 
     		selMenuOptions[i] = $(this).find("input:checked").val();
     		if( i == 0 ) { document.frmOrder.cartMenuSauceCode.value  = selMenuOptions[i]; } 
     		if( i == 1 ) { document.frmOrder.cartMenuCheeseCode.value = selMenuOptions[i]; } 
     		if( i == 2 ) { document.frmOrder.cartMenuBakeCode.value   = selMenuOptions[i]; } 
     		if( i == 3 ) { document.frmOrder.cartMenuCutCode.value    = selMenuOptions[i]; }
     	}); 
     	var cartMenuOptions = selMenuOptions.join("/");
     	
    	// 메뉴 사이즈 갯수만큼 체크한다.(피자별로 생성되는 사이즈수가 틀림)
    	for( var i = 0; i < checkMenuSize.length; i++ )
    	{
    		//라디오 버튼이 체크상태이면 메뉴정보 저장
    		if( checkMenuSize[i].checked == true )
    		{
    			var menuList  = selMenuValue[i].value;
    			var menuValue = menuList.split(",");
    			
    			document.frmOrder.cartAction.value         = "addMenu";                       // 장바구니처리
    	    	document.frmOrder.cartMenuType.value       = "";                              // 메뉴타입
    	    	document.frmOrder.cartMenuCode.value       = menuValue[0] + "_" + cartIndex;  // 메뉴코드
    	    	document.frmOrder.cartMenuName.value       = menuValue[1];                    // 메뉴명
    	    	document.frmOrder.cartMenuOrdCode.value    = "10";                            // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
    	    	document.frmOrder.cartMenuDivCode.value    = menuValue[9];                    // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
    	    	document.frmOrder.cartMenuLagCode.value    = menuValue[5];                    // 메뉴대분류코드
    	    	document.frmOrder.cartMenuMidCode.value    = menuValue[6];                    // 메뉴중분류코드
    	    	document.frmOrder.cartMenuSmlCode.value    = menuValue[7];                    // 메뉴소분류코드
    	    	document.frmOrder.cartMenuSubCode.value    = menuValue[8];                    // 메뉴세분류코드
    	    	document.frmOrder.cartMenuPrice.value      = menuValue[3];                    // 메뉴주문단가
    	    	document.frmOrder.cartMenuQty.value        = "0";                             // 메뉴주문수량
    	    	document.frmOrder.cartMenuAmt.value        = menuValue[3];                    // 메뉴주문금액
    	    	document.frmOrder.cartMenuDisRate.value    = "0";                             // 메뉴할인율
    	    	document.frmOrder.cartMenuDisAmt.value     = "0";                             // 메뉴할인금액
    	    	document.frmOrder.cartMenuCopDisAmt.value  = "0";                             // 메뉴선결제쿠폰할인
    	    	document.frmOrder.cartMenuNetSaleAmt.value = menuValue[3];                    // 메뉴순매출금액
    	    	document.frmOrder.cartMenuPayAmt.value     = menuValue[3];                    // 메뉴결제금액
    	    	document.frmOrder.cartMenuMessage.value    = "";                              // 메뉴전달메세지
    	    	document.frmOrder.cartMenuSize.value       = menuValue[2];                    // 메뉴사이즈
    	    	document.frmOrder.cartMenuDough.value      = menuValue[4];                    // 메뉴도우종류
    	    	
    			//메뉴대분류코드별 메뉴타입 및 메뉴수량 세팅
    			if( document.frmOrder.cartMenuLagCode.value == "10" )  // 피자
    			{
        			document.frmOrder.cartMenuType.value = "typePizza";  // 메뉴 타입
        			document.frmOrder.cartMenuQty.value  = "1";          // 메뉴 수량
    			}
    			else if( document.frmOrder.cartMenuLagCode.value == "20" )  // 사이드
    			{
        			document.frmOrder.cartMenuType.value = "typeSide";   // 메뉴 타입
        			document.frmOrder.cartMenuQty.value  = selMenuQty;   // 메뉴 수량
    			}
    			else if( document.frmOrder.cartMenuLagCode.value == "30" )  // 소스
    			{
        			document.frmOrder.cartMenuType.value = "typeSauce";  // 메뉴 타입
        			document.frmOrder.cartMenuQty.value  = selMenuQty;   // 메뉴 수량
    			}
    			else if( document.frmOrder.cartMenuLagCode.value == "40" )  // 음료
    			{
        			document.frmOrder.cartMenuType.value = "typeBever";  // 메뉴 타입
        			document.frmOrder.cartMenuQty.value  = selMenuQty;   // 메뉴 수량
    			}
	    	}
    	}
    	
    	// 메뉴 품절여부 체크
		var storeCode     = document.frmOrder.cartOrdStoreCode.value;  // 매장코드
    	var storeName     = document.frmOrder.cartOrdStoreName.value;  // 매장명
    	var checkMenuCode = menuValue[0];
    	var flag          = "oneMenu";
		
		if( storeCode != "" )
		{
			$.ajax(
			{
				url      : root+"/order/checkStoreMenu.jsp?flag="+flag+"&storeCode="+storeCode+"&menuCode="+checkMenuCode,
				dataType : "html",
				type     : "post",
				beforeSend: function() 
				{ 
					$('#viewLoading').fadeOut(500);  
				},
				success  : function(data)
				{
					if( "N" == trim(data) )
					{
						var alertFrame = $("#notice_1002");
						alertFrame.find("#alertText p").remove();
						alertFrame.find("#alertText").append("<p>선택하신 메뉴는<br>\""+ storeName +"\" 매장에서 현재 주문이 불가능합니다.</p>"); 
						popAlert(alertFrame);
						return;
					}
					else
					{
						innerCartData();
					}
				},
				error: function( jqXHR, textStatus, errorThrown)
				{
		       		//console.log("jqXHR.status: " + jqXHR.status + "\njqXHR.statusText: " + jqXHR.statusText + "\ntextStatus: " + textStatus + "\nerrorThrown: " + errorThrown);
		       	}
			});	
		}
		else
		{
			innerCartData();
		}
		
		//20131213
		//ajax 통신하는 동안 아래 함수가 실행되면 품절상황이 체크되기전 장바구니에 들어감.
		function innerCartData()
		{
			//피자 수량은 5개까지만 주문 가능 -> 단품 피자, 세트에 포함된 피자, 하프피자
	    	if( document.frmOrder.cartMenuType.value == "typePizza" )
	    	{ 
		    	$.post(root+"/order/newCart.jsp?cartAction=getPizzaCount", function(pizzaCount)
	   	    	{
					var pizzaCount = trim(pizzaCount);  // 장바구니 주문 피자 수량
					if( parseInt(pizzaCount) < 5 )
					{ 
						cartSendDataInfo = {
										    cartAction         : document.frmOrder.cartAction.value          // 장바구니처리
							    		   ,cartMenuType       : document.frmOrder.cartMenuType.value        // 메뉴타입
		    	    					   ,cartMenuCode       : document.frmOrder.cartMenuCode.value        // 메뉴코드
		    	    					   ,cartMenuName       : document.frmOrder.cartMenuName.value        // 메뉴명
		    	    					   ,cartMenuOrdCode    : document.frmOrder.cartMenuOrdCode.value     // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
		    	    					   ,cartMenuDivCode    : document.frmOrder.cartMenuDivCode.value     // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
		    	    					   ,cartMenuLagCode    : document.frmOrder.cartMenuLagCode.value     // 메뉴대분류코드
		    	    					   ,cartMenuMidCode    : document.frmOrder.cartMenuMidCode.value     // 메뉴중분류코드
		    	    					   ,cartMenuSmlCode    : document.frmOrder.cartMenuSmlCode.value     // 메뉴소분류코드
		    	    					   ,cartMenuSubCode    : document.frmOrder.cartMenuSubCode.value     // 메뉴세분류코드
		    	    					   ,cartMenuPrice      : document.frmOrder.cartMenuPrice.value       // 메뉴주문단가
		    	    					   ,cartMenuQty        : document.frmOrder.cartMenuQty.value         // 메뉴주문수량
		    	    					   ,cartMenuAmt        : document.frmOrder.cartMenuAmt.value         // 메뉴주문금액
		    	    					   ,cartMenuDisRate    : document.frmOrder.cartMenuDisRate.value     // 메뉴할인율
		    	    					   ,cartMenuDisAmt     : document.frmOrder.cartMenuDisAmt.value      // 메뉴할인금액
		    	    					   ,cartMenuCopDisAmt  : document.frmOrder.cartMenuCopDisAmt.value   // 메뉴선결제쿠폰할인
		    	    					   ,cartMenuNetSaleAmt : document.frmOrder.cartMenuNetSaleAmt.value  // 메뉴순매출금액
		    	    					   ,cartMenuPayAmt     : document.frmOrder.cartMenuPayAmt.value      // 메뉴결제금액
		    	    					   ,cartMenuBakeCode   : document.frmOrder.cartMenuBakeCode.value    // 메뉴베이크코드
		    	    					   ,cartMenuCutCode    : document.frmOrder.cartMenuCutCode.value     // 메뉴컷코드
		    	    					   ,cartMenuCheeseCode : document.frmOrder.cartMenuCheeseCode.value  // 메뉴치즈코드
		    	    					   ,cartMenuSauceCode  : document.frmOrder.cartMenuSauceCode.value   // 메뉴소스코드
		    	    					   ,cartMenuMessage    : document.frmOrder.cartMenuMessage.value     // 메뉴전달메세지
		    	    					   ,cartMenuSize       : document.frmOrder.cartMenuSize.value        // 메뉴사이즈
		    	    					   ,cartMenuDough      : document.frmOrder.cartMenuDough.value       // 메뉴도우종류
										   ,cartMenuOption     : cartMenuOptions                             // 메뉴옵션
										   ,cartECouponCompany : document.frmOrder.cartECouponCompany.value  // E쿠폰제휴사
										   ,cartECouponCode    : document.frmOrder.cartECouponCode.value     // E쿠폰코드
										   ,cartECouponNumber  : document.frmOrder.cartECouponNumber.value   // E쿠폰번호
			    			               }; 
				    	fnSaveForCart(cartSendDataInfo); 
					}
					else
					{
						$('#viewLoading').fadeOut();
						popAlert("#notice_limit");
						$("#notice_limit").find(".alertBtn").focus();
					}
	   	    	});
	    	}
	    	else
	    	{
	    		cartSendDataInfo = {
					    			cartAction         : document.frmOrder.cartAction.value          // 장바구니처리
		    					   ,cartMenuType       : document.frmOrder.cartMenuType.value        // 메뉴타입
								   ,cartMenuCode       : document.frmOrder.cartMenuCode.value        // 메뉴코드
								   ,cartMenuName       : document.frmOrder.cartMenuName.value        // 메뉴명
								   ,cartMenuOrdCode    : document.frmOrder.cartMenuOrdCode.value     // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
								   ,cartMenuDivCode    : document.frmOrder.cartMenuDivCode.value     // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
								   ,cartMenuLagCode    : document.frmOrder.cartMenuLagCode.value     // 메뉴대분류코드
								   ,cartMenuMidCode    : document.frmOrder.cartMenuMidCode.value     // 메뉴중분류코드
								   ,cartMenuSmlCode    : document.frmOrder.cartMenuSmlCode.value     // 메뉴소분류코드
								   ,cartMenuSubCode    : document.frmOrder.cartMenuSubCode.value     // 메뉴세분류코드
								   ,cartMenuPrice      : document.frmOrder.cartMenuPrice.value       // 메뉴주문단가
								   ,cartMenuQty        : document.frmOrder.cartMenuQty.value         // 메뉴주문수량
								   ,cartMenuAmt        : document.frmOrder.cartMenuAmt.value         // 메뉴주문금액
								   ,cartMenuDisRate    : document.frmOrder.cartMenuDisRate.value     // 메뉴할인율
								   ,cartMenuDisAmt     : document.frmOrder.cartMenuDisAmt.value      // 메뉴할인금액
		    					   ,cartMenuCopDisAmt  : document.frmOrder.cartMenuCopDisAmt.value   // 메뉴선결제쿠폰할인
		    					   ,cartMenuNetSaleAmt : document.frmOrder.cartMenuNetSaleAmt.value  // 메뉴순매출금액
								   ,cartMenuPayAmt     : document.frmOrder.cartMenuPayAmt.value      // 메뉴결제금액
		    					   ,cartMenuBakeCode   : document.frmOrder.cartMenuBakeCode.value    // 메뉴베이크코드
		    					   ,cartMenuCutCode    : document.frmOrder.cartMenuCutCode.value     // 메뉴컷코드
		    					   ,cartMenuCheeseCode : document.frmOrder.cartMenuCheeseCode.value  // 메뉴치즈코드
		    					   ,cartMenuSauceCode  : document.frmOrder.cartMenuSauceCode.value   // 메뉴소스코드
								   ,cartMenuMessage    : document.frmOrder.cartMenuMessage.value     // 메뉴전달메세지
								   ,cartMenuSize       : document.frmOrder.cartMenuSize.value        // 메뉴사이즈
								   ,cartMenuDough      : document.frmOrder.cartMenuDough.value       // 메뉴도우종류
								   ,cartMenuOption     : cartMenuOptions                             // 메뉴옵션
								   ,cartECouponCompany : document.frmOrder.cartECouponCompany.value  // E쿠폰제휴사
								   ,cartECouponCode    : document.frmOrder.cartECouponCode.value     // E쿠폰코드
								   ,cartECouponNumber  : document.frmOrder.cartECouponNumber.value   // E쿠폰번호
			           		       }; 
				fnSaveForCart(cartSendDataInfo);	
	    	}
		}
    }
	/*************************************************************************/
	
	
    // 장바구니 메뉴 삭제
    function fnRemoveBasket(val, type, price)
    {
		var id = val.split("_");
		var count = $("#"+ val +" input#count").attr("value");

    	document.frmOrder.cartAction.value   = "deleteCartMenu";
    	document.frmOrder.cartMenuCode.value = id[1]+"_"+id[2];
    	
    	$.ajax(
    	{
			url       : "/order/newCart.jsp",
			type      : "POST",
			data      : $("#frmOrder").serialize(),
			dataType  : "html", 
			beforeSend: function() 
			{              
				//통신을 시작할때 처리             
				$('#viewLoading').show().fadeIn(500);
			}, 
			complete: function() 
			{             
				//통신이 완료된 후 처리              
				$('#viewLoading').fadeOut();         
			},
			success : function(data)
			{
				//정상적으로 서버통신 된 후 화면에서 삭제
				if( trim(data) == "true" )
				{
					//해당 리스트 메뉴 가격 빼기!!
					var prc = 0;
					prc -= parseInt(price.replace(",", ""));
					setTotalPrc((prc * count), 1);  // 주문 합계 금액 계산
					fnDeleteMenuTooping(val, type);  // 메뉴 토핑 삭제(메뉴 삭제시)
				}
			}
		});
    	
    }
	
	
 	/* 최종주문금액 쓰기 */
 	// 주문 합계 금액 계산
 	function setTotalPrc(price, value)
 	{
		//value : 플러스 또는 마이너스 또는 0 밸류 표시
 		toPrc += parseInt(price);
 		toPrc *= value;
		var $totalPrcArea = $("#ord_total");
 		$totalPrcArea.find(".price").text(won(toPrc.toString())); 

 		//20130923 
 		//장바구니 보기 버튼의 수량 갱신 
 		getCount();
 		
 	}

	
 	//20130923 장바구니 목록 개수
 	function getCount()
 	{
 		
		$.post(root+"/order/newCart.jsp?cartAction=getCountOfCartMenus", function(count)
		{
			var menuCount = trim(count) ;
	 		$("#scrollTopBtn").text(menuCount);
		});
		
 	}
 	

 	// 메뉴 토핑 삭제(메뉴 삭제시)
	function fnDeleteMenuTooping(val, type)
	{
		var cnt   = 0; 
		var $list = $("#"+val);
		var count = $("#"+ val +" input#count").attr("value");
		
   		var toppTotalPrc = 0;

	 	$.post("/order/newCart.jsp?cartAction=deleteCartTooping&cartMenuCode="+ val.replace('pizzaMenu_', ''),
		function(flag)
		{  
			//정상적으로 서버통신 된 후 화면에서 삭제   
		    //해당 메뉴에 추가된 토핑 있으면 토핑가격도 같이 빼주기!!   
 		    $list.find("ul.topp_p").each(function(i,e)
 		    {
		    	//토핑가격 장바구니 총액서 빼기
		    	$(this).find("li").each(function(i,e)
		    	{
		    		var eaAmount = $(this).find(".toppEaAmt").val();	////1.토핑개별 총액
		    		toppTotalPrc += parseInt(eaAmount);
		    	});
		    	
		    	toppTotalPrc = 0 - (toppTotalPrc * parseInt(count));
	    		setTotalPrc(toppTotalPrc, 1); 
		    });  
		}); 
		
		//20140620 프로모션 메뉴 화면 삭제 같이 하기
		if(type == "typePromotion")
		{
			//적용메뉴와 할인메뉴가 적용된 쿠폰 코드로 묶음 찾기 
			var followMenuCode = $("#"+ val +" input#promCoupon").val();
			$("#"+ val).parent().find("li.prom_menu").each(function(i){
//				alert( $(this).attr("class") );
				if( $(this).hasClass(followMenuCode) )
				{
					$(this).remove();
				}
			});
		}
		
		$list.remove();
	}
 	
 	
    /* 주문정보 확인->배송정보 저장-> pj_1003이동*/
    function fnOrderInfoView()
    {
    	
		// 선택 메뉴 여부 및 금액 한도 Check
		var $cartList  = $("#ord_list>li");
	 	var $totalPrc  = $("#ord_total").find(".price").text();
		var cartAmount = parseInt($totalPrc.replace(",","").replace("원","") );
		var orderFlag  = false;  //장바구니에 피자또는 사이드 메뉴를 포함하는지 검사
		var alertFrame = $("#notice_1002");
		
		$cartList.each(function(e,i)
		{
			var menuType = $(this).attr("class");
			//사이드 메뉴는 클래스 이름 수정 > side_menu(20130627)
			//if( menuType == "pizza_menu product" || menuType == "set_menu product" || menuType == "set_menu eCoupon_menu product" || menuType == "half_menu product" || menuType == "side_menu product" ) { orderFlag = true; }
			
			//20140620 프로모션 메뉴까지 포함 통과~
			if( $(this).hasClass("pizza_menu") == true || $(this).hasClass("set_menu") == true  || $(this).hasClass("half_menu") == true || $(this).hasClass("side_menu") == true  ){orderFlag = true;}
		});
		
		//장바구니에 메뉴가 있고 총액이 10000원이상, 피자메뉴를 포함한 경우만 주문 진행
		if( $cartList.size() < 0 || cartAmount < 10000 || orderFlag == false )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>피자 또는 사이드 메뉴를 포함하여 <br/>총  10,000원 이상인 경우만 주문이 가능합니다.</p>").css("line-height","35px"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			return;
		}
		
		// 배달주문, 포장주문 주문방법 선택 Check
		if( $("#btn_addr").hasClass("active") == false && $("#btn_store").hasClass("active") == false )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>\"배달주문\" 또는 \"포장주문\"을 선택해 주세요!</p>").css("line-height","45px"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			return;
		}
		
		var mem_name  = $("#ord_optInfo_section .mem_name").text();
		var mem_phone = $("#ord_optInfo_section .mem_phone").text();
		var addr      = $("#ord_optInfo_section .addr").text();
		
    	// 고객명(수령인), 연락처(전화번호), 배달주소 Check
     	if( mem_name.length <= 0 || mem_phone.length <= 0 || addr.length <= 0 )
     	{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>\"배달\" 또는 \"포장\" 주문을 선택하시고<br/>\"수령인 정보\" 및 \"주소\"를 확인해 주세요!</p> ").css("line-height","35px"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
     		return;
     	}
		// 바로주문, 예약주문 주문방법 선택 Check
		//if( $("#btn_ordNow").hasClass("active") == false && $("#btn_ordReserv").hasClass("active") == false )
		//조건문 변경 >> 버튼 값으로 하는 경우 시간이 제대로 선택되지 않아도 넘어가버림
/* 		if($ord_time.text() == "")
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>\"바로주문\" 또는 \"예약주문\"을 선택해주세요!<br/>예약 시간은 \"바로주문\"시간 이후부터 가능합니다.</p> ").css("line-height","35px"); 
			popAlert(alertFrame);
			return;
		} */

    	//********************************************************************************
    	// 주문구분(주문유형)
    	// 10 : 배달주문
    	// 20 : 포장주문
    	// 30 : 단체주문
    	// 40 : 예약주문
    	// 50 : 환불주문
    	// 55 : 수취주문
    	// 60 : A/S주문
    	// 70 : 정보성주문
    	//********************************************************************************
    	document.frmOrder.cartOrdDivide.value    = "";  // 주문구분(주문유형)
    	document.frmOrder.cartOrdReserve.value   = "";  // 예약주문여부
		document.frmOrder.cartOrdCustName.value  = "";  // 고객명
		document.frmOrder.cartOrdCustPhone.value = "";  // 전화번호
		
		//라디오 버튼 세팅
    	if( $("#btn_addr").hasClass("active")      ) { document.frmOrder.cartOrdDivide.value  = "10"; }  // 배달주문버튼
    	if( $("#btn_store").hasClass("active")     ) { document.frmOrder.cartOrdDivide.value  = "20"; }  // 포장주문버튼
/*     	if( $("#btn_ordNow").hasClass("active")    ) { document.frmOrder.cartOrdReserve.value = "N";  }  // 바로주문버튼
    	if( $("#btn_ordReserv").hasClass("active") ) { document.frmOrder.cartOrdReserve.value = "Y";  }  // 예약주문버튼
    	 */
		document.frmOrder.cartOrdCustName.value  = mem_name;                               // 고객명
		document.frmOrder.cartOrdCustPhone.value = mem_phone;                              // 전화번호

    	var cartOrderInfo = null;
    	
    	cartOrderInfo = {
    	 				 cartOrdCustName     : document.frmOrder.cartOrdCustName.value,      // 고객명
    	 				 cartOrdCustPhone    : document.frmOrder.cartOrdCustPhone.value,     // 전화번호
    			         cartOrdDivide       : document.frmOrder.cartOrdDevide.value,        // 주문구분(주문유형)
    			         cartOrdReserve      : document.frmOrder.cartOrdReserve.value,       // 예약주문여부
    			         cartOrdResDate      : document.frmOrder.cartOrdResDate.value,       // 예약일자
    			         cartOrdResTime      : document.frmOrder.cartOrdResTime.value,       // 예약시간
    			         cartOrdDevAddr1     : document.frmOrder.cartOrdDevAddr1.value,      // 배달지주소1
    			         cartOrdDevAddr2     : document.frmOrder.cartOrdDevAddr2.value,      // 배달지주소2
    			         cartOrdDevAddr3     : document.frmOrder.cartOrdDevAddr3.value,      // 배달지주소3
    			         cartOrdDevAddr4     : document.frmOrder.cartOrdDevAddr4.value,      // 배달지주소4
    			         cartOrdAddressID    : document.frmOrder.cartOrdAddressID.value,     // ADDRESS_ID
    			         cartOrdStoreCode    : document.frmOrder.cartOrdStoreCode.value,     // 매장코드
    			         cartOrdStoreName    : document.frmOrder.cartOrdStoreName.value,     // 매장명
    			         cartOrdSectorCode   : document.frmOrder.cartOrdSectorCode.value,    // 매장섹터코드
    			         cartOrdSectorName   : document.frmOrder.cartOrdSectorName.value,    // 매장섹터명
    			         cartOrdDeliveryTime : document.frmOrder.cartOrdDeliveryTime.value,  // 섹터예상시간
    			         cartOrdDeliveryYN   : document.frmOrder.cartOrdDeliveryYN.value,    // 배달가능여부
    			         cartOrdNewAddressYN : document.frmOrder.cartOrdNewAddressYN.value   // 배달지주소신규추가여부
	                    }; 

    	var jsonCartOrderInfo = JSON.stringify(cartOrderInfo);
    	 
    	//장바구니에 있는 모든메뉴 상태 검사 _ 매장코드로
    	var storeCode = document.frmOrder.cartOrdStoreCode.value;
    	var storeName = document.frmOrder.cartOrdStoreName.value;
    	
   		$.ajax(
   		{
   			url      : "/order/checkStoreMenu.jsp",
   			type     : "post",
   			data     : "storeCode="+storeCode+"&flag=allMenu&storeName="+storeName,
   			dataType : "html",
   			success  : function(data)
   			{
   				if( trim(data) != "" )
   				{
   					alertFrame.find("#alertText p").remove();
   					alertFrame.find("#alertText").append("<p>" + trim(data).split("*")[0] + "<br>" + trim(data).split("*")[1] + "<br>" + trim(data).split("*")[1] +"</p>").css("line-height","35px"); 
   					popAlert(alertFrame);
					alertFrame.find(".alertBtn").focus();
   					//20131212 체크
   					//주문불가 알림 후 장바구니에서 삭제 요망!!!
   				}
   				else
   				{
   					fnOrderNext(jsonCartOrderInfo);	
   				}
   			}
   		});

    }
    
    
    /* 주소저장 후 결제 페이지 이동 */
    function fnOrderNext(jsonCartOrderInfo)
    {
    	$.ajax(
    	{
			url      : "/order/addOrderAddr.jsp",
			type     : "post",
			data     : "jsonCartOrderInfo="+encodeURIComponent(jsonCartOrderInfo),
			dataType : "html",
			success  : function(data)
			{
				if( trim(data) == "ok" )
				{
					var url = "/order.jsp?step=step2";
					window.location.href = url;
				}
				else
				{
				}
			},
			error : function( jqXHR, textStatus, errorThrown ) 
			{
			}
 		});
    	
    }
    
    
    /* 주문 및 배달지(주소) session 저장 */
    function fnSaveCartOrderInfo()
    {
    	
    	//********************************************************************************
    	// 주문구분(주문유형)
    	// 10 : 배달주문
    	// 20 : 포장주문
    	// 30 : 단체주문
    	// 40 : 예약주문
    	// 50 : 환불주문
    	// 55 : 수취주문
    	// 60 : A/S주문
    	// 70 : 정보성주문
    	//********************************************************************************
    	document.frmOrder.cartOrdDivide.value  = "";  // 주문구분(주문유형)
    	document.frmOrder.cartOrdReserve.value = "";  // 예약주문여부
    	if( $("#btn_addr").hasClass("active")      ) { document.frmOrder.cartOrdDivide.value  = "10"; }  // 배달주문버튼
    	if( $("#btn_store").hasClass("active")     ) { document.frmOrder.cartOrdDivide.value  = "20"; }  // 포장주문버튼
 
    	/*  20140121 pj_1003화면에서 마지막 전송전 저장   */
    	/* if( $("#btn_ordNow").hasClass("active")    ) { document.frmOrder.cartOrdReserve.value = "N";  }  // 바로주문버튼
    	if( $("#btn_ordReserv").hasClass("active") ) { document.frmOrder.cartOrdReserve.value = "Y";  }  // 예약주문버튼
    	document.frmOrder.cartOrdResDate.value = $("#s_date").val();                     // 예약일자
    	document.frmOrder.cartOrdResTime.value = $("#s_hour").val()+$("#s_minu").val();  // 예약시간 */
    	
    	var cartOrderInfo = null;
    	
    	cartOrderInfo = {
				 		 cartOrdCustName     : document.frmOrder.cartOrdCustName.value,      // 고객명
 				 		 cartOrdCustPhone    : document.frmOrder.cartOrdCustPhone.value,     // 전화번호
    			         cartOrdDivide       : document.frmOrder.cartOrdDevide.value,        // 주문구분(주문유형)
    			         cartOrdReserve      : document.frmOrder.cartOrdReserve.value,       // 예약주문여부
    			         cartOrdResDate      : document.frmOrder.cartOrdResDate.value,       // 예약일자
    			         cartOrdResTime      : document.frmOrder.cartOrdResTime.value,       // 예약시간
    			         cartOrdDevAddr1     : document.frmOrder.cartOrdDevAddr1.value,      // 배달지주소1
    			         cartOrdDevAddr2     : document.frmOrder.cartOrdDevAddr2.value,      // 배달지주소2
    			         cartOrdDevAddr3     : document.frmOrder.cartOrdDevAddr3.value,      // 배달지주소3
    			         cartOrdDevAddr4     : document.frmOrder.cartOrdDevAddr4.value,      // 배달지주소4
    			         cartOrdAddressID    : document.frmOrder.cartOrdAddressID.value,     // ADDRESS_ID
    			         cartOrdStoreCode    : document.frmOrder.cartOrdStoreCode.value,     // 매장코드
    			         cartOrdStoreName    : document.frmOrder.cartOrdStoreName.value,     // 매장명
    			         cartOrdSectorCode   : document.frmOrder.cartOrdSectorCode.value,    // 매장섹터코드
    			         cartOrdSectorName   : document.frmOrder.cartOrdSectorName.value,    // 매장섹터명
    			         cartOrdDeliveryTime : document.frmOrder.cartOrdDeliveryTime.value,  // 섹터예상시간
    			         cartOrdDeliveryYN   : document.frmOrder.cartOrdDeliveryYN.value,    // 배달가능여부
    			         cartOrdNewAddressYN : document.frmOrder.cartOrdNewAddressYN.value   // 배달지주소신규추가여부
	                    }; 
    	
    	var jsonCartOrderInfo = JSON.stringify(cartOrderInfo);
    	
    	$.ajax(
    	{
			url      : "/order/addOrderAddr.jsp",
			type     : "post",
			data     : "jsonCartOrderInfo="+encodeURIComponent(jsonCartOrderInfo),
			dataType : "html",
			success  : function(data)
			{
				if( trim(data) == "ok" )
				{
					
				}
				else
				{
					
				}
			},
			error : function( jqXHR, textStatus, errorThrown ) 
			{
			}
 		});
    	
    }
    
 
 	//scrollTopBtn 스크롤에 따라 위치 변경!!
 	function scrollPosition()
 	{
 		
	 	var de  = document.documentElement;
	 	var b   = document.body;
	 	var now = { };
	 	now.Y = document.all ? (!de.scrollTop ? b.scrollTop : de.scrollTop) : (window.pageYOffset ? window.pageYOffset : window.scrollY);
		
	 	return now.Y;
	 	
 	}
 	
 	//
 	function outmenu(id)
 	{
 		
 	 	var $cart_area = $("#cart_list_section");
 	 	var $ord_area  = $("#ord_area"); 
	 	var $btn       = $("#"+id);
	 
	 	var yw  = scrollPosition();
	 	var obj = document.getElementById(id);
	 
	 	if( yw >= $cart_area.height()+100 )
	 	{
 			obj.style.display="block"; 
		 	if( yw >= $ord_area.height()+155 )
		 	{
			 	$btn.css("position","fixed");
			 	$btn.css("left","50%");
			 	$btn.css("margin-left","278px"); /* 브라우저 중앙에서 우측으로 떨어질 거리  */
		 	}
		 	else
		 	{ 
			 	$btn.css("position","relative");
			 	$btn.css("left","42px");
			 	$btn.css("margin-left","0px");
		 	}
	 	}
	 	else
	 	{
	 		obj.style.display="none"; 
	 	}
	 	
 	}
 	
	// 0.5초(500)마다 outmenu('scrollTopBtn')함수 반복실행(setInterval)
	setInterval("outmenu('scrollTopBtn')", 500); 

	//옵션박스안의 옵션값 변경
	var old_sid  = "";
	var old_this = "";
	$(".option").slideUp();
	
	//
	function swapimg(old_sid, $this) 
	{ 
		
		var prevIndex = parseInt(old_sid.substr(old_sid.length-1, 1) ) -1;	  //이전에 클릭한 옵션의 인덱스 구하기
	  	$this.parent().parent().find("li").eq(prevIndex).find("span").text("▼");
	  	
	}
	
	function fnAdjustMenu(sid,$this)
	{
		
		// 이전 선택 옵션이 지금 선택옵션과 다르면
	    if( old_sid != sid )
	    {  
	    	// 지금 선택한 옵션이 처음 선택이 아니면
	      	if( old_sid != "" )
	      	{  
	    	  	$this.parent().parent().find('#'+old_sid).stop().slideUp(); //이전 옵션을 숨기고 
	         	swapimg(old_sid, $this);   // swapimg 함수를 호출. 
	      	}
	    	
	      	$this.parent().parent().find('#'+sid).stop().slideDown(); // 현재 클릭한 옵션을 보여줌 
	      	old_sid = sid; // 예전 옵션 변수에 현재 옵션 번호를 저장  
	      	$this.find("span").text("▲");
	   	}
	 	// 이전 클릭이 지금 클릭한 옵션과 같으면
	    else
	    { 
		   	$this.parent().parent().find('#'+sid).stop().slideUp(); // 현재 옵션을 숨기고 
	      	old_sid = ""; 
	      	$this.find("span").text("▼"); 
	   	}  
	}
	
	function fnCartAppend_plat(id, name, size, doughNm , price, type, count, setItems)
	{
		// 20140426 세트처럼 붙이기만함 
		// class, name, id 수정안함
		
		var $list    = $("#ord_list");
		var add_list = '';
		
		add_list += '<li class="set_menu product" id="' + id + '">';
		add_list += '<p class="set_name ">'+ name +'</p>'; 
		add_list += '<p class="opt"><span class="price">('+ size +') ' + won(price) + '</span>';
		add_list += '<span class="count">'; 
		add_list += '<span class= "minusBtn"><a href="javascript:fnSetCount(\'' +id +'\',  \''+type+'\', \''+price+'\', \'minus\');">';
		add_list += '<img src="'+root+'/assets/img/order/btn_minus.png" alt="빼기" ></a></span>';
		add_list += '<input type="text" id="count" name="count" class="item_count" value="'+ count +'" />';
		add_list += '<span class= "plusBtn"><a href="javascript:fnSetCount(\'' +id +'\',  \''+type+'\', \''+price+'\', \'plus\');">';
		add_list += '<img src="'+root+'/assets/img/order/btn_plus.png" alt="더하기" /></a></span>'; 
		add_list += '<a href="javascript:fnRemoveBasket(\'' +id +'\', \''+type+'\', \''+ price+'\');" class="btn_menu_del">';
		add_list += '<img src="'+root+'/assets/img/order/btn_item_del.png" alt="삭제" /></a>';
		add_list += '</span></p>';
		add_list += '</li>';
	
		$list.append(add_list);

		var setPrc = parseInt(price.replace(",", "")) * parseInt(count) ;
		setTotalPrc(setPrc, 1);
		contents_resize();
	}
	
	
	// 20140616 프로모션쿠폰리스트 조회 	
    function fnGetPromotionCouponList()
    {
    	$.ajax(
    	{ 
    		type       : 'post',
    		data       : "flag=promotion",
    		url        : "/order/couponCheck.jsp",
    		dataType   : "json",
			beforeSend : function() 
			{              
				//통신을 시작할때 처리             
				$('#viewLoading').show().fadeIn(500);          
			}
    		,complete : function() 
    		{             
				//통신이 완료된 후 처리              
				$('#viewLoading').fadeOut();         
			}
    		,success : function(data)
    		{    			
    			var promotionValue = "";
     			var str = "<option value=''>프로모션 쿠폰을 선택해주세요.</option>";
     			for( var i = 0; i < data.promotionCoupon.length; i++ )
     			{
     				var d= data.promotionCoupon[i];
     				if(d.promotioncouponCode != "" && d.promotionCouponCode != null)
     				{
     					
     					// 프로모션 쿠폰
     					// 쿠폰코드, 
     					// 할인유형코드(1.%할인 2.금액할인 3.무료제공 4.금액할인수기등록 5.%할인수기등록(4/5 POS에서 할인율임의판단) )
     					// 할인율
     					// 할인금액
     					// 할인적용메뉴 Y,N
     					// 할인적용사이즈 Y,N
     					// 할인금액차감대상코드
     					promotionValue =    d.promotionCouponCode            + "," + d.promotionCouponDiscountFlag    + ","
     					                  + d.promotionCouponDiscountPercent + "," + d.promotionCouponDiscountAmt     + ","
     					                  + d.promotionCouponApplicationMenu + "," + d.promotionCouponApplicationSize + ","
     					                  + d.promotionCouponDiscountTarget
     					                  ;
     					str = str + "<option value='" + promotionValue + "'>" + d.promotionCouponNm + "</option>";
     				}
     			}	
     			
     			$("#prom_coupon").html(str);
    		}
    	});
    	
    	//20140618 화면 초기화 추가
    	$(".prom_spcInstruction").hide();
		$(".main_menu .price").text(won("0"));		//메뉴가격
		$(".main_menu #main_menu_img").html("<img src='"+root+"/assets/img/order/menu/00/def_img.png' alt='쿠폰적용메뉴' onerror=\"this.src='"+root+"/assets/img/order/menu/noImage_ord.png'\" />");		// $this.parent().parent().prev() : 메뉴 이미지
     	$("#main_menu option").remove();
 		$("#main_menu").html("<option value=''>메뉴를 선택해주세요.</option>");

		$("#option_box_prom").hide();
 		$(".sub_menu").hide();
		$("#prom_section .plus").hide();
		$("#prom_section .and").hide();
		$(".sub_description").show();
    }
	
	// 20140616 프로모션쿠폰 왼쪽 SELECTBOX 생성 - 메인메뉴
    function fnPromotionMainMenu(val)
    {
		//20140619 메뉴 이미지, 가격 초기화		
		$(".prom_spcInstruction").hide();
		$("#option_box_prom").hide();
		$(".main_menu .price").text(won("0"));		//메뉴가격
		$(".main_menu #main_menu_img").html("<img src='"+root+"/assets/img/order/menu/00/def_img.png' alt='쿠폰적용메뉴' onerror=\"this.src='"+root+"/assets/img/order/menu/00/def_img.png'\" />");
		
		if(val == "")
		{
			$(".sub_menu").hide();
			$("#prom_section .plus").hide();
			$("#prom_section .and").hide();
			$(".sub_description").show();
			
			// 20140619 메인메뉴 초기화
			$("#main_menu option").remove();
	 		$("#main_menu").html("<option value=''>메뉴를 선택해주세요.</option>");
		}
		else
       	{
       	
       		var promotionCouponCode            = val.split(",")[0]; // 프로모션 쿠폰
       		var promotionCouponDiscountFlag    = val.split(",")[1]; // 할인유형코드(1.%할인 2.금액할인 3.무료제공 4.금액할인수기등록 5.%할인수기등록(4/5 POS에서 할인율임의판단) )
       		var promotionCouponDiscountPercent = val.split(",")[2]; // 할인율
       		var promotionCouponDiscountAmt     = val.split(",")[3]; // 할인금액
       		var promotionCouponApplicationMenu = val.split(",")[4]; // 할인적용메뉴 Y,N
       		var promotionCouponApplicationSize = val.split(",")[5]; // 할인적용사이즈 Y,N
       		var promotionCouponDiscountTarget  = val.split(",")[6]; // 할인금액차감대상코드
       		
       	    $.ajax(
       	    { 
   		   		type       : 'post',
   		   		data       : "flag=promotionMainMenu&code="+promotionCouponCode+"&applicationMenu="+promotionCouponApplicationMenu+"&applicationSize="+promotionCouponApplicationSize,
   		   		url        : "/order/couponCheck.jsp",
   		   		dataType   : "json",
   				beforeSend : function() 
   				{              
   					//통신을 시작할때 처리             
   					$('#viewLoading').show().fadeIn(500);          
   				}
   		   		,complete : function() 
   		   		{             
   					//통신이 완료된 후 처리              
   					$('#viewLoading').fadeOut(); 
   				}
   		   		,success : function(data)
   		   		{
   		   			var str = "<option value=''>메뉴를 선택해주세요.</option>";
   		   			for( var i = 0; i < data.promMainMenu.length; i++ )
   		   			{
   		   				var d = data.promMainMenu[i];
   		   				var code        = d.promotionCouponMenuCode;      // 메뉴코드
   		   				var img         = d.promotionCouponMenuImg;       // 메뉴이미지파일 
   		   				var name        = d.promotionCouponMenuName;      // 메뉴명(메뉴중분류명)
   		   				
   		   				var price       = d.promotionCouponMenuSaleAmt;   // 판매금액
   		   				var menuDough   = d.promotionCouponMenuDough;     // 메뉴도우종류 
   		   				var menuSizeKor = d.promotionCouponMenuSizeKor;   // 메뉴사이즈한글
   		   				var menuSizeEng = d.promotionCouponMenuSizeEng;   // 메뉴사이즈영문
   		   				var menuSize    = d.promotionCouponMenuSize;      // 메뉴사이즈(L,P..)
   		   				var menuLagCode = d.promotionCouponMenuLagCode;   // 메뉴대분류코드
   		   				var menuMidCode = d.promotionCouponMenuMidCode;   // 메뉴중분류코드
   		   				var menuSmlCode = d.promotionCouponMenuSmlCode;   // 메뉴소분류코드
   		   				var menuSubCode = d.promotionCouponMenuSubCode;   // 메뉴세분류코드
   		   				var menuGroupCode = d.promotionCouponGroupCd;     // 온라인메뉴그룹
   		   				var menuDivCode   = d.promotionCouponMenuDivCode; // 메뉴구분코드
   		   				
   		   				var mainMenuValue =  code +","+ name +","+menuMidCode +","+ price +","+ promotionCouponDiscountAmt + "," + menuSubCode+ "," + menuDough+ "," + menuSizeKor+ "," +menuLagCode+ "," 
   		   				                     + menuMidCode+ "," +menuSmlCode+ "," + menuGroupCode+ "," +menuDivCode+","+menuSizeEng+","+menuSize;  
   		   				//console.log(code+"/"+img+"/"+name);
   		   				//console.log(menuDough+"/"+menuSize+"/" + price);
   	   		   			
   		   				str = str + "<option value='" + mainMenuValue +"'>" + name + " " + menuDough + " " + menuSizeKor + "</option>";				
   		   			}	
   		   			$("#main_menu").html(str);
   		   		}
   		   	});
       	}       
    }
	
 	// 20140617 프로모션쿠폰 오른쪽 - 할인메뉴
    function fnPromotionSubMenu(val)
    { 
		$("#first_sub").show();
		$("#prom_section .and").show();
		
		if(val == "")
		{
	    	//$(".sub_menu .price").text(won("0"));		//메뉴가격
	    	//$(".sub_menu .name").text("");		//메뉴가격
			//$(".sub_menu #sub_menu_img").html("<img src='"+root+"/assets/img/order/menu/00/def_img_sub.png' alt='쿠폰할인메뉴'  />");		// $this.parent().parent().prev() : 메뉴 이미지
			$(".sub_menu").hide();
			$("#prom_section .and").hide();
		}
		else
       	{
       		var promotionCouponCode            = val.split(",")[0]; // 프로모션 쿠폰
       		var promotionCouponDiscountFlag    = val.split(",")[1]; // 할인유형코드(1.금액할인 2.%할인 3.무료제공 4.금액할인수기등록 5.%할인수기등록(4/5 POS에서 할인율임의판단) )
       		var promotionCouponDiscountPercent = val.split(",")[2]; // 할인율
       		var promotionCouponDiscountAmt     = val.split(",")[3]; // 할인금액
       		var promotionCouponApplicationMenu = val.split(",")[4]; // 할인적용메뉴 Y,N
       		var promotionCouponApplicationSize = val.split(",")[5]; // 할인적용사이즈 Y,N
       		var promotionCouponDiscountTarget  = val.split(",")[6]; // 할인금액차감대상코드
       		var displayDiscount = 0;var displayPrice = 0;
       		var disAmt = 0;             //할인금액
  				
       		//alert(promotionCouponDiscountFlag);
       		
       	    $.ajax(
       	    { 
   		   		type       : 'post',
   		   		data       : "flag=promotionDisMenu&code="+promotionCouponCode,
   		   		url        : "/order/couponCheck.jsp",
   		   		dataType   : "json",
   				beforeSend : function() 
   				{              
   					//통신을 시작할때 처리             
   					$('#viewLoading').show().fadeIn(500);          
   				}
   		   		,complete : function() 
   		   		{             
   					//통신이 완료된 후 처리              
   					$('#viewLoading').fadeOut(); 
   				}
   		   		,success : function(data)
   		   		{
					if(data.promDisMenu.length > 1)
					{
						$("#second_sub").show();
						$("#prom_section .plus").show();
						$(".sub_description").hide();
					}
					else
					{
						$("#second_sub").hide();
						$("#prom_section .plus").hide();
						$(".sub_description").show();
					}
   		   			
					for( var i = 0; i < data.promDisMenu.length; i++ )
   		   			{
   		   				var d = data.promDisMenu[i];
   		   				
   		   				var code        = d.promDisMenuCode;    // 메뉴코드
   		   				var img         = d.promDisMenuImg;     // 이미지파일
   		   				var name        = d.promDisMenuName;    // 메뉴명(중분류명)
   		   				var price       = d.promDisMenuSaleAmt; // 판매금액
   		   				var menuLagCode = d.promDisMenuLagCode; // 메뉴대분류코드
   		   				var menuMidCode = d.promDisMenuMidCode; // 메뉴중분류코드
   		   				var menuSmlCode = d.promDisMenuSmlCode; // 메뉴소분류코드
   		   				var menuSubCode = d.promDisMenuSubCode; // 메뉴세분류코드
   		   				var menuDough   = d.promDisMenuDough;   // 메뉴도우종류
   		   				var menuSizeKor = d.promDisMenuSizeKor; // 메뉴사이즈한글
   		   				var menuSize    = d.promDisMenuSize;    // 메뉴사이즈(L,P..)
   		   				var menuSizeEng = d.promDisMenuSizeEng; // 메뉴사이즈영문
   		   				var menuGroupCd = d.promDisGroupCd;     // 온라인메뉴그룹
   		   				var menuDivcode = d.promDisMenuDivCode; // 메뉴구분코드
   		   				
   		  				//20140618 
   		  				//사이드 1개인 경우 할인또는 무료 가능, 2개인 경우 무료만 표시됨..
   		  				//금액 할인이면 사이드 메뉴 가격에서 할인 금액 빼고, 무료제공이면 0원으로 표시
   		  				if(promotionCouponDiscountFlag == "1")
   		  				{
   		  					displayPrice = parseInt(price,10)- parseInt(promotionCouponDiscountAmt,10);
   		  					disAmt = parseInt(promotionCouponDiscountAmt,10);
   		  					
   		  				}
   		  				else if(promotionCouponDiscountFlag == "2")
   		  				{
   		  					//%할인 
   		  					//50% 할인이면 *0.5 , 메뉴가격 - 할인 가격 쓰기
   		  					displayDiscount =  parseInt(price,10) * (parseInt(promotionCouponDiscountPercent,10)/100) ;		//빼야 할  할인 금액
   		  					displayPrice = parseInt(price,10) - ( parseInt(price,10) * (parseInt(promotionCouponDiscountPercent,10)/100) );		//화면에 표시할 할인 후 금액
   		  					disAmt =  displayDiscount;   		  					
   		  				}
   		  				else if(promotionCouponDiscountFlag == "3")
   		  				{//무료제공
   		  					disAmt = parseInt(price,10);	
   		  				}
   		   				
   		   				
   		   				
	   		   			var imgLink = "<img src='"+root+"/assets/img/order/menu/00/sub/prom_" + menuMidCode +"_ord.png' alt='"+name+"' title='"+name+"' onerror=\"this.src='"+root+"/assets/img/order/menu/00/def_img_sub.png'\" />";
						var priceStr ='<span class="org_block">&nbsp;'+ won(price) +'&nbsp;&nbsp;&nbsp;</span>    '+ setComma(displayPrice.toString()) +'<span class="t_block">원</span></span>';
   		   				
   		   				//console.log("할인메뉴" + i + ": " + code+"/"+img+"/"+name);
   		   				//음료는 사이즈도 같이 표시
   		   				if(menuLagCode == "40")
   		   				{
   		   					name = name +" " +  menuSizeKor;
   		   				}
   		   				
   		   				$(".sub_menu").eq(i).find(".name" ).text(name);		// 메뉴이름
   		   				$(".sub_menu").eq(i).find(".img"  ).html(imgLink);    // 메뉴 이미지
   		   				$(".sub_menu").eq(i).find(".price").html(priceStr);	// 메뉴가격
   		   				
   		   				$(".sub_menu").eq(i).find(".hideCode"    ).val(code);	      // 메뉴코드
   			   			$(".sub_menu").eq(i).find(".hideName"    ).val(name);	      // 메뉴명
						$(".sub_menu").eq(i).find(".hidePrice"   ).val(price);	      // 메뉴가격
						$(".sub_menu").eq(i).find(".hideDiscountPrice"   ).val(disAmt);  // 할인가격
						
						$(".sub_menu").eq(i).find(".hideLageCode").val(menuLagCode);  // 메뉴대분류코드
						$(".sub_menu").eq(i).find(".hideMidCode" ).val(menuMidCode);  // 메뉴중분류코드
						$(".sub_menu").eq(i).find(".hideSmlCode" ).val(menuSmlCode);  // 메뉴소분류코드
						$(".sub_menu").eq(i).find(".hideSubCode" ).val(menuSubCode);  // 메뉴세분류코드
						$(".sub_menu").eq(i).find(".hideDough"   ).val(menuDough);	  // 메뉴도우종류
						$(".sub_menu").eq(i).find(".hideSize"    ).val(menuSize);	  // 메뉴사이즈
						$(".sub_menu").eq(i).find(".hideDivCode").val(menuDivcode);  // 메뉴구분코드
						
   		   			}
   		   		}
   		   	});
       	}        
    }

	// 20140617 프로모션쿠폰 메뉴 SELECTBOX 선택 - 메인메뉴
    function fnPromotionMainMenuSelect($this)
	{
		//console.log($this.val());
		var val               = $this.val();

		//20140619 메뉴 이미지, 가격 초기화
		if(val == "")
		{
			$(".prom_spcInstruction").hide();
			$("#option_box_prom").hide();
			$(".main_menu .price").text(won("0"));		//메뉴가격
			$(".main_menu #main_menu_img").html("<img src='"+root+"/assets/img/order/menu/00/def_img.png' alt='쿠폰적용메뉴' onerror=\"this.src='"+root+"/assets/img/order/menu/00/def_img.png'\" />");
		}
		else
		{
			var menuCode          = val.split(",")[0];
			var menuName          = val.split(",")[1];
			var menuMidCode       = val.split(",")[2];
			var menuPrice         = val.split(",")[3];
			var menuDiscountPrice = val.split(",")[4];
			var menuSubCode       = val.split(",")[5];	//세분류 코드 : 이미지 폴더명
			
			var imgLink = "<img src='"+root+"/assets/img/order/menu/00/" + menuSubCode +"/prom_" + menuMidCode +"_ord.png' alt='"+menuName+"' title='"+menuName+"' onerror=\"this.src='"+root+"/assets/img/order/menu/noImage_ord.png'\" />";

			$this.parent().next().text(won(menuPrice));		// $this.parent().next() : 메뉴가격
			$this.parent().parent().prev().html(imgLink);		// $this.parent().parent().prev() : 메뉴 이미지
			
			$(".prom_spcInstruction").show();
		}
	} 
	
	// 20140618 장바구니 추가
	function fnPromotionAddCart($this)
	{	 
		var $prompDiv      = $("#prom_section");
 		var $mainMenu      = $("#main_menu");   // 프로모션 적용메뉴 select
 		var $subMenu      = $(".sub_menu");	//프로모션 할인메뉴 공통
 		var $firstSubMenu  = $("#first_sub");   // 프로모션 할인메뉴1
 		var $secondSubMenu = $("#second_sub");  // 프로모션 할인메뉴2
 		var $promCoupon    = $("#prom_coupon"); // 프로모션 쿠폰 
 		
 		var promotionCouponCode = $promCoupon.val().split(",")[0]; // 프로모션 쿠폰코드
		var cartMenuOptions  = "";        // 적용메뉴 피자옵션
		var cartSendDataInfo = null;     // 장바구니 전송 내역
		
		var menuCode        = ""; // 메뉴코드
		var menuName        = ""; // 메뉴명
		var menuMidCode     = ""; // 메뉴중분류코드
		var menuPrice       = ""; // 메뉴판매금액
		var menuDiscountAmt = ""; // 메뉴할인금액 
		var menuSubCode     = ""; // 메뉴세분류코드
		var menuDough       = ""; // 메뉴도우
		var menuSize        = ""; // 메뉴사이즈한글
		var menuLagCode     = ""; // 메뉴대분류코드
		var menuMidCode     = ""; // 메뉴중분류코드
		var menuSmlCode     = ""; // 메뉴소분류코드
		var menuGroupCode   = ""; // 메뉴온라인그룹
		var menuDivCode     = ""; // 메뉴구분코드
		var menuSizeEng     = ""; // 메뉴사이즈영문
		var menuSize        = ""; // 메뉴사이즈(L,P..)
		
		var promCouponIndex = setCartIndex(); // 장바구니 순번 - 메인메뉴,할인메뉴 쿠폰 순번용
		
		// 프로모션 적용메뉴 없으면 장바구니담기 막음 
		if($mainMenu.val() == null || $mainMenu.val() == "")
		{
			alert("쿠폰 적용 메뉴를 먼저 선택해 주세요!!");
			return;
		}
		
		 //20140619  장바구니 피자 수량 체크 수정
		//피자 수량은 5개까지만 주문 가능 -> 단품 피자, 세트에 포함된 피자, 하프피자
	 	$.post(root+"/order/newCart.jsp?cartAction=getPizzaCount", function(count)
	    {
   			var pizzaCount = trim(count); 
    		if( parseInt(pizzaCount) < 5 )
			{
    			$prompDiv.find(".menuArea .p_menu").each(function(i)
				{
					//console.log("------------------------");
					
			 		document.frmOrder.cartAction.value            = "addMenu";  // 장바구니처리
					document.frmOrder.cartMenuType.value       = "";  // 메뉴타입
					document.frmOrder.cartMenuCode.value       = "";  // 메뉴코드
					document.frmOrder.cartMenuName.value       = "";  // 메뉴명
					document.frmOrder.cartMenuOrdCode.value   = "";  // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
					document.frmOrder.cartMenuDivCode.value   = "";  // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
					document.frmOrder.cartMenuLagCode.value   = "";  // 메뉴대분류코드
					document.frmOrder.cartMenuMidCode.value   = "";  // 메뉴중분류코드
					document.frmOrder.cartMenuSmlCode.value   = "";  // 메뉴소분류코드
					document.frmOrder.cartMenuSubCode.value   = "";  // 메뉴세분류코드
					document.frmOrder.cartMenuPrice.value        = "";  // 메뉴주문단가
					document.frmOrder.cartMenuQty.value          = "";  // 메뉴주문수량
					document.frmOrder.cartMenuAmt.value          = "";  // 메뉴주문금액
					document.frmOrder.cartMenuDisRate.value      = "";  // 메뉴할인율
					document.frmOrder.cartMenuDisAmt.value       = "";  // 메뉴할인금액
					document.frmOrder.cartMenuCopDisAmt.value  = "";  // 메뉴선결제쿠폰할인
					document.frmOrder.cartMenuNetSaleAmt.value = "";  // 메뉴순매출금액
					document.frmOrder.cartMenuPayAmt.value     = "";  // 메뉴결제금액
					document.frmOrder.cartMenuBakeCode.value   = "";  // 메뉴베이크코드
					document.frmOrder.cartMenuCutCode.value    = "";  // 메뉴컷코드
					document.frmOrder.cartMenuCheeseCode.value = "";  // 메뉴치즈코드
					document.frmOrder.cartMenuSauceCode.value  = "";  // 메뉴소스코드
					document.frmOrder.cartMenuMessage.value    = "";  // 메뉴전달메세지
					document.frmOrder.cartMenuSize.value          = "";  // 메뉴사이즈
					document.frmOrder.cartMenuDough.value      = "";  // 메뉴도우종류
					document.frmOrder.cartECouponCompany.value = "";  // E쿠폰제휴사
					document.frmOrder.cartECouponCode.value    = "";  // E쿠폰코드
					document.frmOrder.cartECouponNumber.value  = "";  // E쿠폰번호
					
					//1. 적용 메뉴인 경우
			 		if($(this).hasClass("main_menu") )
					{
			 			if($mainMenu.val() != null && $mainMenu.val() != "")
						{
							var list = $mainMenu.val().split(",");
							menuCode        = list[0];  // 메뉴코드
							menuName        = list[1];  // 메뉴명
							menuMidCode     = list[2];  // 메뉴중분류코드
							menuPrice       = list[3];  // 메뉴판매금액
							menuDiscountAmt = list[4];  // 메뉴할인금액 
							menuSubCode     = list[5];  // 메뉴세분류코드
							menuDough       = list[6];  // 메뉴도우
							menuSize        = list[7];  // 메뉴사이즈한글
							menuLagCode     = list[8];  // 메뉴대분류코드
							menuMidCode     = list[9];  // 메뉴중분류코드
							menuSmlCode     = list[10]; // 메뉴소분류코드
							menuGroupCode   = list[11]; // 메뉴온라인그룹
							menuDivCode     = list[12]; // 메뉴구분코드
							menuSizeEng     = list[13]; // 메뉴사이즈영문
							menuSize        = list[14]; // 메뉴사이즈(L,P..)
									
							// 적용메뉴 피자 옵션
							var currMenuOptions = $("#option_box_prom");
		     				var findMenuOptions = currMenuOptions.find(".spcInstructions li");
		     				var selMenuOptions  = [];
		     				
					     	findMenuOptions.each(function(idx) 
					     	{ 
					     		selMenuOptions[idx] = $(this).find("input:checked").val();
					     		if(idx == 0 ) { document.frmOrder.cartMenuSauceCode.value  = selMenuOptions[idx]; } 
					     		if(idx == 1 ) { document.frmOrder.cartMenuCheeseCode.value = selMenuOptions[idx]; } 
					     		if(idx == 2 ) { document.frmOrder.cartMenuBakeCode.value   = selMenuOptions[idx]; } 
					     		if(idx == 3 ) { document.frmOrder.cartMenuCutCode.value    = selMenuOptions[idx]; }
					     	}); 
					     	cartMenuOptions = selMenuOptions.join("/");
		
//					     	console.log("main menu > opt  ["+ cartMenuOptions +"]");
//							console.log("main menu >  ["+ list +"]");
							
							document.frmOrder.cartMenuCode.value       = menuCode+"_"+ (parseInt(promCouponIndex)+i);  // 메뉴코드
							document.frmOrder.cartMenuName.value       = menuName;                // 메뉴명
							document.frmOrder.cartMenuOrdCode.value    = "10";                    // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
							document.frmOrder.cartMenuDivCode.value    = menuDivCode;             // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
							document.frmOrder.cartMenuLagCode.value    = menuLagCode;             // 메뉴대분류코드
							document.frmOrder.cartMenuMidCode.value    = menuMidCode;             // 메뉴중분류코드
							document.frmOrder.cartMenuSmlCode.value    = menuSmlCode;             // 메뉴소분류코드
							document.frmOrder.cartMenuSubCode.value    = menuSubCode;             // 메뉴세분류코드
							document.frmOrder.cartMenuPrice.value      = menuPrice;               // 메뉴주문단가
							document.frmOrder.cartMenuAmt.value        = menuPrice;               // 메뉴주문금액
							document.frmOrder.cartMenuDisRate.value    = "0";                     // 메뉴할인율
							document.frmOrder.cartMenuDisAmt.value     = "0";                     // 메뉴할인금액
							document.frmOrder.cartMenuCopDisAmt.value  = "0";                     // 메뉴선결제쿠폰할인
							document.frmOrder.cartMenuNetSaleAmt.value = menuPrice;               // 메뉴순매출금액
							document.frmOrder.cartMenuPayAmt.value     = menuPrice;               // 메뉴결제금액
							document.frmOrder.cartMenuMessage.value    = "";                      // 메뉴전달메세지
							document.frmOrder.cartMenuSize.value       = menuSize;                // 메뉴사이즈
							document.frmOrder.cartMenuDough.value      = menuDough;               // 메뉴도우종류
							document.frmOrder.cartECouponCompany.value = "";                      // E쿠폰제휴사
							document.frmOrder.cartECouponCode.value    = promotionCouponCode+"_"+promCouponIndex;  // E쿠폰코드
							document.frmOrder.cartECouponNumber.value  = "MAIN";  // E쿠폰번호 - 적용메뉴,할인메뉴구분
							 
							fnReset_spcOption_up($this);
//							console.log("1. in main_menu");
						}
			 			else
			 			{
			 				//20140619 장바구니 버튼 클릭 시 쿠폰 적용메뉴 선택 검사
			 				alert("쿠폰 적용 메뉴를 먼저 선택해 주세요!!");
			 				return;
			 			}
					}
			 		//2. 할인 메뉴인 경우
			 		else if($(this).hasClass("sub_menu") )	
			 		{
			 			// none또는 value가 없으면 할인메뉴가 없는 것!!
			 			if($(this).css("display") == "block" && $(this).find(".hideCode").val() != null && $(this).find(".hideCode").val() != "" )
			 			{
							menuCode      = $(this).find(".hideCode").val();  // 메뉴코드
							menuName     = $(this).find(".hideName").val();  // 메뉴명
							menuMidCode = $(this).find(".hideMidCode").val();  // 메뉴중분류코드
							menuPrice      = $(this).find(".hidePrice").val();  // 메뉴판매금액
							menuDiscountPrice = $(this).find(".hideDiscountPrice").val();  // 메뉴할인금액
							menuSubCode = $(this).find(".hideSubCode").val();  // 메뉴세분류코드
							menuDough    = $(this).find(".hideDough").val();  // 메뉴도우
							menuSize       = $(this).find(".hideSize").val();  // 메뉴사이즈한글
							menuLagCode = $(this).find(".hideLageCode").val();  // 메뉴대분류코드
							menuMidCode = $(this).find(".hideMidCode").val();  // 메뉴중분류코드
							menuSmlCode = $(this).find(".hideSmlCode").val(); // 메뉴소분류코드
							menuDivCode = $(this).find(".hideDiveCode").val(); // 메뉴구분코드
							menuSize      = $(this).find(".hideSize").val(); // 메뉴사이즈(L,P..)
							
//							console.log($(this).attr("id") + " 할인메뉴 "+ i + ">  [" + menuCode + " , " + menuName + " , " + menuPrice + " , " + menuLagCode + ", " + menuDivCode + ", " + menuSize + "]");
							
							//서브메뉴1,2 > 메인메뉴가 있고 메뉴가 있는것
							document.frmOrder.cartMenuCode.value         = menuCode+"_"+(parseInt(promCouponIndex)+i);  // 메뉴코드
							document.frmOrder.cartMenuName.value        = menuName;  // 메뉴명
							document.frmOrder.cartMenuOrdCode.value    = "20";  // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
							//document.frmOrder.cartMenuDivCode.value     = menuDivCode;  // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
							document.frmOrder.cartMenuDivCode.value     = "10";  // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
							document.frmOrder.cartMenuLagCode.value    = menuLagCode;  // 메뉴대분류코드
							document.frmOrder.cartMenuMidCode.value    = menuMidCode;  // 메뉴중분류코드
							document.frmOrder.cartMenuSmlCode.value    = menuSmlCode;  // 메뉴소분류코드
							document.frmOrder.cartMenuSubCode.value    = menuSubCode;  // 메뉴세분류코드
							document.frmOrder.cartMenuPrice.value         = menuPrice;  // 메뉴주문단가
							document.frmOrder.cartMenuAmt.value          = menuPrice;  // 메뉴주문금액
							document.frmOrder.cartMenuDisRate.value      = "0";  // 메뉴할인율
							document.frmOrder.cartMenuDisAmt.value       = menuDiscountPrice;  // 메뉴할인금액 
							document.frmOrder.cartMenuCopDisAmt.value  = "0";  // 메뉴선결제쿠폰할인
							document.frmOrder.cartMenuNetSaleAmt.value = menuPrice;  // 메뉴순매출금액
							document.frmOrder.cartMenuPayAmt.value      = menuPrice;  // 메뉴결제금액
							document.frmOrder.cartMenuMessage.value    = "";  // 메뉴전달메세지
							document.frmOrder.cartMenuSize.value          = menuSize;  // 메뉴사이즈
							document.frmOrder.cartMenuDough.value         = menuDough;  // 메뉴도우종류
							document.frmOrder.cartECouponCompany.value = "";  // E쿠폰제휴사
							document.frmOrder.cartECouponCode.value      = promotionCouponCode+"_"+promCouponIndex;  // E쿠폰코드
							document.frmOrder.cartECouponNumber.value  = "SUB";  // E쿠폰번호 - 적용메뉴,할인메뉴구분

//				 			console.log("1. in sub_menu ");
			 			}
			 		} 
			 		
			 		/* //메뉴대분류코드별 메뉴타입 및 메뉴수량 세팅
					if( document.frmOrder.cartMenuLagCode.value == "10" )  // 피자
					{
						document.frmOrder.cartMenuType.value = "typePizza";  // 메뉴 타입
						document.frmOrder.cartMenuQty.value  = "1";          // 메뉴 수량
					}
					else if( document.frmOrder.cartMenuLagCode.value == "20" )  // 사이드
					{
						document.frmOrder.cartMenuType.value = "typeSide";   // 메뉴 타입
						document.frmOrder.cartMenuQty.value  = "1";   // 메뉴 수량
					}
					else if( document.frmOrder.cartMenuLagCode.value == "30" )  // 소스
					{
						document.frmOrder.cartMenuType.value = "typeSauce";  // 메뉴 타입
						document.frmOrder.cartMenuQty.value  = "1";   // 메뉴 수량
					}
					else if( document.frmOrder.cartMenuLagCode.value == "40" )  // 음료
					{
						document.frmOrder.cartMenuType.value = "typeBever";  // 메뉴 타입
						document.frmOrder.cartMenuQty.value  = "1";   // 메뉴 수량
					} */
					
					
					//20140619 메뉴 타입 통일
			 		document.frmOrder.cartMenuType.value = "typePromotion";  
					document.frmOrder.cartMenuQty.value  = "1"; 
			 		
//			 		console.log("2. in 저장준비 " + document.frmOrder.cartMenuType.value);
				
			    	//if( document.frmOrder.cartMenuType.value == "typePizza" )
			    	if($("#cartMenuCode").val() != "" && $("#cartMenuCode").val() != null) // 20140620 each돌면서 값이 없어도 진행막음
			    	{	
			    		if( document.frmOrder.cartMenuLagCode.value == "10" )		//대분류 코드로 피자 구분
				    	{
							cartSendDataInfo = {
									    cartAction         : document.frmOrder.cartAction.value          // 장바구니처리
						    		   ,cartMenuType       : document.frmOrder.cartMenuType.value        // 메뉴타입
	    	    					   ,cartMenuCode       : document.frmOrder.cartMenuCode.value        // 메뉴코드
	    	    					   ,cartMenuName       : document.frmOrder.cartMenuName.value        // 메뉴명
	    	    					   ,cartMenuOrdCode    : document.frmOrder.cartMenuOrdCode.value     // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
	    	    					   ,cartMenuDivCode    : document.frmOrder.cartMenuDivCode.value     // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
	    	    					   ,cartMenuLagCode    : document.frmOrder.cartMenuLagCode.value     // 메뉴대분류코드
	    	    					   ,cartMenuMidCode    : document.frmOrder.cartMenuMidCode.value     // 메뉴중분류코드
	    	    					   ,cartMenuSmlCode    : document.frmOrder.cartMenuSmlCode.value     // 메뉴소분류코드
	    	    					   ,cartMenuSubCode    : document.frmOrder.cartMenuSubCode.value     // 메뉴세분류코드
	    	    					   ,cartMenuPrice      : document.frmOrder.cartMenuPrice.value       // 메뉴주문단가
	    	    					   ,cartMenuQty        : document.frmOrder.cartMenuQty.value         // 메뉴주문수량
	    	    					   ,cartMenuAmt        : document.frmOrder.cartMenuAmt.value         // 메뉴주문금액
	    	    					   ,cartMenuDisRate    : document.frmOrder.cartMenuDisRate.value     // 메뉴할인율
	    	    					   ,cartMenuDisAmt     : document.frmOrder.cartMenuDisAmt.value      // 메뉴할인금액
	    	    					   ,cartMenuCopDisAmt  : document.frmOrder.cartMenuCopDisAmt.value   // 메뉴선결제쿠폰할인
	    	    					   ,cartMenuNetSaleAmt : document.frmOrder.cartMenuNetSaleAmt.value  // 메뉴순매출금액
	    	    					   ,cartMenuPayAmt     : document.frmOrder.cartMenuPayAmt.value      // 메뉴결제금액
	    	    					   ,cartMenuBakeCode   : document.frmOrder.cartMenuBakeCode.value    // 메뉴베이크코드
	    	    					   ,cartMenuCutCode    : document.frmOrder.cartMenuCutCode.value     // 메뉴컷코드
	    	    					   ,cartMenuCheeseCode : document.frmOrder.cartMenuCheeseCode.value  // 메뉴치즈코드
	    	    					   ,cartMenuSauceCode  : document.frmOrder.cartMenuSauceCode.value   // 메뉴소스코드
	    	    					   ,cartMenuMessage    : document.frmOrder.cartMenuMessage.value     // 메뉴전달메세지
	    	    					   ,cartMenuSize       : document.frmOrder.cartMenuSize.value        // 메뉴사이즈
	    	    					   ,cartMenuDough      : document.frmOrder.cartMenuDough.value       // 메뉴도우종류
									   ,cartMenuOption     : cartMenuOptions                             // 메뉴옵션
									   ,cartECouponCompany : document.frmOrder.cartECouponCompany.value  // E쿠폰제휴사
									   ,cartECouponCode    : document.frmOrder.cartECouponCode.value     // E쿠폰코드
									   ,cartECouponNumber  : document.frmOrder.cartECouponNumber.value   // E쿠폰번호
	   			               }; 
					    	fnSaveForCart(cartSendDataInfo);  
				 			//console.log("3. in 적용메뉴 저장 " + document.frmOrder.cartMenuName.value );
				    	}
				    	else		//대분류 10이 아닌 메뉴 (사이드, 음료, 소스)
				    	{
				    		cartSendDataInfo = {
							    			cartAction         : document.frmOrder.cartAction.value          // 장바구니처리
				    					   ,cartMenuType       : document.frmOrder.cartMenuType.value        // 메뉴타입
										   ,cartMenuCode       : document.frmOrder.cartMenuCode.value        // 메뉴코드
										   ,cartMenuName       : document.frmOrder.cartMenuName.value        // 메뉴명
										   ,cartMenuOrdCode    : document.frmOrder.cartMenuOrdCode.value     // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
										   ,cartMenuDivCode    : document.frmOrder.cartMenuDivCode.value     // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
										   ,cartMenuLagCode    : document.frmOrder.cartMenuLagCode.value     // 메뉴대분류코드
										   ,cartMenuMidCode    : document.frmOrder.cartMenuMidCode.value     // 메뉴중분류코드
										   ,cartMenuSmlCode    : document.frmOrder.cartMenuSmlCode.value     // 메뉴소분류코드
										   ,cartMenuSubCode    : document.frmOrder.cartMenuSubCode.value     // 메뉴세분류코드
										   ,cartMenuPrice      : document.frmOrder.cartMenuPrice.value       // 메뉴주문단가
										   ,cartMenuQty        : document.frmOrder.cartMenuQty.value         // 메뉴주문수량
										   ,cartMenuAmt        : document.frmOrder.cartMenuAmt.value         // 메뉴주문금액
										   ,cartMenuDisRate    : document.frmOrder.cartMenuDisRate.value     // 메뉴할인율
										   ,cartMenuDisAmt     : document.frmOrder.cartMenuDisAmt.value      // 메뉴할인금액 
				    					   ,cartMenuCopDisAmt  : document.frmOrder.cartMenuCopDisAmt.value   // 메뉴선결제쿠폰할인
				    					   ,cartMenuNetSaleAmt : document.frmOrder.cartMenuNetSaleAmt.value  // 메뉴순매출금액
										   ,cartMenuPayAmt     : document.frmOrder.cartMenuPayAmt.value      // 메뉴결제금액
				    					   ,cartMenuBakeCode   : document.frmOrder.cartMenuBakeCode.value    // 메뉴베이크코드
				    					   ,cartMenuCutCode    : document.frmOrder.cartMenuCutCode.value     // 메뉴컷코드
				    					   ,cartMenuCheeseCode : document.frmOrder.cartMenuCheeseCode.value  // 메뉴치즈코드
				    					   ,cartMenuSauceCode  : document.frmOrder.cartMenuSauceCode.value   // 메뉴소스코드
										   ,cartMenuMessage    : document.frmOrder.cartMenuMessage.value     // 메뉴전달메세지
										   ,cartMenuSize       : document.frmOrder.cartMenuSize.value        // 메뉴사이즈
										   ,cartMenuDough      : document.frmOrder.cartMenuDough.value       // 메뉴도우종류
										   ,cartMenuOption     : cartMenuOptions                             // 메뉴옵션
										   ,cartECouponCompany : document.frmOrder.cartECouponCompany.value  // E쿠폰제휴사
										   ,cartECouponCode    : document.frmOrder.cartECouponCode.value     // E쿠폰코드
										   ,cartECouponNumber  : document.frmOrder.cartECouponNumber.value   // E쿠폰번호
			           		       }; 
							fnSaveForCart(cartSendDataInfo);
				 			//console.log("3. in 할인메뉴 저장 " + document.frmOrder.cartMenuName.value );
				    	}
			    	}
				});/* end -- (".menuArea .p_menu").each */
			}
			else
			{
				$('#viewLoading').fadeOut();
				popAlert("#notice_limit");
				$("#notice_limit").find(".alertBtn").focus();
			}
    		
	   	});/* end -- 피자 수량 체크 */
	   	
	}/* end -- fnPromotionAddCart */
	function getRandomString()
	{
		var result = ""; 			
		for(var i=1; i<25; i++)
		{
			var ch = String.fromCharCode((Math.random()* 26)+97);
 			result += ch;
		}
		return result;
	}
	
</script>

<form id="frmOrder" name="frmOrder" method="post" onsubmit="return false;">
	<!-- 공통 -->
	<input type="hidden" id="onlineGroupCd"       name="onlineGroupCd"       value="" />  <!-- 온라인 메뉴그룹코드        -->
	<input type="hidden" id="pizzaSelIdx"         name="pizzaSelIdx"         value="" />  <!-- 피자 그룹메뉴              --> 
	<input type="hidden" id="menuSoldOutYn"       name="menuSoldOutYn"       value="" />  <!-- 메뉴 품절 여부             -->
	<!-- 장바구니 (공통) -->
	<input type="hidden" id="cartAction"          name="cartAction"          value="" />  <!-- 장바구니 처리              -->
	<!-- 장바구니 (주문) -->
	<input type="hidden" id="cartOrdCustName"     name="cartOrdCustName"     value="" />  <!-- 고객명                     -->
	<input type="hidden" id="cartOrdCustPhone"    name="cartOrdCustPhone"    value="" />  <!-- 전화번호                   -->
	<input type="hidden" id="cartOrdDivide"       name="cartOrdDevide"       value="" />  <!-- 주문구분(주문유형)         -->
	<input type="hidden" id="cartOrdReserve"      name="cartOrdReserve"      value="" />  <!-- 예약주문여부               -->
	<input type="hidden" id="cartOrdResDate"      name="cartOrdResDate"      value="" />  <!-- 예약일자                   -->
	<input type="hidden" id="cartOrdResTime"      name="cartOrdResTime"      value="" />  <!-- 예약시간                   -->
	<input type="hidden" id="cartOrdDevAddr1"     name="cartOrdDevAddr1"     value="" />  <!-- 배달지주소1                -->
	<input type="hidden" id="cartOrdDevAddr2"     name="cartOrdDevAddr2"     value="" />  <!-- 배달지주소2                -->
	<input type="hidden" id="cartOrdDevAddr3"     name="cartOrdDevAddr3"     value="" />  <!-- 배달지주소3                -->
	<input type="hidden" id="cartOrdDevAddr4"     name="cartOrdDevAddr4"     value="" />  <!-- 배달지주소4                -->
	<input type="hidden" id="cartOrdAddressID"    name="cartOrdAddressID"    value="" />  <!-- ADDRESS_ID                 -->
	<input type="hidden" id="cartOrdStoreCode"    name="cartOrdStoreCode"    value="" />  <!-- 매장코드                   -->
	<input type="hidden" id="cartOrdStoreName"    name="cartOrdStoreName"    value="" />  <!-- 매장명                     -->
	<input type="hidden" id="cartOrdSectorCode"   name="cartOrdSectorCode"   value="" />  <!-- 매장섹터코드               -->
	<input type="hidden" id="cartOrdSectorName"   name="cartOrdSectorName"   value="" />  <!-- 매장섹터명                 -->
	<input type="hidden" id="cartOrdDeliveryTime" name="cartOrdDeliveryTime" value="" />  <!-- 섹터예상시간               -->
	<input type="hidden" id="cartOrdDeliveryYN"   name="cartOrdDeliveryYN"   value="" />  <!-- 배달가능여부               -->
	<input type="hidden" id="cartOrdNewAddressYN" name="cartOrdNewAddressYN" value="" />  <!-- 배달지주소신규추가여부     -->
	<!-- 장바구니 (주문상세 : 메뉴) -->
	<input type="hidden" id="cartMenuType"        name="cartMenuType"        value="" />  <!-- 메뉴타입                   -->
	<input type="hidden" id="cartMenuCode"        name="cartMenuCode"        value="" />  <!-- 메뉴코드                   -->
	<input type="hidden" id="cartMenuName"        name="cartMenuName"        value="" />  <!-- 메뉴명                     -->
	<input type="hidden" id="cartMenuOrdCode"     name="cartMenuOrdCode"     value="" />  <!-- 메뉴주문구분코드           --> <!-- 10:정상,20:할인,30:서비스(무료) -->
	<input type="hidden" id="cartMenuDivCode"     name="cartMenuDivCode"     value="" />  <!-- 메뉴구분코드               --> <!-- 10:단품,20:세트,30:하프&하프 -->
	<input type="hidden" id="cartMenuLagCode"     name="cartMenuLagCode"     value="" />  <!-- 메뉴대분류코드             -->
	<input type="hidden" id="cartMenuMidCode"     name="cartMenuMidCode"     value="" />  <!-- 메뉴중분류코드             -->
	<input type="hidden" id="cartMenuSmlCode"     name="cartMenuSmlCode"     value="" />  <!-- 메뉴소분류코드             -->
	<input type="hidden" id="cartMenuSubCode"     name="cartMenuSubCode"     value="" />  <!-- 메뉴세분류코드             -->
	<input type="hidden" id="cartMenuPrice"       name="cartMenuPrice"       value="" />  <!-- 메뉴주문단가               -->
	<input type="hidden" id="cartMenuQty"         name="cartMenuQty"         value="" />  <!-- 메뉴주문수량               -->
	<input type="hidden" id="cartMenuAmt"         name="cartMenuAmt"         value="" />  <!-- 메뉴주문금액               -->
	<input type="hidden" id="cartMenuDisRate"     name="cartMenuDisRate"     value="" />  <!-- 메뉴할인율                 -->
	<input type="hidden" id="cartMenuDisAmt"      name="cartMenuDisAmt"      value="" />  <!-- 메뉴할인금액               -->
	<input type="hidden" id="cartMenuCopDisAmt"   name="cartMenuCopDisAmt"   value="" />  <!-- 메뉴선결제쿠폰할인         -->
	<input type="hidden" id="cartMenuNetSaleAmt"  name="cartMenuNetSaleAmt"  value="" />  <!-- 메뉴순매출금액             -->
	<input type="hidden" id="cartMenuPayAmt"      name="cartMenuPayAmt"      value="" />  <!-- 메뉴결제금액               -->
	<input type="hidden" id="cartMenuBakeCode"    name="cartMenuBakeCode"    value="" />  <!-- 메뉴베이크코드             -->
	<input type="hidden" id="cartMenuCutCode"     name="cartMenuCutCode"     value="" />  <!-- 메뉴컷코드                 -->
	<input type="hidden" id="cartMenuCheeseCode"  name="cartMenuCheeseCode"  value="" />  <!-- 메뉴치즈코드               -->
	<input type="hidden" id="cartMenuSauceCode"   name="cartMenuSauceCode"   value="" />  <!-- 메뉴소스코드               -->
	<input type="hidden" id="cartMenuMessage"     name="cartMenuMessage"     value="" />  <!-- 메뉴전달메세지             -->
	<input type="hidden" id="cartMenuSize"        name="cartMenuSize"        value="" />  <!-- 메뉴사이즈                 -->
	<input type="hidden" id="cartMenuDough"       name="cartMenuDough"       value="" />  <!-- 메뉴도우종류               -->
	<input type="hidden" id="cartECouponCompany"  name="cartECouponCompany"  value="" />  <!-- E쿠폰제휴사                -->
	<input type="hidden" id="cartECouponCode"     name="cartECouponCode"     value="" />  <!-- E쿠폰코드                  -->
	<input type="hidden" id="cartECouponNumber"   name="cartECouponNumber"   value="" />  <!-- E쿠폰번호                  -->
	<!-- 화면 : 하프&하프 -->
	<input type="hidden" id="halfMenuCode1"       name="halfMenuCode1"       value="" />  <!-- (왼쪽)하프메뉴코드         -->
	<input type="hidden" id="halfMenuName1"       name="halfMenuName1"       value="" />  <!-- (왼쪽)하프메뉴명           -->
	<input type="hidden" id="halfMenuLagCode1"    name="halfMenuLagCode1"    value="" />  <!-- (왼쪽)하프메뉴대분류코드   -->
	<input type="hidden" id="halfMenuMidCode1"    name="halfMenuMidCode1"    value="" />  <!-- (왼쪽)하프메뉴중분류코드   -->
	<input type="hidden" id="halfMenuSmlCode1"    name="halfMenuSmlCode1"    value="" />  <!-- (왼쪽)하프메뉴소분류코드   -->
	<input type="hidden" id="halfMenuSubCode1"    name="halfMenuSubCode1"    value="" />  <!-- (왼쪽)하프메뉴세분류코드   -->
	<input type="hidden" id="halfMenuPrice1"      name="halfMenuPrice1"      value="" />  <!-- (왼쪽)하프메뉴단가         -->
	<input type="hidden" id="halfMenuQty1"        name="halfMenuQty1"        value="" />  <!-- (왼쪽)하프메뉴수량         -->
	<input type="hidden" id="halfMenuAmt1"        name="halfMenuAmt1"        value="" />  <!-- (왼쪽)하프메뉴금액         -->
	<input type="hidden" id="halfMenuSize1"       name="halfMenuSize1"       value="" />  <!-- (왼쪽)하프메뉴사이즈       -->
	<input type="hidden" id="halfMenuDough1"      name="halfMenuDough1"      value="" />  <!-- (왼쪽)하프메뉴도우종류     -->
	<input type="hidden" id="halfMenuCode2"       name="halfMenuCode2"       value="" />  <!-- (오른쪽)하프메뉴코드       -->
	<input type="hidden" id="halfMenuName2"       name="halfMenuName2"       value="" />  <!-- (오른쪽)하프메뉴명         -->
	<input type="hidden" id="halfMenuLagCode2"    name="halfMenuLagCode2"    value="" />  <!-- (오른쪽)하프메뉴대분류코드 -->
	<input type="hidden" id="halfMenuMidCode2"    name="halfMenuMidCode2"    value="" />  <!-- (오른쪽)하프메뉴중분류코드 -->
	<input type="hidden" id="halfMenuSmlCode2"    name="halfMenuSmlCode2"    value="" />  <!-- (오른쪽)하프메뉴소분류코드 -->
	<input type="hidden" id="halfMenuSubCode2"    name="halfMenuSubCode2"    value="" />  <!-- (오른쪽)하프메뉴세분류코드 -->
	<input type="hidden" id="halfMenuPrice2"      name="halfMenuPrice2"      value="" />  <!-- (오른쪽)하프메뉴단가       -->
	<input type="hidden" id="halfMenuQty2"        name="halfMenuQty2"        value="" />  <!-- (오른쪽)하프메뉴수량       -->
	<input type="hidden" id="halfMenuAmt2"        name="halfMenuAmt2"        value="" />  <!-- (오른쪽)하프메뉴금액       -->
	<input type="hidden" id="halfMenuSize2"       name="halfMenuSize2"       value="" />  <!-- (오른쪽)하프메뉴사이즈     -->
	<input type="hidden" id="halfMenuDough2"      name="halfMenuDough2"      value="" />  <!-- (오른쪽)하프메뉴도우종류   -->
	<!-- 화면 : E쿠폰 -->
	<input type="hidden" id="eCouponCompany"      name="eCouponCompany"      value="" />  <!-- E쿠폰제휴사                -->
	<input type="hidden" id="eCouponCode"         name="eCouponCode"         value="" />  <!-- E쿠폰코드                  -->
	<input type="hidden" id="eCouponName"         name="eCouponName"         value="" />  <!-- E쿠폰명                    -->
	<input type="hidden" id="eCouponNumber"       name="eCouponNumber"       value="" />  <!-- E쿠폰번호                  -->
	<!-- 화면 : E쿠폰메뉴 -->
	<input type="hidden" id="ecopMenuCode"        name="ecopMenuCode"        value="" />  <!-- E쿠폰메뉴코드              -->
	<input type="hidden" id="ecopMenuName"        name="ecopMenuName"        value="" />  <!-- E쿠폰메뉴명                -->
	<input type="hidden" id="ecopMenuDivCode"     name="ecopMenuDivCode"     value="" />  <!-- E쿠폰메뉴구분코드          -->
	<input type="hidden" id="ecopMenuLagCode"     name="ecopMenuLagCode"     value="" />  <!-- E쿠폰메뉴대분류코드        -->
	<input type="hidden" id="ecopMenuMidCode"     name="ecopMenuMidCode"     value="" />  <!-- E쿠폰메뉴중분류코드        -->
	<input type="hidden" id="ecopMenuSmlCode"     name="ecopMenuSmlCode"     value="" />  <!-- E쿠폰메뉴소분류코드        -->
	<input type="hidden" id="ecopMenuSubCode"     name="ecopMenuSubCode"     value="" />  <!-- E쿠폰메뉴세분류코드        -->
	<input type="hidden" id="ecopMenuPrice"       name="ecopMenuPrice"       value="" />  <!-- E쿠폰메뉴단가              -->
	<input type="hidden" id="ecopMenuDiscAmt"     name="ecopMenuDiscAmt"     value="" />  <!-- E쿠폰메뉴할인금액          -->
	<input type="hidden" id="ecopMenuSaleAmt"     name="ecopMenuSaleAmt"     value="" />  <!-- E쿠폰메뉴판매금액          -->
	<input type="hidden" id="ecopMenuSize"        name="ecopMenuSize"        value="" />  <!-- E쿠폰메뉴사이즈            -->	
	<!-- 주문  -->
	<input type="hidden" id="_menuid"         name="_menuid"          value="" />  		 <!-- 메뉴 id				-->
	<input type="hidden" id="_imagepathorder" name="_imagepathorder"  value="" />  		 <!-- 온라인주문 메뉴 이미지 경로	-->
	<input type="hidden" id="_name" name="_name"  value="" />  					   	 	 <!-- 제품명	-->
	<input type="hidden" id="_size" name="_size"  value="" />  				       	 	 <!-- 사이즈	-->
	<input type="hidden" id="_cnt_opt"        name="_cnt_opt"         value="" />  		 <!-- 수량					-->
	<input type="hidden" id="_price"          name="_price"           value="" />  		 <!-- 금액					-->
	<input type="hidden" id="_consist"        name="_consist"         value="" />  		 <!-- 메뉴 구성				-->
	<input type="hidden" id="_randomString"   name="_randomString"    value="" />
 
	<!-- 메뉴 -->
	<!-- con_container -->
	<div id="con_container">
  		<!-- conternts --> 
  		<div id="contents">
    		<h2 class="hidden"><!--오리지널 씬--></h2>
    		<!-- cont --> 
    		<div class="cont">
      			<!-- menuNavi_section -->
      			<div id="menuNavi_section">
        			<div class="pizza">
          				<h3 class="hidden">피자</h3>
          				<ul class="pizza_list">
            				<!-- <li><a href="javascript:fnSelMenuGroup('0', '00' );">이달의 프로모션</a></li> -->
            				<li>
            					<a href="orderAction.action?menuId=pj_2002&pizzaSelIdx=0" style="background: url(../assets/img/order/ordMenu_pizza1.gif) no-repeat">베스트메뉴</a>
            				</li>
            				<li>
            					<a href="orderAction.action?menuId=pj_2003&pizzaSelIdx=1" style="background: url(../assets/img/order/ordMenu_pizza2.gif) no-repeat;">오리지널</a>
            				</li>
            				<li>
            					<a href="orderAction.action?menuId=pj_2004&pizzaSelIdx=2" style="background: url(../assets/img/order/ordMenu_pizza3.gif) no-repeat;">골드링</a>
            				</li>
            				<li>
            					<a href="orderAction.action?menuId=pj_2005&pizzaSelIdx=3" style="background: url(../assets/img/order/ordMenu_pizza4.gif) no-repeat;">치즈롤</a>
            				</li>
            				<li>
            					<a href="orderAction.action?menuId=pj_2006&pizzaSelIdx=4" style="background: url(../assets/img/order/ordMenu_pizza5.gif) no-repeat;">씬</a>
            				</li>
            				<li style="display:none;">
            					<a href="javascript:fnSelMenuGroup('5', '50' );" style="background: url(../assets/img/order/ordMenu_pizza6.gif) no-repeat;">오리지널씬</a>
            				</li>
            				<li>
            					<a href="orderAction.action?menuId=pj_2008&pizzaSelIdx=6" style="background: url(../assets/img/order/ordMenu_pizza7.gif) no-repeat;">골드링씬</a>
            				</li>
            				<li>
            					<a href="orderAction.action?menuId=pj_2009&pizzaSelIdx=7" style="background: url(../assets/img/order/ordMenu_pizza8.gif) no-repeat;">하트씬</a>
            				</li>
          				</ul>
        			</div>
        			<div class="side">
          				<h3 class="hidden">세트/사이드/음료</h3>
          				<ul class="side_list">
            				<!-- <li><a href="javascript:fnViewDiv('prom');"><img src="../assets/img/order/ord_menu_prom_btn.png" alt="이달의 프로모션" /></a></li> -->
            				<li><a href="orderAction.action?menuId=pj_2011&pizzaSelIdx=${param.pizzaSelIdx }"><img src="../assets/img/order/ord_menu_set_btn2.png" alt="세트메뉴" /></a></li>
            				<li><a href="orderAction.action?menuId=pj_2013&pizzaSelIdx=${param.pizzaSelIdx}"><img src="../assets/img/order/ord_menu_drink_btn.png" alt="음료" /></a></li>
            			</ul>
        			</div>
        			<div class="coupon">
          				<ul class="coupon_list">   				
            				<li><a href="orderAction.action?menuId=pj_2012&pizzaSelIdx=${param.pizzaSelIdx}"><img src="../assets/img/order/ord_menu_side_btn.png" alt="사이드" /></a></li>
            				<li><a href="orderAction.action?menuId=pj_2010&pizzaSelIdx=${param.pizzaSelIdx}"><img src="../assets/img/order/ord_menu_plt_btn.png" alt="파파플래터" /></a></li>
            			<!-- <li><a href="javascript:fnSelMenuGroup('9', '80');"><img src="../assets/img/order/ord_menu_drink_btn.png" alt="음료" /></a></li> -->
          				</ul>
        			</div>
        			
        			<!-- 20140210 이달의 프로모션 버튼으로 분리 -->
      				<!-- 20140424 파파플래터, 반값 프로모션 버튼 추가 & 레이아웃 수정 -->
      				<div class="promotion">
      					<ul class="etc_list">
            				<!--  <li><a href="javascript:fnViewDiv('half');"><img src="../assets/img/order/ord_menu_half_btn.png" alt="하프엔하프피자" /></a></li> -->
            				<%-- 
            				<li><a href="orderAction.action?menuId=pj_2013&pizzaSelIdx=${param.pizzaSelIdx}"><img src="../assets/img/order/ord_menu_drink_btn.png" alt="음료" /></a></li>
            				<li><a href="orderAction.action?menuId=pj_2014&pizzaSelIdx=${param.pizzaSelIdx}"><img src="../assets/img/order/ord_menu_sauce_btn.png" alt="소스&피클" /></a></li>
            				--%>
            				<!--  <li><a href="javascript:fnViewDiv('coupon');"><img src="../assets/img/order/ord_menu_ecu_btn.png" alt="e쿠폰메뉴" /></a></li> -->
           				</ul>
       				</div>
      			</div>
      			<!-- menuNavi_section end -->
      			
      			<!-- menuList_section -->
				<div id="menuList_section"> 
				<c:forEach var="li" items="${list}" varStatus="status">
					<!-- item -->
					<!-- 베스트메뉴(pj_2002), 오리지널(pj_2003), 골드링(pj_2004), 치즈롤(pj_2005), 씬(pj_2006), 골드링씬(pj_2008), 하트씬(pj_2009) -->
					<c:if test="${ li.menuid eq 'pj_2002' || li.menuid eq 'pj_2003' || li.menuid eq 'pj_2004' || li.menuid eq 'pj_2005'
									|| li.menuid eq 'pj_2006' || li.menuid eq 'pj_2008' || li.menuid eq 'pj_2009'}">
						<div id='menu_${status.count}' class='item'>
							<!-- 왼쪽 이미지 영역 -->
							<!-- item_left -->
							<div class='item_left'>
								<p class='photo'>
									<img src='${li.imagepathorder}' alt='${li.name}' title='${li.name}' onerror="this.src='/assets/img/order/menu/noImage_ord.png'" />
								</p> 
								<p class='name' id='pName_1'>${li.name}</p> 
								<p><button type='button' id='basket_1' name='basket_1' onclick="fnOrderPizza('${li.menuid}','${li.imagepathorder}','${ li.consist}','${li.name }');">장바구니에담기</button></p> 
							</div>
							<!--// item_left --> 
							<!--// item_right -->
							<div class='item_right'>
								<c:set var="price" value="" />	  
								<!-- size -->
								<input type='hidden' id="_size" value="" />
								<div class='size'>
									<c:if test="${ li.rprice != null}">
										<p class='label_radio menu_size_radio' >
											<c:set var="str" value="${li.rprice}"/>
											<input type='radio' name='pSize_1' value='${fn:substring(str, 0, fn:length(str)-1)}'/>
											<img src='../assets/img/order/ord_menuList_size_R.png' alt='레귤러' title='Regular' name="레귤러" />
											<span class='price' >${fn:substring(str, 0, fn:length(str)-1)}</span>
										</p>
									</c:if>
									<c:if test="${ li.lprice != null}">
										<p class='label_radio menu_size_radio' >
											<c:set var="str" value="${li.lprice}"/>
											<input type='radio' name='pSize_1' value='${fn:substring(str, 0, fn:length(str)-1)}'/>
											<img src='../assets/img/order/ord_menuList_size_L.png' alt='라지' title='large' name="라지" />
											<span class='price' >${fn:substring(str, 0, fn:length(str)-1)}</span>   
										</p>
									</c:if>
									<c:if test="${ li.fprice != null}">
										<p class='label_radio menu_size_radio' >
											<c:set var="str" value="${li.fprice}"/>
											<input type='radio' name='pSize_1' value='${fn:substring(str, 0, fn:length(str)-1)}'/>
											<img src='../assets/img/order/ord_menuList_size_F.png' alt='패밀리' title='family'/>
											<span class='price' >${fn:substring(str, 0, fn:length(str)-1)}</span>   
										</p>
									</c:if>
									<c:if test="${ li.pprice != null}">
										<p class='label_radio menu_size_radio' >
											<c:set var="str" value="${li.pprice}"/>
										  	<input type='radio' name='pSize_1' value='${fn:substring(str, 0, fn:length(str)-1)}'"/>
											<img src='../assets/img/order/ord_menuList_size_P.png' alt='파티' title='party'/>
											<span class='price' >${fn:substring(str, 0, fn:length(str)-1)}</span>   
										</p>	
									</c:if>
								</div>		
								<script type="text/javascript">
									//20140304 라디오버튼 디폴트 위치를 라지사이즈로 변경
									var firstSize = $("#menu_1 .size img").attr("title");
									if(firstSize == "Regular"){ra_check($("#menu_1 .size .menu_size_radio").eq(1));}
									else{ra_check($("#menu_1 .size .menu_size_radio").eq(0));}
								</script>
								<!--// size -->
								<!--// size -->   	
								<div class='spcInstruction'>  	
									<p class='btn'>
										<img src='../assets/img/order/btn_opt_off.gif' alt='변경' />
									</p>   
									<!-- 옵션변경 말풍선 -->    
									<div class='comment'>   
										<p class='top'>
											<img src='../assets/img/order/ord_menuList_detail_commBg_top.png' alt=''>
										</p>   
										<p class='bottom'>
											<img src='../assets/img/order/ord_menuList_detail_commBg_bottom.png' alt=''>
										</p>   
										<p class='center'>
											<span>special instructions :</span><br>
											버튼 클릭 시 sauce, cheese, bake, cut 상태를 조절하실 수 있습니다.<br>
											장바구니에 담은 후 변경하시려면 메뉴를 장바구니에서 삭제후 다시 담으셔야 합니다!!
										</p>    
									</div>   
									<!--// 옵션변경 말풍선 -->   	
								</div>  	
								<!-- detail -->   	
								<div class='detail'>   		
									<p class='btn'>
										<img src='../assets/img/order/btn_info.gif' alt='상세설명'/>
									</p>
									<!-- 상세보기 말풍선 -->
									<div class='comment'>
										<p class='top'><img src='../assets/img/order/ord_menuList_detail_commBg_top.png' alt=''></p>
										<p class='bottom'><img src='../assets/img/order/ord_menuList_detail_commBg_bottom.png' alt=''></p>
										<dl>
											<dt>토핑재료:</dt>
			                  				<dd>${li.topping}</dd>
			                			</dl>
			              			</div>
			              			<!--// 상세보기 말풍선 -->
			            		</div>
			            		<!--// detail -->
			            		<p class="select_price"></p>
	          				</div>
							<!--// item_right -->  
	          				<!-- 20130926 소스&치즈&커팅&베이크 옵션주기 -->
	          				<div id ="option_box_1" class="option_box"><!--  display: none; -->
		          				<ul class="spcInstructions">
		         					<li>
		        						<p onclick="fnAdjustMenu('1_1',$(this));">소스 조절 <span class="imgsp">▼</span></p>
		        						<div id="1_1" class="option">
											<p class="menu_opt_radio" >
												<input type="radio" id="1_regularSauce" name="1_sau_radio" value=""/>
			          							<label for="1_regularSauce">소스 보통(Normal)</label>
		          							</p>
											<p class="menu_opt_radio" >
												<input type="radio" id="1_lightSauce" name="1_sau_radio" value="20"/>
			          							<label for="1_lightSauce">소스 조금(LS)</label>
		          							</p>
											<p class="menu_opt_radio" >
												<input type="radio" id="1_extraSauce" name="1_sau_radio" value="30"/>
			          							<label for="1_extraSauce">소스 많이(XS)</label>
		          							</p>
											<p class="menu_opt_radio" >
												<input type="radio" id="1_noSauce" name="1_sau_radio" value="40"/>
			          							<label for="1_noSauce">소스 제외(NS)</label>
		          							</p>
										</div>
		       						</li>
		       						<li style=" cursor:pointer;">
		        						<p onclick="fnAdjustMenu('1_2',$(this));">치즈 조절 <span class="imgsp">▼</span></p>
		        						<div id="1_2" class="option">
											<p class="menu_opt_radio" >
												<input type="radio" id="1_normalCheese" name="1_chee_radio" value="" />
			          							<label for="1_normalCheese">치즈 보통(Normal)</label>
		          							</p>
											<p class="menu_opt_radio" >
												<input type="radio" id="1_lightCheese" name="1_chee_radio" value="20"/>
			          							<label for="1_lightCheese">치즈 조금(LC)</label>  
		          							</p>
											<p class="menu_opt_radio" >
												<input type="radio" id="1_noCheese" name="1_chee_radio" value="30"/>
			          							<label for="1_noCheese">치즈 제외(NC)</label>
		          							</p>
										</div>
		       						</li>
		       						<li>
		        						<p onclick="fnAdjustMenu('1_3',$(this));">굽기 조절 <span class="imgsp">▼</span></p>
		        						<div id="1_3" class="option">
											<p class="menu_opt_radio" >
												<input type="radio" id="1_normalBake" name="1_bake_radio" value=""/>
			          							<label for="1_normalBake">기본 굽기(Normal)</label>
		          							</p>
											<p class="menu_opt_radio" >
												<input type="radio" id="1_wellDone" name="1_bake_radio" value="20"/>
			          							<label for="1_wellDone">바싹 굽기(WD)</label> 
		          							</p>
										</div>
		       						</li>
		       						<li>
		        						<p onclick="fnAdjustMenu('1_4',$(this));">조각 컷팅 <span class="imgsp">▼</span></p>
		        						<div id="1_4" class="option">
											<p class="menu_opt_radio" >
												<input type="radio" id="1_normalCut" name="1_cut_radio" value=""/>
			          							<label for="1_normalCut">기본컷팅(Normal)</label>
		          							</p>
											<p class="menu_opt_radio" >
												<input type="radio" id="1_squareCut" name="1_cut_radio" value="60"/>
			          							<label for="1_squareCut">사각컷팅(SC)</label>
		          							</p> 
											<p class="menu_opt_radio" >
												<input type="radio" id="1_sixCut" name="1_cut_radio" value="20"/>
			          							<label for="1_sixCut">6조각컷팅(6C)</label>
		          							</p> 
											<p class="menu_opt_radio" >
												<input type="radio" id="1_eightCut" name="1_cut_radio" value="30"/>
			          							<label for="1_eightCut">8조각컷팅(8C)</label>
		          							</p> 
											<p class="menu_opt_radio" >
												<input type="radio" id="1_tenCut" name="1_cut_radio" value="40"/>
			          							<label for="1_tenCut">10조각컷팅(10C)</label>
		          							</p> 
										</div>
		       						</li> 
		          				</ul>
			  				</div>
	        			</div>
        			</c:if>
					<!-- //item -->
					
					<!-- item -->
					<!-- 세트 메뉴 -->
					<c:if test="${ li.menuid eq 'pj_2011' }">
						<c:set var="price" value="${li.setprice}"/>
						<c:set var="price" value="${fn:substring(price,0,fn:length(price)-1) }"/>
						<div id="set_section" class="" style="display: block;">
							<div class="set_items has-js" id="set_30348"> 
								<p class="image">
									<img src="${li.imagepathorder }" width="220" height="140" alt="${li.name }" title="${li.name }" id="orderimage">
								</p>
								<p class="name" id="setNm"><c:out value="${li.name }" /><span class="size">(2-3인용)</span></p>
								<p class="btn_cart" onclick="fnOrderSet_plater('${li.menuid}','${li.imagepathorder}','${price}','${ li.consist}','${li.name }');">
									<button type="button">장바구니에담기</button>
								</p>
								<p class="description">
									<img src="../assets/img/order/ord_menuList_size_set.png" alt="라지세트" title="라지세트">상세 <br>
									<span> : ${ li.consist} </span>
								</p>
								<div class="size_prc">
									<input type="hidden" name=" " value=" ">
									<p class="set_price">${price } </p>
									<p style="width:40px; position:absolute; top:10px; left:140px;">수량 : </p>
									<p class="selcet_count">
										<select id="cnt_opt" name="cnt_opt" onchange="setSelect(this.value)">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
									</p>
								</div>
							</div>
						</div>
					</c:if>					
					<!-- item -->
					
					<!-- item -->
					<!-- 사이드 -->
					<c:if test="${ li.menuid eq 'pj_2012' }">
						<c:set var="price" value="${li.onesizeprice}"/>
						<c:set var="price" value="${fn:substring(price,0,fn:length(price)-1) }"/>
						<div id='menu_${status.count}' class='item'>
							<!-- 왼쪽 이미지 영역 -->
							<!-- item_left -->
							<div class='item_left'>
								<p class='photo'><img src='${li.imagepathorder}' alt='${li.name}' title='${li.name}' onerror="this.src='/assets/img/order/menu/noImage_ord.png'" /></p>
								<p class='name' id='pName_1'>${li.name}</p>
								<p><button type='button' id='basket_1' name='basket_1' onclick="fnOrderSide('${li.menuid}','${li.imagepathorder}','${price}','${ li.consist}','${li.name }');">장바구니에담기</button></p>
							</div>
							<!--// item_left -->
							<!--// item_right -->
							<div class='item_right'>
								<!-- size -->
								<div class='size'>
									<input type='hidden' name='pCode_1' value='51036,샘플러,one,12900,,20,9001,3006,,10' />
									<p class='label_radio menu_size_radio'>
										<c:set var="str" value="${li.onesizeprice}"/>
										<input type='radio' name='pSize_1' value='${fn:substring(str, 0, fn:length(str)-1)}' />
										<img src='../assets/img/order/ord_menuList_size_one.png' alt='원사이즈' title='One Size' />
										<span class='price'>${fn:substring(str, 0, fn:length(str)-1)}</span>
									</p>
								</div>
								<script type="text/javascript">
									//20140304 라디오버튼 디폴트 위치를 라지사이즈로 변경
									var firstSize = $("#menu_1 .size img").attr("title");
									if(firstSize == "Regular"){ra_check($("#menu_1 .size .menu_size_radio").eq(1));}
									else{ra_check($("#menu_1 .size .menu_size_radio").eq(0));}
								</script>
								<!--// size -->
								<div class='select_count'>
									<select id='cnt_opt1' name='cnt_opt' onchange="setSelect(this.value)">
										<option value='1'>1</option>
										<option value='2'>2</option>
										<option value='3'>3</option>
										<option value='4'>4</option>
										<option value='5'>5</option>
										<option value='6'>6</option>
										<option value='7'>7</option>
										<option value='8'>8</option>
										<option value='9'>9</option>
										<option value='10'>10</option>
									</select>
								</div>
								<!-- detail -->
								<div class='detail'>
									<p class='btn'><img src='../assets/img/order/btn_info.gif' alt='상세설명' /></p>
									<!-- 상세보기 말풍선 -->
									<div class='comment'>
										<p class='top'><img src='../assets/img/order/ord_menuList_detail_commBg_top.png' alt=''></p>
										<p class='bottom'><img src='../assets/img/order/ord_menuList_detail_commBg_bottom.png' alt=''></p>
										<dl>
											<dd>
												<c:if test="${ li.material != null }">
													<b style = "color:#228a68;">재료</b><br/>
													${li.material}<br/>
												</c:if>
												<c:if test="${li.presentsauce != null }">
													<b style = "color:#228a68;">증정소스</b><br/>
													${li.presentsauce}
												</c:if>	
											</dd>
										</dl>
									</div>
									<!--// 상세보기 말풍선 -->
								</div>
								<!--// detail -->
								<p class="select_price">0</p>
							</div>
							<!--// item_right -->
						</div>
					</c:if>
					<!-- //item -->
					
					<!-- item -->
					<!-- 파파플래터 -->
					<c:if test="${ li.menuid eq 'pj_2010' }">
						<c:set var="price" value="${li.boxprice}"/>
						<c:set var="price" value="${fn:substring(price,0,fn:length(price)-1) }"/>
						<div id="plat_section" class="" style="display: block;">
							<div class="item has-js" id="menu_50992">
								<p class="image"><img src="../assets/img/order/menu/11/1019_ord.png" width="220" height="140" alt="수퍼 파파스" title="수퍼 파파스"></p>
								<p class="name" id="pName_50992">${li.name}<span class="size">(BOX)</span></p>
								<p class="btn_cart" onclick="fnOrderSet_plater('${li.menuid}','${li.imagepathorder}','${price}','${ li.consist}','${li.name }');">
									<button type="button">장바구니에담기</button>
								</p>
								<p class="description">
									<img src="../assets/img/order/ord_menuList_size_box.png" alt="플래터세트">구성<br>
									<span> :${li.consist}</span>
								</p>
								<div class="size_prc">
									<c:set var="str" value="${li.boxprice}"/>
									<p class="price">${fn:substring(str, 0, fn:length(str)-1)}</p>
									<p style="width: 40px; position: absolute; top: 10px; left: 140px;">수량
										:</p>
									<p class="selcet_count">
										<select id="cnt_opt" name="cnt_opt" onchange="setSelect(this.value)">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
									</p>
								</div>
							</div>
						</div>
					</c:if>					
					<!-- //item -->
					
					<!-- item -->
					<!-- 음료 -->
					<c:if test="${li.menuid eq 'pj_2013' }">
						<div id='menu_${status.count}' class='item'>
							<!-- 왼쪽 이미지 영역 -->
							<!-- item_left -->
							<div class='item_left'>
								<p class='photo'><img src='${li.imagepathorder}' alt='${li.name}' title='${li.name}' onerror="this.src='/assets/img/order/menu/noImage_ord.png'" /></p>
								<p class='name' id='pName_1'>${li.name}</p>
								<p><button type='button' id='basket_1' name='basket_1' onclick="fnOrderBever('${li.menuid}','${li.imagepathorder}','${ li.consist}','${li.name }');">장바구니에담기</button></p>
							</div>
							<!--// item_left -->
							<!--// item_right -->
							<div class='item_right'>
								<!-- size -->
								<div class='size'>
									<!-- 350ML -->
									<c:if test="${li.name eq '미닛 메이드 오렌지'}">
										<p class='label_radio menu_size_radio' >
											<input type='radio' name='pSize_1' value='${fn:substring(li.rprice, 0, fn:length(li.rprice)-1)}' />
											<img src='../assets/img/order/ord_menuList_size_350ml.png' alt='350ml' title='350ml'/><span class='price' >${fn:substring(li.rprice, 0, fn:length(li.rprice)-1)}</span>
										</p>	
									</c:if>
									<!-- 500ML -->
									<c:if test="${li.name eq '코카콜라' || li.name eq '스프라이트' || li.name eq '코카콜라 제로' }">
										<p class='label_radio menu_size_radio'>
											<input type='radio' name='pSize_1' value='${fn:substring(li.rprice, 0, fn:length(li.rprice)-1)}' />
											<img src='../assets/img/order/ord_menuList_size_500ml.png' alt='500ml' title='500ml' /><span class='price'>${fn:substring(li.rprice, 0, fn:length(li.rprice)-1)}</span>
										</p>	
									</c:if>
									<!-- 600ML -->
									<c:if test="${li.name eq '환타' }">
										<p class='label_radio menu_size_radio' >
											<input type='radio' name='pSize_1' value='${fn:substring(li.lprice, 0, fn:length(li.lprice)-1)}' />
											<img src='../assets/img/order/ord_menuList_size_600ml.png' alt='600ml' title='600ml'/><span class='price' >${fn:substring(li.rprice, 0, fn:length(li.rprice)-1)}</span> 
										</p>
									</c:if>
									<!-- 1.25L -->
									<c:if test="${li.name eq '코카콜라'}">
										<p class='label_radio menu_size_radio'>
											<input type='radio' name='pSize_1' value='${fn:substring(li.lprice, 0, fn:length(li.lprice)-1)}' />
											<img src='../assets/img/order/ord_menuList_size_1.25L.png' alt='1.25L' title='1.25L' /><span class='price'>${fn:substring(li.lprice, 0, fn:length(li.lprice)-1)}</span>
										</p>
									</c:if>
									<!-- 1.25L -->
									<c:if test="${li.name eq '스프라이트' || li.name eq '코카콜라 제로' || li.name eq '환타' || li.name eq '미닛 메이드 오렌지'}">
										<p class='label_radio menu_size_radio' >
											<input type='radio' name='pSize_1' value='${fn:substring(li.lprice, 0, fn:length(li.lprice)-1)}' />
											<img src='../assets/img/order/ord_menuList_size_1.5L.png' alt='1.5L' title='1.5L'/><span class='price' >${fn:substring(li.lprice, 0, fn:length(li.lprice)-1)}</span>
										</p>
									</c:if>
								</div>
								<script type="text/javascript">
									//20140304 라디오버튼 디폴트 위치를 라지사이즈로 변경
									var firstSize = $("#menu_1 .size img").attr("title");
									if(firstSize == "Regular"){ra_check($("#menu_1 .size .menu_size_radio").eq(1));}
									else{ra_check($("#menu_1 .size .menu_size_radio").eq(0));}
								</script>
								<!--// size -->
								<!--// size -->
								<div class='select_count'>
									<select id='cnt_opt_bever' name='cnt_opt_drink' onchange="setSelect(this.value)">
										<option value='1' selected="selected">1</option>
										<option value='2'>2</option>
										<option value='3'>3</option>
										<option value='4'>4</option>
										<option value='5'>5</option>
										<option value='6'>6</option>
										<option value='7'>7</option>
										<option value='8'>8</option>
										<option value='9'>9</option>
										<option value='10'>10</option>
									</select>
								</div>
								<!-- detail -->
								<div class='detail'>
									<p class='btn'><img src='../assets/img/order/btn_info.gif' alt='상세설명' /></p>
									<!-- 상세보기 말풍선 -->
									<div class='comment'>
										<p class='top'><img src='../assets/img/order/ord_menuList_detail_commBg_top.png' alt=''></p>
										<p class='bottom'><img src='../assets/img/order/ord_menuList_detail_commBg_bottom.png' alt=''></p>
										<dl>
											<dd>${li.name}</dd>
										</dl>
									</div>
								</div>
								<p class="select_price">0</p>								
							</div>
							<!--// item_right -->
						</div>
					</c:if>
					<!-- //item -->
					
					<!-- item -->
					<!-- 소스&피클 -->
					<c:if test="${li.menuid eq 'pj_2014' }">
						<div id="menu_${status.count}" class="item has-js">
							<!-- 왼쪽 이미지 영역 -->
							<!-- item_left -->
							<div class="item_left">
								<p class="photo"><img src="/assets/img/order/menu/90/3004_ord.png" alt="갈릭 소스" title="갈릭 소스" onerror="this.src='/assets/img/order/menu/noImage_ord.png'"></p>
								<p class="name" id="pName_1">갈릭 소스</p>
								<p><button type="button" id="basket_1" name="basket_1" onclick="makeSendData('1');fnReset_spcOption_up($(this));">장바구니에담기</button></p>
							</div>
						</div>
					</c:if>
					<!-- //item -->
				</c:forEach>
				</div>
      			<!--// menuList_section -->      			
       		<!-- 20140616 프로모션 메뉴 화면 생성 (샘플러 출시 기준) -->
			<div id="prom_section" style="display: none;">
          		<div class="prom_section_coup">
            				
       				<label for="prom_coupon" class="hidden">쿠폰</label>
       				<select id="prom_coupon" name="prom_coupon" class="s_coup" onchange="fnPromotionMainMenu(this.value); fnPromotionSubMenu(this.value);">
         				<option value="">프로모션 쿠폰을 선택해주세요</option>
         				<!-- <option value="">라지 이상 피자(골드링, 치즈롤 제외)와 함께 구매 시 파파샘플러 4,000원</option> -->
       				</select>
          			<p class="txt_point padd_t5 bold"> [제휴 및 기타 할인 중복 적용 불가]</p>
     			</div>	
          	
          			<!-- menuArea-->
          			<div class="menuArea">
            			<div class="main_menu p_menu">
            				<p class="tit"><img src="/assets/img/order/prom1.gif" alt="적용메뉴" /></p>
              				<p class="img" style="text-align:left" id="main_menu_img">
              					<img src="/assets/img/order/menu/00/def_img.png" alt="쿠폰 적용 메뉴"/>
              				</p>
              				<p class="select_price s15 prom_menu_name"> 
              					<span class="name"><label for="main_menu" class="hidden">적용 메뉴 선택</label>
              						<select id="main_menu" name="main_menu" class="prom_menu" onchange="fnPromotionMainMenuSelect($(this));">
               							<!-- <option>마가리타 오리지널 라지</option> -->
	              					</select>
	              				</span>
              					<span class="price">0<span class="t_block">원</span></span> 
              				</p>
            			</div>
            			
            			<!-- 할인메뉴 1 -->
            			<div class="sub_menu p_menu" id="first_sub">
            				<p class="tit"><img src="/assets/img/order/prom2.gif" alt="할인메뉴" /></p>
              				
              				<p class="img" style="text-align:right" id="sub_menu_img">
              					<img src="/assets/img/order/menu/00/def_img_sub.png" alt="할인메뉴1"/>
              				</p>
              				<p class="select_price s15 prom_menu_name"> 
              					<span class="name"></span>
              					<span class="price">
	              					<!-- 20140616 할인되는 메뉴는 org_block클래스에 원래 단가 표시 -->
	              					<!-- <span class="org_block">&nbsp;100,000원&nbsp;&nbsp;&nbsp;</span>X<span class="t_block">원</span> -->
              					</span>
              					<span class="promHiddenVal">
              					<!-- 20140619 장바구니 저장용 추가 -->
	              					<input type="hidden" class="hideCode"     value="" />
	              					<input type="hidden" class="hideName"     value="" />
	              					<input type="hidden" class="hidePrice"    value="" />
	              					<input type="hidden" class="hideDiscountPrice"    value="" />
	              					<input type="hidden" class="hideLageCode" value="" />
	              					<input type="hidden" class="hideMidCode"  value="" />
	              					<input type="hidden" class="hideSmlCode"  value="" />
	              					<input type="hidden" class="hideSubCode"  value="" />
	              					<input type="hidden" class="hideDough"    value="" />
	              					<input type="hidden" class="hideSize"     value="" />
	              					<input type="hidden" class="hideDiveCode" value="" />
              					</span>
              				</p>
            			</div>
            			<!-- 할인메뉴 2 -->
            			<div class="sub_menu p_menu" id="second_sub" style="display: none">
            				<p class="tit"><img src="/assets/img/order/prom3.gif" alt="할인메뉴" /></p>
              				
              				<p class="img" style="text-align:right" id="sub_menu_img">
              					<img src="/assets/img/order/menu/00/def_img_sub.png" alt="할인메뉴2"/>
              				</p>
              				<p class="select_price s15 prom_menu_name"> 
              					<span class="name"></span>
              					<span class="price">
	              					<!-- 20140616 할인되는 메뉴는 org_block클래스에 원래 단가 표시 -->
	              					<!-- <span class="org_block">&nbsp;100,000원&nbsp;&nbsp;&nbsp;</span>X<span class="t_block">원</span> -->
              					 </span>
              					 <span class="promHiddenVal">
              					<!-- 20140619 장바구니 저장용 추가 -->
	              					<input type="hidden" class="hideCode"     value="" />
	              					<input type="hidden" class="hideName"     value="" />
	              					<input type="hidden" class="hidePrice"    value="" />
	              					<input type="hidden" class="hideDiscountPrice"    value="" />
	              					<input type="hidden" class="hideLageCode" value="" />
	              					<input type="hidden" class="hideMidCode"  value="" />
	              					<input type="hidden" class="hideSmlCode"  value="" />
	              					<input type="hidden" class="hideSubCode"  value="" />
	              					<input type="hidden" class="hideDough"    value="" />
	              					<input type="hidden" class="hideSize"     value="" />
	              					<input type="hidden" class="hideDiveCode" value="" />
              					</span>
              				</p>
            			</div>
            			
            			<div class="sub_description">
            				<p class="padd_t5">
            					프로모션 쿠폰이 아닌 기타 할인 적용을 원하시는 경우 피자 단품을 선택하신 후 결제 단계에서 쿠폰 적용을 받으실 수 있습니다.
            					<br><br>
            					장바구니에서 프로모션 메뉴의 수량 변경 또는 프로모션 메뉴 삭제 시 할인 메뉴에 동시 적용됩니다. 
            				</p>
     					</div>
          			</div> 
          			<!--// menuArea-->
					
	          		<div id="prom_info">
	          			<!-- 옵션변경 버튼 --> 
            			<div class="prom_spcInstruction">
							<p class="btn_h23 red"><button type="button">피자옵션</button></p>
              				
              				<div class="comment">
                				<p class="top"><img src="/assets/img/order/ord_menuList_detail_commBg_top.png" alt=""></p>
                				<p class="bottom"><img src="/assets/img/order/ord_menuList_detail_commBg_bottom.png" alt=""></p>
            					<p class="center"><span>special instructions :</span>
	            		 			<br>버튼 클릭 시 sauce, cheese, bake, cut 상태를 조절하실 수 있습니다.
	            		 			<br>장바구니에 담은 후 변경하시려면 메뉴를 장바구니에서 삭제후 다시 담으셔야 합니다!!</p> 
              				</div> 
						</div>
						<!-- 장바구니 버튼 -->
            			<p class="btn_cart" onclick="fnPromotionAddCart($(this));">
              				<button type="button" >장바구니에담기</button>
            				<!-- 장바구니 담기 후 피자 옵션 모두 초기화하기 -->
            			</p>
	          		</div>
	          			
          			<!-- 프로모션 메뉴 피자 옵션 변경 -->
          			<div id ="option_box_prom" class="prom_option_box"><!--  display: none; -->
	          				<ul class="spcInstructions">
	         					<li>
	        						<p onclick="fnAdjustMenu('prom_1',$(this));">소스 조절 <span class="imgsp">▼</span></p>
	        						<div id="prom_1" class="option">
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_regularSauce" name="prom_sau_radio" value=""/>
		          							<label for="prom_regularSauce">소스 보통(Normal)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_lightSauce" name="prom_sau_radio" value="20"/>
		          							<label for="prom_lightSauce">소스 조금(LS)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_extraSauce" name="prom_sau_radio" value="30"/>
		          							<label for="prom_extraSauce">소스 많이(XS)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_noSauce" name="prom_sau_radio" value="40"/>
		          							<label for="prom_noSauce">소스 제외(NS)</label>
	          							</p>
									</div>
	       						</li>
	       						<li style=" cursor:pointer;">
	        						<p onclick="fnAdjustMenu('prom_2',$(this));">치즈 조절 <span class="imgsp">▼</span></p>
	        						<div id="prom_2" class="option">
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_normalCheese" name="prom_chee_radio" value="" />
		          							<label for="prom_normalCheese">치즈 보통(Normal)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_lightCheese" name="prom_chee_radio" value="20"/>
		          							<label for="prom_lightCheese">치즈 조금(LC)</label>  
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_noCheese" name="prom_chee_radio" value="30"/>
		          							<label for="prom_noCheese">치즈 제외(NC)</label>
	          							</p>
									</div>
	       						</li>
	       						<li>
	        						<p onclick="fnAdjustMenu('prom_3',$(this));">굽기 조절 <span class="imgsp">▼</span></p>
	        						<div id="prom_3" class="option">
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_normalBake" name="prom_bake_radio" value=""/>
		          							<label for="prom_normalBake">기본 굽기(Normal)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_wellDone" name="prom_bake_radio" value="20"/>
		          							<label for="prom_wellDone">바싹 굽기(WD)</label> 
	          							</p>
									</div>
	       						</li>
	       						<li>
	        						<p onclick="fnAdjustMenu('prom_4',$(this));">조각 컷팅 <span class="imgsp">▼</span></p>
	        						<div id="prom_4" class="option">
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_normalCut" name="prom_cut_radio" value=""/>
		          							<label for="prom_normalCut">기본컷팅(Normal)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_squareCut" name="prom_cut_radio" value="60"/>
		          							<label for="prom_squareCut">사각컷팅(SC)</label>
	          							</p> 
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_sixCut" name="prom_cut_radio" value="20"/>
		          							<label for="prom_sixCut">6조각컷팅(6C)</label>
	          							</p> 
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_eightCut" name="prom_cut_radio" value="30"/>
		          							<label for="prom_eightCut">8조각컷팅(8C)</label>
	          							</p> 
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_tenCut" name="prom_cut_radio" value="40"/>
		          							<label for="prom_tenCut">10조각컷팅(10C)</label>
	          							</p> 
									</div>
	       						</li> 
	          				</ul>
	  				</div> 
          			<p class="and"><img src="/assets/img/order/and.png" alt="and"/></p>
					<p class="plus"><img src="/assets/img/order/plus.png" alt="plus"/></p>
      			</div>
				<!-- prom_section end-->		


      			<!-- 세트메뉴 섹션 --> 
      			<div id="set_section" class="" style="display: none;">
      			</div>
      			<!-- 세트메뉴 섹션 끝-->
      			
      			<!-- 20140425 파파플래터 --> 
      			<div id="plat_section" class="" style="display: none;">
      			</div>
      			<!-- 세트메뉴 섹션 끝-->
      
      			<!-- 하프앤하프 섹션 -->
      			<!-- half_section --> 
      			<div id="half_section" style="display: none;">
          			<!-- left-->
          			<div class="left">
            			<div class="size">
              				<label for="pro_size" class="hidden">사이즈</label>
              				<select id="pro_size" name="pro_size" class="s_size" onchange="fnSelLeftHalfAndHalf(this.value);">
                				<option value="">피자 사이즈를 선택해주세요</option>
              				</select>
            			</div>
            			
            			<div class="half1">
            				<p class="tit"><img src="/assets/img/order/hp1.gif" alt="하프1피자" /></p>
              				<label for="half1" class="hidden">하프피자1 선택</label>
              				<select id="half1" name="half1" class="half" onchange="fnSelRightHalfAndHalf(this.value, 1)">
               					<option>피자1 선택해주세요</option>
              				</select>
              				<p class="img" style="text-align:left" id="half1Img"><img src="" alt=""/></p>
              				<p class="select_price s15 half_name" style="width:100%;"> <span class="name"></span><span class="price"><span class="t_block"></span></span> </p>
            			</div>
            			
            			<div class="half2">
            				<p class="tit"><img src="/assets/img/order/hp2.gif" alt="하프2피자" /></p>
              				<label for="half2" class="hidden">하프피자2 선택</label>
              				<select id="half2" name="half2" class="half" onchange="fnSelImageHalfandHalf(this.value, 2);">
                				<option>피자2 선택해주세요</option>
              				</select>
              				<p class="img" style="text-align:right" id="half2Img"> <img src="" alt=""/></p>
              				<p class="select_price s15 half_name"> <span class="name"></span><span class="price"><span class="t_block"></span></span></p>
            			</div>
          			</div>
          			<!--// left-->
          			
          			<!-- right -->
          			<div class="right">
            			<div class="half_spcInstruction">
							<p class="btn_h23 red"><button type="button">옵션변경</button></p>
              				<!-- 옵션변경 말풍선 --> 
              				<div class="comment">
                				<p class="top"><img src="/assets/img/order/ord_menuList_detail_commBg_top.png" alt=""></p>
                				<p class="bottom"><img src="/assets/img/order/ord_menuList_detail_commBg_bottom.png" alt=""></p>
            					<p class="center"><span>special instructions :</span>
	            		 			<br>버튼 클릭 시 sauce, cheese, bake, cut 상태를 조절하실 수 있습니다.
	            		 			<br>장바구니에 담은 후 변경하시려면 메뉴를 장바구니에서 삭제후 다시 담으셔야 합니다!!</p> 
              				</div>
              				<!--// 옵션변경 말풍선 --> 
							</div>
							
            			<p class="select_price"></p>
            			<p></p>
            			<p class="btn_cart" onclick="fnAddSet($(this), '59999','30', '55', '', '', '');fnReset_spcOption_up($(this))">
              				<button type="button" >장바구니에담기</button>
            			</p>
          			</div>
          			<!--// right -->
        			<div id ="option_box_59999" class="half_option_box"><!--  display: none; -->
	          				<ul class="spcInstructions">
	         					<li>
	        						<p onclick="fnAdjustMenu('59999_1',$(this));">소스 조절 <span class="imgsp">▼</span></p>
	        						<div id="59999_1" class="option">
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_regularSauce" name="59999_sau_radio" value=""/>
		          							<label for="59999_regularSauce">소스 보통(Normal)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_lightSauce" name="59999_sau_radio" value="20"/>
		          							<label for="59999_lightSauce">소스 조금(LS)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_extraSauce" name="59999_sau_radio" value="30"/>
		          							<label for="59999_extraSauce">소스 많이(XS)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_noSauce" name="59999_sau_radio" value="40"/>
		          							<label for="59999_noSauce">소스 제외(NS)</label>
	          							</p>
									</div>
	       						</li>
	       						<li style=" cursor:pointer;">
	        						<p onclick="fnAdjustMenu('59999_2',$(this));">치즈 조절 <span class="imgsp">▼</span></p>
	        						<div id="59999_2" class="option">
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_normalCheese" name="59999_chee_radio" value="" />
		          							<label for="59999_normalCheese">치즈 보통(Normal)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_lightCheese" name="59999_chee_radio" value="20"/>
		          							<label for="59999_lightCheese">치즈 조금(LC)</label>  
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_noCheese" name="59999_chee_radio" value="30"/>
		          							<label for="59999_noCheese">치즈 제외(NC)</label>
	          							</p>
									</div>
	       						</li>
	       						<li>
	        						<p onclick="fnAdjustMenu('59999_3',$(this));">굽기 조절 <span class="imgsp">▼</span></p>
	        						<div id="59999_3" class="option">
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_normalBake" name="59999_bake_radio" value=""/>
		          							<label for="59999_normalBake">기본 굽기(Normal)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_wellDone" name="59999_bake_radio" value="20"/>
		          							<label for="59999_wellDone">바싹 굽기(WD)</label> 
	          							</p>
									</div>
	       						</li>
	       						<li>
	        						<p onclick="fnAdjustMenu('59999_4',$(this));">조각 컷팅 <span class="imgsp">▼</span></p>
	        						<div id="59999_4" class="option">
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_normalCut" name="59999_cut_radio" value=""/>
		          							<label for="59999_normalCut">기본컷팅(Normal)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_squareCut" name="59999_cut_radio" value="60"/>
		          							<label for="59999_squareCut">사각컷팅(SC)</label>
	          							</p> 
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_sixCut" name="59999_cut_radio" value="20"/>
		          							<label for="59999_sixCut">6조각컷팅(6C)</label>
	          							</p> 
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_eightCut" name="59999_cut_radio" value="30"/>
		          							<label for="59999_eightCut">8조각컷팅(8C)</label>
	          							</p> 
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_tenCut" name="59999_cut_radio" value="40"/>
		          							<label for="59999_tenCut">10조각컷팅(10C)</label>
	          							</p> 
									</div>
	       						</li> 
	          				</ul>
		  				</div>
		  				<p class="plus"><img src="/assets/img/order/plus.png" alt="plus" style="display: none;"/></p>
      			</div>
      			<!--// half_section --> 
      			<!-- 하프앤하프 섹션 끝 --> 
      
      			<!-- E쿠폰 섹션 -->
      			<div id="ecoup_section" style="display: none;">
          			<!-- left-->
        			<div class="left">
          				<div class="inquiry">
          					<p>
          						* E쿠폰 번호를 입력하신 후 조회 버튼을 눌러주세요!!
          					</p>
            				<label for="coup_id">E쿠폰 번호</label>
            				<input type="text" id="coup_id" style="width:200px"/>
             				<span class="btn_h23 gray" onclick="$('#coup_id').val( $('#coup_id').val().toUpperCase() ); fnSelECoupon($('#coup_id').val());"><button type="button">조회</button></span>
          				</div>
        			</div>
          			<!--// left-->
        
          			<!-- right -->
        			<div class="right"> 
          				<p><img src="/assets/img/order/menu/eCoupon_img_none.png" alt="e_Coupon" title="couponNm"/></p>
            			<p class="name" id="coupNm"></p>
            			<p class="btn_cart" onclick="fnAddSet($(this), '','', '', '', '', '')"><button type="button">장바구니에담기</button></p> 
        			</div>
          			<!--// right -->
      			</div>
      			<!-- e쿠폰 섹션 끝 --> 
      
    		</div>
    		<!--// cont --> 
  		</div>
  		<!--// conternts --> 
	</div>
	<!--// con_container -->
</form>
 

<!-- ///////////////////////////////////////////////////////////// 장바구니 구역 //////////////////////////////////////////////////////////////////// -->
<!-- orderWrap --> 

<!--// orderWrap --> 

<!-- ///////////////////////////////////////////////////////// 오더옵션에 들어 갈 컨텐츠 모음///////////////////////////////////////////////////////////////////////// --> 
<!-- 회원정보 (jsp : 회원 정보 출력) -->
<div id="mem_info" class="opt_box">
  	<p class="top"></p>
  	<p class="bottom"></p>
  	<div>
    	<h3 class="title line_btn"><img src="/assets/img/order/order_rboxTitle_memInfo.gif" alt="수령인 정보" /><span class="btn_h23 gray right" ><button type="button" class="mem_modify">변경</button></span></h3>
    	<div class="opt_whBox">
      		<p class="top"></p>
      		<p class="bottom"></p>
      		<p class="line"><span class="tit">이름 : </span> <span class="text m_name" >정우람</span></p>
      		<p style="padding : 4px 0 0;"><span class="tit">연락처 : </span> <span class="text m_phone" >01038085247</span></p>
      		<!-- jsp 이부분이 회원 정보 출력 부분 끝 --> 
    	</div>
  	</div>
</div>

<!-- 회원 주소정보/ 선택 (jsp : 회원 주소 정보 출력) -->
<div id="select_addr" class="opt_box">
  	<p class="top"></p>
  	<p class="bottom"></p>
  	<div>
    	<h3 class="title line_btn">
	    	<img src="/assets/img/order/order_rboxTitle_addrSelect.gif" alt="배달지선택" /> 
	    	<!-- <a href="#frame"><span class="btn_h23 gray right" ><button type="button" id="btn_newAddr_reg">새주소 입력</button></span></a> -->
	    	<!-- 문서모드 ie7, ie8 반응 수정-->
	    	<a href="javascript:;" onclick="parent.window.scrollTo(0, $('#frame').offset().top);">
	    		<span class="btn_h23 gray right" ><button type="button" id="btn_newAddr_reg">새주소 입력</button></span>
	    	</a>
    	</h3>
    	<div id="addr_list" class="mem_addr opt_whBox">
      		<p class="top"></p>
			<p class="bottom"></p>

	  		<p class="line line_height15 line_btn">
	  			<span>조회 정보가 없습니다.</span>
      		<p/>

    	</div>
  	</div>
</div>

<!-- 프레임(매장찾기:)(주소찾기:)(토핑:) -->
<div id="frame" class="opt_box" >
  	<p class="top"></p>
  	<p class="bottom"></p>
  	<div>
    	<h3 class="title"><!--<img src="assets/img/order/order_rboxTitle_selectStore.gif" alt="방문매장선택" />--></h3>
    	<div id="addr_list" class="mem_addr opt_whBox" style="padding:0;">
      		<iframe name="" frameborder="0" width="280px" height="200px" src="" id="ifrm">아이프레임이 지원되는 브라우저에서 확인가능합니다.</iframe>
    	</div>
  	</div>
</div>
 
<!-- ////////////////////////////////////  alert 및 공통 팝업  ////////////////////////////////////-->
<!-- 20140730 8월 프로모션 주문 시 쿠폰 유의 사항 알림 추가  -->
<div class="pop_box6" id="pop_guide_coupon">
   	<p class="padd_t5"> 
   		<span class="txt_point txt_tit padd_tb5"> 8월 전사 프로모션 주문 시 유의 사항</span>
		<span class="btn_h23 gray" style="position: absolute; right:25px; top:20px"><button type="button" onclick='del_pop("#pop_guide_coupon")'>확인</button></span>
	</p>
	<br>
	<p class="padd_b5">
	* 8월 전사 프로모션<span class="bold"> 'Double Upgrade(골드링/치즈롤 크러스트 패밀리 사이즈 수퍼파파스/스파이시치킨랜치/존스페이버릿)'</span> 적용 및 주문을 원하시는 고객님들은 
 		<span class="bold">골드링/치즈롤 크러스트 패밀리사이즈 수퍼파파스/스파이시치킨랜치/존스페이버릿</span> 피자를 장바구니에 담으신 후, 쿠폰을 선택하셔야 적용이 가능합니다.<br><br>
	* <span class="bold padd_b10">8월 전사 프로모션 'Double Upgrade' 주문 방법 </span><br>
	① 온라인 주문 시작 &#8594; ② 골드링 또는 치즈롤 크러스트 선택 &#8594; ③ 수퍼 파파스/스파이시 치킨랜치/존스 페이버릿 패밀리 사이즈 선택 &#8594; ④ 장바구니 담기 &#8594; ⑤ 결제 화면의 ‘쿠폰조회/적용 버튼’ 클릭 후 해당 쿠폰 적용 &#8594; ⑥ 주문 완료!!<br>
	</p>
</div>

<!--장바구니 빈경우, E쿠폰 쿠폰번호 미등록 오류, 주문타입 선택 알림, 주소선택알림, 시간선택 알림 -->
<div class="notice" id="notice_1002" style="display:none; width:320px; height:144px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header" >
	    <div class="left" style="float:left; width:6px;  background:url(/assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:308px; height:40px; background:url(/assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>알림!!</h2>
	    	<!-- <a id="closex" class="close" href="#">Close</a> -->
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(/assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div id="alertText" class="text_body" style="width:320px; height:90px; line-height: 35px; background:#fff; border: 0px none; padding: 10px 0px;"> 
	   	<p></p> 
    </div> 
 	<!-- //comm_list --> 
  	<div class="footer" style="position: absolute; height:30px; background:#fff; " >
		<div class="button" style=" bottom:15px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_1002');">확 인</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:308px; height:8px; background:url(/assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div>
 
<!-- ///////////////////////////// 피자 수량 제한 alert  /////////////////////////////-->
<div class="notice" id="notice_limit" style="display:none; width:320px; height:144px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header" >
	    <div class="left" style="float:left; width:6px;  background:url(/assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:308px; height:40px; background:url(/assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>알림!!</h2>
	    	<!-- <a id="closex" class="close" href="#">Close</a> -->
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(/assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div class="text_body" style="width:320px; height:90px; line-height: 30px; background:#fff; border: 0px none; padding: 10px 0px;"> 
    	<p>온라인 주문은 피자 5판까지만 가능합니다. <br/>
    		장바구니를 확인하세요</p> 
    </div> 
 	<!-- //comm_list --> 
  	<div class="footer" style="position: absolute; height:30px; background:#fff; " >
		<div class="button" style=" bottom:15px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_limit');">확 인</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:308px; height:8px; background:url(/assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div>

 
<!-- ///////////////////////////// E쿠폰 조회 통신오류 alert  /////////////////////////////-->
<div class="notice" id="notice_eCopErr_NW" style="display:none; width:320px; height:144px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header" >
	    <div class="left" style="float:left; width:6px;  background:url(/assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:308px; height:40px; background:url(/assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>알림!!</h2>
	    	<!-- <a id="closex" class="close" href="#">Close</a> -->
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(/assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div class="text_body" style="width:320px; height:90px; line-height: 30px; background:#fff; border: 0px none; padding: 10px 0px;"> 
    	<p>조회 중 에러가 발생했습니다.!<br/>
    		잠시 후 다시 조회해 주십시요.</p> 
    </div> 
 	<!-- //comm_list --> 
  	<div class="footer" style="position: absolute; height:30px; background:#fff; " >
		<div class="button" style=" bottom:15px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_eCopErr_NW');">확 인</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:308px; height:8px; background:url(/assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div>




 
<!-- ///////////////////////////// E쿠폰 쿠폰번호 오류 alert  /////////////////////////////-->
<div class="notice" id="notice_eCopErr" style="display:none; width:320px; height:144px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header" >
	    <div class="left" style="float:left; width:6px;  background:url(/assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:308px; height:40px; background:url(/assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>알림!!</h2>
	    	<!-- <a id="closex" class="close" href="#">Close</a> -->
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(/assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div class="text_body" style="width:320px; height:90px; line-height: 30px; background:#fff; border: 0px none; padding: 10px 0px;"> 
    	<p>사용할 수 없는 쿠폰번호입니다.!<br/>
    		쿠폰번호를 확인후 다시 입력하여 주십시요.</p> 
    </div> 
 	<!-- //comm_list --> 
  	<div class="footer" style="position: absolute; height:30px; background:#fff; " >
		<div class="button" style=" bottom:15px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_eCopErr');">확 인</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:308px; height:8px; background:url(/assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div>

<!-- ///////////////////////////// E쿠폰 쿠폰번호 사용 alert  /////////////////////////////-->
<div class="notice" id="notice_eCopCart" style="display:none; width:320px; height:144px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header" >
	    <div class="left" style="float:left; width:6px;  background:url(/assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:308px; height:40px; background:url(/assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>알림!!</h2>
	    	<!-- <a id="closex" class="close" href="#">Close</a> -->
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(/assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div class="text_body" style="width:320px; height:90px; line-height: 30px; background:#fff; border: 0px none; padding: 10px 0px;"> 
    	<p>조회하신 쿠폰 상품은 이미 장바구니에 등록되어 있습니다.<br/>
    		쿠폰 1장당 1회만 사용 가능합니다.</p> 
    </div> 
 	<!-- //comm_list --> 
  	<div class="footer" style="position: absolute; height:30px; background:#fff; " >
		<div class="button" style=" bottom:15px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_eCopCart');">확 인</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:308px; height:8px; background:url(/assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div> 
 
<!-- ///////////////////////////// E쿠폰 쿠폰번호 사용 alert  /////////////////////////////-->
<div class="notice" id="notice_eCopUse" style="display:none; width:320px; height:144px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header" >
	    <div class="left" style="float:left; width:6px;  background:url(/assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:308px; height:40px; background:url(/assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>알림!!</h2>
	    	<!-- <a id="closex" class="close" href="#">Close</a> -->
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(/assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div class="text_body" style="width:320px; height:90px; line-height: 30px; background:#fff; border: 0px none; padding: 10px 0px;"> 
    	<p>입력하신 번호는 이미 사용된 쿠폰번호입니다.!<br/>
    		쿠폰번호를 확인후 다시 입력하여 주십시오.</p> 
    </div> 
 	<!-- //comm_list --> 
  	<div class="footer" style="position: absolute; height:30px; background:#fff; " >
		<div class="button" style=" bottom:15px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_eCopUse');">확 인</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:308px; height:8px; background:url(/assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div> 
<!-- ///////////////////////////// 알림 팝업  /////////////////////////////-->

<!-- ///////////////////////////// E쿠폰 쿠폰번호 사용 alert  /////////////////////////////-->
<div class="notice" id="notice_eDate" style="display:none; width:320px; height:144px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header" >
	    <div class="left" style="float:left; width:6px;  background:url(/assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:308px; height:40px; background:url(/assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>알림!!</h2>
	    	<!-- <a id="closex" class="close" href="#">Close</a> -->
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(/assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div class="text_body" style="width:320px; height:90px; line-height: 30px; background:#fff; border: 0px none; padding: 10px 0px;"> 
    	<p>해당 쿠폰번호는 사용기간이 만료되었습니다.<br/>
    	   유효기간을 확인하여 주십시오.</p> 
    </div> 
 	<!-- //comm_list --> 
  	<div class="footer" style="position: absolute; height:30px; background:#fff; " >
		<div class="button" style=" bottom:15px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_eDate');">확 인</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:308px; height:8px; background:url(/assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div> 
<!-- ///////////////////////////// 알림 팝업  /////////////////////////////-->

<!-- ///////////  20131108 토핑화면 알럿 팝업 추가!!  //////////// -->
<div class="notice" id="notice_topping" style="display:none; width:340px; height:auto; min-height:140px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header">
	    <div class="left" style="float:left; width:6px;  background:url(/assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:328px; height:40px; background:url(/assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>알림!!</h2> 
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(/assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div id="alertText" class="text_body" style="width:340px; height:auto; min-height:90px; line-height: 30px; background:#fff; border: 0px none; padding:8px 0px;"> 
    </div> 
  	<!-- //comm_list --> 
  	<div class="footer" style="position: absolute; height:32px; background:#fff; " >
		<div class="button" style="bottom:20px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_topping');">확 인</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:328px; height:8px; background:url(/assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div> 

<!-- ///////////////////////////// 주소 삭제 확인 alert  /////////////////////////////-->
<div class="notice" id="notice_del_addr" style="display:none; width:320px; height:144px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header" >
	    <div class="left" style="float:left; width:6px;  background:url(/assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:308px; height:40px; background:url(/assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>알림!!</h2>
	    	<!-- <a id="closex" class="close" href="#">Close</a> -->
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(/assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div class="text_body" style="width:320px; height:90px; line-height: 30px; background:#fff; border: 0px none; padding: 10px 0px;"> 
    	<p>정말 삭제하시겠습니까?<br/>
    		 '예'를 선택하시면 선택하신 주소가 영구 삭제됩니다.</p> 
    </div> 
 	<!-- //comm_list --> 
  	<div class="footer" style="position: absolute; height:30px; background:#fff; " >
		<div class="button" style=" bottom:15px;">
			<input id="del_loginId"    type="hidden" name="del_loginId"    value="1">
			<input id="del_addressID"  type="hidden" name="del_addressID"  value="999">
			<input id="del_addrDetail" type="hidden" name="del_addrDetail" value="">
			<input id="del_addrListId" type="hidden" name="del_addrListId" value="0">
			<button class="alertBtn red" type="button" onclick="delete_addr($(this));">예</button>
			<button class="alertBtn gray" type="button" onclick="del_pop2('#notice_del_addr');">아니오</button>
		</div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:308px; height:8px; background:url(/assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
  	
</div>

<script type="text/javascript">	   
/*  /////////////////////////////////// 피자메뉴부분 Navi ///////////////////////////////////////////////////////// */
	
	var $pizz_menu = $(".pizza_list li a");
	var linkURL    = new Array();
	var overURL    = new Array();
	var onURL      = new Array();
	var $actv_menu = "";
	
	$pizz_menu.each(function(i,el)
	{
		// 처음들어올때 활성화 되어있는 메뉴 active함수의 멤버변수로 보내줌
		active($pizz_menu.eq("${param.pizzaSelIdx}"));//피자 도우선택 구분값
		// 메뉴별 이미지(link,on,over이미지) 배열 만들어 저장
		linkURL[i] = "../assets/img/order/ordMenu_pizza"+(i+1)+".gif";
		overURL[i] = "../assets/img/order/ordMenu_pizza"+(i+1)+"_over.gif";
		onURL[i]   = "../assets/img/order/ordMenu_pizza"+(i+1)+"_on.gif";
	
		$(this).css("background","url("+linkURL[i]+") no-repeat"); 

		if( $(this).hasClass("active") )
		{
			$(this).css("background","url("+onURL[i]+") no-repeat");
		}
		
		// 이벤트 선언
		$(this).bind("mouseenter",overMenu);
		$(this).bind("mouseleave",outMenu);
		$(this).bind("click",onMenu);
	});

	// 피자메뉴 오버했을때 : 활성화된 메뉴를 제외한 나머지 메뉴에 오버이지로 교체
	function overMenu()
	{
		var num=$(this).parent().index();
		
		if( !$(this).hasClass("active") )
		{
			$(this).css("background","url("+overURL[num]+") no-repeat");
		}
	}
	
	// 피자메뉴 아웃했을때 : 활성화된 메뉴를 제외한 나머지 메뉴에 아웃이지로 교체
	function outMenu()
	{
		var num=$(this).parent().index();
		
		if( !$(this).hasClass("active") )
		{
			$(this).css("background","url("+linkURL[num]+") no-repeat");
		}
	}
	
	// 피자메뉴 클릭했을때 : 이전활성화되어있던 메뉴의 클래스(active)를없애주고 링크이미지로 교체 후 현재메뉴를 active함수를 호출시켜 활성화 시킴
	function onMenu()
	{
		active($(this));
	}
	
	// 현재 클릭한 메뉴 활성화 함수
	function active($el)
	{
 		var num=$el.parent().index();
		$el.addClass("active"); 
		$actv_menu$ =$el;
	}
</script> 
