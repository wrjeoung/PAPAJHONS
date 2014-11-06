/* *******0402 수정부분시작 */
	function ra_check($this)
	{
		$this.addClass('r_on');
		$this.find("input").attr("checked","checked");
		
		var price          = $this.find("input").attr("value");
		var $item_rightBox = $this.parent().parent();
		
		var $size = $("input[name=_size]");
		var imgAlt = $this.find("img").attr("alt");
		$size.attr("value",imgAlt);
		$item_rightBox.find(".select_price").text(setComma(price));
		
//		var size          = $this.find("img").attr("alt");
//		$item_rightBox.find("#_size").attr("value",size);
//		$item_rightBox.find(".select_price").text(setComma(price));
	}
	

///////////////////////////////// ord_list 토핑추가/토핑빼기 /////////////////////////////////
	/* 토핑버튼  클릭시 */
	function fnTopping($this, type)
	{
		//각 메뉴 아이디에 맞는 토핑 호출을 위해 메뉴코드를 파라미터로 넘김
		var listId   = $this.parent().parent().parent().attr("id");
		var menuCode = ""; 
		var menuQty  = "";                                // 메뉴수량
		var menuType = type;

		if(type == "typePromotion")
		{
			menuCode = listId.replace("promMenu_", "");  // 메뉴코드
		}	
		else
		{
			menuCode = listId.replace("pizzaMenu_", "");  // 메뉴코드
		}	
		
		if( type == "typePizza" || type == "typePromotion")
		{
			menuQty = $("#"+listId).find("input#count").val();
		}
		else if( type == "typeHalf" )
		{
			menuQty = $("#"+listId).parent().parent().find("input#count").val();
		}
		
		opt_cont_reset();
		open_topp_frm(menuCode, menuQty, menuType);
	}
	
	
	/* 토핑 슬라이드로 전달할 메뉴 코드 받기 */
	function open_topp_frm(menuCode, menuQty, menuType)
	{
		$frame.show();
		$frame_title.remove();
		$frame.find("iframe").attr("src",root+"/order/topp.jsp?menuCode="+menuCode+"&menuQty="+menuQty+"&menuType="+menuType); 
		$frame.find("iframe").css("height","460px");
		$opt_con.append($frame);
		slide_con_open();
		contents_resize();
	} 
	
	///* 토핑 슬라이드에서 보내는 데이터 받아 쓰기 *///
	/* mCode:string , toppData:object */
	function append_topp_p(mCode, toppData, prevTotalPrc, menuCount, menuType)
	{
		var listId    = "pizzaMenu_" + mCode;
		if(menuType == "typePromotion")
		{
			listId    = "promMenu_" + mCode;
		}
		
		var $toppType = toppData.cartToppType; 
	  
	 	//토핑가격 장바구니 총액에 더하기 
	 	var eaTotPrc  = 0;	 // 1.토핑개별 총액
	 	var appendPrc = 0;	 // 2.토핑가격에 메뉴 수량을 곱한 금액
	 	
	 	eaTotPrc  = parseInt(toppData.cartToppPrice.replace(",","")) * parseInt(toppData.cartToppQty);
	 	appendPrc = eaTotPrc * parseInt(menuCount);

		//console.log("==ToppName : " + toppData.cartToppName);
		//console.log("==menuCount : " + menuCount);
		//console.log("==eaTotPrc : " + eaTotPrc );
		//console.log("==eaTotPrc * menuCount : " + appendPrc);
		
	 	setTotalPrc(appendPrc, 1);
	 	
	 	//장바구니에 토핑 html append
	 	if( $toppType == "plus" )
	 	{
	 		//토핑 추가 쓰기
	 		fnPlusAppend( );
	 	} 
	 	else
	 	{
	 		//토핑 빼기 쓰기
	 		fnMinusAppend( );
	 	}
	 	
	 	//플러스 토핑
	 	function fnPlusAppend()
	 	{
	 		var listItem    = "";
	 		var topp_p_list = $("#"+listId).find("ul.topp_p");
	 		
	 		//리스트가 있는경우
	 		if( topp_p_list.size() > 0 )
	 		{ 
	 			listItem = '<li class='+toppData.cartToppItemCode +'><span class="name">' + toppData.cartToppName + '</span>'+
				           '<span class="topCnt">'+ toppData.cartToppQty +'</span>' +
				           '<span class="price">x '+ toppData.cartToppPrice +'원' + 
				           '<a href="#" onclick="fnClearToppItem($(this), \''+mCode+'\', \''+menuCount+'\' )"  class="btn_menu_del">'+
				           '<img src="'+root+'/assets/img/order/btn_item_del.png" alt="삭제" /></a>'+
				           '</span><input type="hidden" class="toppEaAmt" name="toppEaAmt" value="'+eaTotPrc +'"/></li>';
	 			topp_p_list.append(listItem);
	 		}
 			//리스트가 없는경우
	 		else
	 		{ 
	 			listItem = '<ul class="topp_p">'+ 
	 					   '<li class='+toppData.cartToppItemCode +'><span class="name">' + toppData.cartToppName + '</span>'+
						   '<span class="topCnt">'+ toppData.cartToppQty +'</span>' +
						   '<span class="price">x '+ toppData.cartToppPrice +'원' +
						   '<a href="#" onclick="fnClearToppItem($(this), \''+mCode+'\' , \''+menuCount+'\')" class="btn_menu_del">'+
						   '<img src="'+root+'/assets/img/order/btn_item_del.png" alt="삭제" /></a>'+
						   '</span><input type="hidden" class="toppEaAmt" name="toppEaAmt" value="'+eaTotPrc +'"/></li>';
	 					   '</ul>';
	 			$("#"+listId).append(listItem);
	 		}
	 	}

	 	//마이너스 토핑  
		function fnMinusAppend( )
		{
	 		var listItem    = "";
	 		var topp_m_list = $("#"+listId).find("ul.topp_m");
	 		
	 		if( topp_m_list.size() > 0 )
	 		{
	 			listItem = ', <span class="'+toppData.cartToppItemCode +'">'+ toppData.cartToppName +'</span>';
	 			topp_m_list.find("li .name").append(listItem);
	 		}
	 		else
	 		{
	 			listItem = '<ul class="topp_m">'+ 
						   '<li><span class="name"><span class="'+toppData.cartToppItemCode +'">'+ toppData.cartToppName +'</span></span>'+
						   '<span class="del"><a href="#" onclick="fnClearToppAll($(this), \''+mCode+'\' )"  class="btn_menu_del">'+
						   '<img src="'+root+'/assets/img/order/btn_item_del.png" alt="삭제" /></a>'+
						   '</span></li></ul>';
				$("#"+listId).append(listItem);
	 		}
		}  
	}
	/* append_topp_p 끝*/

	//세션에서 토핑정보 1줄 삭제 : minus토핑 타입
	function fnClearToppAll($this, mCode)
	{  
    	$.post(root+"/order/newCart.jsp?flagCart=removeToppMinusItem&nCode="+ mCode + "&tType=minus",
		function(data){ 
    		//정상적으로 서버통신 된 후 화면에서 삭제 
	    	fnRemoveToppItem($this );
		});
	}

    //장바구니 합계에서 뺄 토핑 가격 계산
	//20140311 장바구니의 해당 메뉴 수량 곱해서 빼기
	function fnCalculMinusToppPrice(price, count, menuCount)
	{
	 	var toppPrc = 0;
	 	
		toppPrc -=  parseInt(price.replace("원", ""))  *  parseInt(count)*  parseInt(menuCount);

	 	setTotalPrc(toppPrc, 1);
    } 
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/*
	 *20140311 장바구니에서 직접 토핑을 지우는 경우만 해당 (토핑 삭제버튼)
		 	
		//세션에서 토핑정보 1개 삭제 : plus토핑 타입
		function fnClearToppItem( $this , mCode)
		{  
			var toppId = $this.parent().parent().attr("class"); 
		    	
		    $.post(root+"/order/newCart.jsp?flagCart=removeToppPlusItem&nCode="+  mCode + "&tId=" + toppId, 
		    			function(data){ 
						//정상적으로 서버통신 된 후 화면에서 삭제 
			}); 
		 	//토핑가격 장바구니 총액서 빼기
		 	var price = $this.parent().parent().find(".price").text().replace("x", "");
		 	var count = $this.parent().parent().find(".topCnt").text();
		 	
		 	fnCalculMinusToppPrice(price, count);
			 	
	    	fnRemoveToppItem($this );
	    }

		 장바구니 화면에서 바로 토핑 지우기 
		function fnRemoveToppItem($this)
		{
		 	if( $this.parent().parent().parent().find("li").size() == 1 )
		 	{
				$this.parent().parent().parent().remove();
			}
		 	else
		 	{
				//자기 자신 li만 지우기
				$this.parent().parent().remove();
			} 
		}
	*/
	