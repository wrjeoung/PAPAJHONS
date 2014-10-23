/**********************************************************************
 * 장바구니 관련 스크립트 모음
 **********************************************************************/

///////////* 옵션박스 늘어날때 컨텐츠 height보다 커지면 컨텐츠 height 설정 *///////////
	var $contents  = $("#contents");
	var s_con_size = $contents.height();
	contents_resize(); 

	//
	function contents_resize()
	{
	
		var $contents = $("#contents");
		var $ord_area = $("#ord_area");
		var $ord_opt  = $("#ord_opt_area");
		var con_size  = $("#contents .cont").height()+115; 

		if( $ord_opt.css("display") != "none")
		{
			if( $ord_area.height() > $ord_opt.height() )
			{
				biger_height = $ord_area.height();
			} 
			else 
			{
				biger_height=$ord_opt.height();
			}
		
			if( con_size < biger_height )
			{
				$contents.css("height",biger_height); 
			}
			else
			{ 
				if( s_con_size < con_size )
				{
					$contents.css("height",con_size);
				}
				else
				{
					$contents.css("height",s_con_size);
				}
			}
		}
		else
		{ 
			if( $ord_area.height() > s_con_size )
			{
				$contents.css("height",$ord_area.height());
			}
			else
			{
				$contents.css("height",s_con_size);
			}
		
			if( $ord_area.height() > con_size )
			{
				$contents.css("height",$ord_area.height());
			}
			else
			{
				$contents.css("height",con_size);
			}
		} 
	
		if( con_size < $ord_opt.height() )
		{
			var opt_height2=$ord_opt.height();
			$contents.css("height",opt_height2);
		}
	
	}


	///////////////////////////// 카트에 담기는 상품 인덱스 달아주기///////////////////////
	function setCartIndex()
	{
	
		var compIndex = "";
		var lastIndex = "";
		var nextIndex = 0;
		
		if( $("#ord_list > li").size() == 0 )
		{
			lastIndex = "0";
		}
		else
		{
			$("#ord_list > li").each(function(i,e)
			{
				compIndex = $(this).attr("id").split("_")[2];
				
				if( i == 0 ) { lastIndex = compIndex; }
				
				if( parseInt(compIndex) > parseInt(lastIndex) ) { lastIndex = compIndex; }
			});
		}
		
		nextIndex = parseInt(lastIndex) + 1;
	
		return nextIndex;
	
	}


	//////////////////////////////사이드 배너 설정/////////////////////////////////////
	var $bannerBox   = $("#side_banner");
	var $banner_menu = $("#banner_content") ;
	var $addCartBtn  = $("#banner_btn");

	//배너 플레이 설정
	var BANNER_HEIGHT  = 180;   // 배너 하나 크기
	var SHOW_DURATION  = 500;   // 넘김순서
	var AUTO_PLAY_TIME = 2500;  // 자동넘김 시간 설정
	var autoTImerID;

	var nBannerLength       = 0;  // 배너이미지 갯수. 
	var nCurrentBannerIndex = 0;  // 현재 화면에 보이고 있는 이미지 인덱스

	nBannerLength = $banner_menu.children("img").length;		
	$banner_menu.height(BANNER_HEIGHT*nBannerLength);

	startAutoPlay(); 

	//
	function showNextMenu()
	{
	
		var nIndex = this.nCurrentBannerIndex+1;
		if( nIndex >= nBannerLength) { nIndex = 0; }
	
		// n번째 배너 보이기.		
		this.showBannerAt(nIndex);
	
		//20130813 배너메뉴 텍스트 추가
		var id = $banner_menu.children("img").eq(nIndex).attr("id");
		$("#ban_name").text($("#"+id).attr("alt"));
	}


	//nIndex번째 배너 보이기.
	function showBannerAt(nIndex)
	{
	
		var nPosition = -BANNER_HEIGHT*nIndex;  // n번째 배너 위치값 구하기.
	
		// 슬라이드 넘기기
		$banner_menu.stop();
		$banner_menu.animate({top:nPosition},SHOW_DURATION);
	
		//현재 배너 인덱스 업데이트 시키기.
		this.nCurrentBannerIndex = nIndex;
	
	}


	//사이드배너 자동 실행 시작
	function startAutoPlay()
	{
	
		if( this.autoTimerID != 0 ) { clearInterval(this.autoTimerID); }
	
		this.autoTimerID = setInterval(function() { showNextMenu(); },this.AUTO_PLAY_TIME);
	
	} 


	//사이드 배너 자동실행 멈춤.
	function stopAutoPlay()
	{
	
		if( this.autoTimerID != 0 ) { clearInterval(this.autoTimerID); }
	
		this.autoTimerID = 0;
	
	}


	//배너슬라이더에 마우스 올린경우
	$bannerBox.bind("mouseenter",function() { stopAutoPlay(); });
	//배너슬라이더에서 마우스 빠진경우
	$bannerBox.bind("mouseleave",function() { startAutoPlay(); });


	//배너에서 장바구니담기 버튼 클릭!!
	$addCartBtn.bind("click",function()
	{
    	var cartIndex = setCartIndex();  // 장바구니 순번
		var getData   = $banner_menu.children("#bnMenuInfo").eq(nCurrentBannerIndex).attr("value");
		
		var cartAction         = "addMenu";                                // 장바구니처리
		var cartMenuType       = "";                                       // 메뉴타입
		var cartMenuCode       = getData.split(",")[0] + "_" + cartIndex;  // 메뉴코드
		var cartMenuName       = getData.split(",")[1];                    // 메뉴명
		var cartMenuOrdCode    = "10";                                     // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
		var cartMenuDivCode    = getData.split(",")[2];                    // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
		var cartMenuLagCode    = getData.split(",")[3];                    // 메뉴대분류코드
		var cartMenuMidCode    = getData.split(",")[4];                    // 메뉴중분류코드
		var cartMenuSmlCode    = getData.split(",")[5];                    // 메뉴소분류코드
		var cartMenuSubCode    = getData.split(",")[6];                    // 메뉴세분류코드
		var cartMenuPrice      = getData.split(",")[7];                    // 메뉴주문단가
		var cartMenuQty        = "1";                                      // 메뉴주문수량
		var cartMenuAmt        = getData.split(",")[7];                    // 메뉴주문금액
		var cartMenuDisRate    = "0";                                      // 메뉴할인율
		var cartMenuDisAmt     = "0";                                      // 메뉴할인금액
		var cartMenuCopDisAmt  = "0";                                      // 메뉴선결제쿠폰할인
		var cartMenuNetSaleAmt = getData.split(",")[7];                    // 메뉴순매출금액
		var cartMenuPayAmt     = getData.split(",")[7];                    // 메뉴결제금액
		var cartMenuBakeCode   = "";                                       // 메뉴베이크코드
		var cartMenuCutCode    = "";                                       // 메뉴컷코드
		var cartMenuCheeseCode = "";                                       // 메뉴치즈코드
		var cartMenuSauceCode  = "";                                       // 메뉴소스코드
		var cartMenuMessage    = "";                                       // 메뉴전달메세지
		var cartMenuSize       = getData.split(",")[8];                    // 메뉴사이즈
		var cartMenuDough      = getData.split(",")[9];                    // 메뉴도우종류
        var cartMenuOptions    = "";                                       // 메뉴옵션
        var cartECouponCompany = "";                                       // E쿠폰제휴사
        var cartECouponCode    = "";                                       // E쿠폰코드
        var cartECouponNumber  = "";                                       // E쿠폰번호
		
		// 메뉴대분류코드별 메뉴타입
		if( cartMenuLagCode == "10" ) { cartMenuType = "typePizza"; }
		else if( cartMenuLagCode == "20" ) { cartMenuType = "typeSide";  }
		else if( cartMenuLagCode == "30" ) { cartMenuType = "typeSauce"; }
		else if( cartMenuLagCode == "40" ) { cartMenuType = "typeBever"; }
		else if( cartMenuLagCode == "50" ) { cartMenuType = "typeSet";   }
	
		var cartSendDataInfo = {
    			                cartAction         : cartAction          // 장바구니처리
				               ,cartMenuType       : cartMenuType        // 메뉴타입
				               ,cartMenuCode       : cartMenuCode        // 메뉴코드
				               ,cartMenuName       : cartMenuName        // 메뉴명
				               ,cartMenuOrdCode    : cartMenuOrdCode     // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
				               ,cartMenuDivCode    : cartMenuDivCode     // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
				               ,cartMenuLagCode    : cartMenuLagCode     // 메뉴대분류코드
				               ,cartMenuMidCode    : cartMenuMidCode     // 메뉴중분류코드
				               ,cartMenuSmlCode    : cartMenuSmlCode     // 메뉴소분류코드
				               ,cartMenuSubCode    : cartMenuSubCode     // 메뉴세분류코드
				               ,cartMenuPrice      : cartMenuPrice       // 메뉴주문단가
				               ,cartMenuQty        : cartMenuQty         // 메뉴주문수량
				               ,cartMenuAmt        : cartMenuAmt         // 메뉴주문금액
				               ,cartMenuDisRate    : cartMenuDisRate     // 메뉴할인율
				               ,cartMenuDisAmt     : cartMenuDisAmt      // 메뉴할인금액
				               ,cartMenuCopDisAmt  : cartMenuCopDisAmt   // 메뉴선결제쿠폰할인
				               ,cartMenuNetSaleAmt : cartMenuNetSaleAmt  // 메뉴순매출금액
				               ,cartMenuPayAmt     : cartMenuPayAmt      // 메뉴결제금액
				               ,cartMenuBakeCode   : cartMenuBakeCode    // 메뉴베이크코드
				               ,cartMenuCutCode    : cartMenuCutCode     // 메뉴컷코드
				               ,cartMenuCheeseCode : cartMenuCheeseCode  // 메뉴치즈코드
				               ,cartMenuSauceCode  : cartMenuSauceCode   // 메뉴소스코드
				               ,cartMenuMessage    : cartMenuMessage     // 메뉴전달메세지
				               ,cartMenuSize       : cartMenuSize        // 메뉴사이즈
				               ,cartMenuDough      : cartMenuDough       // 메뉴도우종류
    			               ,cartMenuOption     : cartMenuOptions     // 메뉴옵션
							   ,cartECouponCompany : cartECouponCompany  // E쿠폰제휴사
							   ,cartECouponCode    : cartECouponCode     // E쿠폰코드
							   ,cartECouponNumber  : cartECouponNumber   // E쿠폰번호
   		                       }; 
	
		//세션에 추가할 타입과 데이터 만들기
		fnSaveForCart(cartSendDataInfo);

	});


	//배너 image not found 처리 
	//$this : ".m_list>img"  
	function fnNoImages($this)
	{
		
		event.srcElement.src = root+"/assets/img/banner_img/bn_noImg.png"; 
	
		$("#ban_name").css("display","block");
	}

//////////////////// 장바구니 아이템수량버튼 클릭 ////////////////////
	function fnSetCount(id , type, price, gubun)
	{  
		var $cntInput    = $("#"+ id +" input#count");
		var menuCount    = parseInt( $cntInput.attr("value") ); 
		var plusToppList = $("#"+id).find("ul.topp_p li");
		var toppTotalPrc = 0;
		
		plusToppList.each(function()
		{ 
			var eaAmount = $(this).find(".toppEaAmt").val();  // 1. 토핑개별 총액
			toppTotalPrc += parseInt(eaAmount);                // 2. 메뉴 1개당 토핑 적용금액
		}); 
   
		//수량이 1개일때 gubun이 마이너스이면 리스트에서 아이템 삭제
		if( gubun == "minus" && menuCount == 1 )
		{
			alert("이 메뉴를 장바구니에서 삭제합니다");
			//장바구니 1개 아이템 삭제 함수 호출
			fnRemoveBasket(id, type, price); 
		}
		else
		{
			//
			if( gubun == "minus" && menuCount > 1 )
			{
				menuCount--;
				$cntInput.attr("value", menuCount);
				
				price = (0 - parseInt(price.replace(",", ""))).toString();
				toppTotalPrc = 0 - toppTotalPrc;
				setTotalPrc(toppTotalPrc, 1); 
				calculate();
			}
			// 수량제한
			else if( gubun == "plus" )
			{  
				if( type == "typePizza" || type == "typeSet" || type == "typeHalf" || type == "typePromotion" )
				{ 
					$.post(root+"/order/newCart.jsp?cartAction=getPizzaCount", function(count)
					{
						var pizzaCnt = trim(count) ;
						if( (parseInt(pizzaCnt) + 1) <= 5 )
						{
							menuCount++;
							$cntInput.attr("value", menuCount);
							setTotalPrc(toppTotalPrc, 1); 
							calculate();
						}
						else
						{
							$('#viewLoading').fadeOut();
							popAlert("#notice_limit");
							$("#notice_limit").find(".alertBtn").focus();
							
						} 
					});
				}
				//피자가 아닌경우
				else
				{ 
					menuCount++;
					$cntInput.attr("value", menuCount);
					setTotalPrc(toppTotalPrc, 1); 
					calculate();
				} 
			}
		}
		
		//수량에 따른 금액 계산
		function calculate()
		{
			fnCheckCount(id, type, menuCount);
			setTotalPrc(price.replace(",", ""), 1);
			
			//20140620 프로모션 메뉴 수량 변경 화면 표시  : 수량이 변경 된 후 하려면 계산 후
			if(type == "typePromotion")
			{
				//적용메뉴와 할인메뉴가 적용된 쿠폰 코드로 묶음 찾기 
				var followMenuCode = $("#"+ id +" input#promCoupon").val();
				//alert("followMenuCode ["+followMenuCode+"]");
				$("#"+ id).parent().find("li.prom_menu").each(function(i){
					//alert( $(this).attr("class") );
					if( $(this).hasClass(followMenuCode) )
					{
						$(this).find(".count span").text($cntInput.val());
						var dcPrice = $(this).find("span .dcPrice").text();
						dcPrice = dcPrice.replace(/,/gi, "").replace("원","");
						
						//alert("dcPrice > "+dcPrice);
						if(gubun == "minus")
						{
							dcPrice = 0 - dcPrice;
							
						}
						
						setTotalPrc( dcPrice , 1);
					}
				});
			}
			
		}
		
	}
	
	
	//////////////////////////////// 장바구니에 보낼 메뉴 세션에 저장  ////////////////////////////// 
	//세션에 추가할 타입과 데이터 만들기 함수
	function fnSaveForCart(cartSendDataInfo)
	{
		var menuFound = false;  // 메뉴 중복 여부
		
		//1. 메뉴 타입 = 피자
		if( cartSendDataInfo.cartMenuType == "typePizza" )
		{  
			//세션으로 보내기
			saveSession(cartSendDataInfo);
			menuFound = true;
		}
		//2. 메뉴타입 =  프로모션 (피자, 사이드, 음료, 소스 등 단품 메뉴 모두 가능)
		else if( cartSendDataInfo.cartMenuType == "typePromotion" )
		{  
			//세션으로 보내기
			saveSession(cartSendDataInfo);
			menuFound = true;
		}
		//3. 메뉴 타입 != 피자, 프로모션 메뉴 제외한 다른 메뉴들
		else
		{ 	 
			var $list    = $("#ord_list"); 
			var id       = "";  //  
			var menuCode = "";  // 
			
			//1-1. 장바구니가 비어있지 않은 경우
			if( $list.size() != 0 )
			{   
				$list.find("li.product").each(function()
				{ 
					id       = $(this).attr("id") ;               // 
					menuCode = $(this).attr("id").split("_")[1];  //
					var menuType = $(this).attr("id").split("_")[0];  //
					
					//alert("id ["+id+"] menuCode ["+menuCode+"]");
					
					if( menuCode == cartSendDataInfo.cartMenuCode.split("_")[0]  && menuType != "promMenu" )
					{
						var $cntInput = $("#"+ id +" input#count");  
						var cnt       = parseInt($cntInput.attr("value")) + parseInt(cartSendDataInfo.cartMenuQty); 

							//같은 상품 있으므로 수량만 갱신하기
							fnCheckCount(id, cartSendDataInfo.cartMenuType, cnt);
							//화면에 수량 변경
							$cntInput.attr("value", cnt);
							menuFound = true; 
						//금액 변경
						var setPrc = parseInt(cartSendDataInfo.cartMenuPrice) * parseInt(cartSendDataInfo.cartMenuQty);
						setTotalPrc(setPrc, 1);; 
					} 
				});  
			}
			// 1-2. 장바구니가 비어있으면 바로 추가
			else
			{ 
				//세션으로 보내기
				saveSession(cartSendDataInfo);
				menuFound = true; 
			}
		}
		
		// 메뉴 타입 != 피자 And 장바구니에 같은 상품이 없는 경우
		if( menuFound == false ) 
		{ 
			//세션으로 보내기
			saveSession(cartSendDataInfo);
		}
	  
	}
	
	
	//장바구니 수량  체크&변경
	function fnCheckCount(id, type, count)
	{ 
		
		var menuCode = id.split("_")[1] + "_" + id.split("_")[2];  
		var cartSendDataInfo = {cartAction:"replaceCount", cartMenuType:type, cartMenuCode:menuCode, cartMenuQty:count};
	
		//세션으로 보내기 : count replace
		saveSession(cartSendDataInfo);
	}

	
	/////////////////////////// sendData를 세션으로 보내기 ///////////////////////
	function saveSession(cartSendDataInfo)
	{
	
		$.ajax(
		{
			url        : root+"/order/newCart.jsp",
			type       : "POST",
			data       : cartSendDataInfo,
			dataType   : "html",
			beforeSend : function() 
			{              
				//통신을 시작할때 처리             
				$('#viewLoading').show().fadeIn(500);          
			},
			complete   : function() 
			{             
				//통신이 완료된 후 처리              
				$('#viewLoading').fadeOut();         
			},
			success    : function(data)
			{
				if( trim(data) == "true" )
				{
					//세션에 저장 후 화면에 쓰기
					fnSetCartList(cartSendDataInfo);
//					alert("장바구니 저장 완료!!");
				}
				else
				{
					//alert("장바구니 저장 실패!!");
				}
			}
		});
		
	}


	//////////////////////////////세션에 저장 후 화면에 쓰기 ////////////////////////////////
	function fnSetCartList(cartSendDataInfo)
	{
	
		// 1. cartAction "addMenu"인 경우
		if( cartSendDataInfo.cartAction == "addMenu" )
		{
			var id       = "";                                        // 메뉴코드
			var name     = cartSendDataInfo.cartMenuName;             // 메뉴명
			var size     = cartSendDataInfo.cartMenuSize;             // 메뉴사이즈
			var price    = setComma(cartSendDataInfo.cartMenuPrice);  // 메뉴주문단가
			var doughNm  = cartSendDataInfo.cartMenuDough;            // 메뉴도우종류
			var count    = cartSendDataInfo.cartMenuQty;              // 메뉴주문수량
			var mainType = cartSendDataInfo.cartMenuType;             // 메뉴타입
			var menuOpt  = cartSendDataInfo.cartMenuOption;           // 메뉴옵션

			if( mainType == "typeSide" )       { id = "sideMenu_"  + cartSendDataInfo.cartMenuCode; }
			else if( mainType == "typeBever" ) { id = "etcMenu_"   + cartSendDataInfo.cartMenuCode; }
			else if( mainType == "typeSauce" ) { id = "sauceMenu_" + cartSendDataInfo.cartMenuCode; }
			//20140619 프로모션 메뉴 구분
			else if( mainType == "typePromotion" ) { id = "promMenu_" + cartSendDataInfo.cartMenuCode; }
			else                               { id = "pizzaMenu_" + cartSendDataInfo.cartMenuCode; } 
			

//			console.log(cartSendDataInfo);
			document.frmOrder.cartMenuLagCode.value = cartSendDataInfo.cartMenuLagCode;		//메뉴대분류
			document.frmOrder.cartMenuMidCode.value = cartSendDataInfo.cartMenuMidCode;		//메뉴중분류
			document.frmOrder.cartMenuSubCode.value = cartSendDataInfo.cartMenuSubCode;		//메뉴세분류
			document.frmOrder.cartMenuSmlCode.value = cartSendDataInfo.cartMenuSmlCode;		//메뉴소분류
			
//			console.log(" script 491 line : " , menuOpt);
			
			//화면에 메뉴 추가
			if( mainType == "typeSet" )
			{
				//스트링 데이터를 제이슨 오브젝트형식으로 변환
				var jData = $.parseJSON(cartSendDataInfo.cartSetMenuInfo);
				id = "setMenu_" + jData.cartMenuCode ;
				fnCartAppend_set(id, jData.cartMenuName, jData.cartMenuSize, "", jData.cartMenuPrice, "typeSet", jData.cartMenuQty, jData.cartSetMenuDetail);
				
//				if( jData.cartMenuSize == "E" )
//				{
//					if( jData.cartECouponCompany == "99" )
//					{
//						fnCartAppend_set(id, jData.cartMenuName.split(")")[1], jData.cartMenuSize, "", jData.cartMenuNetSaleAmt, "typeSet", jData.cartMenuQty, jData.cartSetMenuDetail);	
//					}
//					else
//					{
//						fnCartAppend_set(id, "E-쿠폰메뉴", jData.cartMenuSize, "", jData.cartMenuNetSaleAmt, "typeSet", jData.cartMenuQty, jData.cartSetMenuDetail);	
//					}
//				}
//				else
//				{
//					fnCartAppend_set(id, jData.cartMenuName, jData.cartMenuSize, "", jData.cartMenuPrice, "typeSet", jData.cartMenuQty, jData.cartSetMenuDetail);	
//				}
			} 
			else if( mainType == "typeHalf" )
			{
//				console.log(" script 516 line : " , cartSendDataInfo);
				
				var jData = $.parseJSON(cartSendDataInfo.cartSetMenuInfo);
				id = "halfMenu_" + jData.cartMenuCode;
				var cartIdx = jData.cartMenuCode.split("_")[1];
				fnCartAppend_half(id
						         ,jData.cartMenuSize
						         ,jData.cartMenuDough
						         ,jData.cartMenuPrice
						         ,"typeHalf"
						         ,jData.cartMenuQty
						         ,jData.cartSetMenuDetail[0].setMenuName
						         ,jData.cartSetMenuDetail[1].setMenuName
						         ,jData.cartSetMenuDetail[0].setMenuCode+"_"+cartIdx
						         ,jData.cartSetMenuDetail[1].setMenuCode+"_"+cartIdx
						         ,jData.cartMenuOption
						         );
			}
			else if( mainType == "typeECoupon" )
			{
				//스트링 데이터를 제이슨 오브젝트형식으로 변환
				var jData = $.parseJSON(cartSendDataInfo.cartSetMenuInfo);
				id = "setMenu_" + jData.cartMenuCode ;
//				if( jData.cartMenuSize == "E" )
//				{
					if( jData.cartECouponCompany == "99" )
					{
						
						var vMenuName = jData.cartMenuName;
						
						if(vMenuName.indexOf(")") < 0)
						{
							fnCartAppend_set(id, vMenuName, jData.cartMenuSize, "", jData.cartMenuNetSaleAmt, "typeSet", jData.cartMenuQty, jData.cartSetMenuDetail);	
						}
						else
						{
							fnCartAppend_set(id,vMenuName.split(")")[1], jData.cartMenuSize, "", jData.cartMenuNetSaleAmt, "typeSet", jData.cartMenuQty, jData.cartSetMenuDetail);
						}
					}
					else
					{
						fnCartAppend_set(id, "E-쿠폰 메뉴", jData.cartMenuSize, "", jData.cartMenuNetSaleAmt, "typeSet", jData.cartMenuQty, jData.cartSetMenuDetail);	
					}
			}
			//20140619 프로모션 메뉴 장바구니 구분
			else if(mainType == "typePromotion")
			{
//				console.log(" cart.js 593 line : " , cartSendDataInfo);

				//20140620 장바구니 표시용 파라미터 추가
				var menuLagCode = cartSendDataInfo.cartMenuLagCode;       // 메뉴대분류
				var menuMidCode = cartSendDataInfo.cartMenuMidCode;		// 메뉴중분류(피자구분용)
				var menuPos  = cartSendDataInfo.cartECouponNumber;          // 적용메뉴, 할인메뉴 구분용
				var promCoupon  = cartSendDataInfo.cartECouponCode;			// 해당 쿠폰 코드
				var menuDiscountPrice = cartSendDataInfo.cartMenuDisAmt;   // 메뉴할인금액

				fnCartAppend_promotion(menuLagCode, menuMidCode, menuPos, id, name, size, doughNm ,price, mainType, count, menuOpt,promCoupon, menuDiscountPrice);
			}
			else
			{
					fnCartAppend(id, name, size, doughNm ,price, mainType, count, menuOpt);
			}
		}
		// 2. cartAction "cartReset"인 경우
		else if( cartSendDataInfo.cartAction == "cartReset" )
		{
			fnClearAll();
		}
	
	}
	
	
	/************************************************20130529 페이지 옮김************************************************/
	///* 장바구니 화면에 추가 *///
	function fnCartAppend(id, name, size, doughNm , price, type, count, menuOpt)
	{ 
		if( price == null || price == "" ) { price = "0"; }
		var $list    = $("#ord_list");
		var add_list = '';

		//typePizza이면 토핑 버튼 , 사이드메뉴 또는 음료메뉴인 경우는 수량 변경 추가!!
		if( type == "typePizza" )
		{
			add_list += '<li class="pizza_menu product" id="' + id + '">';
			//20140203 토핑버튼 포커스이미지 추가
			add_list += '<div  class="focusImg" style="border:1px solid #fff; width:140px; height:54px; margin-top:-56px; position:relative; top:54px; left:0; background:url('+root+'/assets/img/order/btn_topping_focus_bg2.png) no-repeat left top; display:none"></div>';
			
			add_list += '<p class="name"><span class="name">'+ name +'</span>';
//			add_list += '<span class="topp"><a onclick="fnTopping($(this), \''+type+'\');" class="btn_topp_p">';
			if(size !="BOX")
			{
				add_list += '<span class="topp"><a onmouseover="fnShowFocus($(this))" onmouseout="fnHideFocus($(this))" onclick="fnTopping($(this), \''+type+'\');" class="btn_topp_p">';
				add_list += '<img src="'+root+'/assets/img/order/btn_topping_p.png" alt="토핑추가" /></a></span>';
			}
			add_list += '</p>'; 

		}
		else if( type == "typeBever" || type == "typeSide" || type == "typeSauce" )
		{
			var classNm = "etc_menu";
			if( type == "typeSauce" ) { classNm = "sauce_menu"; }
			else if( type == "typeSide" ) { classNm = "side_menu"; }
		
			add_list += '<li class="'+ classNm +' product" id="' + id + '">';
			add_list += '<p class="name"><span class="name">'+ name +'</span>';
			add_list += '<span class="count">'; 
			add_list += '<span class= "minusBtn"><a href="javascript:fnSetCount(\'' +id +'\',  \''+type+'\', \''+price+'\', \'minus\');">';
			add_list += '<img src="'+root+'/assets/img/order/btn_minus.png" alt="빼기" ></a></span>';
			add_list += '<input type="text" id="count" name="count" class="item_count" value="'+ count +'" disabled/>';
			add_list += '<span class= "plusBtn"><a href="javascript:fnSetCount(\'' +id +'\',  \''+type+'\', \''+price+'\', \'plus\');">';
			add_list += '<img src="'+root+'/assets/img/order/btn_plus.png" alt="더하기" /></a></span>';
			add_list += '</span></p>';  
		}
		else
		{
			add_list += '<p class="name"><span class="name">'+ name +'</span></p>';
		}
		
		add_list += '<p class="opt"><span class="pric">('+ size +')'+doughNm+' '+ price + '원</span>'; 
		add_list += '<span class="count '+type+'">';
		
		if( type == "typePizza" )
		{
			add_list += '<span class= "minusBtn"><a href="javascript:fnSetCount(\'' +id +'\',  \''+type+'\', \''+price+'\', \'minus\');">';
			add_list += '<img src="'+root+'/assets/img/order/btn_minus.png" alt="빼기" ></a></span>';
			add_list += '<input type="text" id="count" name="count" class="item_count" value="'+ count +'" disabled/>';
			add_list += '<span class= "plusBtn"><a href="javascript:fnSetCount(\'' +id +'\',  \''+type+'\', \''+price+'\', \'plus\');">';
			add_list += '<img src="'+root+'/assets/img/order/btn_plus.png" alt="더하기" /></a></span>';
		}
		
		add_list += '<a href="javascript:fnRemoveBasket(\'' +id +'\', \''+type+'\', \''+price+'\');" class="btn_menu_del">';
		add_list += '<img src="'+root+'/assets/img/order/btn_item_del.png" alt="삭제" /></a> </span></p>';

		//20131028 menuOption 값 추가(소스, 치즈, 베이크, 컷)
		var sauce  = menuOpt.split("/")[0];
		var cheese = menuOpt.split("/")[1];
		var bake   = menuOpt.split("/")[2];
		var cut    = menuOpt.split("/")[3]; 
		
		var optionSauce  = fnSwitch("sauce",  sauce);
		var optionCheese = fnSwitch("cheese", cheese);
		var optionBake   = fnSwitch("bake",   bake);
		var optionCut    = fnSwitch("cut",    cut);
		
		
		// 20140428 파파플래터 옵션 없음
		if( type == "typePizza"  && size !="BOX")	// && menuSmlCode == "3023"
		{
			add_list += '<p class="spc_instruction"><span>:: </span>'+ optionSauce + "," + optionCheese + "," + optionBake + "," + optionCut +'</p>';
		}
		
		add_list += '</li>'; 
	
		$list.append(add_list);
 
		price = ( parseInt(price.replace(",", "")) * parseInt(count) ).toString();
		setTotalPrc(price, 1);
		
		//20140305 마가리타와 수퍼파파스만 토핑슬라이드 자동으로 열기
		fnAutoToppOpen(id, count, type);	//(id, name, size, doughNm , price, type, count, menuOpt)
	}

	//20140305 마가리타와 수퍼파파스만 토핑슬라이드 자동으로 열기
	function fnAutoToppOpen(id, count, type){
//		console.log("fnAutoToppOpen >>> 중분류코드 : " , document.frmOrder.cartMenuMidCode.value);
//		console.log("fnAutoToppOpen >>> 중분류이름 : " , document.frmOrder.cartMenuName.value);
		var menuMidCode = document.frmOrder.cartMenuMidCode.value;
		var menuSmlCode = document.frmOrder.cartMenuSmlCode.value;
		
		//20140428 플래터 토핑오픈 제외
		if(type == "typePizza" && menuSmlCode !="3023")
		{
			if(menuMidCode == "1018" || menuMidCode == "1019")
			{
				var menuCode = id.replace("pizzaMenu_", "");  // 메뉴코드 
				open_topp_frm(menuCode, count, type);
			}
		}
	}
	
	function fnSwitch(optionKey, val)
	{ 
		var optionVal="기본";
		if(optionKey == "sauce"){
			switch(val)
			{
				case "" :
				{
					optionVal = "소스기본";
					break;
				}
				case "20" :
				{
					optionVal = "소스조금";
					break;
				}
				case "30" :
				{
					optionVal = "소스많이";
					break;
				}
				case "40" :
				{
					optionVal = "소스제외";
					break;
				}
			}
		}
		else if(optionKey == "cheese")
		{
			switch(val)
			{
				case "" :
				{
					optionVal = "치즈보통";
					break;
				}
				case "20" :
				{
					optionVal = "치즈조금";
					break;
				}
				case "30" :
				{
					optionVal = "치즈제외";
					break;
				}
			} 
		}
		else if(optionKey == "bake")
		{
			switch(val)
			{
				case "" :
				{
					optionVal = "기본굽기";
					break;
				}
				case "20" :
				{
					optionVal = "바싹굽기";
					break;
				}
			}
		}
		else if(optionKey == "cut")
		{
			switch(val)
			{
				case "" :
				{
					optionVal = "기본컷";
					break;
				}
				case "60" :
				{
					optionVal = "사각컷";
					break;
				}
				case "20" :
				{
					optionVal = "6조각컷";
					break;
				}
				case "30" :
				{
					optionVal = "8조각컷";
					break;
				}
				case "40" :
				{
					optionVal = "10조각컷";
					break;
				}
			}
		}
		return optionVal;
	}
	
	
	//20140619 프로모션 메뉴 화면에 쓰기
	//20140620 장바구니 표시용 파라미터 추가 - 대분류, 중분류, 적용/할인메뉴 구분자, 프로모션쿠폰코드
	/*
	 * menuDiscountPrice : 할인금액 - 메뉴금액에서 빼야 결제금액
	 * */
	function fnCartAppend_promotion(menuLagCode, menuMidCode, menuPos, id, name, size, doughNm ,price, menuType, count, menuOpt, promCoupon, menuDiscountPrice)
	{ 
		//console.log("fnCartAppend_promotion >> "); 		
		//console.log(menuLagCode, menuPos, id, name, size, doughNm ,price, menuType, count, menuOpt, promCoupon,menuDiscountPrice);
		
		var categorization = menuLagCode;		//피자(10), 사이드(20), 음료(40) 구분용 대분류코드
		var mainORsub = menuPos;		//적용메뉴,할인메뉴 구분자
		var menuDisAmt = 0;
		
		menuDisAmt = parseInt(price.replace(/,/gi, ""), 10) - parseInt(menuDiscountPrice, 10); // 메뉴판매가격- 할인금액

		if( price == null || price == "" ) { price = "0"; }
		var $list    = $("#ord_list");
		var add_list = "";
 
		//1. 적용 메뉴인 경우 
		if(mainORsub == "MAIN")
		{
			//20140620 장바구니 메인메뉴 li의 hidden 인풋에 쿠폰 코드저장..
			
			// 피자 이면..
			if(categorization == "10" )
			{
				add_list += '<li class="pizza_menu product '+ promCoupon +'" id="' + id + '">';	//prom_menu
				add_list += '<input type="hidden" id="promCoupon" value="'+ promCoupon +'"/>';
				add_list += '<div class="focusImg" style="border:1px solid #fff; width:140px; height:54px; margin-top:-56px; position:relative; top:54px; left:0; background:url('+root+'/assets/img/order/btn_topping_focus_bg2.png) no-repeat left top; display:none"></div>';
				add_list += '<p class="name"><span class="name">'+ name +'</span>';
				add_list += '<span class="topp"><a onmouseover="fnShowFocus($(this))" onmouseout="fnHideFocus($(this))" onclick="fnTopping($(this), \''+menuType+'\');" class="btn_topp_p">';
				add_list += '<img src="'+root+'/assets/img/order/btn_topping_p.png" alt="토핑추가" /></a></span>';
				add_list += '</p>';
			}
			else
			{
				var classNm = "etc_menu";
				if( categorization == "20" ) { classNm = "side_menu"; }
				
				add_list += '<li class="'+ classNm +' product '+ promCoupon +'" id="' + id + '">';
				add_list += '<input type="hidden"   id="promCoupon"  value="'+ promCoupon +'"/>';
				add_list += '<p class="name"><span class="name">'+ name +'</span>';
				add_list += '<span class="count">'; 
				add_list += '<span class= "minusBtn"><a href="javascript:fnSetCount(\'' +id +'\',  \''+menuType+'\', \''+price+'\', \'minus\');">';
				add_list += '<img src="'+root+'/assets/img/order/btn_minus.png" alt="빼기" ></a></span>';
				add_list += '<input type="text" id="count" name="count" class="item_count" value="'+ count +'" disabled/>';
				add_list += '<span class= "plusBtn"><a href="javascript:fnSetCount(\'' +id +'\',  \''+menuType+'\', \''+price+'\', \'plus\');">';
				add_list += '<img src="'+root+'/assets/img/order/btn_plus.png" alt="더하기" /></a></span>';
				add_list += '</span></p>';  
			}
			
			add_list += '<p class="opt"><span class="pric">('+ size +')'+doughNm+' '+ price + '원</span>'; 
			add_list += '<span class="count '+menuType+'">';
			
			if(categorization == "10" )
			{
				add_list += '<span class= "minusBtn"><a href="javascript:fnSetCount(\'' +id +'\',  \''+menuType+'\', \''+price+'\', \'minus\');">';
				add_list += '<img src="'+root+'/assets/img/order/btn_minus.png" alt="빼기" ></a></span>';
				add_list += '<input type="text" id="count" name="count" class="item_count" value="'+ count +'" disabled/>';
				add_list += '<span class= "plusBtn"><a href="javascript:fnSetCount(\'' +id +'\',  \''+menuType+'\', \''+price+'\', \'plus\');">';
				add_list += '<img src="'+root+'/assets/img/order/btn_plus.png" alt="더하기" /></a></span>';
			}
			add_list += '<a href="javascript:fnRemoveBasket(\'' +id +'\', \''+menuType+'\', \''+price+'\');" class="btn_menu_del">';
			add_list += '<img src="'+root+'/assets/img/order/btn_item_del.png" alt="삭제" /></a> </span></p>';

			var optionSauce  = fnSwitch("sauce",  menuOpt.split("/")[0]);
			var optionCheese = fnSwitch("cheese", menuOpt.split("/")[1]);
			var optionBake   = fnSwitch("bake",   menuOpt.split("/")[2]);
			var optionCut    = fnSwitch("cut",    menuOpt.split("/")[3]);
			
			// 피자 이면..
			if(categorization == "10" )
			{
				add_list += '<p class="spc_instruction"><span>:: </span>'+ optionSauce + "," + optionCheese + "," + optionBake + "," + optionCut +'</p>';
			}
			add_list += '</li>';
			$list.append(add_list);
			
			//마가리타와 수퍼파파스 토핑슬라이드 자동
			if(menuMidCode == "1018" || menuMidCode == "1019")
			{
				var menuCode = id.replace("promMenu_", "");  // 메뉴코드 
//				open_topp_frm(menuCode, count, menuType);
			}
		}
		//2. 할인 메뉴인 경우
		else
		{	
			//피자가 아닌 경우
			if(categorization != "10" )
			{
				add_list += '<li class="prom_menu product '+ promCoupon +'" id="' + id + '">';
				add_list += '<p class="name"><span class="name">'+ name +'</span>';
				add_list += '<span class="count"><span> '+count+'</span>개</span> </p>';  
				add_list += '<p class="prom_opt"><span class="pric"><span class="standardPrc"> '+ price + '원</span> <span class="dcPrice">'+ setComma(menuDisAmt)+'원</span></span>';
/*				add_list += '<span class="info" id="prom_'+ classNm +'">할인</span>';*/
				add_list += '</p>'; 
			}
			add_list += '</li>'; 
			$list.append(add_list);
		}
 
		if(mainORsub == "MAIN") //적용메뉴
		{	
			price = ( parseInt(price.replace(",", "")) * parseInt(count) ).toString();
		}
		else //할인메뉴
		{	
			// 20140620 프로모션 할인메뉴 할인된 금액으로 주문금액 계산( 장바구니 합계)
			price = ( parseInt(menuDisAmt) * parseInt(count) ).toString();
		}
		
		setTotalPrc(price, 1);
		
	}
	
	/* 장바구니에 세트 또는 이쿠폰 메뉴 쓰기 */
	function fnCartAppend_set(id, name, size, doughNm , price, type, count, setItems)
	{
		var $list    = $("#ord_list");
		var add_list = '';
		if(size == "E")
		{
			add_list += '<li class="set_menu eCoupon_menu product" id="' + id + '">'; 
		}
		else
		{
			add_list += '<li class="set_menu product" id="' + id + '">';
		}
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
		add_list += '<ul class="set_items" >';
		
		for( var i = 0; i < setItems.length; i++ )
		{
			add_list += '<li class="item_li" id="' + setItems[i].setMenuCode + '" >';
	    	add_list += '<p><span class="menu">'+ setItems[i].setMenuName +'</span></p>';
	    	add_list += '</li>';
	    }
		
		add_list += '</ul></li>';
	
		$list.append(add_list);

		var setPrc = parseInt(price.replace(",", "")) * parseInt(count) ;
		setTotalPrc(setPrc, 1);
		contents_resize();
	}
	
	
	/* 하프메뉴 화면 장바구니 쓰기 */
	function fnCartAppend_half(id, size, dough, price, type , count , name1, name2, h1_id, h2_id,menuOpt )
	{
		var $list    = $("#ord_list");
//		console.log(" script 798 line : " , menuOpt);
		
		//20140128 menuOption 값 추가(소스, 치즈, 베이크, 컷)
		var sauce  = menuOpt.split("/")[0];
		var cheese = menuOpt.split("/")[1];
		var bake   = menuOpt.split("/")[2];
		var cut    = menuOpt.split("/")[3]; 
		
		var optionSauce  = fnSwitch("sauce",  sauce);
		var optionCheese = fnSwitch("cheese", cheese);
		var optionBake   = fnSwitch("bake",   bake);
		var optionCut    = fnSwitch("cut",    cut);

		var add_list = '';
		
		add_list += '<li class="half_menu product" id="' + id + '" >';
		add_list += '<p>하프앤하프</p>';
		add_list += '<p class="opt"> <span class="price">('+ size +') '+dough+' '+ won(price) + '</span>';
		add_list += '<span class="count '+type+'">';
		add_list += '<span class= "minusBtn"><a href="javascript:fnSetCount(\'' +id +'\',  \''+type+'\', \''+price+'\', \'minus\');">';
		add_list += '<img src="'+root+'/assets/img/order/btn_minus.png" alt="빼기" ></a></span>';
		add_list += '<input type="text" id="count" name="count" class="item_count" value="'+ count +'" />';
		add_list += '<span class= "plusBtn"><a href="javascript:fnSetCount(\'' +id +'\',  \''+type+'\', \''+price+'\', \'plus\');">';
		add_list += '<img src="'+root+'/assets/img/order/btn_plus.png" alt="더하기" /></a></span>'; 
		add_list += '<a href="javascript:fnRemoveBasket(\'' +id +'\', \''+type+'\', \''+ price+'\');">';
		add_list += '<img src="'+root+'/assets/img/order/btn_item_del.png" alt="하프삭제" /></a> </span> </p>';
		
		add_list += '<p class="spc_instruction"><span>:: </span>'+ optionSauce + "," + optionCheese + "," + optionBake + "," + optionCut +'</p>';

		add_list += '<ul class="half_ul" >';
		add_list += '<li class="cart_half1" id="pizzaMenu_' + h1_id + '" >';
		add_list += '<p><span class="pizza_menu">'+ name1 +'</span><span class="topp"><a onmouseover="fnShowFocus($(this))" onmouseout="fnHideFocus($(this))" onclick="fnTopping($(this), \''+type+'\');" class="btn_topp_p"><img src="'+root+'/assets/img/order/btn_topping_p.png" alt="토핑추가" /></a></span></p>';
		//20140203 토핑버튼 포커스이미지 추가
		add_list += '<div  class="focusImg" style="border:1px solid #fff; width:130px; height:54px;  position:relative; top:-4px; left:0;margin-top:-56px; background:url('+root+'/assets/img/order/btn_topping_focus_bg3.png) no-repeat left top; display:none"></div>';
		add_list += '</li>';
		add_list += '<li class="cart_half2" id="pizzaMenu_' + h2_id + '" >';
		add_list += '<p><span class="pizza_menu">' + name2 +'</span><span class="topp"><a onmouseover="fnShowFocus($(this))" onmouseout="fnHideFocus($(this))" onclick="fnTopping($(this), \''+type+'\');" class="btn_topp_p"><img src="'+root+'/assets/img/order/btn_topping_p.png" alt="토핑추가" /></a></span> </p>';
		//20140203 토핑버튼 포커스이미지 추가
		add_list += '<div  class="focusImg" style="border:1px solid #fff; width:130px; height:54px;  position:relative; top:-2px; left:0;margin-top:-56px; background:url('+root+'/assets/img/order/btn_topping_focus_bg3.png) no-repeat left top; display:none"></div>';
		add_list += '</li>';
		add_list += '</ul>';

		add_list += '</li>';

		$list.append(add_list);

		var setPrc = price.replace("원","");
		setTotalPrc(setPrc.replace(",", ""), 1);

		contents_resize();
	}


	/***************************************************************************************************************/
	//피자수량 체크하기!!
	//같은 메뉴 체크하기!! > 20130521 완성
	/*********************하프앤하프 & 세트&이쿠폰 장바구니 추가 *********************/
	//1개 메뉴 추가했을 때 검사
	function fnCheckStoreMenu(checkMenuCode, flag)
	{		
		var storeCode = document.frmOrder.cartOrdStoreCode.value;  // 매장코드
    	var storeName = document.frmOrder.cartOrdStoreName.value;  // 매장명
		var rtnTxt    = "";
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
						rtnTxt = "N";
						var alertFrame = $("#notice_1002");
	   					alertFrame.find("#alertText p").remove();
	   					alertFrame.find("#alertText").append("<p>선택하신 메뉴는<br>\""+ storeName +"\" 매장에서 현재 주문이 불가능합니다.</p>"); 
	   					popAlert(alertFrame);
					}
					else
					{
						rtnTxt ="Y";
					}
					$("#menuSoldOutYn").attr("value", rtnTxt);
				},
				error: function( jqXHR, textStatus, errorThrown)
				{
		        	//console.log("jqXHR.status: " + jqXHR.status + "\njqXHR.statusText: " + jqXHR.statusText + "\ntextStatus: " + textStatus + "\nerrorThrown: " + errorThrown);
		        }
			});	
		}
		
	}
	

	function fnAddSet($this, menuCode, menuDivCode, menuLagCode, menuMidCode, menuSmlCode, menuSubCode)
	{
		
		var $menu_sectionId = $this.parent().parent().attr("id");  // 메뉴구분 - 세트, 하프, E쿠폰 
		var halfMenuOptions = "";
		
		// 플래터정보
		var platArray       = ""; 
		var platMenuCode    = ""; // 메뉴코드
		var platMenuName    = ""; // 메뉴
		var platMenuSize    = ""; // 메뉴명
		var platMenuSaleAmt = ""; // 판매금액 
		var platMenuDough   = ""; // 메뉴도우종류 
		var platMenuLagCode = ""; // 메뉴대분류코드 
		var platMenuMidCode = ""; // 메뉴중분류코드
		var platMenuSmlCode = ""; // 메뉴소분류코드 
		var platMenuSubCode = ""; // 메뉴세분류코드 
		var platMenuDivCode = ""; // 메뉴구분코드
		
		// 플래터정보
		if( $menu_sectionId == "plat_section" )
		{
			platArray       = menuCode.split(",");
			platMenuCode    = platArray[0];  // 메뉴코드
			platMenuName    = platArray[1];  // 메뉴
			platMenuSize    = platArray[2];  // 메뉴사이즈 PaPa platter
			platMenuSaleAmt = platArray[3];  // 판매금액 
			platMenuDough   = platArray[4];  // 메뉴도우종류 
			platMenuLagCode = platArray[5];  // 메뉴대분류코드 
			platMenuMidCode = platArray[6];  // 메뉴중분류코드
			platMenuSmlCode = platArray[7];  // 메뉴소분류코드 
			platMenuSubCode = platArray[8];  // 메뉴세분류코드 
			platMenuDivCode = platArray[9];  // 메뉴구분코드
			
			menuCode = platMenuCode;
			
/*			console.log(
					"fnAddSet > plat 메뉴정보"              + "\n" +
					" platMenuCode    : " + platMenuCode    + "\n" +
					" platMenuName    : " + platMenuName    + "\n" +
					" platMenuSize    : " + platMenuSize    + "\n" +
					" platMenuSaleAmt : " + platMenuSaleAmt + "\n" +
					" platMenuDough   : " + platMenuDough   + "\n" +
					" platMenuLagCode : " + platMenuLagCode + "\n" +
					" platMenuMidCode : " + platMenuMidCode + "\n" +
					" platMenuSmlCode : " + platMenuSmlCode + "\n" +
					" platMenuSubCode : " + platMenuSubCode + "\n" +
					" platMenuDivCode : " + platMenuDivCode + "\n" 
			);*/
		}
		
		
	
		//매장메뉴 품절 검사
		// 1. 세트메뉴인 경우
		if( $menu_sectionId == "set_section" )
		{
			fnCheckStoreMenu(menuCode, "oneMenu");
		}
		// 2. 하프메뉴인 경우
		else if( $menu_sectionId == "half_section" ) 
		{
	     	var findMenuOptions =  $("#option_box_59999").find(".spcInstructions li");	
	     	var selMenuOptions  = [];
	     	findMenuOptions.each(function(i,e) 
 	     	{ 
	     		selMenuOptions[i] = $(this).find("input:checked").val();
	     		if( i == 0 ) { document.frmOrder.cartMenuSauceCode.value  = selMenuOptions[i]; } 
	     		if( i == 1 ) { document.frmOrder.cartMenuCheeseCode.value = selMenuOptions[i]; } 
	     		if( i == 2 ) { document.frmOrder.cartMenuBakeCode.value   = selMenuOptions[i]; } 
	     		if( i == 3 ) { document.frmOrder.cartMenuCutCode.value    = selMenuOptions[i]; }
	     	}); 
	     	halfMenuOptions = selMenuOptions.join("/");
	     	
		}
		//3. E쿠폰인 경우 : 카트에 한번 담긴 쿠폰상품 중복 막기
		else if( $menu_sectionId == "ecoup_section" )
		{
			var image      = $("#ecoup_section .right img");
			var couponName = $("#ecoup_section .right .name");
			
			//console.log("hidden 이쿠폰 번호 체크 : " , $("#eCouponNumber").val());
			 
			//20140112
			//조회한 쿠폰은  $("#eCouponNumber").val()가 있고, 장바구니 담은 후 지워줌!!
			//if( $("#coup_id").val() == "" ) :  인풋값은 조회하지 않고도 읽어올 수 있으므로 입력화면 값은 쓰지 않도록 변경
			if( $("#eCouponNumber").val() == "" ) 
			{
				var alertFrame = $("#notice_1002");
				alertFrame.find("#alertText p").remove();
				alertFrame.find("#alertText").append("<p>사용하실 쿠폰을 조회하신 후 <br>사용하실 수 있습니다!!</p>"); 
				popAlert(alertFrame);
				
				return; 
			}
	    	image.attr("src", root+"/assets/img/order/menu/eCoupon_img_none.png");
	    	couponName.text("");
	    	$("#coup_id").val("");

			fnCheckStoreMenu($("#ecopMenuCode").val(), "oneMenu");
		}
		//20140425 파파플래터 섹션 추가
		else if( $menu_sectionId == "plat_section" )
		{
			fnCheckStoreMenu(menuCode, "oneMenu");
		}
		//20131216
		//ajax 통신하는 동안 아래 함수가 실행되면 품절상황이 체크되기전 장바구니에 들어감.
		setTimeout(innerCartData2,800);
		function innerCartData2()
		{
			if( $("#menuSoldOutYn").attr("value") == "N" ) { return; }	//fnCheckStoreMenu 함수 실행 결과
			
	     	var cartSendDataInfo = null;  // 장바구니 전송 내역
	        var cartAction         = "";  // 장바구니처리
	        var cartMenuType       = "";  // 메뉴타입
	        var cartMenuCode       = "";  // 메뉴코드
	        var cartMenuName       = "";  // 메뉴명
	        var cartMenuOrdCode    = "";  // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
	        var cartMenuDivCode    = "";  // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
	        var cartMenuLagCode    = "";  // 메뉴대분류코드
	        var cartMenuMidCode    = "";  // 메뉴중분류코드
	        var cartMenuSmlCode    = "";  // 메뉴소분류코드
	        var cartMenuSubCode    = "";  // 메뉴세분류코드
	        var cartMenuPrice      = "";  // 메뉴주문단가
	        var cartMenuQty        = "";  // 메뉴주문수량
	        var cartMenuAmt        = "";  // 메뉴주문금액
	        var cartMenuDisRate    = "";  // 메뉴할인율
	        var cartMenuDisAmt     = "";  // 메뉴할인금액
	        var cartMenuCopDisAmt  = "";  // 메뉴선결제쿠폰할인
	        var cartMenuNetSaleAmt = "";  // 메뉴순매출금액
	        var cartMenuPayAmt     = "";  // 메뉴결제금액
	        var cartMenuBakeCode   = "";  // 메뉴베이크코드
	        var cartMenuCutCode    = "";  // 메뉴컷코드
	        var cartMenuCheeseCode = "";  // 메뉴치즈코드
	        var cartMenuSauceCode  = "";  // 메뉴소스코드
	        var cartMenuMessage    = "";  // 메뉴전달메세지
	        var cartMenuSize       = "";  // 메뉴사이즈
	        var cartMenuDough      = "";  // 메뉴도우종류
	        var cartMenuOption     = "";  // 메뉴 옵션
	        var cartECouponCompany = "";  // E쿠폰제휴사
	        var cartECouponCode    = "";  // E쿠폰코드
	        var cartECouponNumber  = "";  // E쿠폰번호
		
			// 1. 세트메뉴인 경우
			if( $menu_sectionId == "set_section" )
			{
		    	var cartIndex = setCartIndex();  // 장바구니 순번
				var selectBox = $("#set_"+menuCode).find(".size_prc .selcet_count");
				var menuName  = $("#set_"+menuCode).find("#setNm").text().split("(")[0];
				var menuPrice = $("#set_"+menuCode).find(".set_price").text(); 
				var menuQty   = selectBox.find("select option:selected").val();
				var menuAmt   = parseInt(menuPrice.replace(/,/gi, "")) * parseInt(menuQty);
				var menuSize  = $("#set_"+menuCode).find(".size").text().split("(")[1].substr(0,($("#set_"+menuCode).find(".size").text().length)-2);
				
	            cartAction         = "addMenu";                     // 장바구니처리
	            cartMenuType       = "typeSet";                     // 메뉴타입
	            cartMenuCode       = menuCode + "_" + cartIndex;    // 메뉴코드
	            cartMenuName       = menuName;                      // 메뉴명
	            cartMenuOrdCode    = "10";                          // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
	            cartMenuDivCode    = menuDivCode;                   // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
	            cartMenuLagCode    = menuLagCode;                   // 메뉴대분류코드
	            cartMenuMidCode    = menuMidCode;                   // 메뉴중분류코드
	            cartMenuSmlCode    = menuSmlCode;                   // 메뉴소분류코드
	            cartMenuSubCode    = menuSubCode;                   // 메뉴세분류코드
	            cartMenuPrice      = menuPrice.replace(/,/gi, "");  // 메뉴주문단가
	            cartMenuQty        = menuQty;                       // 메뉴주문수량
	            cartMenuAmt        = menuPrice.replace(/,/gi, "");  // 메뉴주문금액
	            cartMenuDisRate    = "0";                           // 메뉴할인율
	            cartMenuDisAmt     = "0";                           // 메뉴할인금액
	            cartMenuCopDisAmt  = "0";                           // 메뉴선결제쿠폰할인
	            cartMenuNetSaleAmt = menuPrice.replace(/,/gi, "");  // 메뉴순매출금액
	            cartMenuPayAmt     = menuPrice.replace(/,/gi, "");  // 메뉴결제금액
	            cartMenuSize       = menuSize;                      // 메뉴사이즈
				
				$.post(root+"/order/newCart.jsp?cartAction=getPizzaCount", function(count)
				{
					var pizzaCnt = trim(count) ;
					if( (parseInt(pizzaCnt) + parseInt(menuQty)) <= 5 )
					{ 
						var setMenus = []; 
						var setMenuCount = $("#set_"+menuCode).find(".description span .hiddenData").size();  // 세트상세 메뉴 개수
						for( var i = 0; i < setMenuCount; i++ )
						{
							var setMenuData = $("#set_"+menuCode).find(".description span .hiddenData").eq(i).text();
							setMenus.push(setMenuData);
						}
						
						var cartSetMenuDetail = [];
						for( var i = 0; i < setMenus.length; i++ )
						{
							//1.아이템 하나씩 [object] 형태 변환
							var objSetMenu = new SaveSetItems(menuCode, setMenus[i], cartIndex);
							cartSetMenuDetail.push(objSetMenu);
						}
						
						//아이템 배열과 세트코드로 보낼 데이터 만들기
						var objSetMenuInfo = new SaveSetMenu(
							                                  cartMenuType        // 메뉴타입
								                             ,cartMenuCode        // 메뉴코드
								                             ,cartMenuName        // 메뉴명
								                             ,cartMenuOrdCode     // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
								                             ,cartMenuDivCode     // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
								                             ,cartMenuLagCode     // 메뉴대분류코드
								                             ,cartMenuMidCode     // 메뉴중분류코드
								                             ,cartMenuSmlCode     // 메뉴소분류코드
								                             ,cartMenuSubCode     // 메뉴세분류코드
								                             ,cartMenuPrice       // 메뉴주문단가
								                             ,cartMenuQty         // 메뉴주문수량
								                             ,cartMenuAmt         // 메뉴주문금액
								                             ,cartMenuDisRate     // 메뉴할인율
								                             ,cartMenuDisAmt      // 메뉴할인금액
								                             ,cartMenuCopDisAmt   // 메뉴선결제쿠폰할인
								                             ,cartMenuNetSaleAmt  // 메뉴순매출금액
								                             ,cartMenuPayAmt      // 메뉴결제금액
								                             ,cartMenuBakeCode    // 메뉴베이크코드
								                             ,cartMenuCutCode     // 메뉴컷코드
								                             ,cartMenuCheeseCode  // 메뉴치즈코드
								                             ,cartMenuSauceCode   // 메뉴소스코드
								                             ,cartMenuMessage     // 메뉴전달메세지
								                             ,cartMenuSize        // 메뉴사이즈
								                             ,cartMenuDough       // 메뉴도우종류
								                             ,cartMenuOption      // 메뉴옵션
								                             ,cartECouponCompany  // E쿠폰제휴사
								                             ,cartECouponCode     // E쿠폰코드
								                             ,cartECouponNumber   // E쿠폰번호
			                                                 ,cartSetMenuDetail   // 세트메뉴상세
			                                                 )
						var jsonSetMenuInfo = JSON.stringify(objSetMenuInfo);	//json 형태로 변환 
						cartSendDataInfo = {
							                cartAction      : cartAction,      // 장바구니처리
				    			            cartMenuType    : cartMenuType,    // 메뉴타입
							                cartSetMenuInfo : jsonSetMenuInfo  // 세트메뉴
				                           }; 
						
						// 장바구니에 같은 상품이 있는지 먼저 보기
						var $list    = $("#ord_list"); 
						var id       = ""; 
						var listCode = "";  
						var match    = false;
						
						if( $list.size() > 0 )
						{   
							$list.find("li.set_menu").each(function()
							{ 
								id       = $(this).attr("id"); 
								listCode = $(this).attr("id").split("_")[1]; 
					 		
								if( listCode == menuCode )
								{
									match = true;
									//같은 상품 있으므로 수량만 갱신하기
									var $cntInput = $("#"+ id +" input#count");
									var cnt       = parseInt($cntInput.attr("value")) + parseInt(menuQty);
					 			
									fnCheckCount(id, cartMenuType, cnt);
									
									//화면에 수량, 금액 변경
									$cntInput.attr("value", cnt); 
									setTotalPrc((removePoint(menuPrice)*parseInt(menuQty)), 1); 
								}
							});
						}
						
						if( match == false) 
						{
							//세션으로 보내기
							saveSession(cartSendDataInfo);
						}
					}
					else
					{
						$('#viewLoading').fadeOut();
						popAlert("#notice_limit");
						$("#notice_limit").find(".alertBtn").focus();
						
					}
				});
			}
			// 2. 하프메뉴인 경우
			else if( $menu_sectionId == "half_section" ) 
			{
				if( $("#halfMenuCode1").val() == "" || $("#halfMenuCode2").val() == "" ) { return; }
			
				if( $("#menuSoldOutYn").attr("value") == "N" ) { return; }
				
		    	var cartIndex = setCartIndex();  // 장바구니 순번
				var menuAmt1  = $("#halfMenuAmt1").val();
				var menuAmt2  = $("#halfMenuAmt2").val();
				var menuAmt   = (parseInt(menuAmt1) + parseInt(menuAmt2)).toString(); 
				var menuSize  = $("#halfMenuSize1").val(); 
				var menuDough = $("#halfMenuDough1").val(); 
	
	            cartAction         = "addMenu";                     // 장바구니처리
	            cartMenuType       = "typeHalf";                    // 메뉴타입
	            cartMenuCode       = menuCode + "_" + cartIndex;    // 메뉴코드
	            cartMenuName       = "하프앤하프";                  // 메뉴명
	            cartMenuOrdCode    = "10";                          // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
	            cartMenuDivCode    = menuDivCode;                   // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
	            cartMenuLagCode    = menuLagCode;                   // 메뉴대분류코드
	            cartMenuMidCode    = $("#halfMenuMidCode1").val();  // 메뉴중분류코드
	            cartMenuSmlCode    = $("#halfMenuSmlCode1").val();  // 메뉴소분류코드
	            cartMenuSubCode    = $("#halfMenuSubCode1").val();  // 메뉴세분류코드
	            cartMenuPrice      = menuAmt;                       // 메뉴주문단가
	            cartMenuQty        = "1";                           // 메뉴주문수량
	            cartMenuAmt        = menuAmt;                       // 메뉴주문금액
	            cartMenuDisRate    = "0";                           // 메뉴할인율
	            cartMenuDisAmt     = "0";                           // 메뉴할인금액
	            cartMenuCopDisAmt  = "0";                           // 메뉴선결제쿠폰할인
	            cartMenuNetSaleAmt = menuAmt;                       // 메뉴순매출금액
	            cartMenuPayAmt     = menuAmt;                       // 메뉴결제금액
	            cartMenuSize       = menuSize;                      // 메뉴사이즈
	            cartMenuDough      = menuDough;                     // 메뉴도우종류
				cartMenuBakeCode  = document.frmOrder.cartMenuBakeCode.value;    // 메뉴베이크코드
				cartMenuCutCode   = document.frmOrder.cartMenuCutCode.value;    // 메뉴컷코드
				cartMenuCheeseCode = document.frmOrder.cartMenuCheeseCode.value;  // 메뉴치즈코드
				cartMenuSauceCode  = document.frmOrder.cartMenuSauceCode.value;   // 메뉴소스코드
	            cartMenuOption	=	halfMenuOptions;				//메뉴옵션 스트링
				
				$.post(root+"/order/newCart.jsp?cartAction=getPizzaCount", function(count)
				{
					var pizzaCnt = trim(count) ;
					if( (parseInt(pizzaCnt) + 1) <= 5 )
					{
						//세트구성 아이템 개수
						var cartSetMenuDetail = []; 
						var setMenuCount = 2;  // 세트상세 메뉴 개수
						for( var i = 1; i <= setMenuCount; i++ )
						{
							var setCode        = menuCode + "_" + cartIndex;
							var setSeqNumber   = i.toString();
							var setMenuCode    = $("#halfMenuCode"+i).val();
							var setMenuName    = $("#halfMenuName"+i).val();
							var setMenuDivCode = "";
							var setMenuLagCode = $("#halfMenuLagCode"+i).val();
							var setMenuMidCode = $("#halfMenuMidCode"+i).val();
							var setMenuSmlCode = $("#halfMenuSmlCode"+i).val();
							var setMenuSubCode = $("#halfMenuSubCode"+i).val();
							var setMenuPrice   = $("#halfMenuPrice"+i).val();
							var setMenuQty     = $("#halfMenuQty"+i).val();
							var setMenuAmount  = $("#halfMenuAmt"+i).val();
							var setMenuDisRate = "0";
							var setMenuDisAmt  = "0";
							var setMenuCopDis  = "0";
							var setMenuNetSale = $("#halfMenuAmt"+i).val();
							
							setMenuCode = setMenuCode + "-" + setSeqNumber;
							
							var objSetMenu = {"setCode"        :setCode
									         ,"setSeqNumber"   :setSeqNumber
									         ,"setMenuCode"    :setMenuCode
									         ,"setMenuName"    :setMenuName
									         ,"setMenuDivCode" :setMenuDivCode
									         ,"setMenuLagCode" :setMenuLagCode
									         ,"setMenuMidCode" :setMenuMidCode
									         ,"setMenuSmlCode" :setMenuSmlCode
									         ,"setMenuSubCode" :setMenuSubCode
									         ,"setMenuPrice"   :setMenuPrice
									         ,"setMenuQty"     :setMenuQty
									         ,"setMenuAmount"  :setMenuAmount
									         ,"setMenuDisRate" :setMenuDisRate
									         ,"setMenuDisAmt"  :setMenuDisAmt
									         ,"setMenuCopDis"  :setMenuCopDis
									         ,"setMenuNetSale" :setMenuNetSale
									         };
							cartSetMenuDetail.push(objSetMenu);
						}
						
						//아이템 배열과 세트코드로 보낼 데이터 만들기
						var objSetMenuInfo = new SaveSetMenu(
	                                                          cartMenuType        // 메뉴타입
	                                                         ,cartMenuCode        // 메뉴코드
	                                                         ,cartMenuName        // 메뉴명
	                                                         ,cartMenuOrdCode     // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
	                                                         ,cartMenuDivCode     // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
	                                                         ,cartMenuLagCode     // 메뉴대분류코드
	                                                         ,cartMenuMidCode     // 메뉴중분류코드
	                                                         ,cartMenuSmlCode     // 메뉴소분류코드
	                                                         ,cartMenuSubCode     // 메뉴세분류코드
	                                                         ,cartMenuPrice       // 메뉴주문단가
	                                                         ,cartMenuQty         // 메뉴주문수량
	                                                         ,cartMenuAmt         // 메뉴주문금액
	                                                         ,cartMenuDisRate     // 메뉴할인율
	                                                         ,cartMenuDisAmt      // 메뉴할인금액
								                             ,cartMenuCopDisAmt   // 메뉴선결제쿠폰할인
								                             ,cartMenuNetSaleAmt  // 메뉴순매출금액
	                                                         ,cartMenuPayAmt      // 메뉴결제금액
	                                                         ,cartMenuBakeCode    // 메뉴베이크코드
	                                                         ,cartMenuCutCode     // 메뉴컷코드
	                                                         ,cartMenuCheeseCode  // 메뉴치즈코드
	                                                         ,cartMenuSauceCode   // 메뉴소스코드
	                                                         ,cartMenuMessage     // 메뉴전달메세지
	                                                         ,cartMenuSize        // 메뉴사이즈
	                                                         ,cartMenuDough       // 메뉴도우종류
	                                                         ,cartMenuOption      // 메뉴옵션
								                             ,cartECouponCompany  // E쿠폰제휴사
								                             ,cartECouponCode     // E쿠폰코드
								                             ,cartECouponNumber   // E쿠폰번호
	                                                         ,cartSetMenuDetail   // 세트메뉴상세
	                                                         );
						var jsonSetMenuInfo = JSON.stringify(objSetMenuInfo);	//json 형태로 변환 
						cartSendDataInfo = {
										    cartAction      : cartAction,      // 장바구니처리
										    cartMenuType    : cartMenuType,    // 메뉴타입
										    cartSetMenuInfo : jsonSetMenuInfo  // 세트메뉴
										   }; 
						
						//세션으로 보내기
						saveSession(cartSendDataInfo);
					}
					else
					{
						$('#viewLoading').fadeOut();
						popAlert("#notice_limit");
						$("#notice_limit").find(".alertBtn").focus();
					}
				});
			}
			//3. e쿠폰메뉴인 경우
			else if( $menu_sectionId == "ecoup_section" )
			{
		    	var cartIndex = setCartIndex();  // 장바구니 순번
		    	
	            cartAction         = "addMenu";                                      // 장바구니처리
//	            cartMenuType       = "typeSet";                                      // 메뉴타입
	            cartMenuType       = "typeECoupon";                                  // 메뉴타입
	            cartMenuCode       = $("#ecopMenuCode"   ).val() + "_" + cartIndex;  // 메뉴코드
	            cartMenuName       = $("#ecopMenuName"   ).val();                    // 메뉴명
	            cartMenuOrdCode    = "10";                                           // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
	            cartMenuDivCode    = $("#ecopMenuDivCode").val();                    // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
	            cartMenuLagCode    = $("#ecopMenuLagCode").val();                    // 메뉴대분류코드
	            cartMenuMidCode    = $("#ecopMenuMidCode").val();                    // 메뉴중분류코드
	            cartMenuSmlCode    = $("#ecopMenuSmlCode").val();                    // 메뉴소분류코드
	            cartMenuSubCode    = $("#ecopMenuSubCode").val();                    // 메뉴세분류코드
	            cartMenuPrice      = $("#ecopMenuPrice"  ).val();                    // 메뉴주문단가
	            cartMenuQty        = "1";                                            // 메뉴주문수량
	            cartMenuAmt        = $("#ecopMenuPrice"  ).val();                    // 메뉴주문금액
	            cartMenuDisRate    = "0";                                            // 메뉴할인율
	            cartMenuDisAmt     = "0";                                            // 메뉴할인금액
	            cartMenuCopDisAmt  = $("#ecopMenuDiscAmt").val();                    // 메뉴선결제쿠폰할인
	            cartMenuNetSaleAmt = $("#ecopMenuSaleAmt").val();                    // 메뉴순매출금액
	            cartMenuPayAmt     = "0";                                            // 메뉴결제금액
	            cartMenuSize       = "E";                                            // 메뉴사이즈(e쿠폰 표시)
	            cartECouponCompany = $("#eCouponCompany" ).val();                    // E쿠폰제휴사
	            cartECouponCode    = $("#eCouponCode"    ).val();                    // E쿠폰코드
	            cartECouponNumber  = $("#eCouponNumber"  ).val();                    // E쿠폰번호

				$.post(root+"/order/newCart.jsp?cartAction=getPizzaCount", function(count)
				{
					var pizzaCnt = trim(count) ;
					if( (parseInt(pizzaCnt) + 1) <= 5 )
					{
						var cartSetMenuDetail = []; 
						var setMenuCount = $("#ecoup_section").find(".eCouponDetail .hiddenData").size();  // 세트상세 메뉴 개수
						for( var i = 0; i < setMenuCount; i++ )
						{
							var setMenuData = $("#ecoup_section").find(".eCouponDetail .hiddenData").eq(i).text();
							
							var setCode        = setMenuData.split("/")[0] + "_" + cartIndex;
							var setSeqNumber   = setMenuData.split("/")[1];
							var setMenuCode    = setMenuData.split("/")[2];
							var setMenuName    = setMenuData.split("/")[3].replace("\"", "");
							var setMenuDivCode = setMenuData.split("/")[4];
							var setMenuLagCode = setMenuData.split("/")[5];
							var setMenuMidCode = setMenuData.split("/")[6];
							var setMenuSmlCode = setMenuData.split("/")[7];
							var setMenuSubCode = setMenuData.split("/")[8];
							var setMenuPrice   = setMenuData.split("/")[9];
							var setMenuQty     = setMenuData.split("/")[10];
							var setMenuAmount  = setMenuData.split("/")[11];
							var setMenuDisRate = setMenuData.split("/")[12];
							var setMenuDisAmt  = setMenuData.split("/")[13];
							var setMenuCopDis  = setMenuData.split("/")[14];
							var setMenuNetSale = setMenuData.split("/")[15];
							
							var objSetMenu = {"setCode"        :setCode
									         ,"setSeqNumber"   :setSeqNumber
									         ,"setMenuCode"    :setMenuCode
									         ,"setMenuName"    :setMenuName
									         ,"setMenuDivCode" :setMenuDivCode
									         ,"setMenuLagCode" :setMenuLagCode
									         ,"setMenuMidCode" :setMenuMidCode
									         ,"setMenuSmlCode" :setMenuSmlCode
									         ,"setMenuSubCode" :setMenuSubCode
									         ,"setMenuPrice"   :setMenuPrice
									         ,"setMenuQty"     :setMenuQty
									         ,"setMenuAmount"  :setMenuAmount
									         ,"setMenuDisRate" :setMenuDisRate
									         ,"setMenuDisAmt"  :setMenuDisAmt
									         ,"setMenuCopDis"  :setMenuCopDis
									         ,"setMenuNetSale" :setMenuNetSale
									         };
							cartSetMenuDetail.push(objSetMenu);
						}
						
				    	var objSetMenuInfo = {
			            		  			  cartAction         : cartAction          // 장바구니처리
			            		  			 ,cartMenuType       : cartMenuType        // 메뉴타입
			            		  			 ,cartMenuCode       : cartMenuCode        // 메뉴코드
			            		  			 ,cartMenuName       : cartMenuName        // 메뉴명
			            		  			 ,cartMenuOrdCode    : cartMenuOrdCode     // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
			            		  			 ,cartMenuDivCode    : cartMenuDivCode     // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
			            		  			 ,cartMenuLagCode    : cartMenuLagCode     // 메뉴대분류코드
			            		  			 ,cartMenuMidCode    : cartMenuMidCode     // 메뉴중분류코드
			            		  			 ,cartMenuSmlCode    : cartMenuSmlCode     // 메뉴소분류코드
			            		  			 ,cartMenuSubCode    : cartMenuSubCode     // 메뉴세분류코드
			            		  			 ,cartMenuPrice      : cartMenuPrice       // 메뉴주문단가
			            		  			 ,cartMenuQty        : cartMenuQty         // 메뉴주문수량
			            		  			 ,cartMenuAmt        : cartMenuAmt         // 메뉴주문금액
			            		  			 ,cartMenuDisRate    : cartMenuDisRate     // 메뉴할인율
			            		  			 ,cartMenuDisAmt     : cartMenuDisAmt      // 메뉴할인금액
				                             ,cartMenuCopDisAmt  : cartMenuCopDisAmt   // 메뉴선결제쿠폰할인
				                             ,cartMenuNetSaleAmt : cartMenuNetSaleAmt  // 메뉴순매출금액
			            		  			 ,cartMenuPayAmt     : cartMenuPayAmt      // 메뉴결제금액
			            		  			 ,cartMenuBakeCode   : cartMenuBakeCode    // 메뉴베이크코드
			            		  			 ,cartMenuCutCode    : cartMenuCutCode     // 메뉴컷코드
			            		  			 ,cartMenuCheeseCode : cartMenuCheeseCode  // 메뉴치즈코드
			            		  			 ,cartMenuSauceCode  : cartMenuSauceCode   // 메뉴소스코드
			            		  			 ,cartMenuMessage    : cartMenuMessage     // 메뉴전달메세지
			            		  			 ,cartMenuSize       : cartMenuSize        // 메뉴사이즈
			            		  			 ,cartMenuDough      : cartMenuDough       // 메뉴도우종류
			            		  			 ,cartMenuOption     : cartMenuOption      // 메뉴 옵션
				                             ,cartECouponCompany : cartECouponCompany  // E쿠폰제휴사
				                             ,cartECouponCode    : cartECouponCode     // E쿠폰코드
				                             ,cartECouponNumber  : cartECouponNumber   // E쿠폰번호
			            		  			 ,cartSetMenuDetail  : cartSetMenuDetail   // 세트메뉴상세
		                	     			 };
	  		
				    	var jsonSetMenuInfo = JSON.stringify(objSetMenuInfo);	//json 형태로 변환
				    	
				    	cartSendDataInfo = {
					               			cartAction      : cartAction,      // 장바구니처리
					               			cartMenuType    : cartMenuType,    // 메뉴타입
					               			cartSetMenuInfo : jsonSetMenuInfo  // 세트메뉴
		                       			   };
				    	
						//세션으로 보내기
						saveSession(cartSendDataInfo);
					}
					else
					{
						$('#viewLoading').fadeOut();
						popAlert("#notice_limit");
						$("#notice_limit").find(".alertBtn").focus();
					}
				});

		    	//20140112 장바구니 작성 후 hidden값 Clear 하기
				$("#eCouponCompany").val("");  // E쿠폰제휴사
				$("#eCouponCode"   ).val("");  // E쿠폰코드
				$("#eCouponName"   ).val("");  // E쿠폰명
			    $("#eCouponNumber" ).val("");  // E쿠폰번호
			}
			//4. 파파플래터 메뉴인 경우 (20140425)
			else if( $menu_sectionId == "plat_section" )
			{
				if( $("#menuSoldOutYn").attr("value") == "N" ) { return; }	//fnCheckStoreMenu 함수 실행 결과
				
				// platMenuSize 값만 받아오지 못함[undefinded] 
				// 다시 값 지정 
			    platMenuCode    = platArray[0];  // 메뉴코드
			    platMenuName    = platArray[1];  // 메뉴
			    platMenuSize    = platArray[2];  // 메뉴사이즈 PaPa platter
				platMenuSaleAmt = platArray[3];  // 판매금액 
				platMenuDough   = platArray[4];  // 메뉴도우종류 
				platMenuLagCode = platArray[5];  // 메뉴대분류코드 
				platMenuMidCode = platArray[6];  // 메뉴중분류코드
				platMenuSmlCode = platArray[7];  // 메뉴소분류코드 
				platMenuSubCode = platArray[8];  // 메뉴세분류코드 
				platMenuDivCode = platArray[9];  // 메뉴구분코드
								
				var platCartIndex = setCartIndex();  // 장바구니 순번
				var selectBox     = $("#menu_"+platMenuCode).find(".size_prc .selcet_count");
				
				platMenuName      =  platMenuName + " " + platMenuSize;
				var platMenuPrice = platMenuSaleAmt;
				var platMenuQty   = selectBox.find("select option:selected").val();
				var platMenuAmt   = parseInt(platMenuPrice.replace(/,/gi, "")) * parseInt(platMenuQty);
				
				// (BOX)
				var platMenuSize  = $("#plat_section").find("#menu_" + platMenuCode).find(".size").text().split("(")[1].substr(0,($("#menu_"+platMenuCode).find(".size").text().length)-2);
				
				cartAction         = "addMenu";                          // 장바구니처리
	            cartMenuType       = "typePizza";                        // 메뉴타입
	            cartMenuCode       = platMenuCode + "_" + platCartIndex; // 메뉴코드
	            cartMenuName       = platMenuName;                       // 메뉴명
	            cartMenuOrdCode    = "10";                               // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
	            cartMenuDivCode    = platMenuDivCode;                    // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
	            cartMenuLagCode    = platMenuLagCode;                    // 메뉴대분류코드
	            cartMenuMidCode    = platMenuMidCode;                    // 메뉴중분류코드
	            cartMenuSmlCode    = platMenuSmlCode;                    // 메뉴소분류코드
	            cartMenuSubCode    = platMenuSubCode;                    // 메뉴세분류코드
	            cartMenuPrice      = platMenuPrice.replace(/,/gi, "");   // 메뉴주문단가
	            cartMenuQty        = platMenuQty;                        // 메뉴주문수량
	            cartMenuAmt        = platMenuPrice.replace(/,/gi, "");   // 메뉴주문금액
	            cartMenuDisRate    = "0";                                // 메뉴할인율
	            cartMenuDisAmt     = "0";                                // 메뉴할인금액
	            cartMenuCopDisAmt  = "0";                                // 메뉴선결제쿠폰할인
	            cartMenuNetSaleAmt = platMenuPrice.replace(/,/gi, "");   // 메뉴순매출금액
	            cartMenuPayAmt     = platMenuPrice.replace(/,/gi, "");   // 메뉴결제금액
	            cartMenuSize       = platMenuSize;                       // 메뉴사이즈
	            
	            $.post(root+"/order/newCart.jsp?cartAction=getPizzaCount", function(pizzaCount)
	   	    	{
	            	var pizzaCount = trim(pizzaCount);  // 장바구니 주문 피자 수량
					if( (parseInt(pizzaCount) + parseInt(cartMenuQty)) <= 5 )
					{					
						cartSendDataInfo = {
										    cartAction         : cartAction          // 장바구니처리
							    		   ,cartMenuType       : cartMenuType        // 메뉴타입
		    	    					   ,cartMenuCode       : cartMenuCode        // 메뉴코드
		    	    					   ,cartMenuName       : cartMenuName        // 메뉴명
		    	    					   ,cartMenuOrdCode    : cartMenuOrdCode     // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
		    	    					   ,cartMenuDivCode    : cartMenuDivCode     // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
		    	    					   ,cartMenuLagCode    : cartMenuLagCode     // 메뉴대분류코드
		    	    					   ,cartMenuMidCode    : cartMenuMidCode     // 메뉴중분류코드
		    	    					   ,cartMenuSmlCode    : cartMenuSmlCode     // 메뉴소분류코드
		    	    					   ,cartMenuSubCode    : cartMenuSubCode     // 메뉴세분류코드
		    	    					   ,cartMenuPrice      : cartMenuPrice       // 메뉴주문단가
		    	    					   ,cartMenuQty        : cartMenuQty         // 메뉴주문수량
		    	    					   ,cartMenuAmt        : cartMenuAmt         // 메뉴주문금액
		    	    					   ,cartMenuDisRate    : cartMenuDisRate     // 메뉴할인율
		    	    					   ,cartMenuDisAmt     : cartMenuDisAmt      // 메뉴할인금액
		    	    					   ,cartMenuCopDisAmt  : cartMenuCopDisAmt   // 메뉴선결제쿠폰할인
		    	    					   ,cartMenuNetSaleAmt : cartMenuNetSaleAmt  // 메뉴순매출금액
		    	    					   ,cartMenuPayAmt     : cartMenuPayAmt      // 메뉴결제금액
		    	    					   ,cartMenuBakeCode   : ""                  // 메뉴베이크코드
		    	    					   ,cartMenuCutCode    : ""                  // 메뉴컷코드
		    	    					   ,cartMenuCheeseCode : ""                  // 메뉴치즈코드
		    	    					   ,cartMenuSauceCode  : ""                  // 메뉴소스코드
		    	    					   ,cartMenuMessage    : ""                  // 메뉴전달메세지
		    	    					   ,cartMenuSize       : cartMenuSize        // 메뉴사이즈
		    	    					   ,cartMenuDough      : platMenuDough       // 메뉴도우종류
										   ,cartMenuOption     : ""                  // 메뉴옵션
										   ,cartECouponCompany : ""                  // E쿠폰제휴사
										   ,cartECouponCode    : ""                  // E쿠폰코드
										   ,cartECouponNumber  : ""                  // E쿠폰번호
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
			//console.log("menu code : " , cartMenuCode , cartAction);
			
		}
	}

	
	//아이템 배열을이용한 오브젝트 만들기
	function SaveSetMenu(
		                  cartMenuType        // 메뉴타입
		                 ,cartMenuCode        // 메뉴코드
		                 ,cartMenuName        // 메뉴명
		                 ,cartMenuOrdCode     // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
		                 ,cartMenuDivCode     // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
		                 ,cartMenuLagCode     // 메뉴대분류코드
		                 ,cartMenuMidCode     // 메뉴중분류코드
		                 ,cartMenuSmlCode     // 메뉴소분류코드
		                 ,cartMenuSubCode     // 메뉴세분류코드
		                 ,cartMenuPrice       // 메뉴주문단가
		                 ,cartMenuQty         // 메뉴주문수량
		                 ,cartMenuAmt         // 메뉴주문금액
		                 ,cartMenuDisRate     // 메뉴할인율
		                 ,cartMenuDisAmt      // 메뉴할인금액
                         ,cartMenuCopDisAmt   // 메뉴선결제쿠폰할인
                         ,cartMenuNetSaleAmt  // 메뉴순매출금액
		                 ,cartMenuPayAmt      // 메뉴결제금액
		                 ,cartMenuBakeCode    // 메뉴베이크코드
		                 ,cartMenuCutCode     // 메뉴컷코드
		                 ,cartMenuCheeseCode  // 메뉴치즈코드
		                 ,cartMenuSauceCode   // 메뉴소스코드
		                 ,cartMenuMessage     // 메뉴전달메세지
		                 ,cartMenuSize        // 메뉴사이즈
		                 ,cartMenuDough       // 메뉴도우종류
		                 ,cartMenuOption      // 메뉴옵션
                         ,cartECouponCompany  // E쿠폰제휴사
                         ,cartECouponCode     // E쿠폰코드
                         ,cartECouponNumber   // E쿠폰번호
		                 ,cartSetMenuDetail   // 세트메뉴상세
			             ) 
	{
		
		this.cartMenuType       = trim(cartMenuType      );  // 메뉴타입
		this.cartMenuCode       = trim(cartMenuCode      );  // 메뉴코드
		this.cartMenuName       = trim(cartMenuName      );  // 메뉴명
		this.cartMenuOrdCode    = trim(cartMenuOrdCode   );  // 메뉴주문구분코드(10:정상,20:할인,30:서비스(무료))
		this.cartMenuDivCode    = trim(cartMenuDivCode   );  // 메뉴구분코드(10:단품,20:세트,30:하프&하프)
		this.cartMenuLagCode    = trim(cartMenuLagCode   );  // 메뉴대분류코드
		this.cartMenuMidCode    = trim(cartMenuMidCode   );  // 메뉴중분류코드
		this.cartMenuSmlCode    = trim(cartMenuSmlCode   );  // 메뉴소분류코드
		this.cartMenuSubCode    = trim(cartMenuSubCode   );  // 메뉴세분류코드
		this.cartMenuPrice      = trim(cartMenuPrice     );  // 메뉴주문단가
		this.cartMenuQty        = trim(cartMenuQty       );  // 메뉴주문수량
		this.cartMenuAmt        = trim(cartMenuAmt       );  // 메뉴주문금액
		this.cartMenuDisRate    = trim(cartMenuDisRate   );  // 메뉴할인율
		this.cartMenuDisAmt     = trim(cartMenuDisAmt    );  // 메뉴할인금액
		this.cartMenuCopDisAmt  = trim(cartMenuCopDisAmt );  // 메뉴선결제쿠폰할인
		this.cartMenuNetSaleAmt = trim(cartMenuNetSaleAmt);  // 메뉴순매출금액
		this.cartMenuPayAmt     = trim(cartMenuPayAmt    );  // 메뉴결제금액
		this.cartMenuBakeCode   = trim(cartMenuBakeCode  );  // 메뉴베이크코드
		this.cartMenuCutCode    = trim(cartMenuCutCode   );  // 메뉴컷코드
		this.cartMenuCheeseCode = trim(cartMenuCheeseCode);  // 메뉴치즈코드
		this.cartMenuSauceCode  = trim(cartMenuSauceCode );  // 메뉴소스코드
		this.cartMenuMessage    = trim(cartMenuMessage   );  // 메뉴전달메세지
		this.cartMenuSize       = trim(cartMenuSize      );  // 메뉴사이즈
		this.cartMenuDough      = trim(cartMenuDough     );  // 메뉴도우종류
		this.cartMenuOption     = trim(cartMenuOption    );  // 메뉴옵션
		this.cartECouponCompany = trim(cartECouponCompany);  // E쿠폰제휴사
		this.cartECouponCode    = trim(cartECouponCode   );  // E쿠폰코드
		this.cartECouponNumber  = trim(cartECouponNumber );  // E쿠폰번호
		this.cartSetMenuDetail  = cartSetMenuDetail;         // 세트메뉴상세
		
	}
	
	
	//아이템 하나씩 오브젝트 만들기
	//setMenuCd:세트코드 , setItem:세트를 구성하는 각각의 아이템
	function SaveSetItems(menuCode, setMenus, cartIndex)
	{

		this.setCode        = menuCode + "_" + cartIndex;
		this.setSeqNumber   = trim(setMenus.split("/")[1]);
		this.setMenuCode    = trim(setMenus.split("/")[2]);
		this.setMenuName    = trim(setMenus.split("/")[3]);
		this.setMenuDivCode = trim(setMenus.split("/")[4]);
		this.setMenuLagCode = trim(setMenus.split("/")[5]);
		this.setMenuMidCode = trim(setMenus.split("/")[6]);
		this.setMenuSmlCode = trim(setMenus.split("/")[7]);
		this.setMenuSubCode = trim(setMenus.split("/")[8]);
		this.setMenuPrice   = trim(setMenus.split("/")[9]);
		this.setMenuQty     = trim(setMenus.split("/")[10]);
		this.setMenuAmount  = trim(setMenus.split("/")[11]);
		this.setMenuDisRate = trim(setMenus.split("/")[12]);
		this.setMenuDisAmt  = trim(setMenus.split("/")[13]);
		this.setMenuCopDis  = trim(setMenus.split("/")[14]);
		this.setMenuNetSale = trim(setMenus.split("/")[15]);
		
	}

	
	/********************* 장바구니 초기화(화면) *********************/
	function fnClearAll()
	{ 
		//20130509 초기화 할때 장바구니 리스트 전체 삭제
		$("#ord_list").find("li").each(function() { $(this).remove(); });

		radio_btnReset($("#btn_addr"));      
		radio_btnReset($("#btn_store"));  
		
		//히든값 초기화
		document.frmOrder.cartOrdDevide.value = "";
		//배달,포장 버튼 초기화
		$("#cart_btn_ordWay1 .active").removeClass("active"); 
		
		//토탈 금액 초기화
		setTotalPrc(0, 0); 
		//네비게이션 초기화
		$(".tracking").css("background-image","url("+root+"/assets/img/order/tracking1.png)");
		
		
		//20131216 배송지 정보 초기화
		$ord_store_name.text("");
		$ord_addr.text("");
//		$ord_time.text("");
		
		//배송지 정보 영역 숨기기
		ord_way_hide();
		contents_resize();
	}
	
	
	/********************* 장바구니 초기화(세션) ********************/
	function fnClearCart()
	{
		
		var cartSendDataInfo = {cartAction:"cartReset"};
		saveSession(cartSendDataInfo);
	
		//$("#ord_opt_area").css("display","none");
		slide_con_close();
		ord_way_reset();
		opt_cont_reset();
	}
	

	///////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// 장바구니 노드 변수입력 ///////////////////////////////////////////////////
	var $ord_opt = $("#ord_opt_area");
	$ord_opt.css({"top":"-0px","left":"-100px","display":"none"});
	$opt_con = $ord_opt.find(".con");
	
	// 배달 버튼
	var $btn_addr = $("#btn_addr");
	// 방문포장 버튼
	var $btn_store = $("#btn_store");
	
	/* 옵션에 들어가는 컨텐츠들 */
	// 회원정보
	var $mem_info = $("#mem_info");
	// 주소선택
	var $select_addr = $("#select_addr");
	// 프레임
	var $frame = $("#frame");
	//프레임 타이틀
	var $frame_title = $frame.find(".title");

	// 주문 정보 입력받는곳
	var $ord_info        = $("#ord_optInfo_section");
	var $ord_mem_name    = $ord_info.find(".mem_name");
	var $ord_mem_phone   = $ord_info.find(".mem_phone");
	var $ord_store_title = $ord_info.find(".store_title");
	var $ord_store_name  = $ord_info.find(".store_name");
	var $ord_addr_title  = $ord_info.find(".addr_title");
	var $ord_addr        = $ord_info.find(".addr");
	var $ord_time_title  = $ord_info.find(".time_title");
	var $ord_time        = $ord_info.find(".visit_time");
	var $sect_info = $ord_info.find(".sect_info");
	
	var value_store_name;
	var value_store_phone;
	var value_addr;
	var value_visit_time;
		
	// 회원정보
	var mem_name  = $("#mem_info .m_name").text();
	var mem_phone = $("#mem_info .m_phone").text();
	

	// 라디오 버튼 설정
	function radio_btn(el)
	{
		var $btn_this=$(el);
		var $btn_container=$btn_this.parent();
		var $btn_radio=$btn_container.find("button");
		btn_reset();
		// 버튼 on 초기화
		function btn_reset()
		{
			$btn_radio.each(function(i){
				
				$(this).removeClass("active");
				$btn_this.addClass("active");
	
				$btn_radio.eq(i).find("img").attr("src",function(){
					return $(this).attr("src").replace("_on.png",".png");
				});
			});
		}
		$btn_this.find("img").attr("src",function(){
				return $(this).attr("src").replace(".png","_on.png");
		});
	} // radio_btn

	
	// 라디오 버튼 초기화
	function radio_btnReset(el)
	{
		var $btn_this = $(el);
		var $btn_container = $btn_this.parent();
		var $btn_radio = $btn_container.find("button");
		
		$btn_radio.each(function(i)
		{
			$(this).removeClass("active");
			$btn_this.addClass("active");
			$btn_radio.eq(i).find("img").attr("src",function()
			{
				return $(this).attr("src").replace("_on.png",".png");
			});
		});
	}
	

	/////////////////////// 배달 주문 선택 시///////////////////////////////////////////////////////////////
	// 배달버튼 클릭
	$btn_addr.bind("click",function(){ 
		fnCheckingCart($(this)); 
	});
	//포장주문 버튼 클릭
	$btn_store.bind("click",function(){
			fnCheckingCart($(this));
	});
	
	
	function fnCheckingCart($this)
	{
		
		var $cartList  = $("#ord_list>li");
	 	var $totalPrc  = $("#ord_total").find(".price").text();
		var cartAmount = parseInt($totalPrc.replace(",","").replace("원","") );
		var orderFlag  = false;  //장바구니에 피자또는 사이드 메뉴를 포함하는지 검사
		
		$cartList.each(function(e,i)
		{
			var menuType = $(this).attr("class");
			//if( menuType == "pizza_menu product" || menuType == "set_menu product" || menuType == "set_menu eCoupon_menu product" || menuType == "half_menu product" || menuType == "side_menu product" ) 
			//{orderFlag = true;}
			
			//20140620 프로모션 메뉴까지 포함 통과~
			if( $(this).hasClass("pizza_menu") == true || $(this).hasClass("set_menu") == true  || $(this).hasClass("half_menu") == true || $(this).hasClass("side_menu") == true  ){orderFlag = true;}
		});
		
		//장바구니에 메뉴가 있고 총액이 10000원이상, 피자메뉴를 포함한 경우만 주문 진행
		if( $cartList.size() > 0  &&  cartAmount > 10000  &&  orderFlag == true )
		{
			radio_btn($this);
			
			if( $this.attr("id") == "btn_addr" )	//배달버튼인경우
			{
				append_addr();
			}
			else if( $this.attr("id") == "btn_store" )	//포장버튼인경우
			{
				append_visit();
			}
		}
		else
		{
			var alertFrame = $("#notice_1002");
			//alert("피자 메뉴를 포함하여,\n총  10,000원 이상인 경우만 주문이 가능합니다.");
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>피자 또는 사이드 메뉴를 포함하여 <br/>총  10,000원 이상인 경우만 주문이 가능합니다.</p>").css("line-height","35px"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
		}
		
	}

	
	////////////////////////////////////////// 수령인 정보 //////////////////////////////////////////////////////////////////////
	/* 회원정보 변경 */
	var $btn_mem_modify = $mem_info.find(".mem_modify");
	var $m_name         = $mem_info.find(".m_name");
	var $m_phone        = $mem_info.find(".m_phone");
	
	var v_name  = $m_name.text();
	var v_phone = $m_phone.text();
	
	$btn_mem_modify.bind("click", mem_modify);
	
	function mem_modify()
	{
		$btn_mem_modify.addClass("active");
		$btn_mem_modify.text("확인");
		
		$m_name.html('<input type="text" id="in_m_name" name="in_m_name" value='+v_name+' />');
		$m_phone.html('<input type="text" id="in_m_name" name="in_m_phone" value='+v_phone+'   maxlength="12"/>');
		toggle($btn_mem_modify);
	}
	
	
	function modify_ok()
	{
		var name    = $mem_info.find(".m_name input").attr("value");
		var phoneNm = $mem_info.find(".m_phone input").attr("value");
		
		//입력한 전화번호가 숫자가 아닌 경우 알림
		if(isNaN(phoneNm))
		{
			alert("전화번호는 숫자로만 입력 가능합니다");
			$mem_info.find(".m_phone input").focus();
			$mem_info.find(".m_phone input").css("border","solid 2px #f00");
			return; 
		}
			
		if( name != "" && phoneNm != "" )
		{
			//전화번호를 적게 쓰거나 많이 쓴경우 알림
			if(phoneNm.length < 9 || phoneNm.length>11)
			{
				alert("입력하신 전화번호는 유효하지 않습니다.\n지역번호를 포함한 전화번호를 다시 입력해 주세요.");
				$mem_info.find(".m_phone input").focus();
				$mem_info.find(".m_phone input").css("border","solid 2px #f00");
				return;
			}
			else
			{
				$m_name.text(name);
				$m_phone.text(phoneNm);
				$btn_mem_modify.removeClass("active");
				$btn_mem_modify.text("변경");
				toggle($btn_mem_modify);	
			}
		}
		//이름이나 전화번호 입력란이 비어있는 경우 입력 알림!!
		else 
		{
			if(phoneNm == "" )
			{
				if( confirm("전화번호가 입력되지 않았습니다.\n기본 입력 된 정보를 그대로 사용하시겠습니까?\n입력을 원하시면 취소 버튼을 눌러주세요!!") == true )
				{
					$m_phone.text(v_phone);
					$m_name.text(name);
				}
				else
				{
					$mem_info.find(".m_phone input").focus();
					$mem_info.find(".m_phone input").css("border","solid 2px #f00");
					return; 
				}  
			}
			else if( name == "")
			{
				if( confirm("이름이 입력되지 않았습니다.\n기본 입력 된 정보를 그대로 사용하시겠습니까?\n입력을 원하시면 취소 버튼을 눌러주세요!!") == true )
				{
					$m_name.text(v_name);
					$m_phone.text(phoneNm);
				}
				else
				{
					$mem_info.find(".m_name input").focus();
					$mem_info.find(".m_name input").css("border","solid 2px #f00");  
					return; 
				}  
			}
			else if( name == "" && phoneNm == "" )
			{
				if( confirm("기본 입력 된 정보를 그대로 사용하시겠습니까? \n입력을 원하시면 취소 버튼을 눌러주세요!!") == true )
				{
					$m_name.text(v_name);
					$m_phone.text(v_phone);
				}
				else
				{  
					return; 
				} 
			}
			$btn_mem_modify.removeClass("active");
			$btn_mem_modify.text("변경");
			toggle($btn_mem_modify);
		}
	}
	
	
	function toggle($el)
	{
		$el.unbind();
		if( $el.hasClass("active") ){$el.bind("click",modify_ok);}
		else{$el.bind("click",mem_modify);}
	}

	
	// 배달버튼 클릭시 옵션박스에 추가되는 컨텐츠
	function append_addr()
	{
		opt_cont_reset();
		$mem_info.show();
		$select_addr.show();
		$opt_con.append($mem_info);	
		$opt_con.append($select_addr);
		slide_con_open();
		
		//네비게이션 변경
		$(".tracking").css("background-image","url("+root+"/assets/img/order/tracking2.png)");
	}
	
	
	// 배달 옵션의 주소 선택 클릭
	//$("#addr_list .btn_select").bind("click",select_addr);
	//동적 생성 후 추가된 html을 읽어오려면 bind 함수가 아닌 delegate를 써야함
	$(document).delegate("#addr_list .btn_select", "click" , select_addr);
	
	function select_addr()
	{
		//20140410 수령인 정보 변경 후 확인 버튼을 누르지 변경정보 저장 안됨
		if($btn_mem_modify.text() =="확인")
		{
			alert('수령인 정보를 확인하신 후\n수령인 정보의 [확인] 버튼을 먼저 눌러주세요');
		}
		else
		{
			//20170811 배달가능 여부에 따라 진행
			var deliveryYN = $(this).parent().parent().find(".devYN").text();
			if( deliveryYN == "N" )
			{
				var alertFrame = $("#notice_1002");
				alertFrame.find("#alertText p").remove();
				alertFrame.find("#alertText").append("<p>선택하신 주소는 현재 배달이 불가능합니다.</p>").css("line-height","50px"); 
				parent.popAlert(alertFrame);
				alertFrame.find(".alertBtn").focus();
				return false;
			}
			
			parent.$('#viewLoading').show().fadeIn('fast');    
			parent.document.frmOrder.cartOrdCustName.value     = mem_name;                                               // 고객명
			parent.document.frmOrder.cartOrdCustPhone.value    = mem_phone;                                              // 전화번호
			parent.document.frmOrder.cartOrdDevide.value 			= "10";
			parent.document.frmOrder.cartOrdDevAddr1.value     = $(this).parent().parent().find(".addrSi").text();      // 배달지주소1
			parent.document.frmOrder.cartOrdDevAddr2.value     = $(this).parent().parent().find(".addrGu").text();      // 배달지주소2
			parent.document.frmOrder.cartOrdDevAddr3.value     = $(this).parent().parent().find(".addrDong").text();    // 배달지주소3
			parent.document.frmOrder.cartOrdDevAddr4.value     = $(this).parent().parent().find(".addrDetail").text();  // 배달지주소4
			parent.document.frmOrder.cartOrdAddressID.value    = $(this).parent().parent().find(".addrID").text();      // ADDRESS_ID
			parent.document.frmOrder.cartOrdStoreCode.value    = $(this).parent().parent().find(".stoCode").text();     // 매장코드
			parent.document.frmOrder.cartOrdStoreName.value    = $(this).parent().parent().find(".stoName").text();     // 매장명
			parent.document.frmOrder.cartOrdSectorCode.value   = $(this).parent().parent().find(".secCode").text();     // 매장섹터코드
			parent.document.frmOrder.cartOrdSectorName.value   = $(this).parent().parent().find(".secName").text();     // 매장섹터명
			parent.document.frmOrder.cartOrdDeliveryTime.value = $(this).parent().parent().find(".devTime").text();     // 섹터예상시간
			parent.document.frmOrder.cartOrdDeliveryYN.value   = $(this).parent().parent().find(".devYN").text();       // 배달가능여부
			parent.document.frmOrder.cartOrdNewAddressYN.value = "N";                                                    // 배달지주소신규추가여부
			
			slide_con_close();
			
			var devAddress   = $(this).parent().parent().find(".addr").text();     // 배달지주소
	    	var storeCode    = $(this).parent().parent().find(".stoCode").text();  // 매장코드
	    	var storeName    = $(this).parent().parent().find(".stoName").text();  // 매장명
	    	var deliveryTime = $(this).parent().parent().find(".devTime").text();  // 배달소요시간
	
			//20130914 장바구니 메뉴 검사 추가
			$.ajax(
			{
				url      : root+"/order/checkStoreMenu.jsp",
				type     : "post",
				data     : "storeCode="+storeCode+"&flag=allMenu&storeName="+storeName,
				dataType : "html",
				success  : function(data)
				{
					if( trim(data) != "" )
					{
						var alertFrame = $("#notice_1002");
	   					alertFrame.find("#alertText p").remove();
	   					alertFrame.find("#alertText").append("<p>" + trim(data).split("*")[0] + "<br>" + trim(data).split("*")[1]+ "<br>" + trim(data).split("*")[2] +"</p>"); 
	   					popAlert(alertFrame);
	   					//20131212 체크
	   					//주문불가 알림 후 장바구니에서 삭제해야함!!!
						
	   					return;
					}
					else
					{
						value_addr       = devAddress; 
						value_store_name = storeName;
						value_visit_time = deliveryTime;
						
						ord_way_reset();
						ord_way_show();
						  
						$ord_store_title.text("배달매장");
						$ord_addr_title.text("배달주소");
	//					$ord_time_title.text("배달시간");
						// 주문 정보 입력
				    	setTimeout("input_info(10)", 500);
					}
				}
			});
		}
	}
	
	// 배달 옵션의 주소 삭제 클릭
	//동적 생성 후 추가된 html을 읽어오려면 bind 함수가 아닌 delegate를 써야함
	$(document).delegate("#addr_list .btn_del_addr", "click" , confirmDelete);
	
	function confirmDelete()
	{
		var loginId    = $(this).parent().parent().find(".loginId" ).text();  // 로그인아이디
		var addressID  = $(this).parent().parent().find(".addrID"  ).text();  // ADDRESS_ID
		var addrDetail = $(this).parent().parent().find(".addrDetl").text();  // 배달지주소4
		var $thisAddr  = $(this).parent().parent().attr("id");	//삭제할 라인 아이디
		
		$("#notice_del_addr").find(".footer #del_loginId"   ).attr("value", loginId   );
		$("#notice_del_addr").find(".footer #del_addressID" ).attr("value", addressID );
		$("#notice_del_addr").find(".footer #del_addrDetail").attr("value", addrDetail);
		$("#notice_del_addr").find(".footer #del_addrListId").attr("value", $thisAddr );
		
		popAlert("#notice_del_addr");
	}

	function delete_addr($this)
	{

		var loginId    = $this.parent().find("#del_loginId"   ).val();  // 로그인아이디
		var addressID  = $this.parent().find("#del_addressID" ).val();  // ADDRESS_ID
		var addrDetail = $this.parent().find("#del_addrDetail").val();  // 배달지주소4

		var addrListId = $this.parent().find("#del_addrListId" ).val();  // 화면의 주소 리스트중 삭제할 라인 아이디
		// 화면에서 삭제
		//$(this).parent().parent().remove();
	
		$.ajax(
		{
			url        : root+"/order/deleteDeliveryAddr.jsp",
			type       : "POST",
  			data       : "loginId="+loginId+"&addressID="+addressID+"&addrDetail="+addrDetail,
			dataType   : "html",
			beforeSend : function() 
			{              
				//통신을 시작할때 처리             
				$('#viewLoading').fadeIn(500);          
			},
			complete : function() 
			{             
				//통신이 완료된 후 처리              
				$('#viewLoading').fadeOut();
				del_pop2('#notice_del_addr');        
			},
			success : function(data)
			{
				$("#"+addrListId).remove();	
			},
	 		error : function()
	 		{
			   	alert('주소가 정상적으로 삭제되지 않았습니다.\n삭제 버튼을 다시 눌러주세요');
			   	return;
			}
		});
	}
	
	
	// 배달 옵션의 새주소 등록 클릭
	$("#btn_newAddr_reg").bind("click",reg_newAddr);
	
	function reg_newAddr()
	{
		
		$frame.show();
		$frame_title.html('<img src="'+root+'/assets/img/order/order_rboxTitle_addrSearch.gif" alt="주소검색" />');
		$frame.find("iframe").attr("src",root+"/order/search_addr.jsp");
		$frame.find("iframe").css("height","200px");
		$opt_con.append($frame);
		contents_resize();
	}

	
	/////////////////////// 포장 주문 선택 시///////////////////////////////////////////////////////////////
	// 포장버튼 클릭시 옵션박스에 추가되는 컨텐츠
	function append_visit()
	{
		opt_cont_reset();
		$mem_info.show();
		$frame.show();
		$frame_title.html('<img src="'+root+'/assets/img/order/order_rboxTitle_selectStore.gif" alt="방문포장" />');
		$frame.find("iframe").attr("src",root+"/order/select_store.jsp");
		$frame.find("iframe").css("height","200px");
		$opt_con.append($mem_info);
		$opt_con.append($frame);
		slide_con_open();
		$('#viewLoading').show().fadeIn(500);
		
		//트레킹변경
		$(".tracking").css("background-image","url("+root+"/assets/img/order/tracking2.png)");
		
	}
	
	//////////////////////////// 배달/방문매장 / 토핑 공통 FN ////////////////////////////////////////////////////////////////////////////////////////
	// 주문 정보 입력 : 호출= select_addr()
	function input_info(ordDivide)
	{ 
		var value_mem_name  = "";
		var value_mem_phone = "";
		
		if( $mem_info.find("input").size() > 0 )
		{
			value_mem_name  = $mem_info.find(".m_name input").attr("value");	
			value_mem_phone = $mem_info.find(".m_phone input").attr("value");	
		}
		else
		{
			value_mem_name  = $mem_info.find(".m_name").text();
			value_mem_phone = $mem_info.find(".m_phone").text();	
		}
		
		$ord_mem_name.text(value_mem_name);
		$ord_mem_phone.text(value_mem_phone);
		$ord_store_name.text(value_store_name);
		$ord_addr.text(value_addr);

		//배달, 방문 공통 : 매장이 선택되면 무조건 받아오는 섹터 시간
		//배달주소, 배달가능시간 or 방문매장주소, 방문가능시간
		var serviceable_time = value_visit_time + "분~" + ( parseInt(value_visit_time) +10 ) + "분"; 
//		$ord_time.text(serviceable_time);	
		
		//20131216
		//섹터 시간은 따로 알림을 주더라도 배송지 정보란에 기입하지 않는다!!
		//변경값 구분 안됨
		//$ord_time.text("");
		
		//20140121 섹터시간만 표시하고 결제화면으로 이동하도록 변경.
		var sector = "주소는 ";
		var ordType = "배달";
		
		if(ordDivide == 20)		//10:배달, 20:포장
		{
			sector = "매장은 ";
			ordType = "포장";
			serviceable_time =  ( parseInt(value_visit_time) - 15 ) + "분~" + ( parseInt(value_visit_time) - 10 ) + "분"
		}
		$sect_info.html("<br><span class='txt_green'>선택하신 "+sector +"주문이 완료된 후<br><span class='txt_point'>"+ serviceable_time +"</span>의  " +ordType+"시간이 소요됩니다. 예약 시간은 결제 화면에서 변경하실 수 있습니다.</span>");
		fnSaveCartOrderInfo();  // 주문 및 배달지(주소) session 저장
		contents_resize();
	}
	
	function ord_modal(sw)
	{
		
		var $container = $("#container");
		var $orderWrap = $("#orderWrap");
		var $footer    = $("#footer");
		var h          = $("body").css("height");
		
		// sw가 true일경우 모달 생성
		if( sw == true )
		{
			// modal_box가 append되지 않았을때 생성
			if( $container.find("#modal_box").size() <= 0 )
			{  
				$orderWrap.css("z-index",1000);
				$container.css({"z-index":10});
				$footer.css({"position":"relative","z-index":1});
				$container.append('<div id="modal_box" style="width:100%; height:'+h+'; background:url(assets/img/common/modal_bg.png); position:fixed; top:0px; left:0px; z-index:100" ></div>');
			}
		}
		// sw가 false일경우 모달 삭제
		else
		{
			$("#modal_box").remove();
		}
		
	}

	
	// 옵션 슬라이드 박스 열기 : 호출 = append_addr(), append_visit(), open_topp_frm()-> topping.js
	function slide_con_open()
	{
		ord_modal(true);     // modal 생성.
		$ord_opt.css({"display":"block","opacity":"0"}); 
		$ord_opt.animate(
		{
			left:"-330px",
			opacity:1
		},
		{
			duration:500,
			complete:function() { contents_resize(); }
		});
		
	}

	
	// 옵션 슬라이드 박스 닫기 
	function slide_con_close()
	{
		//20131216
		//옵션 변경 없이 그냥 슬라이드를 닫는 경우 라디오 버튼값 원래대로 세팅
		if(document.frmOrder.cartOrdDevide.value == "10")
		{
			radio_btn($("#btn_addr")); 
		}
		else if(document.frmOrder.cartOrdDevide.value == "20")
		{
			radio_btn($("#btn_store"));
		}
		else
		{
			radio_btnReset($("#btn_addr"));      
			radio_btnReset($("#btn_store"));  
		}
		
		$('#viewLoading').fadeOut();
		$ord_opt.animate(
		{
			left:"-100px",
			opacity:0
		},
		{
			duration:500,
			complete:function()
			{
				ord_modal(false);  // modal 삭제
				opt_cont_reset();
				$ord_opt.css({"display":"none"});
				contents_resize();
//				modify_ok();
			}
		});		
		
	}
	
	
	// 배달/방문포장 옵션 슬라이드 : 주소나, 매장 선택시 배송지 정보와  바로주문/예약주문 버튼 활성화	
	function ord_way_show()
	{
		$("#ord_optInfo_section").show();
	}
	
	
	// 배송지 정보와 바로주문/예약주문 버튼 숨기기
	function ord_way_hide()
	{
		//20131210. 배달/포장 변경 시 주소가 선택 된 후 다시 쓰는 것으로 변경, 
		//슬라이드에서 내용 변경없이 그냥 닫는 경우 원래 썼던 정보 가지고 있어야함
		ord_way_reset();
		$("#ord_optInfo_section").hide();	//배송지 정보 영역 숨기기
	}
	
	//주소가 새로 선택되는 경우 : 바로주문, 예약주문 버튼 리셋 변경
	function ord_way_reset()
	{
		//히든값 초기화 같이 해주기
		parent.document.frmOrder.cartOrdResDate.value = "";
		parent.document.frmOrder.cartOrdResTime.value = "";
	}
	
	
	/////////////////////////////////// 바로주문/예약주문 //////////////////////////////////
	//20140121 pj_1003화면으로 이동!!
	//check_out_time.js 참조
	
	//토핑추가버튼 마우스 올릴경우 이미지 확대,축소
	function fnShowFocus($this){
		//var imgNm = $this.find("img").attr("src").split("/")[5];
		$this.parent().parent().parent().find(".focusImg").css("display","block");
		
	}
	function fnHideFocus($this){
		$this.parent().parent().parent().find(".focusImg").css("display","none");
	}
	
// top:52px; left:84px; background:#fff; margin-top:-53px;  margin-left:-82px;		
	///////////////////////////////// 기본기능 ///////////////////////////////////////
	// 장바구니에 메뉴가 하나도 없는경우 주문 버튼 막기
	function blockBtn()
	{
		
		var $chkCount = $(".pizza_menu");
		var bool      = false;
		
		if( $chkCount.length <= 0 )
		{
			alert("메뉴를 먼저 선택해주세요.");
			return;
		}
		else
		{
			bool = true;
		}
		
		return bool;
		
	}	

	