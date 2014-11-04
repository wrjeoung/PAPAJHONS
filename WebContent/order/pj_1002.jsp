<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript" src="../assets/js/json2.js"></script>
<script type="text/javascript" src="../assets/js/cart.js"></script>
<script type="text/javascript" src="../assets/js/topping.js"></script>
<script type="text/javascript">
    var root = ""; 
	var sessionOrdInfo = null;
	var toPrc = 0;  //�ʱⰪa  //��ٱ��� ���� �ݾ�
	
	head_title("ORDER");
	
 	//������ ���۽� ó��
    $(document).ready(function()
    {
	 	//������ ���� �÷ε� �̹��� �����
	 	$('#viewLoading').hide();
	 	/* $('#viewLoading')	// ajax ���� �� �Ϸ�� 'Loading �̹���'�� ���� ��Ʈ���ϱ�
		.ajaxStart(function()
		{
			$(this).fadeIn(500);
		})
		.ajaxStop(function()
		{
			$(this).fadeOut(500);
		}); */
	 
 		// �޴�����Ʈ ������ �󼼼���
 		/* 20130926 �ɼǺ��� �ڸ�Ʈ �߰� */
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
				$(".spcInstructions").find("span").each(function() { $(this).text("��"); }	);
				$(".option").slideUp();	//�ȿ� ��ó���ִ� �ɼǵ�
				box.stop().slideUp(); 
 				$(this).find("img").attr("src",root+"../assets/img/order/btn_opt_off.gif"); 
			}
 			
 		} 

 		// ����/üũ�ڽ� ��ư ��Ÿ�� ����
 		$('#menuList_section .item').addClass('has-js');
 		$('.menu_size_radio').click(function(){
			$(this).parent().find('.menu_size_radio').removeClass("r_on");
			ra_check($(this));
 		});
 		$('.menu_opt_radio').click(function(){  
       		set_opt_radio($(this));
   		}); 
 		//���� ��ư �ʱⰪ default ����
 		//$(".option_box .spcInstructions .option").each(function(i){
		
		/* $(".spcInstructions .option").each(function(i){
		  	var $btn = $(this).find(".menu_opt_radio").eq(0);  
		  	set_opt_radio($btn);	  
	  	}); */
 		fnReset_spcOption();
 	    opt_cont_reset();
 	}); 
 		
 		
	// 20140702 �̺�Ʈ ȭ�鿡�� ��ũ�� �� ��� ���θ�� ȭ������ �ٷ� ����
	// ��ũ url : "root/order.jsp?step=promotion"
	//20140703 ���θ�� ��ũ�� ������ ��� URL �Ķ���� �߰� 
	if( 10== "00" ) 
	{
		fnViewDiv("prom");
	}
 			
 	//20140730 8�� ���� ���θ�� �˸� �߰�
 	var sysDate = parseInt( "201410291437".substring(0, 8) );
 	if(sysDate >= "20140801" && sysDate <= "20140831")
 	{
	 	popup("#pop_guide_coupon");
		$("#pop_guide_coupon").find("button").focus();		
 	}
 		
 	//////////////////////////////////////////////	
 	//20140129 ����
 	function fnReset_spcOption_up($this){
 		fnReset_spcOption();
 		//alert($this.parent().parent().next().attr("class"));
 		var box = $this.parent().parent().parent().find(".option_box");
 		if($this.parent().next().hasClass("half_option_box"))
 		{
 			box = $this.parent().next();
 		}
 		
 		// 20140619 ���θ�� �����޴� �ɼ� �߰�
 		if( $this.parent().next().hasClass("prom_option_box") )
 		{
 			box = $this.parent().next();
 		}
 		
 		if( box.css("display") == 'block' )
		{
			$(".spcInstructions").find("span").each(function() { $(this).text("��"); }	);
			$(".option").slideUp();	//�ȿ� ��ó���ִ� �ɼǵ�
			box.stop().slideUp(); //�ش� �޴��� �ɼǹڽ��� : �������� �Ǵ� ���ڹڽ�
			
			$(".option_box").slideUp();	//��� �ɼǹڽ�
			$(".spcInstruction").find(".btn img").attr("src",root+"../assets/img/order/btn_opt_off.gif");	//���ڹڽ�(��ǰ)�ΰ�츸 
		}
 	}
 	
 	//spcInstructions �����ϱ�!! (�ʱ�ȭ)
    function fnReset_spcOption(){
		$(".spcInstructions .option").each(function(i){
		  	var $btn = $(this).find(".menu_opt_radio").eq(0);  
		  	set_opt_radio($btn);	  
	  	});
	}	
    //�ɼǶ��� ��ư üũ�� ����
	function set_opt_radio(radio_btn)
    {
		radio_btn.parent().find('.menu_opt_radio').removeClass("r_on");
		radio_btn.find('input').removeAttr("checked");
		radio_btn.addClass("r_on");
		radio_btn.find("input").attr("checked","checked");
	} 	
    // �ɼǿ� ���� ������ �ʱ�ȭ
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
    	
    	//��ٱ��� ���� ȭ�� ������¡
    	contents_resize();
    }	


    // �¶��θ޴��׷캰 �޴��׷� �˻�
	function fnSelMenuGroup(pizzaSelIdx, onlineGroupCd)
    {	
    	document.frmOrder.onlineGroupCd.value = onlineGroupCd;  // �¶��θ޴��׷�
    	document.frmOrder.pizzaSelIdx.value   = pizzaSelIdx;    // �������ڱ׷�޴�
    	document.frmOrder.action              = "orderAction.action";
    	document.frmOrder.target              = "_self";
    	document.frmOrder.submit();
	}      
    
    
    // ��Ʈ�޴�, ����&����, E���� ȭ��ǥ�� �� �˻�
    function fnViewDiv(val)
    {
    	var listDiv   = document.getElementById("menuList_section");  // �޴�
    	var setDiv    = document.getElementById("set_section");       // ��Ʈ�޴�
    	var halfDiv   = document.getElementById("half_section");      // ����&����
    	var couponDiv = document.getElementById("ecoup_section");     // E����
    	var platDiv   = document.getElementById("plat_section");      // �����÷��� 
    	
    	// 20140616 ���θ�� �޴� ȭ�� ȣ��
    	var promDiv   = document.getElementById("prom_section");      // ���θ�� �޴� 

    	if( val == "set" )
    	{
    		fnSelSetMenu();  // ��Ʈ�޴� �˻�
    		
    		listDiv.style.display   = "none";
    		setDiv.style.display    = "block"; 
    		halfDiv.style.display   = "none";
			couponDiv.style.display = "none";
			platDiv.style.display   = "none";
    		promDiv.style.display   = "none";
    	} 
    	else if( val == "half" )
    	{
    		fnSelHalfAndHalf();  // ����&���� �˻�
    		
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
    	else if( val == "plat" ) // 20140424 �׽�Ʈ �� �����÷��� 
    	{
    		
    		fnPaPaPlat("11");  // 20140424 �����÷���	
    	
    		listDiv.style.display   = "none";
    		setDiv.style.display    = "none";
    		halfDiv.style.display   = "none";
			couponDiv.style.display = "none";
			platDiv.style.display   = "block";
    		promDiv.style.display   = "none";
    	}
    	// 20140616 ���θ�� �޴� ȭ�� ȣ��
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
    
    
 	// ��Ʈ�޴� �˻�
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
				//����� �����Ҷ� ó��             
				$('#viewLoading').show().fadeIn(500);          
			},
	   		complete: function() 
			{             
				//����� �Ϸ�� �� ó��              
				$('#viewLoading').fadeOut();  
				contents_resize();
			},
	   		success:function(data)
	   		{
	   			if( trim(data) != "" && trim(data) != null && trim(data) != "NO" && trim(data) != "]" )
	   			{
		   			var receiveData = trim(data);
					//��Ʈ�� �����͸� ���̽� ������Ʈ�� ����
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
							html += '<p class="btn_cart" onclick="fnAddSet($(this),\''+setMenuInfo[i].menuCode+'\',\''+setMenuInfo[i].menuDivCode+'\',\''+setMenuInfo[i].menuLagCode+'\',\''+setMenuInfo[i].menuMidCode+'\',\''+setMenuInfo[i].menuSmlCode+'\',\''+setMenuInfo[i].menuSubCode+'\');"><button type="button">��ٱ��Ͽ����</button></p>';
							html += '<p class="description"><img src="../assets/img/order/ord_menuList_size_set.png" alt="������Ʈ" title="������Ʈ"/>�� <br>';  
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
							html += '<p style="width:40px; position:absolute; top:10px; left:140px;">���� : </p>';
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
			   			$menu_sect.append("�ֹ� ������ �޴��� �����ϴ�.");
					}
	   			}
	   			else
	   			{
	   				$menu_sect.contents().remove();
	   				$menu_sect.append("�ֹ� ������ �޴��� �����ϴ�.");
	   			} 	 
   			}
   		});
    	
    }
 	
 	// 20140424 �����÷���
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
				//����� �����Ҷ� ó��             
				$('#viewLoading').show().fadeIn(500);          
			},
	   		complete: function() 
			{             
				//����� �Ϸ�� �� ó��              
				$('#viewLoading').fadeOut();  
				contents_resize();
			},
	   		success:function(data)
	   		{
	   			if( trim(data) != "" && trim(data) != null && trim(data) != "NO" && trim(data) != "]" )
	   			{
		   			var receiveData = trim(data);

		   			//��Ʈ�� �����͸� ���̽� ������Ʈ�� ����
					var platMenuInfo = $.parseJSON(receiveData);
					
					$plat_sect.contents().remove();
					 
					if( platMenuInfo.length > 0 )
					{
						for( var i = 0; i < platMenuInfo.length; i++ )
						{
							var mIndex = i+1;
							
							// ��ǰ��ǰ����
							var platMenuHiddenVal = platMenuInfo[i].menuCode+","+platMenuInfo[i].menuName+","+platMenuInfo[i].menuSizeKor+","+platMenuInfo[i].menuSaleAmt+","+platMenuInfo[i].menuDough+","+platMenuInfo[i].menuLagCode+","+platMenuInfo[i].menuMidCode+","+platMenuInfo[i].menuSmlCode+","+platMenuInfo[i].menuSubCode+","+platMenuInfo[i].menuDivCode; 
						
//							console.log(platMenuInfo[i]);
							
							var html = '';

							//html  = '<div class="item has-js" id="menu_'+ mIndex +'"> ';
							html  = '<div class="item has-js" id="menu_'+ platMenuInfo[i].menuCode +'"> '; // �������� �޴��ڵ�� ����
							html += '<p class="image" >';
							html += '<img src="/assets/img/order/menu/' + platMenuInfo[i].menuGroupCd + '/' + platMenuInfo[i].menuMidCode + '_ord.png" width="220" height="140" alt="'+ platMenuInfo[i].menuName +'" title="'+ platMenuInfo[i].menuName +'" /></p>';
							//html += '<p class="name" id="pName_'+ mIndex +'">'+platMenuInfo[i].menuName +" "+ platMenuInfo[i].menuSize +'<span class="size">(BOX)</span></p>';
							html += '<p class="name" id="pName_'+ platMenuInfo[i].menuCode +'">'+platMenuInfo[i].menuName +" "+ platMenuInfo[i].menuSizeKor +'<span class="size">(BOX)</span></p>';
							html += '<p class="btn_cart" onclick="fnAddSet($(this), \''+ platMenuHiddenVal +'\', \'\', \'\', \'\', \'\', \'\');""><button type="button">��ٱ��Ͽ����</button></p>';
							html += '<p class="description"><img src="/assets/img/order/ord_menuList_size_box.png" alt="�÷��ͼ�Ʈ"/>���� <br>';  
							html += '<span> :' + platMenuInfo[i].menuDesDtl ;
							html += '</span></p><div class="size_prc">'; 
	                        html += '<p class="price">' + setComma(platMenuInfo[i].menuSaleAmt)+' </p>';
							html += '<p style="width:40px; position:absolute; top:10px; left:140px;">���� : </p>';
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
			   			$plat_sect.append("�ֹ� ������ �޴��� �����ϴ�.");
					}
	   			}
	   			else
	   			{
	   				$plat_sect.contents().remove();
	   				$plat_sect.append("�ֹ� ������ �޴��� �����ϴ�.");
	   			} 	 
   			}
   		});
    }
 	
 	
 	// ����&���� �˻� _ ����&���� ������ ���� Combo List ���� 	
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
				//����� �����Ҷ� ó��             
				$('#viewLoading').show().fadeIn(500);          
			}
    		,complete : function() 
    		{             
				//����� �Ϸ�� �� ó��              
				$('#viewLoading').fadeOut();         
			}
    		,success : function(data)
    		{
    			var str = "<option value=''>���� ����� �������ּ���.</option>";			
    			for( var i = 0; i < data.half.length; i++ )
    			{
    				var d= data.half[i];
    				str = str + "<option value='" + d.code + "'>" + d.name + "</option>";				
    			}					
    			$("#pro_size").html(str);
    		}
    	});
    	
    	$("#half1 option").remove();
    	var str = "<option value=''>����1 �������ּ���.</option>";		
		$("#half1").html(str);
		
		$("#half2 option").remove();
    	var str = "<option value=''>����2 �������ּ���.</option>";		
		$("#half2").html(str);
    	
		fnClearHalfAndHalf(1);
		fnClearHalfAndHalf(2);
    	
    }
 	

 	// ����&���� �˻� _ ����&���� ���� ���ڼ��� Combo List ����
    function fnSelLeftHalfAndHalf(val)
    {
    	
    	$("#half2 option").remove();
    	var str = "<option value=''>����2 �������ּ���.</option>";		
		$("#half2").html(str);
		
    	$(".right").find(".select_price").text("");
    	
    	//fnClearHalfAndHalf(1);
		//fnClearHalfAndHalf(2);
		//2014.02.18. ����&���� ������ ���ö� ���� ������ ��� �ʱ�ȭ 
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
					//����� �����Ҷ� ó��             
					$('#viewLoading').show().fadeIn(500);          
				}
		   		,complete : function() 
		   		{             
					//����� �Ϸ�� �� ó��              
					$('#viewLoading').fadeOut(); 
				}
		   		,success : function(data)
		   		{
		   			var str = "<option value=''>����1 �������ּ���.</option>";
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
    
    
 	// ����&���� �˻� _ ����&���� ���� ���ڼ��� ����ǰ�� üũ
    function fnSelRightHalfAndHalf(val,num)
    {
    	
    	$(".right").find(".select_price").text("");
		fnClearHalfAndHalf(2);

    	var code = $("#pro_size").val();  // �޴��Һз��ڵ�, �޴����з��ڵ�
    	
    	var array1 = new Array();
    	var array2 = new Array();
    	array1 = code.split(",");  // �޴��Һз��ڵ�, �޴����з��ڵ�
    	array2 = val.split(",");   // �޴��ߺз��ڵ�
    	
    	var $ord_info = $("#ord_optInfo_section");
		var storeCode = document.frmOrder.cartOrdStoreCode.value;  // �����ڵ�
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
							alertFrame.find("#alertText").append("<p>�����Ͻ� �޴���<br>\"" + storeName.text() +"\"������ ���� �ֹ��� �Ұ����մϴ�.</p>").css("line-height","35px"); 
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
 	
 	
 	// ����&���� �˻� _ ����&���� ������ ���ڼ��� Combo List ����
 	//                  ����&���� ���� ���ڼ��� Image ǥ��
    function fnSelRightHalfAndHalfComp(val,num)
    {
    	
    	$(".right").find(".select_price").text("");
		fnClearHalfAndHalf(2);

    	var imgSrc = "";
    	var $img = $("#half1Img");
    	var code = $("#pro_size").val();  // �޴��Һз��ڵ�, �޴����з��ڵ�
    	
    	var array1 = new Array();
    	var array2 = new Array();
    	array1 = code.split(",");  // �޴��Һз��ڵ�, �޴����з��ڵ�
    	array2 = val.split(",");   // �޴��ߺз��ڵ�
    	
   		if( code != "" && val != "" )
    	{
    		var doughType = array1[1];   
    		var errorSrc = "/assets/img/order/menu/55/error_img.png";
	        	
        	imgSrc = "/assets/img/order/menu/55/"+ doughType + "/half_" + array2[0] + "_ord.png";
        	$img.html('<img src="'+ imgSrc + '" alt="' + array2[0] + '" onerror="this.src=\''+errorSrc+'\'"/>');
	        	
        	$(".plus").find("img").show();  // (+)�׸�ǥ��
	    		
        	//������ ���� �ҷ�����
	     	$.ajax(
	     	{ 
	 	   		type       : 'post',
	 	   		data       : "flag=right&val="+val+"&code="+code,
		   		url        : "/order/half.jsp",
		   		dataType   : "json",
				beforeSend : function() 
				{              
					//����� �����Ҷ� ó��             
					$('#viewLoading').show().fadeIn(500);          
				}
		   		,complete : function() 
		   		{             
					//����� �Ϸ�� �� ó��              
					$('#viewLoading').fadeOut(); 
				}
		   		,success : function(data)
		   		{
	 	   			var str = "<option value=''>����2 �������ּ���.</option>";			
	 	   			for( var i = 0; i < data.left.length; i++ )
	 	   			{
	 	   				var d= data.left[i];
	 	   				str = str + "<option value='" + d.code+","+ d.img + "'>" + d.name + "</option>";				
	 	   			}	
	 	   			$("#half2").html(str);

	 	   			fnSelMenuHalfAndHalf(val, num);  // ����&���� �˻� _ ����&���� ���ڼ��� �޴� �˻�
	   		 	}
	   		});
    	}
    	else
    	{
    		fnClearHalfAndHalf(1);
    		fnClearHalfAndHalf(2);
   		}
    	
    }
 	
 	
 	// ����&���� �˻� _ ����&���� ������ ���ڼ��� Image ǥ��
    function fnSelImageHalfandHalf(val, num)
    {
		var code = $("#pro_size").val();  // �޴��Һз��ڵ�, �޴����з��ڵ�
		
    	var array1 = new Array();
    	var array2 = new Array();
    	array1 = code.split(",");  // �޴��Һз��ڵ�, �޴����з��ڵ�
    	array2 = val.split(",");   // �޴��ߺз��ڵ�
    	
    	var $ord_info = $("#ord_optInfo_section");
		var storeCode = document.frmOrder.cartOrdStoreCode.value;  // �����ڵ�
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
							alertFrame.find("#alertText").append("<p>�����Ͻ� �޴���<br>\"" + storeName.text() +"\"������ ���� �ֹ��� �Ұ����մϴ�.</p>").css("line-height","35px"); 
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
 	
 	
 	// ����&���� �˻� _ ����&���� ������ ���ڼ��� Image ǥ��
    function fnSelImageHalfandHalfComp(val, num)
    {
    	var imgSrc = "";
    	var $img = $("#half2Img");
		var code   = $("#pro_size").val();  // �޴��Һз��ڵ�, �޴����з��ڵ�
		
    	var array1 = new Array();
    	var array2 = new Array();
    	array1 = code.split(",");  // �޴��Һз��ڵ�, �޴����з��ڵ�
    	array2 = val.split(",");   // �޴��ߺз��ڵ�
    	
    	if( $("#half1").val() != "" && $("#pro_size").val() != "" )
    	{
    		if( val != "" )
    		{
        		var doughType = array1[1];  
        		var errorSrc = "/assets/img/order/menu/55/error_img.png";
	        		
        		imgSrc = "/assets/img/order/menu/55/"+ doughType + "/half_" + array2[0] + "_ord.png";
        		$img.html('<img src="'+ imgSrc + '" alt="' + array2[0] + '" onerror="this.src=\''+errorSrc+'\'"/>');
		    		
    			fnSelMenuHalfAndHalf(val, num);  // ����&���� �˻� _ ����&���� ���ڼ��� �޴� �˻�
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
 	
 	
 	// ����&���� �˻� _ ����&���� ���ڼ��� Combo List �ʱ�ȭ
    function fnClearHalfAndHalf(num)
    {
    	var sel0 = $("#pro_size").val();  // ��� 
    	var sel1 = $("#half1").val();     // ���� 
    	var sel2 = $("#half2").val();     // ������
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
	    	var str = "<option value=''>����1 �������ּ���.</option>";		
			$("#half1").html(str);
			
			$("#half2 option").remove();
	    	var str = "<option value=''>����2 �������ּ���.</option>";		
			$("#half2").html(str);
    	}
    	else if( sel0 != "" && sel1 == "" )
    	{
    		$("#half2 option").remove();
	    	var str = "<option value=''>����2 �������ּ���.</option>";		
			$("#half2").html(str);
    	}
    	
    }
 	
 	// ����&���� ������ ���� �� ���� ������ Combo List �ʱ�ȭ
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
    	var str = "<option value=''>����1 �������ּ���.</option>";		
		$("#half1").html(str);
		
		$("#half2 option").remove();
    	var str = "<option value=''>����2 �������ּ���.</option>";		
		$("#half2").html(str);
 	}
 	
 	
 	// ����&���� �˻� _ ����&���� ���ڼ��� �˻� (ǰ������, �Ǹſ���)
 	function fnChkStoreMenuHalfAndHalf(mCode, sCode, dCode)
  	{
    	var $ord_info = $("#ord_optInfo_section");
		var storeCode = document.frmOrder.cartOrdStoreCode.value;  // �����ڵ�
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
						alert("�����Ͻ� ��ǰ�� ["+ storeName.text() +"]���� �ֹ��Ͻ� �� �����ϴ�.");
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

 	
 	// ����&���� �˻� _ ����&���� ���ڼ��� �޴� �˻�
    function fnSelMenuHalfAndHalf(val, num)
    {
    	
    	var code    = $("#pro_size").val();             // �޴��Һз��ڵ�, �޴����з��ڵ�
    	var $menuNm = $(".half"+num).find(".name");     // �޴��̸�
    	var $price  = $(".half"+num).find(".price");    // ����
    	var $won    = $(".half"+num).find(".t_block");  // ����ǥ��
    	
        $.ajax(
        { 
	 	   	type       : 'post',
	 	   	data       : "flag=menu&code="+code+"&val="+val,
		   	url        : "/order/half.jsp",
		   	dataType   : "json",
			beforeSend : function() 
			{              
				//����� �����Ҷ� ó��             
				$('#viewLoading').show().fadeIn(500);          
			},
		   	complete : function() 
		   	{             
				//����� �Ϸ�� �� ó��              
				$('#viewLoading').fadeOut();
				fnCompPriceHalfAndHalf();  // ����&���� �˻� _ ����&���� ���ø޴� �����ջ� ǥ��
			},
		   	success : function(data)
		   	{
	 	   		var d= data.halfMenu[0];
	 	   		$menuNm.text(d.menuMidName);	
	 	   		$price.text( won(d.menuSaleAmt));
	 	   		$won.text("��");
	 	   					
	 	   		//���ۿ� �� ����
	 	   		$("#halfMenuCode"   +num).val(d.menuCode   );  // �����޴��ڵ�       : num = 1 -> (����), num = 2 -> (������)
	 	   		$("#halfMenuName"   +num).val(d.menuName   );  // �����޴���         : num = 1 -> (����), num = 2 -> (������)
	 	   		$("#halfMenuLagCode"+num).val(d.menuLagCode);  // �����޴���з��ڵ� : num = 1 -> (����), num = 2 -> (������)
	 	   		$("#halfMenuMidCode"+num).val(d.menuMidCode);  // �����޴��ߺз��ڵ� : num = 1 -> (����), num = 2 -> (������)
	 	   		$("#halfMenuSmlCode"+num).val(d.menuSmlCode);  // �����޴��Һз��ڵ� : num = 1 -> (����), num = 2 -> (������)
	 	   		$("#halfMenuSubCode"+num).val(d.menuSubCode);  // �����޴����з��ڵ� : num = 1 -> (����), num = 2 -> (������)
	 	   		$("#halfMenuPrice"  +num).val(d.menuPrice  );  // �����޴��ܰ�       : num = 1 -> (����), num = 2 -> (������)
	 	   		$("#halfMenuQty"    +num).val("0.5"        );  // �����޴�����       : num = 1 -> (����), num = 2 -> (������)
	 	   		$("#halfMenuAmt"    +num).val(d.menuSaleAmt);  // �����޴��ݾ�       : num = 1 -> (����), num = 2 -> (������)
	 	   		$("#halfMenuSize"   +num).val(d.menuSize   );  // �����޴�������     : num = 1 -> (����), num = 2 -> (������)
	 	   		$("#halfMenuDough"  +num).val(d.menuDough  );  // �����޴���������   : num = 1 -> (����), num = 2 -> (������)
			},
			error:function(request,status,error)
			{   
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			}
	   	});
   		
    }
    
 	// ����&���� �˻� _ ����&���� ���ø޴� �����ջ� ǥ��
    function fnCompPriceHalfAndHalf()
    {
    	
    	var halfPrcVal1 = $("#halfMenuAmt1").val();
		var halfPrcVal2 = $("#halfMenuAmt2").val();
		
		if( $("#half1").val() != "" && $("#half2").val() != "" && $("#pro_size").val() != "" )
		{
			var completPrc = won( (parseInt(halfPrcVal1)+parseInt(halfPrcVal2)).toString() );
			$(".right").find(".select_price").text( completPrc.replace("��", ""));
			$(".half_spcInstruction").css("display","block");
		}
    }
 	
 	
 	// E���� �˻�
    function fnSelECoupon(code)
    {
    	
    	if( $("#coup_id").val() == "" || $("#coup_id").val() == null )
    	{
			var alertFrame = $("#notice_1002");
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>�����Ͻ� ������ȣ�� ���� �Է� ��<br>��ȸ��ư�� ���� �ּ���!</p>").css("line-height","35px"); 
			popAlert(alertFrame);
    		
			$("#coup_id").focus();
    		return;
    	}

    	// ȭ�� Clear
		$("#eCouponCompany").val("");  // E�������޻�
		$("#eCouponCode"   ).val("");  // E�����ڵ�
		$("#eCouponName"   ).val("");  // E������
	    $("#eCouponNumber" ).val("");  // E������ȣ
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
  				//����� �����Ҷ� ó��             
  				$('#viewLoading').show().fadeIn(500);          
  			},
			complete : function() 
			{             
  				//����� �Ϸ�� �� ó��              
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
  			    	// ������ȣ ó��3�ڸ��� �߶� üũ
  			    	var couponNumber = $("#coup_id").val().substring(0, 3);
  					if( couponNumber == "800" )
  					{
  						fnSelInterfaceCoopmarket();  //  E���� �˻� ���������� �������̽� ó��
  					}
  					else if( couponNumber == "900" )
  					{
  						fnSelInterfaceGiftshow();  //  E���� �˻� ����Ƽ�� �������̽� ó��
  					}
  					else
  					{
  						fnSelInterfacePapajohns();  //  E���� �˻� �������� �������̽� ó��
  					}
  				}
  			}
  		});
    	
    }


	//  E���� �˻� ���������� �������̽� ó��
 	function fnSelInterfaceCoopmarket()
    {
    	
    	var command    = "L0";                 // ó����û�ڵ� L0 : ������ȸ  L1 : ��������  L2 : �����������
    	var couponNo   = $("#coup_id").val();  // ������ȣ
    	//var branchCode = "1234567890";         // �����ڵ�(���ð�)
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
  				//����� �Ϸ�� �� ó��              
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
			        fnSelECouponMenu(menuCode);  // E���� �޴� �˻�
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

 	
 	// E���� �˻� ����Ƽ�� �������̽� ó��
    function fnSelInterfaceGiftshow()
    {
    	
    	var command    = "100";                         // ����ڵ� : 100=������ȸ, 101=�������ο�û, 102=������ҿ�û
    	var couponNo   = $("#coup_id").val();           // ������ȣ
		var branchCode = $("#cartOrdStoreCode").val();  // �����ڵ�
    	
    	$.ajax(
    	{
			url      : "/order/couponCheck.jsp?flag=giftiShow&command="+command+"&couponNo="+couponNo+"&branchCode="+branchCode,
  			dataType : "json",
  			type     : "post",
			complete : function() 
			{             
  				//����� �Ϸ�� �� ó��              
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
			        fnSelECouponMenu(menuCode);  // E���� �޴� �˻�
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
 	
 	
	//  E���� �˻� �������� �������̽� ó��
    function fnSelInterfacePapajohns()
    {
    	var couponNo = $("#coup_id").val();  // ������ȣ
    	
    	$.ajax(
    	{
    		url      : "/order/couponCheck.jsp?flag=papajohns&couponNo="+couponNo,
    		dataType : "json",
    		type     : "post",
			complete : function() 
			{             
  				//����� �Ϸ�� �� ó��              
  				$('#viewLoading').fadeOut();         
  			},
    		success  : function(data)
    		{
				var returnValue = data.papajohns[0];
				
  				if( returnValue.resultCode == "11" )
  				{
					popAlert("#notice_eCopErr"); //����
  				}
				else if( returnValue.resultCode == "22" )
				{
					popAlert("#notice_eCopUse"); //���
				}
				else if( returnValue.resultCode == "33" )
				{
					popAlert("#notice_eDate"); //�Ⱓ����
				}
				else if( returnValue.resultCode == "00" ) //����
  				{
					var image      = $("#ecoup_section .right img");
			    	image.attr("src", "/assets/img/order/menu/eCoupon_img_default.png");

			    	var menuCode = returnValue.menuCode;
			    	
			        fnSelECouponMenu(menuCode);  // E���� �޴� �˻�
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
 	
 	
 	// E���� �޴� �˻�
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
				//����� �����Ҷ� ó��             
				//$('#viewLoading').show().fadeIn(500);          
			},
	   		complete: function() 
			{             
				//����� �Ϸ�� �� ó��              
				$('#viewLoading').fadeOut();  
			},
	   		success:function(data)
	   		{
	   			if( trim(data) != "" && trim(data) != null && trim(data) != "NO" && trim(data) != "]" )
	   			{
		   			var receiveData = trim(data);
					//��Ʈ�� �����͸� ���̽� ������Ʈ�� ����
					var setMenuInfo = $.parseJSON(receiveData); 
					
					$menu_sect.find(".eCouponDetail").remove();
					 
					if( setMenuInfo.length > 0 )
					{
						for( var i = 0; i < setMenuInfo.length; i++ )
						{
		  	  				$("#ecopMenuCode"   ).val(setMenuInfo[i].menuCode   );  // E�����޴��ڵ�
		  	  				$("#ecopMenuName"   ).val(setMenuInfo[i].menuName   );  // E�����޴���
		  	  				$("#ecopMenuDivCode").val(setMenuInfo[i].menuDivCode);  // E�����޴������ڵ�
		  	  				$("#ecopMenuLagCode").val(setMenuInfo[i].menuLagCode);  // E�����޴���з��ڵ�
		  	  				$("#ecopMenuMidCode").val(setMenuInfo[i].menuMidCode);  // E�����޴��ߺз��ڵ�
		  	  				$("#ecopMenuSmlCode").val(setMenuInfo[i].menuSmlCode);  // E�����޴��Һз��ڵ�
		  	  				$("#ecopMenuSubCode").val(setMenuInfo[i].menuSubCode);  // E�����޴����з��ڵ�
		  	  				$("#ecopMenuPrice"  ).val(setMenuInfo[i].menuPrice  );  // E�����޴��ܰ�
		  	  				$("#ecopMenuDiscAmt").val(setMenuInfo[i].menuDiscAmt);  // E�����޴����αݾ�
		  	  				$("#ecopMenuSaleAmt").val(setMenuInfo[i].menuSaleAmt);  // E�����޴��Ǹűݾ�
		  	  				$("#ecopMenuSize"   ).val(setMenuInfo[i].menuSize   );  // E�����޴�������
							$("#eCouponCompany" ).val(setMenuInfo[i].couponComp );  // E�������޻�
							$("#eCouponCode"    ).val(setMenuInfo[i].couponCode );  // E�����ڵ�
							$("#eCouponName"    ).val(setMenuInfo[i].couponName );  // E������
						    $("#eCouponNumber"  ).val($("#coup_id").val()       );  // E������ȣ
						    
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
 	
 	
	/********************* ��ٱ��� ������ ������ ����� *********************/  // Rjeong
	// ���� : pizzaMenu_9999 / ��Ʈ : setMenu_ /���̵� : sideMenu_9999 /���� : etcMenu_99999 /���������� : halfMenu_ /e���� : couponMenu_
    //num : ī�װ��� ��ǰ �ε���
    function makeSendData(menuIdx)
	{ 

    	document.frmOrder.cartAction.value         = "";  // ��ٱ���ó��
    	document.frmOrder.cartMenuType.value       = "";  // �޴�Ÿ��
    	document.frmOrder.cartMenuCode.value       = "";  // �޴��ڵ�
    	document.frmOrder.cartMenuName.value       = "";  // �޴���
    	document.frmOrder.cartMenuOrdCode.value    = "";  // �޴��ֹ������ڵ�(10:����,20:����,30:����(����))
    	document.frmOrder.cartMenuDivCode.value    = "";  // �޴������ڵ�(10:��ǰ,20:��Ʈ,30:����&����)
    	document.frmOrder.cartMenuLagCode.value    = "";  // �޴���з��ڵ�
    	document.frmOrder.cartMenuMidCode.value    = "";  // �޴��ߺз��ڵ�
    	document.frmOrder.cartMenuSmlCode.value    = "";  // �޴��Һз��ڵ�
    	document.frmOrder.cartMenuSubCode.value    = "";  // �޴����з��ڵ�
    	document.frmOrder.cartMenuPrice.value      = "";  // �޴��ֹ��ܰ�
    	document.frmOrder.cartMenuQty.value        = "";  // �޴��ֹ�����
    	document.frmOrder.cartMenuAmt.value        = "";  // �޴��ֹ��ݾ�
    	document.frmOrder.cartMenuDisRate.value    = "";  // �޴�������
    	document.frmOrder.cartMenuDisAmt.value     = "";  // �޴����αݾ�
    	document.frmOrder.cartMenuCopDisAmt.value  = "";  // �޴���������������
    	document.frmOrder.cartMenuNetSaleAmt.value = "";  // �޴�������ݾ�
    	document.frmOrder.cartMenuPayAmt.value     = "";  // �޴������ݾ�
    	document.frmOrder.cartMenuBakeCode.value   = "";  // �޴�����ũ�ڵ�
    	document.frmOrder.cartMenuCutCode.value    = "";  // �޴����ڵ�
    	document.frmOrder.cartMenuCheeseCode.value = "";  // �޴�ġ���ڵ�
    	document.frmOrder.cartMenuSauceCode.value  = "";  // �޴��ҽ��ڵ�
    	document.frmOrder.cartMenuMessage.value    = "";  // �޴����޸޼���
    	document.frmOrder.cartMenuSize.value       = "";  // �޴�������
    	document.frmOrder.cartMenuDough.value      = "";  // �޴���������
    	document.frmOrder.cartECouponCompany.value = "";  // E�������޻�
    	document.frmOrder.cartECouponCode.value    = "";  // E�����ڵ�
    	document.frmOrder.cartECouponNumber.value  = "";  // E������ȣ

     	var cartSendDataInfo = null;                                            // ��ٱ��� ���� ����
    	var checkMenuSize    = document.getElementsByName("pSize_" + menuIdx);  // ������ ���� ������ üũ
    	var selMenuValue     = document.getElementsByName("pCode_" + menuIdx);  // ������ ���� �޴� 
    	var cartIndex        = setCartIndex();	                                 // ��ٱ��� ����
     	
     	// ���ڸ޴��� �ƴ� ��� �ش� �޴� ����
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
     	
    	// �޴� ������ ������ŭ üũ�Ѵ�.(���ں��� �����Ǵ� ��������� Ʋ��)
    	for( var i = 0; i < checkMenuSize.length; i++ )
    	{
    		//���� ��ư�� üũ�����̸� �޴����� ����
    		if( checkMenuSize[i].checked == true )
    		{
    			var menuList  = selMenuValue[i].value;
    			var menuValue = menuList.split(",");
    			
    			document.frmOrder.cartAction.value         = "addMenu";                       // ��ٱ���ó��
    	    	document.frmOrder.cartMenuType.value       = "";                              // �޴�Ÿ��
    	    	document.frmOrder.cartMenuCode.value       = menuValue[0] + "_" + cartIndex;  // �޴��ڵ�
    	    	document.frmOrder.cartMenuName.value       = menuValue[1];                    // �޴���
    	    	document.frmOrder.cartMenuOrdCode.value    = "10";                            // �޴��ֹ������ڵ�(10:����,20:����,30:����(����))
    	    	document.frmOrder.cartMenuDivCode.value    = menuValue[9];                    // �޴������ڵ�(10:��ǰ,20:��Ʈ,30:����&����)
    	    	document.frmOrder.cartMenuLagCode.value    = menuValue[5];                    // �޴���з��ڵ�
    	    	document.frmOrder.cartMenuMidCode.value    = menuValue[6];                    // �޴��ߺз��ڵ�
    	    	document.frmOrder.cartMenuSmlCode.value    = menuValue[7];                    // �޴��Һз��ڵ�
    	    	document.frmOrder.cartMenuSubCode.value    = menuValue[8];                    // �޴����з��ڵ�
    	    	document.frmOrder.cartMenuPrice.value      = menuValue[3];                    // �޴��ֹ��ܰ�
    	    	document.frmOrder.cartMenuQty.value        = "0";                             // �޴��ֹ�����
    	    	document.frmOrder.cartMenuAmt.value        = menuValue[3];                    // �޴��ֹ��ݾ�
    	    	document.frmOrder.cartMenuDisRate.value    = "0";                             // �޴�������
    	    	document.frmOrder.cartMenuDisAmt.value     = "0";                             // �޴����αݾ�
    	    	document.frmOrder.cartMenuCopDisAmt.value  = "0";                             // �޴���������������
    	    	document.frmOrder.cartMenuNetSaleAmt.value = menuValue[3];                    // �޴�������ݾ�
    	    	document.frmOrder.cartMenuPayAmt.value     = menuValue[3];                    // �޴������ݾ�
    	    	document.frmOrder.cartMenuMessage.value    = "";                              // �޴����޸޼���
    	    	document.frmOrder.cartMenuSize.value       = menuValue[2];                    // �޴�������
    	    	document.frmOrder.cartMenuDough.value      = menuValue[4];                    // �޴���������
    	    	
    			//�޴���з��ڵ庰 �޴�Ÿ�� �� �޴����� ����
    			if( document.frmOrder.cartMenuLagCode.value == "10" )  // ����
    			{
        			document.frmOrder.cartMenuType.value = "typePizza";  // �޴� Ÿ��
        			document.frmOrder.cartMenuQty.value  = "1";          // �޴� ����
    			}
    			else if( document.frmOrder.cartMenuLagCode.value == "20" )  // ���̵�
    			{
        			document.frmOrder.cartMenuType.value = "typeSide";   // �޴� Ÿ��
        			document.frmOrder.cartMenuQty.value  = selMenuQty;   // �޴� ����
    			}
    			else if( document.frmOrder.cartMenuLagCode.value == "30" )  // �ҽ�
    			{
        			document.frmOrder.cartMenuType.value = "typeSauce";  // �޴� Ÿ��
        			document.frmOrder.cartMenuQty.value  = selMenuQty;   // �޴� ����
    			}
    			else if( document.frmOrder.cartMenuLagCode.value == "40" )  // ����
    			{
        			document.frmOrder.cartMenuType.value = "typeBever";  // �޴� Ÿ��
        			document.frmOrder.cartMenuQty.value  = selMenuQty;   // �޴� ����
    			}
	    	}
    	}
    	
    	// �޴� ǰ������ üũ
		var storeCode     = document.frmOrder.cartOrdStoreCode.value;  // �����ڵ�
    	var storeName     = document.frmOrder.cartOrdStoreName.value;  // �����
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
						alertFrame.find("#alertText").append("<p>�����Ͻ� �޴���<br>\""+ storeName +"\" ���忡�� ���� �ֹ��� �Ұ����մϴ�.</p>"); 
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
		//ajax ����ϴ� ���� �Ʒ� �Լ��� ����Ǹ� ǰ����Ȳ�� üũ�Ǳ��� ��ٱ��Ͽ� ��.
		function innerCartData()
		{
			//���� ������ 5�������� �ֹ� ���� -> ��ǰ ����, ��Ʈ�� ���Ե� ����, ��������
	    	if( document.frmOrder.cartMenuType.value == "typePizza" )
	    	{ 
		    	$.post(root+"/order/newCart.jsp?cartAction=getPizzaCount", function(pizzaCount)
	   	    	{
					var pizzaCount = trim(pizzaCount);  // ��ٱ��� �ֹ� ���� ����
					if( parseInt(pizzaCount) < 5 )
					{ 
						cartSendDataInfo = {
										    cartAction         : document.frmOrder.cartAction.value          // ��ٱ���ó��
							    		   ,cartMenuType       : document.frmOrder.cartMenuType.value        // �޴�Ÿ��
		    	    					   ,cartMenuCode       : document.frmOrder.cartMenuCode.value        // �޴��ڵ�
		    	    					   ,cartMenuName       : document.frmOrder.cartMenuName.value        // �޴���
		    	    					   ,cartMenuOrdCode    : document.frmOrder.cartMenuOrdCode.value     // �޴��ֹ������ڵ�(10:����,20:����,30:����(����))
		    	    					   ,cartMenuDivCode    : document.frmOrder.cartMenuDivCode.value     // �޴������ڵ�(10:��ǰ,20:��Ʈ,30:����&����)
		    	    					   ,cartMenuLagCode    : document.frmOrder.cartMenuLagCode.value     // �޴���з��ڵ�
		    	    					   ,cartMenuMidCode    : document.frmOrder.cartMenuMidCode.value     // �޴��ߺз��ڵ�
		    	    					   ,cartMenuSmlCode    : document.frmOrder.cartMenuSmlCode.value     // �޴��Һз��ڵ�
		    	    					   ,cartMenuSubCode    : document.frmOrder.cartMenuSubCode.value     // �޴����з��ڵ�
		    	    					   ,cartMenuPrice      : document.frmOrder.cartMenuPrice.value       // �޴��ֹ��ܰ�
		    	    					   ,cartMenuQty        : document.frmOrder.cartMenuQty.value         // �޴��ֹ�����
		    	    					   ,cartMenuAmt        : document.frmOrder.cartMenuAmt.value         // �޴��ֹ��ݾ�
		    	    					   ,cartMenuDisRate    : document.frmOrder.cartMenuDisRate.value     // �޴�������
		    	    					   ,cartMenuDisAmt     : document.frmOrder.cartMenuDisAmt.value      // �޴����αݾ�
		    	    					   ,cartMenuCopDisAmt  : document.frmOrder.cartMenuCopDisAmt.value   // �޴���������������
		    	    					   ,cartMenuNetSaleAmt : document.frmOrder.cartMenuNetSaleAmt.value  // �޴�������ݾ�
		    	    					   ,cartMenuPayAmt     : document.frmOrder.cartMenuPayAmt.value      // �޴������ݾ�
		    	    					   ,cartMenuBakeCode   : document.frmOrder.cartMenuBakeCode.value    // �޴�����ũ�ڵ�
		    	    					   ,cartMenuCutCode    : document.frmOrder.cartMenuCutCode.value     // �޴����ڵ�
		    	    					   ,cartMenuCheeseCode : document.frmOrder.cartMenuCheeseCode.value  // �޴�ġ���ڵ�
		    	    					   ,cartMenuSauceCode  : document.frmOrder.cartMenuSauceCode.value   // �޴��ҽ��ڵ�
		    	    					   ,cartMenuMessage    : document.frmOrder.cartMenuMessage.value     // �޴����޸޼���
		    	    					   ,cartMenuSize       : document.frmOrder.cartMenuSize.value        // �޴�������
		    	    					   ,cartMenuDough      : document.frmOrder.cartMenuDough.value       // �޴���������
										   ,cartMenuOption     : cartMenuOptions                             // �޴��ɼ�
										   ,cartECouponCompany : document.frmOrder.cartECouponCompany.value  // E�������޻�
										   ,cartECouponCode    : document.frmOrder.cartECouponCode.value     // E�����ڵ�
										   ,cartECouponNumber  : document.frmOrder.cartECouponNumber.value   // E������ȣ
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
					    			cartAction         : document.frmOrder.cartAction.value          // ��ٱ���ó��
		    					   ,cartMenuType       : document.frmOrder.cartMenuType.value        // �޴�Ÿ��
								   ,cartMenuCode       : document.frmOrder.cartMenuCode.value        // �޴��ڵ�
								   ,cartMenuName       : document.frmOrder.cartMenuName.value        // �޴���
								   ,cartMenuOrdCode    : document.frmOrder.cartMenuOrdCode.value     // �޴��ֹ������ڵ�(10:����,20:����,30:����(����))
								   ,cartMenuDivCode    : document.frmOrder.cartMenuDivCode.value     // �޴������ڵ�(10:��ǰ,20:��Ʈ,30:����&����)
								   ,cartMenuLagCode    : document.frmOrder.cartMenuLagCode.value     // �޴���з��ڵ�
								   ,cartMenuMidCode    : document.frmOrder.cartMenuMidCode.value     // �޴��ߺз��ڵ�
								   ,cartMenuSmlCode    : document.frmOrder.cartMenuSmlCode.value     // �޴��Һз��ڵ�
								   ,cartMenuSubCode    : document.frmOrder.cartMenuSubCode.value     // �޴����з��ڵ�
								   ,cartMenuPrice      : document.frmOrder.cartMenuPrice.value       // �޴��ֹ��ܰ�
								   ,cartMenuQty        : document.frmOrder.cartMenuQty.value         // �޴��ֹ�����
								   ,cartMenuAmt        : document.frmOrder.cartMenuAmt.value         // �޴��ֹ��ݾ�
								   ,cartMenuDisRate    : document.frmOrder.cartMenuDisRate.value     // �޴�������
								   ,cartMenuDisAmt     : document.frmOrder.cartMenuDisAmt.value      // �޴����αݾ�
		    					   ,cartMenuCopDisAmt  : document.frmOrder.cartMenuCopDisAmt.value   // �޴���������������
		    					   ,cartMenuNetSaleAmt : document.frmOrder.cartMenuNetSaleAmt.value  // �޴�������ݾ�
								   ,cartMenuPayAmt     : document.frmOrder.cartMenuPayAmt.value      // �޴������ݾ�
		    					   ,cartMenuBakeCode   : document.frmOrder.cartMenuBakeCode.value    // �޴�����ũ�ڵ�
		    					   ,cartMenuCutCode    : document.frmOrder.cartMenuCutCode.value     // �޴����ڵ�
		    					   ,cartMenuCheeseCode : document.frmOrder.cartMenuCheeseCode.value  // �޴�ġ���ڵ�
		    					   ,cartMenuSauceCode  : document.frmOrder.cartMenuSauceCode.value   // �޴��ҽ��ڵ�
								   ,cartMenuMessage    : document.frmOrder.cartMenuMessage.value     // �޴����޸޼���
								   ,cartMenuSize       : document.frmOrder.cartMenuSize.value        // �޴�������
								   ,cartMenuDough      : document.frmOrder.cartMenuDough.value       // �޴���������
								   ,cartMenuOption     : cartMenuOptions                             // �޴��ɼ�
								   ,cartECouponCompany : document.frmOrder.cartECouponCompany.value  // E�������޻�
								   ,cartECouponCode    : document.frmOrder.cartECouponCode.value     // E�����ڵ�
								   ,cartECouponNumber  : document.frmOrder.cartECouponNumber.value   // E������ȣ
			           		       }; 
				fnSaveForCart(cartSendDataInfo);	
	    	}
		}
    }
	/*************************************************************************/
	
	
    // ��ٱ��� �޴� ����
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
				//����� �����Ҷ� ó��             
				$('#viewLoading').show().fadeIn(500);
			}, 
			complete: function() 
			{             
				//����� �Ϸ�� �� ó��              
				$('#viewLoading').fadeOut();         
			},
			success : function(data)
			{
				//���������� ������� �� �� ȭ�鿡�� ����
				if( trim(data) == "true" )
				{
					//�ش� ����Ʈ �޴� ���� ����!!
					var prc = 0;
					prc -= parseInt(price.replace(",", ""));
					setTotalPrc((prc * count), 1);  // �ֹ� �հ� �ݾ� ���
					fnDeleteMenuTooping(val, type);  // �޴� ���� ����(�޴� ������)
				}
			}
		});
    	
    }
	
	
 	/* �����ֹ��ݾ� ���� */
 	// �ֹ� �հ� �ݾ� ���
 	function setTotalPrc(price, value)
 	{
		//value : �÷��� �Ǵ� ���̳ʽ� �Ǵ� 0 ��� ǥ��
 		toPrc += parseInt(price);
 		toPrc *= value;
		var $totalPrcArea = $("#ord_total");
 		$totalPrcArea.find(".price").text(won(toPrc.toString())); 

 		//20130923 
 		//��ٱ��� ���� ��ư�� ���� ���� 
 		getCount();
 		
 	}

	
 	//20130923 ��ٱ��� ��� ����
 	function getCount()
 	{
 		
		$.post(root+"/order/newCart.jsp?cartAction=getCountOfCartMenus", function(count)
		{
			var menuCount = trim(count) ;
	 		$("#scrollTopBtn").text(menuCount);
		});
		
 	}
 	

 	// �޴� ���� ����(�޴� ������)
	function fnDeleteMenuTooping(val, type)
	{
		var cnt   = 0; 
		var $list = $("#"+val);
		var count = $("#"+ val +" input#count").attr("value");
		
   		var toppTotalPrc = 0;

	 	$.post("/order/newCart.jsp?cartAction=deleteCartTooping&cartMenuCode="+ val.replace('pizzaMenu_', ''),
		function(flag)
		{  
			//���������� ������� �� �� ȭ�鿡�� ����   
		    //�ش� �޴��� �߰��� ���� ������ ���ΰ��ݵ� ���� ���ֱ�!!   
 		    $list.find("ul.topp_p").each(function(i,e)
 		    {
		    	//���ΰ��� ��ٱ��� �Ѿ׼� ����
		    	$(this).find("li").each(function(i,e)
		    	{
		    		var eaAmount = $(this).find(".toppEaAmt").val();	////1.���ΰ��� �Ѿ�
		    		toppTotalPrc += parseInt(eaAmount);
		    	});
		    	
		    	toppTotalPrc = 0 - (toppTotalPrc * parseInt(count));
	    		setTotalPrc(toppTotalPrc, 1); 
		    });  
		}); 
		
		//20140620 ���θ�� �޴� ȭ�� ���� ���� �ϱ�
		if(type == "typePromotion")
		{
			//����޴��� ���θ޴��� ����� ���� �ڵ�� ���� ã�� 
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
 	
 	
    /* �ֹ����� Ȯ��->������� ����-> pj_1003�̵�*/
    function fnOrderInfoView()
    {
    	
		// ���� �޴� ���� �� �ݾ� �ѵ� Check
		var $cartList  = $("#ord_list>li");
	 	var $totalPrc  = $("#ord_total").find(".price").text();
		var cartAmount = parseInt($totalPrc.replace(",","").replace("��","") );
		var orderFlag  = false;  //��ٱ��Ͽ� ���ڶǴ� ���̵� �޴��� �����ϴ��� �˻�
		var alertFrame = $("#notice_1002");
		
		$cartList.each(function(e,i)
		{
			var menuType = $(this).attr("class");
			//���̵� �޴��� Ŭ���� �̸� ���� > side_menu(20130627)
			//if( menuType == "pizza_menu product" || menuType == "set_menu product" || menuType == "set_menu eCoupon_menu product" || menuType == "half_menu product" || menuType == "side_menu product" ) { orderFlag = true; }
			
			//20140620 ���θ�� �޴����� ���� ���~
			if( $(this).hasClass("pizza_menu") == true || $(this).hasClass("set_menu") == true  || $(this).hasClass("half_menu") == true || $(this).hasClass("side_menu") == true  ){orderFlag = true;}
		});
		
		//��ٱ��Ͽ� �޴��� �ְ� �Ѿ��� 10000���̻�, ���ڸ޴��� ������ ��츸 �ֹ� ����
		if( $cartList.size() < 0 || cartAmount < 10000 || orderFlag == false )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>���� �Ǵ� ���̵� �޴��� �����Ͽ� <br/>��  10,000�� �̻��� ��츸 �ֹ��� �����մϴ�.</p>").css("line-height","35px"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			return;
		}
		
		// ����ֹ�, �����ֹ� �ֹ���� ���� Check
		if( $("#btn_addr").hasClass("active") == false && $("#btn_store").hasClass("active") == false )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>\"����ֹ�\" �Ǵ� \"�����ֹ�\"�� ������ �ּ���!</p>").css("line-height","45px"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			return;
		}
		
		var mem_name  = $("#ord_optInfo_section .mem_name").text();
		var mem_phone = $("#ord_optInfo_section .mem_phone").text();
		var addr      = $("#ord_optInfo_section .addr").text();
		
    	// ����(������), ����ó(��ȭ��ȣ), ����ּ� Check
     	if( mem_name.length <= 0 || mem_phone.length <= 0 || addr.length <= 0 )
     	{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>\"���\" �Ǵ� \"����\" �ֹ��� �����Ͻð�<br/>\"������ ����\" �� \"�ּ�\"�� Ȯ���� �ּ���!</p> ").css("line-height","35px"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
     		return;
     	}
		// �ٷ��ֹ�, �����ֹ� �ֹ���� ���� Check
		//if( $("#btn_ordNow").hasClass("active") == false && $("#btn_ordReserv").hasClass("active") == false )
		//���ǹ� ���� >> ��ư ������ �ϴ� ��� �ð��� ����� ���õ��� �ʾƵ� �Ѿ����
/* 		if($ord_time.text() == "")
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>\"�ٷ��ֹ�\" �Ǵ� \"�����ֹ�\"�� �������ּ���!<br/>���� �ð��� \"�ٷ��ֹ�\"�ð� ���ĺ��� �����մϴ�.</p> ").css("line-height","35px"); 
			popAlert(alertFrame);
			return;
		} */

    	//********************************************************************************
    	// �ֹ�����(�ֹ�����)
    	// 10 : ����ֹ�
    	// 20 : �����ֹ�
    	// 30 : ��ü�ֹ�
    	// 40 : �����ֹ�
    	// 50 : ȯ���ֹ�
    	// 55 : �����ֹ�
    	// 60 : A/S�ֹ�
    	// 70 : �������ֹ�
    	//********************************************************************************
    	document.frmOrder.cartOrdDivide.value    = "";  // �ֹ�����(�ֹ�����)
    	document.frmOrder.cartOrdReserve.value   = "";  // �����ֹ�����
		document.frmOrder.cartOrdCustName.value  = "";  // ����
		document.frmOrder.cartOrdCustPhone.value = "";  // ��ȭ��ȣ
		
		//���� ��ư ����
    	if( $("#btn_addr").hasClass("active")      ) { document.frmOrder.cartOrdDivide.value  = "10"; }  // ����ֹ���ư
    	if( $("#btn_store").hasClass("active")     ) { document.frmOrder.cartOrdDivide.value  = "20"; }  // �����ֹ���ư
/*     	if( $("#btn_ordNow").hasClass("active")    ) { document.frmOrder.cartOrdReserve.value = "N";  }  // �ٷ��ֹ���ư
    	if( $("#btn_ordReserv").hasClass("active") ) { document.frmOrder.cartOrdReserve.value = "Y";  }  // �����ֹ���ư
    	 */
		document.frmOrder.cartOrdCustName.value  = mem_name;                               // ����
		document.frmOrder.cartOrdCustPhone.value = mem_phone;                              // ��ȭ��ȣ

    	var cartOrderInfo = null;
    	
    	cartOrderInfo = {
    	 				 cartOrdCustName     : document.frmOrder.cartOrdCustName.value,      // ����
    	 				 cartOrdCustPhone    : document.frmOrder.cartOrdCustPhone.value,     // ��ȭ��ȣ
    			         cartOrdDivide       : document.frmOrder.cartOrdDevide.value,        // �ֹ�����(�ֹ�����)
    			         cartOrdReserve      : document.frmOrder.cartOrdReserve.value,       // �����ֹ�����
    			         cartOrdResDate      : document.frmOrder.cartOrdResDate.value,       // ��������
    			         cartOrdResTime      : document.frmOrder.cartOrdResTime.value,       // ����ð�
    			         cartOrdDevAddr1     : document.frmOrder.cartOrdDevAddr1.value,      // ������ּ�1
    			         cartOrdDevAddr2     : document.frmOrder.cartOrdDevAddr2.value,      // ������ּ�2
    			         cartOrdDevAddr3     : document.frmOrder.cartOrdDevAddr3.value,      // ������ּ�3
    			         cartOrdDevAddr4     : document.frmOrder.cartOrdDevAddr4.value,      // ������ּ�4
    			         cartOrdAddressID    : document.frmOrder.cartOrdAddressID.value,     // ADDRESS_ID
    			         cartOrdStoreCode    : document.frmOrder.cartOrdStoreCode.value,     // �����ڵ�
    			         cartOrdStoreName    : document.frmOrder.cartOrdStoreName.value,     // �����
    			         cartOrdSectorCode   : document.frmOrder.cartOrdSectorCode.value,    // ���弽���ڵ�
    			         cartOrdSectorName   : document.frmOrder.cartOrdSectorName.value,    // ���弽�͸�
    			         cartOrdDeliveryTime : document.frmOrder.cartOrdDeliveryTime.value,  // ���Ϳ���ð�
    			         cartOrdDeliveryYN   : document.frmOrder.cartOrdDeliveryYN.value,    // ��ް��ɿ���
    			         cartOrdNewAddressYN : document.frmOrder.cartOrdNewAddressYN.value   // ������ּҽű��߰�����
	                    }; 

    	var jsonCartOrderInfo = JSON.stringify(cartOrderInfo);
    	 
    	//��ٱ��Ͽ� �ִ� ���޴� ���� �˻� _ �����ڵ��
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
   					//20131212 üũ
   					//�ֹ��Ұ� �˸� �� ��ٱ��Ͽ��� ���� ���!!!
   				}
   				else
   				{
   					fnOrderNext(jsonCartOrderInfo);	
   				}
   			}
   		});

    }
    
    
    /* �ּ����� �� ���� ������ �̵� */
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
    
    
    /* �ֹ� �� �����(�ּ�) session ���� */
    function fnSaveCartOrderInfo()
    {
    	
    	//********************************************************************************
    	// �ֹ�����(�ֹ�����)
    	// 10 : ����ֹ�
    	// 20 : �����ֹ�
    	// 30 : ��ü�ֹ�
    	// 40 : �����ֹ�
    	// 50 : ȯ���ֹ�
    	// 55 : �����ֹ�
    	// 60 : A/S�ֹ�
    	// 70 : �������ֹ�
    	//********************************************************************************
    	document.frmOrder.cartOrdDivide.value  = "";  // �ֹ�����(�ֹ�����)
    	document.frmOrder.cartOrdReserve.value = "";  // �����ֹ�����
    	if( $("#btn_addr").hasClass("active")      ) { document.frmOrder.cartOrdDivide.value  = "10"; }  // ����ֹ���ư
    	if( $("#btn_store").hasClass("active")     ) { document.frmOrder.cartOrdDivide.value  = "20"; }  // �����ֹ���ư
 
    	/*  20140121 pj_1003ȭ�鿡�� ������ ������ ����   */
    	/* if( $("#btn_ordNow").hasClass("active")    ) { document.frmOrder.cartOrdReserve.value = "N";  }  // �ٷ��ֹ���ư
    	if( $("#btn_ordReserv").hasClass("active") ) { document.frmOrder.cartOrdReserve.value = "Y";  }  // �����ֹ���ư
    	document.frmOrder.cartOrdResDate.value = $("#s_date").val();                     // ��������
    	document.frmOrder.cartOrdResTime.value = $("#s_hour").val()+$("#s_minu").val();  // ����ð� */
    	
    	var cartOrderInfo = null;
    	
    	cartOrderInfo = {
				 		 cartOrdCustName     : document.frmOrder.cartOrdCustName.value,      // ����
 				 		 cartOrdCustPhone    : document.frmOrder.cartOrdCustPhone.value,     // ��ȭ��ȣ
    			         cartOrdDivide       : document.frmOrder.cartOrdDevide.value,        // �ֹ�����(�ֹ�����)
    			         cartOrdReserve      : document.frmOrder.cartOrdReserve.value,       // �����ֹ�����
    			         cartOrdResDate      : document.frmOrder.cartOrdResDate.value,       // ��������
    			         cartOrdResTime      : document.frmOrder.cartOrdResTime.value,       // ����ð�
    			         cartOrdDevAddr1     : document.frmOrder.cartOrdDevAddr1.value,      // ������ּ�1
    			         cartOrdDevAddr2     : document.frmOrder.cartOrdDevAddr2.value,      // ������ּ�2
    			         cartOrdDevAddr3     : document.frmOrder.cartOrdDevAddr3.value,      // ������ּ�3
    			         cartOrdDevAddr4     : document.frmOrder.cartOrdDevAddr4.value,      // ������ּ�4
    			         cartOrdAddressID    : document.frmOrder.cartOrdAddressID.value,     // ADDRESS_ID
    			         cartOrdStoreCode    : document.frmOrder.cartOrdStoreCode.value,     // �����ڵ�
    			         cartOrdStoreName    : document.frmOrder.cartOrdStoreName.value,     // �����
    			         cartOrdSectorCode   : document.frmOrder.cartOrdSectorCode.value,    // ���弽���ڵ�
    			         cartOrdSectorName   : document.frmOrder.cartOrdSectorName.value,    // ���弽�͸�
    			         cartOrdDeliveryTime : document.frmOrder.cartOrdDeliveryTime.value,  // ���Ϳ���ð�
    			         cartOrdDeliveryYN   : document.frmOrder.cartOrdDeliveryYN.value,    // ��ް��ɿ���
    			         cartOrdNewAddressYN : document.frmOrder.cartOrdNewAddressYN.value   // ������ּҽű��߰�����
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
    
 
 	//scrollTopBtn ��ũ�ѿ� ���� ��ġ ����!!
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
			 	$btn.css("margin-left","278px"); /* ������ �߾ӿ��� �������� ������ �Ÿ�  */
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
 	
	// 0.5��(500)���� outmenu('scrollTopBtn')�Լ� �ݺ�����(setInterval)
	setInterval("outmenu('scrollTopBtn')", 500); 

	//�ɼǹڽ����� �ɼǰ� ����
	var old_sid  = "";
	var old_this = "";
	$(".option").slideUp();
	
	//
	function swapimg(old_sid, $this) 
	{ 
		
		var prevIndex = parseInt(old_sid.substr(old_sid.length-1, 1) ) -1;	  //������ Ŭ���� �ɼ��� �ε��� ���ϱ�
	  	$this.parent().parent().find("li").eq(prevIndex).find("span").text("��");
	  	
	}
	
	function fnAdjustMenu(sid,$this)
	{
		
		// ���� ���� �ɼ��� ���� ���ÿɼǰ� �ٸ���
	    if( old_sid != sid )
	    {  
	    	// ���� ������ �ɼ��� ó�� ������ �ƴϸ�
	      	if( old_sid != "" )
	      	{  
	    	  	$this.parent().parent().find('#'+old_sid).stop().slideUp(); //���� �ɼ��� ����� 
	         	swapimg(old_sid, $this);   // swapimg �Լ��� ȣ��. 
	      	}
	    	
	      	$this.parent().parent().find('#'+sid).stop().slideDown(); // ���� Ŭ���� �ɼ��� ������ 
	      	old_sid = sid; // ���� �ɼ� ������ ���� �ɼ� ��ȣ�� ����  
	      	$this.find("span").text("��");
	   	}
	 	// ���� Ŭ���� ���� Ŭ���� �ɼǰ� ������
	    else
	    { 
		   	$this.parent().parent().find('#'+sid).stop().slideUp(); // ���� �ɼ��� ����� 
	      	old_sid = ""; 
	      	$this.find("span").text("��"); 
	   	}  
	}
	
	function fnCartAppend_plat(id, name, size, doughNm , price, type, count, setItems)
	{
		// 20140426 ��Ʈó�� ���̱⸸�� 
		// class, name, id ��������
		
		var $list    = $("#ord_list");
		var add_list = '';
		
		add_list += '<li class="set_menu product" id="' + id + '">';
		add_list += '<p class="set_name ">'+ name +'</p>'; 
		add_list += '<p class="opt"><span class="price">('+ size +') ' + won(price) + '</span>';
		add_list += '<span class="count">'; 
		add_list += '<span class= "minusBtn"><a href="javascript:fnSetCount(\'' +id +'\',  \''+type+'\', \''+price+'\', \'minus\');">';
		add_list += '<img src="'+root+'/assets/img/order/btn_minus.png" alt="����" ></a></span>';
		add_list += '<input type="text" id="count" name="count" class="item_count" value="'+ count +'" />';
		add_list += '<span class= "plusBtn"><a href="javascript:fnSetCount(\'' +id +'\',  \''+type+'\', \''+price+'\', \'plus\');">';
		add_list += '<img src="'+root+'/assets/img/order/btn_plus.png" alt="���ϱ�" /></a></span>'; 
		add_list += '<a href="javascript:fnRemoveBasket(\'' +id +'\', \''+type+'\', \''+ price+'\');" class="btn_menu_del">';
		add_list += '<img src="'+root+'/assets/img/order/btn_item_del.png" alt="����" /></a>';
		add_list += '</span></p>';
		add_list += '</li>';
	
		$list.append(add_list);

		var setPrc = parseInt(price.replace(",", "")) * parseInt(count) ;
		setTotalPrc(setPrc, 1);
		contents_resize();
	}
	
	
	// 20140616 ���θ����������Ʈ ��ȸ 	
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
				//����� �����Ҷ� ó��             
				$('#viewLoading').show().fadeIn(500);          
			}
    		,complete : function() 
    		{             
				//����� �Ϸ�� �� ó��              
				$('#viewLoading').fadeOut();         
			}
    		,success : function(data)
    		{    			
    			var promotionValue = "";
     			var str = "<option value=''>���θ�� ������ �������ּ���.</option>";
     			for( var i = 0; i < data.promotionCoupon.length; i++ )
     			{
     				var d= data.promotionCoupon[i];
     				if(d.promotioncouponCode != "" && d.promotionCouponCode != null)
     				{
     					
     					// ���θ�� ����
     					// �����ڵ�, 
     					// ���������ڵ�(1.%���� 2.�ݾ����� 3.�������� 4.�ݾ����μ����� 5.%���μ�����(4/5 POS���� �����������Ǵ�) )
     					// ������
     					// ���αݾ�
     					// ��������޴� Y,N
     					// ������������� Y,N
     					// ���αݾ���������ڵ�
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
    	
    	//20140618 ȭ�� �ʱ�ȭ �߰�
    	$(".prom_spcInstruction").hide();
		$(".main_menu .price").text(won("0"));		//�޴�����
		$(".main_menu #main_menu_img").html("<img src='"+root+"/assets/img/order/menu/00/def_img.png' alt='��������޴�' onerror=\"this.src='"+root+"/assets/img/order/menu/noImage_ord.png'\" />");		// $this.parent().parent().prev() : �޴� �̹���
     	$("#main_menu option").remove();
 		$("#main_menu").html("<option value=''>�޴��� �������ּ���.</option>");

		$("#option_box_prom").hide();
 		$(".sub_menu").hide();
		$("#prom_section .plus").hide();
		$("#prom_section .and").hide();
		$(".sub_description").show();
    }
	
	// 20140616 ���θ������ ���� SELECTBOX ���� - ���θ޴�
    function fnPromotionMainMenu(val)
    {
		//20140619 �޴� �̹���, ���� �ʱ�ȭ		
		$(".prom_spcInstruction").hide();
		$("#option_box_prom").hide();
		$(".main_menu .price").text(won("0"));		//�޴�����
		$(".main_menu #main_menu_img").html("<img src='"+root+"/assets/img/order/menu/00/def_img.png' alt='��������޴�' onerror=\"this.src='"+root+"/assets/img/order/menu/00/def_img.png'\" />");
		
		if(val == "")
		{
			$(".sub_menu").hide();
			$("#prom_section .plus").hide();
			$("#prom_section .and").hide();
			$(".sub_description").show();
			
			// 20140619 ���θ޴� �ʱ�ȭ
			$("#main_menu option").remove();
	 		$("#main_menu").html("<option value=''>�޴��� �������ּ���.</option>");
		}
		else
       	{
       	
       		var promotionCouponCode            = val.split(",")[0]; // ���θ�� ����
       		var promotionCouponDiscountFlag    = val.split(",")[1]; // ���������ڵ�(1.%���� 2.�ݾ����� 3.�������� 4.�ݾ����μ����� 5.%���μ�����(4/5 POS���� �����������Ǵ�) )
       		var promotionCouponDiscountPercent = val.split(",")[2]; // ������
       		var promotionCouponDiscountAmt     = val.split(",")[3]; // ���αݾ�
       		var promotionCouponApplicationMenu = val.split(",")[4]; // ��������޴� Y,N
       		var promotionCouponApplicationSize = val.split(",")[5]; // ������������� Y,N
       		var promotionCouponDiscountTarget  = val.split(",")[6]; // ���αݾ���������ڵ�
       		
       	    $.ajax(
       	    { 
   		   		type       : 'post',
   		   		data       : "flag=promotionMainMenu&code="+promotionCouponCode+"&applicationMenu="+promotionCouponApplicationMenu+"&applicationSize="+promotionCouponApplicationSize,
   		   		url        : "/order/couponCheck.jsp",
   		   		dataType   : "json",
   				beforeSend : function() 
   				{              
   					//����� �����Ҷ� ó��             
   					$('#viewLoading').show().fadeIn(500);          
   				}
   		   		,complete : function() 
   		   		{             
   					//����� �Ϸ�� �� ó��              
   					$('#viewLoading').fadeOut(); 
   				}
   		   		,success : function(data)
   		   		{
   		   			var str = "<option value=''>�޴��� �������ּ���.</option>";
   		   			for( var i = 0; i < data.promMainMenu.length; i++ )
   		   			{
   		   				var d = data.promMainMenu[i];
   		   				var code        = d.promotionCouponMenuCode;      // �޴��ڵ�
   		   				var img         = d.promotionCouponMenuImg;       // �޴��̹������� 
   		   				var name        = d.promotionCouponMenuName;      // �޴���(�޴��ߺз���)
   		   				
   		   				var price       = d.promotionCouponMenuSaleAmt;   // �Ǹűݾ�
   		   				var menuDough   = d.promotionCouponMenuDough;     // �޴��������� 
   		   				var menuSizeKor = d.promotionCouponMenuSizeKor;   // �޴��������ѱ�
   		   				var menuSizeEng = d.promotionCouponMenuSizeEng;   // �޴��������
   		   				var menuSize    = d.promotionCouponMenuSize;      // �޴�������(L,P..)
   		   				var menuLagCode = d.promotionCouponMenuLagCode;   // �޴���з��ڵ�
   		   				var menuMidCode = d.promotionCouponMenuMidCode;   // �޴��ߺз��ڵ�
   		   				var menuSmlCode = d.promotionCouponMenuSmlCode;   // �޴��Һз��ڵ�
   		   				var menuSubCode = d.promotionCouponMenuSubCode;   // �޴����з��ڵ�
   		   				var menuGroupCode = d.promotionCouponGroupCd;     // �¶��θ޴��׷�
   		   				var menuDivCode   = d.promotionCouponMenuDivCode; // �޴������ڵ�
   		   				
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
	
 	// 20140617 ���θ������ ������ - ���θ޴�
    function fnPromotionSubMenu(val)
    { 
		$("#first_sub").show();
		$("#prom_section .and").show();
		
		if(val == "")
		{
	    	//$(".sub_menu .price").text(won("0"));		//�޴�����
	    	//$(".sub_menu .name").text("");		//�޴�����
			//$(".sub_menu #sub_menu_img").html("<img src='"+root+"/assets/img/order/menu/00/def_img_sub.png' alt='�������θ޴�'  />");		// $this.parent().parent().prev() : �޴� �̹���
			$(".sub_menu").hide();
			$("#prom_section .and").hide();
		}
		else
       	{
       		var promotionCouponCode            = val.split(",")[0]; // ���θ�� ����
       		var promotionCouponDiscountFlag    = val.split(",")[1]; // ���������ڵ�(1.�ݾ����� 2.%���� 3.�������� 4.�ݾ����μ����� 5.%���μ�����(4/5 POS���� �����������Ǵ�) )
       		var promotionCouponDiscountPercent = val.split(",")[2]; // ������
       		var promotionCouponDiscountAmt     = val.split(",")[3]; // ���αݾ�
       		var promotionCouponApplicationMenu = val.split(",")[4]; // ��������޴� Y,N
       		var promotionCouponApplicationSize = val.split(",")[5]; // ������������� Y,N
       		var promotionCouponDiscountTarget  = val.split(",")[6]; // ���αݾ���������ڵ�
       		var displayDiscount = 0;var displayPrice = 0;
       		var disAmt = 0;             //���αݾ�
  				
       		//alert(promotionCouponDiscountFlag);
       		
       	    $.ajax(
       	    { 
   		   		type       : 'post',
   		   		data       : "flag=promotionDisMenu&code="+promotionCouponCode,
   		   		url        : "/order/couponCheck.jsp",
   		   		dataType   : "json",
   				beforeSend : function() 
   				{              
   					//����� �����Ҷ� ó��             
   					$('#viewLoading').show().fadeIn(500);          
   				}
   		   		,complete : function() 
   		   		{             
   					//����� �Ϸ�� �� ó��              
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
   		   				
   		   				var code        = d.promDisMenuCode;    // �޴��ڵ�
   		   				var img         = d.promDisMenuImg;     // �̹�������
   		   				var name        = d.promDisMenuName;    // �޴���(�ߺз���)
   		   				var price       = d.promDisMenuSaleAmt; // �Ǹűݾ�
   		   				var menuLagCode = d.promDisMenuLagCode; // �޴���з��ڵ�
   		   				var menuMidCode = d.promDisMenuMidCode; // �޴��ߺз��ڵ�
   		   				var menuSmlCode = d.promDisMenuSmlCode; // �޴��Һз��ڵ�
   		   				var menuSubCode = d.promDisMenuSubCode; // �޴����з��ڵ�
   		   				var menuDough   = d.promDisMenuDough;   // �޴���������
   		   				var menuSizeKor = d.promDisMenuSizeKor; // �޴��������ѱ�
   		   				var menuSize    = d.promDisMenuSize;    // �޴�������(L,P..)
   		   				var menuSizeEng = d.promDisMenuSizeEng; // �޴��������
   		   				var menuGroupCd = d.promDisGroupCd;     // �¶��θ޴��׷�
   		   				var menuDivcode = d.promDisMenuDivCode; // �޴������ڵ�
   		   				
   		  				//20140618 
   		  				//���̵� 1���� ��� ���ζǴ� ���� ����, 2���� ��� ���Ḹ ǥ�õ�..
   		  				//�ݾ� �����̸� ���̵� �޴� ���ݿ��� ���� �ݾ� ����, ���������̸� 0������ ǥ��
   		  				if(promotionCouponDiscountFlag == "1")
   		  				{
   		  					displayPrice = parseInt(price,10)- parseInt(promotionCouponDiscountAmt,10);
   		  					disAmt = parseInt(promotionCouponDiscountAmt,10);
   		  					
   		  				}
   		  				else if(promotionCouponDiscountFlag == "2")
   		  				{
   		  					//%���� 
   		  					//50% �����̸� *0.5 , �޴����� - ���� ���� ����
   		  					displayDiscount =  parseInt(price,10) * (parseInt(promotionCouponDiscountPercent,10)/100) ;		//���� ��  ���� �ݾ�
   		  					displayPrice = parseInt(price,10) - ( parseInt(price,10) * (parseInt(promotionCouponDiscountPercent,10)/100) );		//ȭ�鿡 ǥ���� ���� �� �ݾ�
   		  					disAmt =  displayDiscount;   		  					
   		  				}
   		  				else if(promotionCouponDiscountFlag == "3")
   		  				{//��������
   		  					disAmt = parseInt(price,10);	
   		  				}
   		   				
   		   				
   		   				
	   		   			var imgLink = "<img src='"+root+"/assets/img/order/menu/00/sub/prom_" + menuMidCode +"_ord.png' alt='"+name+"' title='"+name+"' onerror=\"this.src='"+root+"/assets/img/order/menu/00/def_img_sub.png'\" />";
						var priceStr ='<span class="org_block">&nbsp;'+ won(price) +'&nbsp;&nbsp;&nbsp;</span>    '+ setComma(displayPrice.toString()) +'<span class="t_block">��</span></span>';
   		   				
   		   				//console.log("���θ޴�" + i + ": " + code+"/"+img+"/"+name);
   		   				//����� ����� ���� ǥ��
   		   				if(menuLagCode == "40")
   		   				{
   		   					name = name +" " +  menuSizeKor;
   		   				}
   		   				
   		   				$(".sub_menu").eq(i).find(".name" ).text(name);		// �޴��̸�
   		   				$(".sub_menu").eq(i).find(".img"  ).html(imgLink);    // �޴� �̹���
   		   				$(".sub_menu").eq(i).find(".price").html(priceStr);	// �޴�����
   		   				
   		   				$(".sub_menu").eq(i).find(".hideCode"    ).val(code);	      // �޴��ڵ�
   			   			$(".sub_menu").eq(i).find(".hideName"    ).val(name);	      // �޴���
						$(".sub_menu").eq(i).find(".hidePrice"   ).val(price);	      // �޴�����
						$(".sub_menu").eq(i).find(".hideDiscountPrice"   ).val(disAmt);  // ���ΰ���
						
						$(".sub_menu").eq(i).find(".hideLageCode").val(menuLagCode);  // �޴���з��ڵ�
						$(".sub_menu").eq(i).find(".hideMidCode" ).val(menuMidCode);  // �޴��ߺз��ڵ�
						$(".sub_menu").eq(i).find(".hideSmlCode" ).val(menuSmlCode);  // �޴��Һз��ڵ�
						$(".sub_menu").eq(i).find(".hideSubCode" ).val(menuSubCode);  // �޴����з��ڵ�
						$(".sub_menu").eq(i).find(".hideDough"   ).val(menuDough);	  // �޴���������
						$(".sub_menu").eq(i).find(".hideSize"    ).val(menuSize);	  // �޴�������
						$(".sub_menu").eq(i).find(".hideDivCode").val(menuDivcode);  // �޴������ڵ�
						
   		   			}
   		   		}
   		   	});
       	}        
    }

	// 20140617 ���θ������ �޴� SELECTBOX ���� - ���θ޴�
    function fnPromotionMainMenuSelect($this)
	{
		//console.log($this.val());
		var val               = $this.val();

		//20140619 �޴� �̹���, ���� �ʱ�ȭ
		if(val == "")
		{
			$(".prom_spcInstruction").hide();
			$("#option_box_prom").hide();
			$(".main_menu .price").text(won("0"));		//�޴�����
			$(".main_menu #main_menu_img").html("<img src='"+root+"/assets/img/order/menu/00/def_img.png' alt='��������޴�' onerror=\"this.src='"+root+"/assets/img/order/menu/00/def_img.png'\" />");
		}
		else
		{
			var menuCode          = val.split(",")[0];
			var menuName          = val.split(",")[1];
			var menuMidCode       = val.split(",")[2];
			var menuPrice         = val.split(",")[3];
			var menuDiscountPrice = val.split(",")[4];
			var menuSubCode       = val.split(",")[5];	//���з� �ڵ� : �̹��� ������
			
			var imgLink = "<img src='"+root+"/assets/img/order/menu/00/" + menuSubCode +"/prom_" + menuMidCode +"_ord.png' alt='"+menuName+"' title='"+menuName+"' onerror=\"this.src='"+root+"/assets/img/order/menu/noImage_ord.png'\" />";

			$this.parent().next().text(won(menuPrice));		// $this.parent().next() : �޴�����
			$this.parent().parent().prev().html(imgLink);		// $this.parent().parent().prev() : �޴� �̹���
			
			$(".prom_spcInstruction").show();
		}
	} 
	
	// 20140618 ��ٱ��� �߰�
	function fnPromotionAddCart($this)
	{	 
		var $prompDiv      = $("#prom_section");
 		var $mainMenu      = $("#main_menu");   // ���θ�� ����޴� select
 		var $subMenu      = $(".sub_menu");	//���θ�� ���θ޴� ����
 		var $firstSubMenu  = $("#first_sub");   // ���θ�� ���θ޴�1
 		var $secondSubMenu = $("#second_sub");  // ���θ�� ���θ޴�2
 		var $promCoupon    = $("#prom_coupon"); // ���θ�� ���� 
 		
 		var promotionCouponCode = $promCoupon.val().split(",")[0]; // ���θ�� �����ڵ�
		var cartMenuOptions  = "";        // ����޴� ���ڿɼ�
		var cartSendDataInfo = null;     // ��ٱ��� ���� ����
		
		var menuCode        = ""; // �޴��ڵ�
		var menuName        = ""; // �޴���
		var menuMidCode     = ""; // �޴��ߺз��ڵ�
		var menuPrice       = ""; // �޴��Ǹűݾ�
		var menuDiscountAmt = ""; // �޴����αݾ� 
		var menuSubCode     = ""; // �޴����з��ڵ�
		var menuDough       = ""; // �޴�����
		var menuSize        = ""; // �޴��������ѱ�
		var menuLagCode     = ""; // �޴���з��ڵ�
		var menuMidCode     = ""; // �޴��ߺз��ڵ�
		var menuSmlCode     = ""; // �޴��Һз��ڵ�
		var menuGroupCode   = ""; // �޴��¶��α׷�
		var menuDivCode     = ""; // �޴������ڵ�
		var menuSizeEng     = ""; // �޴��������
		var menuSize        = ""; // �޴�������(L,P..)
		
		var promCouponIndex = setCartIndex(); // ��ٱ��� ���� - ���θ޴�,���θ޴� ���� ������
		
		// ���θ�� ����޴� ������ ��ٱ��ϴ�� ���� 
		if($mainMenu.val() == null || $mainMenu.val() == "")
		{
			alert("���� ���� �޴��� ���� ������ �ּ���!!");
			return;
		}
		
		 //20140619  ��ٱ��� ���� ���� üũ ����
		//���� ������ 5�������� �ֹ� ���� -> ��ǰ ����, ��Ʈ�� ���Ե� ����, ��������
	 	$.post(root+"/order/newCart.jsp?cartAction=getPizzaCount", function(count)
	    {
   			var pizzaCount = trim(count); 
    		if( parseInt(pizzaCount) < 5 )
			{
    			$prompDiv.find(".menuArea .p_menu").each(function(i)
				{
					//console.log("------------------------");
					
			 		document.frmOrder.cartAction.value            = "addMenu";  // ��ٱ���ó��
					document.frmOrder.cartMenuType.value       = "";  // �޴�Ÿ��
					document.frmOrder.cartMenuCode.value       = "";  // �޴��ڵ�
					document.frmOrder.cartMenuName.value       = "";  // �޴���
					document.frmOrder.cartMenuOrdCode.value   = "";  // �޴��ֹ������ڵ�(10:����,20:����,30:����(����))
					document.frmOrder.cartMenuDivCode.value   = "";  // �޴������ڵ�(10:��ǰ,20:��Ʈ,30:����&����)
					document.frmOrder.cartMenuLagCode.value   = "";  // �޴���з��ڵ�
					document.frmOrder.cartMenuMidCode.value   = "";  // �޴��ߺз��ڵ�
					document.frmOrder.cartMenuSmlCode.value   = "";  // �޴��Һз��ڵ�
					document.frmOrder.cartMenuSubCode.value   = "";  // �޴����з��ڵ�
					document.frmOrder.cartMenuPrice.value        = "";  // �޴��ֹ��ܰ�
					document.frmOrder.cartMenuQty.value          = "";  // �޴��ֹ�����
					document.frmOrder.cartMenuAmt.value          = "";  // �޴��ֹ��ݾ�
					document.frmOrder.cartMenuDisRate.value      = "";  // �޴�������
					document.frmOrder.cartMenuDisAmt.value       = "";  // �޴����αݾ�
					document.frmOrder.cartMenuCopDisAmt.value  = "";  // �޴���������������
					document.frmOrder.cartMenuNetSaleAmt.value = "";  // �޴�������ݾ�
					document.frmOrder.cartMenuPayAmt.value     = "";  // �޴������ݾ�
					document.frmOrder.cartMenuBakeCode.value   = "";  // �޴�����ũ�ڵ�
					document.frmOrder.cartMenuCutCode.value    = "";  // �޴����ڵ�
					document.frmOrder.cartMenuCheeseCode.value = "";  // �޴�ġ���ڵ�
					document.frmOrder.cartMenuSauceCode.value  = "";  // �޴��ҽ��ڵ�
					document.frmOrder.cartMenuMessage.value    = "";  // �޴����޸޼���
					document.frmOrder.cartMenuSize.value          = "";  // �޴�������
					document.frmOrder.cartMenuDough.value      = "";  // �޴���������
					document.frmOrder.cartECouponCompany.value = "";  // E�������޻�
					document.frmOrder.cartECouponCode.value    = "";  // E�����ڵ�
					document.frmOrder.cartECouponNumber.value  = "";  // E������ȣ
					
					//1. ���� �޴��� ���
			 		if($(this).hasClass("main_menu") )
					{
			 			if($mainMenu.val() != null && $mainMenu.val() != "")
						{
							var list = $mainMenu.val().split(",");
							menuCode        = list[0];  // �޴��ڵ�
							menuName        = list[1];  // �޴���
							menuMidCode     = list[2];  // �޴��ߺз��ڵ�
							menuPrice       = list[3];  // �޴��Ǹűݾ�
							menuDiscountAmt = list[4];  // �޴����αݾ� 
							menuSubCode     = list[5];  // �޴����з��ڵ�
							menuDough       = list[6];  // �޴�����
							menuSize        = list[7];  // �޴��������ѱ�
							menuLagCode     = list[8];  // �޴���з��ڵ�
							menuMidCode     = list[9];  // �޴��ߺз��ڵ�
							menuSmlCode     = list[10]; // �޴��Һз��ڵ�
							menuGroupCode   = list[11]; // �޴��¶��α׷�
							menuDivCode     = list[12]; // �޴������ڵ�
							menuSizeEng     = list[13]; // �޴��������
							menuSize        = list[14]; // �޴�������(L,P..)
									
							// ����޴� ���� �ɼ�
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
							
							document.frmOrder.cartMenuCode.value       = menuCode+"_"+ (parseInt(promCouponIndex)+i);  // �޴��ڵ�
							document.frmOrder.cartMenuName.value       = menuName;                // �޴���
							document.frmOrder.cartMenuOrdCode.value    = "10";                    // �޴��ֹ������ڵ�(10:����,20:����,30:����(����))
							document.frmOrder.cartMenuDivCode.value    = menuDivCode;             // �޴������ڵ�(10:��ǰ,20:��Ʈ,30:����&����)
							document.frmOrder.cartMenuLagCode.value    = menuLagCode;             // �޴���з��ڵ�
							document.frmOrder.cartMenuMidCode.value    = menuMidCode;             // �޴��ߺз��ڵ�
							document.frmOrder.cartMenuSmlCode.value    = menuSmlCode;             // �޴��Һз��ڵ�
							document.frmOrder.cartMenuSubCode.value    = menuSubCode;             // �޴����з��ڵ�
							document.frmOrder.cartMenuPrice.value      = menuPrice;               // �޴��ֹ��ܰ�
							document.frmOrder.cartMenuAmt.value        = menuPrice;               // �޴��ֹ��ݾ�
							document.frmOrder.cartMenuDisRate.value    = "0";                     // �޴�������
							document.frmOrder.cartMenuDisAmt.value     = "0";                     // �޴����αݾ�
							document.frmOrder.cartMenuCopDisAmt.value  = "0";                     // �޴���������������
							document.frmOrder.cartMenuNetSaleAmt.value = menuPrice;               // �޴�������ݾ�
							document.frmOrder.cartMenuPayAmt.value     = menuPrice;               // �޴������ݾ�
							document.frmOrder.cartMenuMessage.value    = "";                      // �޴����޸޼���
							document.frmOrder.cartMenuSize.value       = menuSize;                // �޴�������
							document.frmOrder.cartMenuDough.value      = menuDough;               // �޴���������
							document.frmOrder.cartECouponCompany.value = "";                      // E�������޻�
							document.frmOrder.cartECouponCode.value    = promotionCouponCode+"_"+promCouponIndex;  // E�����ڵ�
							document.frmOrder.cartECouponNumber.value  = "MAIN";  // E������ȣ - ����޴�,���θ޴�����
							 
							fnReset_spcOption_up($this);
//							console.log("1. in main_menu");
						}
			 			else
			 			{
			 				//20140619 ��ٱ��� ��ư Ŭ�� �� ���� ����޴� ���� �˻�
			 				alert("���� ���� �޴��� ���� ������ �ּ���!!");
			 				return;
			 			}
					}
			 		//2. ���� �޴��� ���
			 		else if($(this).hasClass("sub_menu") )	
			 		{
			 			// none�Ǵ� value�� ������ ���θ޴��� ���� ��!!
			 			if($(this).css("display") == "block" && $(this).find(".hideCode").val() != null && $(this).find(".hideCode").val() != "" )
			 			{
							menuCode      = $(this).find(".hideCode").val();  // �޴��ڵ�
							menuName     = $(this).find(".hideName").val();  // �޴���
							menuMidCode = $(this).find(".hideMidCode").val();  // �޴��ߺз��ڵ�
							menuPrice      = $(this).find(".hidePrice").val();  // �޴��Ǹűݾ�
							menuDiscountPrice = $(this).find(".hideDiscountPrice").val();  // �޴����αݾ�
							menuSubCode = $(this).find(".hideSubCode").val();  // �޴����з��ڵ�
							menuDough    = $(this).find(".hideDough").val();  // �޴�����
							menuSize       = $(this).find(".hideSize").val();  // �޴��������ѱ�
							menuLagCode = $(this).find(".hideLageCode").val();  // �޴���з��ڵ�
							menuMidCode = $(this).find(".hideMidCode").val();  // �޴��ߺз��ڵ�
							menuSmlCode = $(this).find(".hideSmlCode").val(); // �޴��Һз��ڵ�
							menuDivCode = $(this).find(".hideDiveCode").val(); // �޴������ڵ�
							menuSize      = $(this).find(".hideSize").val(); // �޴�������(L,P..)
							
//							console.log($(this).attr("id") + " ���θ޴� "+ i + ">  [" + menuCode + " , " + menuName + " , " + menuPrice + " , " + menuLagCode + ", " + menuDivCode + ", " + menuSize + "]");
							
							//����޴�1,2 > ���θ޴��� �ְ� �޴��� �ִ°�
							document.frmOrder.cartMenuCode.value         = menuCode+"_"+(parseInt(promCouponIndex)+i);  // �޴��ڵ�
							document.frmOrder.cartMenuName.value        = menuName;  // �޴���
							document.frmOrder.cartMenuOrdCode.value    = "20";  // �޴��ֹ������ڵ�(10:����,20:����,30:����(����))
							//document.frmOrder.cartMenuDivCode.value     = menuDivCode;  // �޴������ڵ�(10:��ǰ,20:��Ʈ,30:����&����)
							document.frmOrder.cartMenuDivCode.value     = "10";  // �޴������ڵ�(10:��ǰ,20:��Ʈ,30:����&����)
							document.frmOrder.cartMenuLagCode.value    = menuLagCode;  // �޴���з��ڵ�
							document.frmOrder.cartMenuMidCode.value    = menuMidCode;  // �޴��ߺз��ڵ�
							document.frmOrder.cartMenuSmlCode.value    = menuSmlCode;  // �޴��Һз��ڵ�
							document.frmOrder.cartMenuSubCode.value    = menuSubCode;  // �޴����з��ڵ�
							document.frmOrder.cartMenuPrice.value         = menuPrice;  // �޴��ֹ��ܰ�
							document.frmOrder.cartMenuAmt.value          = menuPrice;  // �޴��ֹ��ݾ�
							document.frmOrder.cartMenuDisRate.value      = "0";  // �޴�������
							document.frmOrder.cartMenuDisAmt.value       = menuDiscountPrice;  // �޴����αݾ� 
							document.frmOrder.cartMenuCopDisAmt.value  = "0";  // �޴���������������
							document.frmOrder.cartMenuNetSaleAmt.value = menuPrice;  // �޴�������ݾ�
							document.frmOrder.cartMenuPayAmt.value      = menuPrice;  // �޴������ݾ�
							document.frmOrder.cartMenuMessage.value    = "";  // �޴����޸޼���
							document.frmOrder.cartMenuSize.value          = menuSize;  // �޴�������
							document.frmOrder.cartMenuDough.value         = menuDough;  // �޴���������
							document.frmOrder.cartECouponCompany.value = "";  // E�������޻�
							document.frmOrder.cartECouponCode.value      = promotionCouponCode+"_"+promCouponIndex;  // E�����ڵ�
							document.frmOrder.cartECouponNumber.value  = "SUB";  // E������ȣ - ����޴�,���θ޴�����

//				 			console.log("1. in sub_menu ");
			 			}
			 		} 
			 		
			 		/* //�޴���з��ڵ庰 �޴�Ÿ�� �� �޴����� ����
					if( document.frmOrder.cartMenuLagCode.value == "10" )  // ����
					{
						document.frmOrder.cartMenuType.value = "typePizza";  // �޴� Ÿ��
						document.frmOrder.cartMenuQty.value  = "1";          // �޴� ����
					}
					else if( document.frmOrder.cartMenuLagCode.value == "20" )  // ���̵�
					{
						document.frmOrder.cartMenuType.value = "typeSide";   // �޴� Ÿ��
						document.frmOrder.cartMenuQty.value  = "1";   // �޴� ����
					}
					else if( document.frmOrder.cartMenuLagCode.value == "30" )  // �ҽ�
					{
						document.frmOrder.cartMenuType.value = "typeSauce";  // �޴� Ÿ��
						document.frmOrder.cartMenuQty.value  = "1";   // �޴� ����
					}
					else if( document.frmOrder.cartMenuLagCode.value == "40" )  // ����
					{
						document.frmOrder.cartMenuType.value = "typeBever";  // �޴� Ÿ��
						document.frmOrder.cartMenuQty.value  = "1";   // �޴� ����
					} */
					
					
					//20140619 �޴� Ÿ�� ����
			 		document.frmOrder.cartMenuType.value = "typePromotion";  
					document.frmOrder.cartMenuQty.value  = "1"; 
			 		
//			 		console.log("2. in �����غ� " + document.frmOrder.cartMenuType.value);
				
			    	//if( document.frmOrder.cartMenuType.value == "typePizza" )
			    	if($("#cartMenuCode").val() != "" && $("#cartMenuCode").val() != null) // 20140620 each���鼭 ���� ��� ���ื��
			    	{	
			    		if( document.frmOrder.cartMenuLagCode.value == "10" )		//��з� �ڵ�� ���� ����
				    	{
							cartSendDataInfo = {
									    cartAction         : document.frmOrder.cartAction.value          // ��ٱ���ó��
						    		   ,cartMenuType       : document.frmOrder.cartMenuType.value        // �޴�Ÿ��
	    	    					   ,cartMenuCode       : document.frmOrder.cartMenuCode.value        // �޴��ڵ�
	    	    					   ,cartMenuName       : document.frmOrder.cartMenuName.value        // �޴���
	    	    					   ,cartMenuOrdCode    : document.frmOrder.cartMenuOrdCode.value     // �޴��ֹ������ڵ�(10:����,20:����,30:����(����))
	    	    					   ,cartMenuDivCode    : document.frmOrder.cartMenuDivCode.value     // �޴������ڵ�(10:��ǰ,20:��Ʈ,30:����&����)
	    	    					   ,cartMenuLagCode    : document.frmOrder.cartMenuLagCode.value     // �޴���з��ڵ�
	    	    					   ,cartMenuMidCode    : document.frmOrder.cartMenuMidCode.value     // �޴��ߺз��ڵ�
	    	    					   ,cartMenuSmlCode    : document.frmOrder.cartMenuSmlCode.value     // �޴��Һз��ڵ�
	    	    					   ,cartMenuSubCode    : document.frmOrder.cartMenuSubCode.value     // �޴����з��ڵ�
	    	    					   ,cartMenuPrice      : document.frmOrder.cartMenuPrice.value       // �޴��ֹ��ܰ�
	    	    					   ,cartMenuQty        : document.frmOrder.cartMenuQty.value         // �޴��ֹ�����
	    	    					   ,cartMenuAmt        : document.frmOrder.cartMenuAmt.value         // �޴��ֹ��ݾ�
	    	    					   ,cartMenuDisRate    : document.frmOrder.cartMenuDisRate.value     // �޴�������
	    	    					   ,cartMenuDisAmt     : document.frmOrder.cartMenuDisAmt.value      // �޴����αݾ�
	    	    					   ,cartMenuCopDisAmt  : document.frmOrder.cartMenuCopDisAmt.value   // �޴���������������
	    	    					   ,cartMenuNetSaleAmt : document.frmOrder.cartMenuNetSaleAmt.value  // �޴�������ݾ�
	    	    					   ,cartMenuPayAmt     : document.frmOrder.cartMenuPayAmt.value      // �޴������ݾ�
	    	    					   ,cartMenuBakeCode   : document.frmOrder.cartMenuBakeCode.value    // �޴�����ũ�ڵ�
	    	    					   ,cartMenuCutCode    : document.frmOrder.cartMenuCutCode.value     // �޴����ڵ�
	    	    					   ,cartMenuCheeseCode : document.frmOrder.cartMenuCheeseCode.value  // �޴�ġ���ڵ�
	    	    					   ,cartMenuSauceCode  : document.frmOrder.cartMenuSauceCode.value   // �޴��ҽ��ڵ�
	    	    					   ,cartMenuMessage    : document.frmOrder.cartMenuMessage.value     // �޴����޸޼���
	    	    					   ,cartMenuSize       : document.frmOrder.cartMenuSize.value        // �޴�������
	    	    					   ,cartMenuDough      : document.frmOrder.cartMenuDough.value       // �޴���������
									   ,cartMenuOption     : cartMenuOptions                             // �޴��ɼ�
									   ,cartECouponCompany : document.frmOrder.cartECouponCompany.value  // E�������޻�
									   ,cartECouponCode    : document.frmOrder.cartECouponCode.value     // E�����ڵ�
									   ,cartECouponNumber  : document.frmOrder.cartECouponNumber.value   // E������ȣ
	   			               }; 
					    	fnSaveForCart(cartSendDataInfo);  
				 			//console.log("3. in ����޴� ���� " + document.frmOrder.cartMenuName.value );
				    	}
				    	else		//��з� 10�� �ƴ� �޴� (���̵�, ����, �ҽ�)
				    	{
				    		cartSendDataInfo = {
							    			cartAction         : document.frmOrder.cartAction.value          // ��ٱ���ó��
				    					   ,cartMenuType       : document.frmOrder.cartMenuType.value        // �޴�Ÿ��
										   ,cartMenuCode       : document.frmOrder.cartMenuCode.value        // �޴��ڵ�
										   ,cartMenuName       : document.frmOrder.cartMenuName.value        // �޴���
										   ,cartMenuOrdCode    : document.frmOrder.cartMenuOrdCode.value     // �޴��ֹ������ڵ�(10:����,20:����,30:����(����))
										   ,cartMenuDivCode    : document.frmOrder.cartMenuDivCode.value     // �޴������ڵ�(10:��ǰ,20:��Ʈ,30:����&����)
										   ,cartMenuLagCode    : document.frmOrder.cartMenuLagCode.value     // �޴���з��ڵ�
										   ,cartMenuMidCode    : document.frmOrder.cartMenuMidCode.value     // �޴��ߺз��ڵ�
										   ,cartMenuSmlCode    : document.frmOrder.cartMenuSmlCode.value     // �޴��Һз��ڵ�
										   ,cartMenuSubCode    : document.frmOrder.cartMenuSubCode.value     // �޴����з��ڵ�
										   ,cartMenuPrice      : document.frmOrder.cartMenuPrice.value       // �޴��ֹ��ܰ�
										   ,cartMenuQty        : document.frmOrder.cartMenuQty.value         // �޴��ֹ�����
										   ,cartMenuAmt        : document.frmOrder.cartMenuAmt.value         // �޴��ֹ��ݾ�
										   ,cartMenuDisRate    : document.frmOrder.cartMenuDisRate.value     // �޴�������
										   ,cartMenuDisAmt     : document.frmOrder.cartMenuDisAmt.value      // �޴����αݾ� 
				    					   ,cartMenuCopDisAmt  : document.frmOrder.cartMenuCopDisAmt.value   // �޴���������������
				    					   ,cartMenuNetSaleAmt : document.frmOrder.cartMenuNetSaleAmt.value  // �޴�������ݾ�
										   ,cartMenuPayAmt     : document.frmOrder.cartMenuPayAmt.value      // �޴������ݾ�
				    					   ,cartMenuBakeCode   : document.frmOrder.cartMenuBakeCode.value    // �޴�����ũ�ڵ�
				    					   ,cartMenuCutCode    : document.frmOrder.cartMenuCutCode.value     // �޴����ڵ�
				    					   ,cartMenuCheeseCode : document.frmOrder.cartMenuCheeseCode.value  // �޴�ġ���ڵ�
				    					   ,cartMenuSauceCode  : document.frmOrder.cartMenuSauceCode.value   // �޴��ҽ��ڵ�
										   ,cartMenuMessage    : document.frmOrder.cartMenuMessage.value     // �޴����޸޼���
										   ,cartMenuSize       : document.frmOrder.cartMenuSize.value        // �޴�������
										   ,cartMenuDough      : document.frmOrder.cartMenuDough.value       // �޴���������
										   ,cartMenuOption     : cartMenuOptions                             // �޴��ɼ�
										   ,cartECouponCompany : document.frmOrder.cartECouponCompany.value  // E�������޻�
										   ,cartECouponCode    : document.frmOrder.cartECouponCode.value     // E�����ڵ�
										   ,cartECouponNumber  : document.frmOrder.cartECouponNumber.value   // E������ȣ
			           		       }; 
							fnSaveForCart(cartSendDataInfo);
				 			//console.log("3. in ���θ޴� ���� " + document.frmOrder.cartMenuName.value );
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
    		
	   	});/* end -- ���� ���� üũ */
	   	
	}/* end -- fnPromotionAddCart */
	
</script>

<form id="frmOrder" name="frmOrder" method="post" onsubmit="return false;">
	<!-- ���� -->
	<input type="hidden" id="onlineGroupCd"       name="onlineGroupCd"       value="" />  <!-- �¶��� �޴��׷��ڵ�        -->
	<input type="hidden" id="pizzaSelIdx"         name="pizzaSelIdx"         value="" />  <!-- ���� �׷�޴�              --> 
	<input type="hidden" id="menuSoldOutYn"       name="menuSoldOutYn"       value="" />  <!-- �޴� ǰ�� ����             -->
	<!-- ��ٱ��� (����) -->
	<input type="hidden" id="cartAction"          name="cartAction"          value="" />  <!-- ��ٱ��� ó��              -->
	<!-- ��ٱ��� (�ֹ�) -->
	<input type="hidden" id="cartOrdCustName"     name="cartOrdCustName"     value="" />  <!-- ����                     -->
	<input type="hidden" id="cartOrdCustPhone"    name="cartOrdCustPhone"    value="" />  <!-- ��ȭ��ȣ                   -->
	<input type="hidden" id="cartOrdDivide"       name="cartOrdDevide"       value="" />  <!-- �ֹ�����(�ֹ�����)         -->
	<input type="hidden" id="cartOrdReserve"      name="cartOrdReserve"      value="" />  <!-- �����ֹ�����               -->
	<input type="hidden" id="cartOrdResDate"      name="cartOrdResDate"      value="" />  <!-- ��������                   -->
	<input type="hidden" id="cartOrdResTime"      name="cartOrdResTime"      value="" />  <!-- ����ð�                   -->
	<input type="hidden" id="cartOrdDevAddr1"     name="cartOrdDevAddr1"     value="" />  <!-- ������ּ�1                -->
	<input type="hidden" id="cartOrdDevAddr2"     name="cartOrdDevAddr2"     value="" />  <!-- ������ּ�2                -->
	<input type="hidden" id="cartOrdDevAddr3"     name="cartOrdDevAddr3"     value="" />  <!-- ������ּ�3                -->
	<input type="hidden" id="cartOrdDevAddr4"     name="cartOrdDevAddr4"     value="" />  <!-- ������ּ�4                -->
	<input type="hidden" id="cartOrdAddressID"    name="cartOrdAddressID"    value="" />  <!-- ADDRESS_ID                 -->
	<input type="hidden" id="cartOrdStoreCode"    name="cartOrdStoreCode"    value="" />  <!-- �����ڵ�                   -->
	<input type="hidden" id="cartOrdStoreName"    name="cartOrdStoreName"    value="" />  <!-- �����                     -->
	<input type="hidden" id="cartOrdSectorCode"   name="cartOrdSectorCode"   value="" />  <!-- ���弽���ڵ�               -->
	<input type="hidden" id="cartOrdSectorName"   name="cartOrdSectorName"   value="" />  <!-- ���弽�͸�                 -->
	<input type="hidden" id="cartOrdDeliveryTime" name="cartOrdDeliveryTime" value="" />  <!-- ���Ϳ���ð�               -->
	<input type="hidden" id="cartOrdDeliveryYN"   name="cartOrdDeliveryYN"   value="" />  <!-- ��ް��ɿ���               -->
	<input type="hidden" id="cartOrdNewAddressYN" name="cartOrdNewAddressYN" value="" />  <!-- ������ּҽű��߰�����     -->
	<!-- ��ٱ��� (�ֹ��� : �޴�) -->
	<input type="hidden" id="cartMenuType"        name="cartMenuType"        value="" />  <!-- �޴�Ÿ��                   -->
	<input type="hidden" id="cartMenuCode"        name="cartMenuCode"        value="" />  <!-- �޴��ڵ�                   -->
	<input type="hidden" id="cartMenuName"        name="cartMenuName"        value="" />  <!-- �޴���                     -->
	<input type="hidden" id="cartMenuOrdCode"     name="cartMenuOrdCode"     value="" />  <!-- �޴��ֹ������ڵ�           --> <!-- 10:����,20:����,30:����(����) -->
	<input type="hidden" id="cartMenuDivCode"     name="cartMenuDivCode"     value="" />  <!-- �޴������ڵ�               --> <!-- 10:��ǰ,20:��Ʈ,30:����&���� -->
	<input type="hidden" id="cartMenuLagCode"     name="cartMenuLagCode"     value="" />  <!-- �޴���з��ڵ�             -->
	<input type="hidden" id="cartMenuMidCode"     name="cartMenuMidCode"     value="" />  <!-- �޴��ߺз��ڵ�             -->
	<input type="hidden" id="cartMenuSmlCode"     name="cartMenuSmlCode"     value="" />  <!-- �޴��Һз��ڵ�             -->
	<input type="hidden" id="cartMenuSubCode"     name="cartMenuSubCode"     value="" />  <!-- �޴����з��ڵ�             -->
	<input type="hidden" id="cartMenuPrice"       name="cartMenuPrice"       value="" />  <!-- �޴��ֹ��ܰ�               -->
	<input type="hidden" id="cartMenuQty"         name="cartMenuQty"         value="" />  <!-- �޴��ֹ�����               -->
	<input type="hidden" id="cartMenuAmt"         name="cartMenuAmt"         value="" />  <!-- �޴��ֹ��ݾ�               -->
	<input type="hidden" id="cartMenuDisRate"     name="cartMenuDisRate"     value="" />  <!-- �޴�������                 -->
	<input type="hidden" id="cartMenuDisAmt"      name="cartMenuDisAmt"      value="" />  <!-- �޴����αݾ�               -->
	<input type="hidden" id="cartMenuCopDisAmt"   name="cartMenuCopDisAmt"   value="" />  <!-- �޴���������������         -->
	<input type="hidden" id="cartMenuNetSaleAmt"  name="cartMenuNetSaleAmt"  value="" />  <!-- �޴�������ݾ�             -->
	<input type="hidden" id="cartMenuPayAmt"      name="cartMenuPayAmt"      value="" />  <!-- �޴������ݾ�               -->
	<input type="hidden" id="cartMenuBakeCode"    name="cartMenuBakeCode"    value="" />  <!-- �޴�����ũ�ڵ�             -->
	<input type="hidden" id="cartMenuCutCode"     name="cartMenuCutCode"     value="" />  <!-- �޴����ڵ�                 -->
	<input type="hidden" id="cartMenuCheeseCode"  name="cartMenuCheeseCode"  value="" />  <!-- �޴�ġ���ڵ�               -->
	<input type="hidden" id="cartMenuSauceCode"   name="cartMenuSauceCode"   value="" />  <!-- �޴��ҽ��ڵ�               -->
	<input type="hidden" id="cartMenuMessage"     name="cartMenuMessage"     value="" />  <!-- �޴����޸޼���             -->
	<input type="hidden" id="cartMenuSize"        name="cartMenuSize"        value="" />  <!-- �޴�������                 -->
	<input type="hidden" id="cartMenuDough"       name="cartMenuDough"       value="" />  <!-- �޴���������               -->
	<input type="hidden" id="cartECouponCompany"  name="cartECouponCompany"  value="" />  <!-- E�������޻�                -->
	<input type="hidden" id="cartECouponCode"     name="cartECouponCode"     value="" />  <!-- E�����ڵ�                  -->
	<input type="hidden" id="cartECouponNumber"   name="cartECouponNumber"   value="" />  <!-- E������ȣ                  -->
	<!-- ȭ�� : ����&���� -->
	<input type="hidden" id="halfMenuCode1"       name="halfMenuCode1"       value="" />  <!-- (����)�����޴��ڵ�         -->
	<input type="hidden" id="halfMenuName1"       name="halfMenuName1"       value="" />  <!-- (����)�����޴���           -->
	<input type="hidden" id="halfMenuLagCode1"    name="halfMenuLagCode1"    value="" />  <!-- (����)�����޴���з��ڵ�   -->
	<input type="hidden" id="halfMenuMidCode1"    name="halfMenuMidCode1"    value="" />  <!-- (����)�����޴��ߺз��ڵ�   -->
	<input type="hidden" id="halfMenuSmlCode1"    name="halfMenuSmlCode1"    value="" />  <!-- (����)�����޴��Һз��ڵ�   -->
	<input type="hidden" id="halfMenuSubCode1"    name="halfMenuSubCode1"    value="" />  <!-- (����)�����޴����з��ڵ�   -->
	<input type="hidden" id="halfMenuPrice1"      name="halfMenuPrice1"      value="" />  <!-- (����)�����޴��ܰ�         -->
	<input type="hidden" id="halfMenuQty1"        name="halfMenuQty1"        value="" />  <!-- (����)�����޴�����         -->
	<input type="hidden" id="halfMenuAmt1"        name="halfMenuAmt1"        value="" />  <!-- (����)�����޴��ݾ�         -->
	<input type="hidden" id="halfMenuSize1"       name="halfMenuSize1"       value="" />  <!-- (����)�����޴�������       -->
	<input type="hidden" id="halfMenuDough1"      name="halfMenuDough1"      value="" />  <!-- (����)�����޴���������     -->
	<input type="hidden" id="halfMenuCode2"       name="halfMenuCode2"       value="" />  <!-- (������)�����޴��ڵ�       -->
	<input type="hidden" id="halfMenuName2"       name="halfMenuName2"       value="" />  <!-- (������)�����޴���         -->
	<input type="hidden" id="halfMenuLagCode2"    name="halfMenuLagCode2"    value="" />  <!-- (������)�����޴���з��ڵ� -->
	<input type="hidden" id="halfMenuMidCode2"    name="halfMenuMidCode2"    value="" />  <!-- (������)�����޴��ߺз��ڵ� -->
	<input type="hidden" id="halfMenuSmlCode2"    name="halfMenuSmlCode2"    value="" />  <!-- (������)�����޴��Һз��ڵ� -->
	<input type="hidden" id="halfMenuSubCode2"    name="halfMenuSubCode2"    value="" />  <!-- (������)�����޴����з��ڵ� -->
	<input type="hidden" id="halfMenuPrice2"      name="halfMenuPrice2"      value="" />  <!-- (������)�����޴��ܰ�       -->
	<input type="hidden" id="halfMenuQty2"        name="halfMenuQty2"        value="" />  <!-- (������)�����޴�����       -->
	<input type="hidden" id="halfMenuAmt2"        name="halfMenuAmt2"        value="" />  <!-- (������)�����޴��ݾ�       -->
	<input type="hidden" id="halfMenuSize2"       name="halfMenuSize2"       value="" />  <!-- (������)�����޴�������     -->
	<input type="hidden" id="halfMenuDough2"      name="halfMenuDough2"      value="" />  <!-- (������)�����޴���������   -->
	<!-- ȭ�� : E���� -->
	<input type="hidden" id="eCouponCompany"      name="eCouponCompany"      value="" />  <!-- E�������޻�                -->
	<input type="hidden" id="eCouponCode"         name="eCouponCode"         value="" />  <!-- E�����ڵ�                  -->
	<input type="hidden" id="eCouponName"         name="eCouponName"         value="" />  <!-- E������                    -->
	<input type="hidden" id="eCouponNumber"       name="eCouponNumber"       value="" />  <!-- E������ȣ                  -->
	<!-- ȭ�� : E�����޴� -->
	<input type="hidden" id="ecopMenuCode"        name="ecopMenuCode"        value="" />  <!-- E�����޴��ڵ�              -->
	<input type="hidden" id="ecopMenuName"        name="ecopMenuName"        value="" />  <!-- E�����޴���                -->
	<input type="hidden" id="ecopMenuDivCode"     name="ecopMenuDivCode"     value="" />  <!-- E�����޴������ڵ�          -->
	<input type="hidden" id="ecopMenuLagCode"     name="ecopMenuLagCode"     value="" />  <!-- E�����޴���з��ڵ�        -->
	<input type="hidden" id="ecopMenuMidCode"     name="ecopMenuMidCode"     value="" />  <!-- E�����޴��ߺз��ڵ�        -->
	<input type="hidden" id="ecopMenuSmlCode"     name="ecopMenuSmlCode"     value="" />  <!-- E�����޴��Һз��ڵ�        -->
	<input type="hidden" id="ecopMenuSubCode"     name="ecopMenuSubCode"     value="" />  <!-- E�����޴����з��ڵ�        -->
	<input type="hidden" id="ecopMenuPrice"       name="ecopMenuPrice"       value="" />  <!-- E�����޴��ܰ�              -->
	<input type="hidden" id="ecopMenuDiscAmt"     name="ecopMenuDiscAmt"     value="" />  <!-- E�����޴����αݾ�          -->
	<input type="hidden" id="ecopMenuSaleAmt"     name="ecopMenuSaleAmt"     value="" />  <!-- E�����޴��Ǹűݾ�          -->
	<input type="hidden" id="ecopMenuSize"        name="ecopMenuSize"        value="" />  <!-- E�����޴�������            -->

	<!-- �޴� -->
	<!-- con_container -->
	<div id="con_container">
  		<!-- conternts --> 
  		<div id="contents">
    		<h2 class="hidden"><!--�������� ��--></h2>
    		<!-- cont --> 
    		<div class="cont">
      			<!-- menuNavi_section -->
      			<div id="menuNavi_section">
        			<div class="pizza">
          				<h3 class="hidden">����</h3>
          				<ul class="pizza_list">
            				<!-- <li><a href="javascript:fnSelMenuGroup('0', '00' );">�̴��� ���θ��</a></li> -->
            				<li>
            					<a href="orderAction.action?menuId=pj_2002&pizzaSelIdx=0" style="background: url(../assets/img/order/ordMenu_pizza1.gif) no-repeat">����Ʈ�޴�</a>
            				</li>
            				<li>
            					<a href="orderAction.action?menuId=pj_2003&pizzaSelIdx=1" style="background: url(../assets/img/order/ordMenu_pizza2.gif) no-repeat;">��������</a>
            				</li>
            				<li>
            					<a href="orderAction.action?menuId=pj_2004&pizzaSelIdx=2" style="background: url(../assets/img/order/ordMenu_pizza3.gif) no-repeat;">��帵</a>
            				</li>
            				<li>
            					<a href="orderAction.action?menuId=pj_2005&pizzaSelIdx=3" style="background: url(../assets/img/order/ordMenu_pizza4.gif) no-repeat;">ġ���</a>
            				</li>
            				<li>
            					<a href="orderAction.action?menuId=pj_2006&pizzaSelIdx=4" style="background: url(../assets/img/order/ordMenu_pizza5.gif) no-repeat;">��</a>
            				</li>
            				<li style="display:none;">
            					<a href="javascript:fnSelMenuGroup('5', '50' );" style="background: url(../assets/img/order/ordMenu_pizza6.gif) no-repeat;">�������ξ�</a>
            				</li>
            				<li>
            					<a href="orderAction.action?menuId=pj_2008&pizzaSelIdx=6" style="background: url(../assets/img/order/ordMenu_pizza7.gif) no-repeat;">��帵��</a>
            				</li>
            				<li>
            					<a href="orderAction.action?menuId=pj_2009&pizzaSelIdx=7" style="background: url(../assets/img/order/ordMenu_pizza8.gif) no-repeat;">��Ʈ��</a>
            				</li>
          				</ul>
        			</div>
        			<div class="side">
          				<h3 class="hidden">��Ʈ/���̵�/����</h3>
          				<ul class="side_list">
            				<!-- <li><a href="javascript:fnViewDiv('prom');"><img src="../assets/img/order/ord_menu_prom_btn.png" alt="�̴��� ���θ��" /></a></li> -->
            				<li><a href="orderAction.action?menuId=pj_2011&pizzaSelIdx=${param.pizzaSelIdx }"><img src="../assets/img/order/ord_menu_set_btn2.png" alt="��Ʈ�޴�" /></a></li>
            				<li><a href="orderAction.action?menuId=pj_2013&pizzaSelIdx=${param.pizzaSelIdx}"><img src="../assets/img/order/ord_menu_drink_btn.png" alt="����" /></a></li>
            			</ul>
        			</div>
        			<div class="coupon">
          				<ul class="coupon_list">   				
            				<li><a href="orderAction.action?menuId=pj_2012&pizzaSelIdx=${param.pizzaSelIdx}"><img src="../assets/img/order/ord_menu_side_btn.png" alt="���̵�" /></a></li>
            				<li><a href="orderAction.action?menuId=pj_2010&pizzaSelIdx=${param.pizzaSelIdx}"><img src="../assets/img/order/ord_menu_plt_btn.png" alt="�����÷���" /></a></li>
            			<!-- <li><a href="javascript:fnSelMenuGroup('9', '80');"><img src="../assets/img/order/ord_menu_drink_btn.png" alt="����" /></a></li> -->
          				</ul>
        			</div>
        			
        			<!-- 20140210 �̴��� ���θ�� ��ư���� �и� -->
      				<!-- 20140424 �����÷���, �ݰ� ���θ�� ��ư �߰� & ���̾ƿ� ���� -->
      				<div class="promotion">
      					<ul class="etc_list">
            				<!--  <li><a href="javascript:fnViewDiv('half');"><img src="../assets/img/order/ord_menu_half_btn.png" alt="��������������" /></a></li> -->
            				<%-- 
            				<li><a href="orderAction.action?menuId=pj_2013&pizzaSelIdx=${param.pizzaSelIdx}"><img src="../assets/img/order/ord_menu_drink_btn.png" alt="����" /></a></li>
            				<li><a href="orderAction.action?menuId=pj_2014&pizzaSelIdx=${param.pizzaSelIdx}"><img src="../assets/img/order/ord_menu_sauce_btn.png" alt="�ҽ�&��Ŭ" /></a></li>
            				--%>
            				<!--  <li><a href="javascript:fnViewDiv('coupon');"><img src="../assets/img/order/ord_menu_ecu_btn.png" alt="e�����޴�" /></a></li> -->
           				</ul>
       				</div>
      			</div>
      			<!-- menuNavi_section end -->
      			
      			<!-- menuList_section -->
				<div id="menuList_section"> 
				<c:forEach var="li" items="${list}" varStatus="status">
					<!-- item -->
					<!-- ����Ʈ�޴�(pj_2002), ��������(pj_2003), ��帵(pj_2004), ġ���(pj_2005), ��(pj_2006), ��帵��(pj_2008), ��Ʈ��(pj_2009) -->
					<c:if test="${ li.menuid eq 'pj_2002' || li.menuid eq 'pj_2003' || li.menuid eq 'pj_2004' || li.menuid eq 'pj_2005'
									|| li.menuid eq 'pj_2006' || li.menuid eq 'pj_2008' || li.menuid eq 'pj_2009'}">
						<div id='menu_${status.count}' class='item'>
							<!-- ���� �̹��� ���� -->
							<!-- item_left -->
							<div class='item_left'>
								<p class='photo'>
									<img src='${li.imagepathorder}' alt='${li.name}' title='${li.name}' onerror="this.src='/assets/img/order/menu/noImage_ord.png'" />
								</p> 
								<p class='name' id='pName_1'>${li.name}</p> 
								<p><button type='button' id='basket_1' name='basket_1' onclick="makeSendData('1');fnReset_spcOption_up($(this));">��ٱ��Ͽ����</button></p> 
							</div>
							<!--// item_left --> 
							<!--// item_right -->
							<div class='item_right'>
								<!-- size --> 
								<div class='size'> 
									<input type='hidden' name='pCode_1' value='50330,������Ÿ,R,15900,��������,10,1018,3001,4001,10' />
									<c:if test="${ li.rprice != null}">
										<p class='label_radio menu_size_radio' >
											<c:set var="str" value="${li.rprice}"/>
											<input type='radio' name='pSize_1' value='${fn:substring(str, 0, fn:length(str)-1)}' />
											<img src='../assets/img/order/ord_menuList_size_R.png' alt='���ַ�' title='Regular'/>
											<span class='price' >${fn:substring(str, 0, fn:length(str)-1)}</span>
										</p>
									</c:if>
									<input type='hidden' name='pCode_1' value='50332,������Ÿ,L,21500,��������,10,1018,3002,4001,10' />
									<c:if test="${ li.lprice != null}">
										<p class='label_radio menu_size_radio' >
											<c:set var="str" value="${li.lprice}"/>
											<input type='radio' name='pSize_1' value='${fn:substring(str, 0, fn:length(str)-1)}' />
											<img src='../assets/img/order/ord_menuList_size_L.png' alt='����' title='large'/>
											<span class='price' >${fn:substring(str, 0, fn:length(str)-1)}</span>   
										</p>
									</c:if>
									<input type='hidden' name='pCode_1' value='50329,������Ÿ,F,25900,��������,10,1018,3003,4001,10' />
									<c:if test="${ li.fprice != null}">
										<p class='label_radio menu_size_radio' >
											<c:set var="str" value="${li.fprice}"/>
											<input type='radio' name='pSize_1' value='${fn:substring(str, 0, fn:length(str)-1)}' />
											<img src='../assets/img/order/ord_menuList_size_F.png' alt='�йи�' title='family'/>
											<span class='price' >${fn:substring(str, 0, fn:length(str)-1)}</span>   
										</p>
									</c:if>
									<input type='hidden' name='pCode_1' value='50322,������Ÿ,P,34500,��������,10,1018,3005,4001,10' />
									<c:if test="${ li.pprice != null}">
										<p class='label_radio menu_size_radio' >
											<c:set var="str" value="${li.pprice}"/>
										  	<input type='radio' name='pSize_1' value='${fn:substring(str, 0, fn:length(str)-1)}' />
											<img src='../assets/img/order/ord_menuList_size_P.png' alt='��Ƽ' title='party'/>
											<span class='price' >${fn:substring(str, 0, fn:length(str)-1)}</span>   
										</p>	
									</c:if>
								</div>		
								<script type="text/javascript">
									//20140304 ������ư ����Ʈ ��ġ�� ����������� ����
									var firstSize = $("#menu_1 .size img").attr("title");
									if(firstSize == "Regular"){ra_check($("#menu_1 .size .menu_size_radio").eq(1));}
									else{ra_check($("#menu_1 .size .menu_size_radio").eq(0));}
								</script>
								<!--// size -->
								<!--// size -->   	
								<div class='spcInstruction'>  	
									<p class='btn'>
										<img src='../assets/img/order/btn_opt_off.gif' alt='����' />
									</p>   
									<!-- �ɼǺ��� ��ǳ�� -->    
									<div class='comment'>   
										<p class='top'>
											<img src='../assets/img/order/ord_menuList_detail_commBg_top.png' alt=''>
										</p>   
										<p class='bottom'>
											<img src='../assets/img/order/ord_menuList_detail_commBg_bottom.png' alt=''>
										</p>   
										<p class='center'>
											<span>special instructions :</span><br>
											��ư Ŭ�� �� sauce, cheese, bake, cut ���¸� �����Ͻ� �� �ֽ��ϴ�.<br>
											��ٱ��Ͽ� ���� �� �����Ͻ÷��� �޴��� ��ٱ��Ͽ��� ������ �ٽ� �����ž� �մϴ�!!
										</p>    
									</div>   
									<!--// �ɼǺ��� ��ǳ�� -->   	
								</div>  	
								<!-- detail -->   	
								<div class='detail'>   		
									<p class='btn'>
										<img src='../assets/img/order/btn_info.gif' alt='�󼼼���'/>
									</p>
									<!-- �󼼺��� ��ǳ�� -->
									<div class='comment'>
										<p class='top'><img src='../assets/img/order/ord_menuList_detail_commBg_top.png' alt=''></p>
										<p class='bottom'><img src='../assets/img/order/ord_menuList_detail_commBg_bottom.png' alt=''></p>
										<dl>
											<dt>�������:</dt>
			                  				<dd>${li.topping}</dd>
			                			</dl>
			              			</div>
			              			<!--// �󼼺��� ��ǳ�� -->
			            		</div>
			            		<!--// detail -->
			            		<p class="select_price">0</p>
	          				</div>
							<!--// item_right -->  
	          				<!-- 20130926 �ҽ�&ġ��&Ŀ��&����ũ �ɼ��ֱ� -->
	          				<div id ="option_box_1" class="option_box"><!--  display: none; -->
		          				<ul class="spcInstructions">
		         					<li>
		        						<p onclick="fnAdjustMenu('1_1',$(this));">�ҽ� ���� <span class="imgsp">��</span></p>
		        						<div id="1_1" class="option">
											<p class="menu_opt_radio" >
												<input type="radio" id="1_regularSauce" name="1_sau_radio" value=""/>
			          							<label for="1_regularSauce">�ҽ� ����(Normal)</label>
		          							</p>
											<p class="menu_opt_radio" >
												<input type="radio" id="1_lightSauce" name="1_sau_radio" value="20"/>
			          							<label for="1_lightSauce">�ҽ� ����(LS)</label>
		          							</p>
											<p class="menu_opt_radio" >
												<input type="radio" id="1_extraSauce" name="1_sau_radio" value="30"/>
			          							<label for="1_extraSauce">�ҽ� ����(XS)</label>
		          							</p>
											<p class="menu_opt_radio" >
												<input type="radio" id="1_noSauce" name="1_sau_radio" value="40"/>
			          							<label for="1_noSauce">�ҽ� ����(NS)</label>
		          							</p>
										</div>
		       						</li>
		       						<li style=" cursor:pointer;">
		        						<p onclick="fnAdjustMenu('1_2',$(this));">ġ�� ���� <span class="imgsp">��</span></p>
		        						<div id="1_2" class="option">
											<p class="menu_opt_radio" >
												<input type="radio" id="1_normalCheese" name="1_chee_radio" value="" />
			          							<label for="1_normalCheese">ġ�� ����(Normal)</label>
		          							</p>
											<p class="menu_opt_radio" >
												<input type="radio" id="1_lightCheese" name="1_chee_radio" value="20"/>
			          							<label for="1_lightCheese">ġ�� ����(LC)</label>  
		          							</p>
											<p class="menu_opt_radio" >
												<input type="radio" id="1_noCheese" name="1_chee_radio" value="30"/>
			          							<label for="1_noCheese">ġ�� ����(NC)</label>
		          							</p>
										</div>
		       						</li>
		       						<li>
		        						<p onclick="fnAdjustMenu('1_3',$(this));">���� ���� <span class="imgsp">��</span></p>
		        						<div id="1_3" class="option">
											<p class="menu_opt_radio" >
												<input type="radio" id="1_normalBake" name="1_bake_radio" value=""/>
			          							<label for="1_normalBake">�⺻ ����(Normal)</label>
		          							</p>
											<p class="menu_opt_radio" >
												<input type="radio" id="1_wellDone" name="1_bake_radio" value="20"/>
			          							<label for="1_wellDone">�ٽ� ����(WD)</label> 
		          							</p>
										</div>
		       						</li>
		       						<li>
		        						<p onclick="fnAdjustMenu('1_4',$(this));">���� ���� <span class="imgsp">��</span></p>
		        						<div id="1_4" class="option">
											<p class="menu_opt_radio" >
												<input type="radio" id="1_normalCut" name="1_cut_radio" value=""/>
			          							<label for="1_normalCut">�⺻����(Normal)</label>
		          							</p>
											<p class="menu_opt_radio" >
												<input type="radio" id="1_squareCut" name="1_cut_radio" value="60"/>
			          							<label for="1_squareCut">�簢����(SC)</label>
		          							</p> 
											<p class="menu_opt_radio" >
												<input type="radio" id="1_sixCut" name="1_cut_radio" value="20"/>
			          							<label for="1_sixCut">6��������(6C)</label>
		          							</p> 
											<p class="menu_opt_radio" >
												<input type="radio" id="1_eightCut" name="1_cut_radio" value="30"/>
			          							<label for="1_eightCut">8��������(8C)</label>
		          							</p> 
											<p class="menu_opt_radio" >
												<input type="radio" id="1_tenCut" name="1_cut_radio" value="40"/>
			          							<label for="1_tenCut">10��������(10C)</label>
		          							</p> 
										</div>
		       						</li> 
		          				</ul>
			  				</div>
	        			</div>
        			</c:if>
					<!-- //item -->
					
					<!-- item -->
					<!-- ��Ʈ �޴� -->
					<c:if test="${ li.menuid eq 'pj_2011' }">
						<div id="set_section" class="" style="display: block;">
							<div class="set_items has-js" id="set_30348"> 
								<p class="image">
									<img src="../assets/img/order/menu/60/30348_ord.png" width="220" height="140" alt="50% ���� �������Ľ� ����Ʈ ��Ʈ �޴�" title="50% ���� �������Ľ� ����Ʈ ��Ʈ �޴�">
								</p>
								<p class="name" id="setNm"><c:out value="${li.name }"/><span class="size">(2-3�ο�)</span></p>
								<p class="btn_cart" onclick="fnAddSet($(this),'30348','20','50','','3020','');">
									<button type="button">��ٱ��Ͽ����</button>
								</p>
								<p class="description">
									<img src="../assets/img/order/ord_menuList_size_set.png" alt="������Ʈ" title="������Ʈ">�� <br>
									<span> : ${ li.consist} </span>
								</p>
								<div class="size_prc">
									<input type="hidden" name=" " value=" ">
									<c:set var="text" value="${li.setprice}"/>
									<p class="set_price">${ fn:substring(text,0,fn:length(text)-1) } </p>
									<p style="width:40px; position:absolute; top:10px; left:140px;">���� : </p>
									<p class="selcet_count">
										<select id="cnt_opt" name="cnt_opt">
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
					<!-- ���̵� -->
					<c:if test="${ li.menuid eq 'pj_2012' }">
						<div id='menu_${status.count}' class='item'>
							<!-- ���� �̹��� ���� -->
							<!-- item_left -->
							<div class='item_left'>
								<p class='photo'><img src='${li.imagepathorder}' alt='${li.name}' title='${li.name}' onerror="this.src='/assets/img/order/menu/noImage_ord.png'" /></p>
								<p class='name' id='pName_1'>${li.name}</p>
								<p><button type='button' id='basket_1' name='basket_1' onclick="makeSendData('1');fnReset_spcOption_up($(this));">��ٱ��Ͽ����</button></p>
							</div>
							<!--// item_left -->
							<!--// item_right -->
							<div class='item_right'>
								<!-- size -->
								<div class='size'>
									<input type='hidden' name='pCode_1' value='51036,���÷�,one,12900,,20,9001,3006,,10' />
									<p class='label_radio menu_size_radio'>
										<c:set var="str" value="${li.onesizeprice}"/>
										<input type='radio' name='pSize_1' value='${fn:substring(str, 0, fn:length(str)-1)}' />
										<img src='../assets/img/order/ord_menuList_size_one.png' alt='��������' title='One Size' />
										<span class='price'>${fn:substring(str, 0, fn:length(str)-1)}</span>
									</p>
								</div>
								<script type="text/javascript">
									//20140304 ������ư ����Ʈ ��ġ�� ����������� ����
									var firstSize = $("#menu_1 .size img").attr("title");
									if(firstSize == "Regular"){ra_check($("#menu_1 .size .menu_size_radio").eq(1));}
									else{ra_check($("#menu_1 .size .menu_size_radio").eq(0));}
								</script>
								<!--// size -->
								<div class='select_count'>
									<select id='cnt_opt1' name='cnt_opt'>
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
									<p class='btn'><img src='../assets/img/order/btn_info.gif' alt='�󼼼���' /></p>
									<!-- �󼼺��� ��ǳ�� -->
									<div class='comment'>
										<p class='top'><img src='../assets/img/order/ord_menuList_detail_commBg_top.png' alt=''></p>
										<p class='bottom'><img src='../assets/img/order/ord_menuList_detail_commBg_bottom.png' alt=''></p>
										<dl>
											<dd>
												<c:if test="${ li.material != null }">
													<b style = "color:#228a68;">���</b><br/>
													${li.material}<br/>
												</c:if>
												<c:if test="${li.presentsauce != null }">
													<b style = "color:#228a68;">�����ҽ�</b><br/>
													${li.presentsauce}
												</c:if>	
											</dd>
										</dl>
									</div>
									<!--// �󼼺��� ��ǳ�� -->
								</div>
								<!--// detail -->
								<p class="select_price">0</p>
							</div>
							<!--// item_right -->
						</div>
					</c:if>
					<!-- //item -->
					
					<!-- item -->
					<!-- �����÷��� -->
					<c:if test="${ li.menuid eq 'pj_2010' }">
						<div id="plat_section" class="" style="display: block;">
							<div class="item has-js" id="menu_50992">
								<p class="image"><img src="../assets/img/order/menu/11/1019_ord.png" width="220" height="140" alt="���� ���Ľ�" title="���� ���Ľ�"></p>
								<p class="name" id="pName_50992">${li.name}<span class="size">(BOX)</span></p>
								<p class="btn_cart" onclick="fnAddSet($(this), '50992,���� ���Ľ�,�����÷���,25900,,10,1019,3023,4001,10', '', '', '', '', '');""="">
									<button type="button">��ٱ��Ͽ����</button>
								</p>
								<p class="description">
									<img src="../assets/img/order/ord_menuList_size_box.png" alt="�÷��ͼ�Ʈ">����<br>
									<span> :${li.consist}</span>
								</p>
								<div class="size_prc">
									<c:set var="str" value="${li.boxprice}"/>
									<p class="price">${fn:substring(str, 0, fn:length(str)-1)}</p>
									<p style="width: 40px; position: absolute; top: 10px; left: 140px;">����
										:</p>
									<p class="selcet_count">
										<select id="cnt_opt" name="cnt_opt"><option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option></select>
									</p>
								</div>
							</div>
						</div>
					</c:if>					
					<!-- //item -->
					
					<!-- item -->
					<!-- ���� -->
					<c:if test="${li.menuid eq 'pj_2013' }">
						<div id='menu_${status.count}' class='item'>
							<!-- ���� �̹��� ���� -->
							<!-- item_left -->
							<div class='item_left'>
								<p class='photo'><img src='${li.imagepathorder}' alt='${li.name}' title='${li.name}' onerror="this.src='/assets/img/order/menu/noImage_ord.png'" /></p>
								<p class='name' id='pName_1'>${li.name}</p>
								<p><button type='button' id='basket_1' name='basket_1' onclick="makeSendData('1');fnReset_spcOption_up($(this));">��ٱ��Ͽ����</button></p>
							</div>
							<!--// item_left -->
							<!--// item_right -->
							<div class='item_right'>
								<!-- size -->
								<div class='size'>
									<!-- 350ML -->
									<c:if test="${li.name eq '�̴� ���̵� ������'}">
										<p class='label_radio menu_size_radio' >
											<input type='radio' name='pSize_9' value='${fn:substring(li.rprice, 0, fn:length(li.rprice)-1)}' />
											<img src='../assets/img/order/ord_menuList_size_350ml.png' alt='350ml' title='350ml'/><span class='price' >${fn:substring(li.rprice, 0, fn:length(li.rprice)-1)}</span>
										</p>	
									</c:if>
									<!-- 500ML -->
									<c:if test="${li.name eq '��ī�ݶ�' || li.name eq '��������Ʈ' || li.name eq '��ī�ݶ� ����' }">
										<p class='label_radio menu_size_radio'>
											<input type='radio' name='pSize_1' value='${fn:substring(li.rprice, 0, fn:length(li.rprice)-1)}' />
											<img src='../assets/img/order/ord_menuList_size_500ml.png' alt='500ml' title='500ml' /><span class='price'>${fn:substring(li.rprice, 0, fn:length(li.rprice)-1)}</span>
										</p>	
									</c:if>
									<!-- 600ML -->
									<c:if test="${li.name eq 'ȯŸ' }">
										<p class='label_radio menu_size_radio' >
											<input type='radio' name='pSize_7' value='${fn:substring(li.lprice, 0, fn:length(li.lprice)-1)}' />
											<img src='../assets/img/order/ord_menuList_size_600ml.png' alt='600ml' title='600ml'/><span class='price' >${fn:substring(li.rprice, 0, fn:length(li.rprice)-1)}</span> 
										</p>
									</c:if>
									<!-- 1.25L -->
									<c:if test="${li.name eq '��ī�ݶ�'}">
										<p class='label_radio menu_size_radio'>
											<input type='radio' name='pSize_1' value='${fn:substring(li.lprice, 0, fn:length(li.lprice)-1)}' />
											<img src='../assets/img/order/ord_menuList_size_1.25L.png' alt='1.25L' title='1.25L' /><span class='price'>${fn:substring(li.lprice, 0, fn:length(li.lprice)-1)}</span>
										</p>
									</c:if>
									<!-- 1.25L -->
									<c:if test="${li.name eq '��������Ʈ' || li.name eq '��ī�ݶ� ����' || li.name eq 'ȯŸ' || li.name eq '�̴� ���̵� ������'}">
										<p class='label_radio menu_size_radio' >
											<input type='radio' name='pSize_9' value='${fn:substring(li.lprice, 0, fn:length(li.lprice)-1)}' />
											<img src='../assets/img/order/ord_menuList_size_1.5L.png' alt='1.5L' title='1.5L'/><span class='price' >${fn:substring(li.lprice, 0, fn:length(li.lprice)-1)}</span>
										</p>
									</c:if>
								</div>
								<script type="text/javascript">
									//20140304 ������ư ����Ʈ ��ġ�� ����������� ����
									var firstSize = $("#menu_1 .size img").attr("title");
									if(firstSize == "Regular"){ra_check($("#menu_1 .size .menu_size_radio").eq(1));}
									else{ra_check($("#menu_1 .size .menu_size_radio").eq(0));}
								</script>
								<!--// size -->
								<!--// size -->
								<div class='select_count'>
									<select id='cnt_opt1' name='cnt_opt'>
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
									<p class='btn'><img src='../assets/img/order/btn_info.gif' alt='�󼼼���' /></p>
									<!-- �󼼺��� ��ǳ�� -->
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
					<!-- �ҽ�&��Ŭ -->
					<c:if test="${li.menuid eq 'pj_2014' }">
						<div id="menu_${status.count}" class="item has-js">
							<!-- ���� �̹��� ���� -->
							<!-- item_left -->
							<div class="item_left">
								<p class="photo"><img src="/assets/img/order/menu/90/3004_ord.png" alt="���� �ҽ�" title="���� �ҽ�" onerror="this.src='/assets/img/order/menu/noImage_ord.png'"></p>
								<p class="name" id="pName_1">���� �ҽ�</p>
								<p><button type="button" id="basket_1" name="basket_1" onclick="makeSendData('1');fnReset_spcOption_up($(this));">��ٱ��Ͽ����</button></p>
							</div>
						</div>
					</c:if>
					<!-- //item -->
				</c:forEach>
				</div>
      			<!--// menuList_section -->      			
       		<!-- 20140616 ���θ�� �޴� ȭ�� ���� (���÷� ��� ����) -->
			<div id="prom_section" style="display: none;">
          		<div class="prom_section_coup">
            				
       				<label for="prom_coupon" class="hidden">����</label>
       				<select id="prom_coupon" name="prom_coupon" class="s_coup" onchange="fnPromotionMainMenu(this.value); fnPromotionSubMenu(this.value);">
         				<option value="">���θ�� ������ �������ּ���</option>
         				<!-- <option value="">���� �̻� ����(��帵, ġ��� ����)�� �Բ� ���� �� ���Ļ��÷� 4,000��</option> -->
       				</select>
          			<p class="txt_point padd_t5 bold"> [���� �� ��Ÿ ���� �ߺ� ���� �Ұ�]</p>
     			</div>	
          	
          			<!-- menuArea-->
          			<div class="menuArea">
            			<div class="main_menu p_menu">
            				<p class="tit"><img src="/assets/img/order/prom1.gif" alt="����޴�" /></p>
              				<p class="img" style="text-align:left" id="main_menu_img">
              					<img src="/assets/img/order/menu/00/def_img.png" alt="���� ���� �޴�"/>
              				</p>
              				<p class="select_price s15 prom_menu_name"> 
              					<span class="name"><label for="main_menu" class="hidden">���� �޴� ����</label>
              						<select id="main_menu" name="main_menu" class="prom_menu" onchange="fnPromotionMainMenuSelect($(this));">
               							<!-- <option>������Ÿ �������� ����</option> -->
	              					</select>
	              				</span>
              					<span class="price">0<span class="t_block">��</span></span> 
              				</p>
            			</div>
            			
            			<!-- ���θ޴� 1 -->
            			<div class="sub_menu p_menu" id="first_sub">
            				<p class="tit"><img src="/assets/img/order/prom2.gif" alt="���θ޴�" /></p>
              				
              				<p class="img" style="text-align:right" id="sub_menu_img">
              					<img src="/assets/img/order/menu/00/def_img_sub.png" alt="���θ޴�1"/>
              				</p>
              				<p class="select_price s15 prom_menu_name"> 
              					<span class="name"></span>
              					<span class="price">
	              					<!-- 20140616 ���εǴ� �޴��� org_blockŬ������ ���� �ܰ� ǥ�� -->
	              					<!-- <span class="org_block">&nbsp;100,000��&nbsp;&nbsp;&nbsp;</span>X<span class="t_block">��</span> -->
              					</span>
              					<span class="promHiddenVal">
              					<!-- 20140619 ��ٱ��� ����� �߰� -->
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
            			<!-- ���θ޴� 2 -->
            			<div class="sub_menu p_menu" id="second_sub" style="display: none">
            				<p class="tit"><img src="/assets/img/order/prom3.gif" alt="���θ޴�" /></p>
              				
              				<p class="img" style="text-align:right" id="sub_menu_img">
              					<img src="/assets/img/order/menu/00/def_img_sub.png" alt="���θ޴�2"/>
              				</p>
              				<p class="select_price s15 prom_menu_name"> 
              					<span class="name"></span>
              					<span class="price">
	              					<!-- 20140616 ���εǴ� �޴��� org_blockŬ������ ���� �ܰ� ǥ�� -->
	              					<!-- <span class="org_block">&nbsp;100,000��&nbsp;&nbsp;&nbsp;</span>X<span class="t_block">��</span> -->
              					 </span>
              					 <span class="promHiddenVal">
              					<!-- 20140619 ��ٱ��� ����� �߰� -->
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
            					���θ�� ������ �ƴ� ��Ÿ ���� ������ ���Ͻô� ��� ���� ��ǰ�� �����Ͻ� �� ���� �ܰ迡�� ���� ������ ������ �� �ֽ��ϴ�.
            					<br><br>
            					��ٱ��Ͽ��� ���θ�� �޴��� ���� ���� �Ǵ� ���θ�� �޴� ���� �� ���� �޴��� ���� ����˴ϴ�. 
            				</p>
     					</div>
          			</div> 
          			<!--// menuArea-->
					
	          		<div id="prom_info">
	          			<!-- �ɼǺ��� ��ư --> 
            			<div class="prom_spcInstruction">
							<p class="btn_h23 red"><button type="button">���ڿɼ�</button></p>
              				
              				<div class="comment">
                				<p class="top"><img src="/assets/img/order/ord_menuList_detail_commBg_top.png" alt=""></p>
                				<p class="bottom"><img src="/assets/img/order/ord_menuList_detail_commBg_bottom.png" alt=""></p>
            					<p class="center"><span>special instructions :</span>
	            		 			<br>��ư Ŭ�� �� sauce, cheese, bake, cut ���¸� �����Ͻ� �� �ֽ��ϴ�.
	            		 			<br>��ٱ��Ͽ� ���� �� �����Ͻ÷��� �޴��� ��ٱ��Ͽ��� ������ �ٽ� �����ž� �մϴ�!!</p> 
              				</div> 
						</div>
						<!-- ��ٱ��� ��ư -->
            			<p class="btn_cart" onclick="fnPromotionAddCart($(this));">
              				<button type="button" >��ٱ��Ͽ����</button>
            				<!-- ��ٱ��� ��� �� ���� �ɼ� ��� �ʱ�ȭ�ϱ� -->
            			</p>
	          		</div>
	          			
          			<!-- ���θ�� �޴� ���� �ɼ� ���� -->
          			<div id ="option_box_prom" class="prom_option_box"><!--  display: none; -->
	          				<ul class="spcInstructions">
	         					<li>
	        						<p onclick="fnAdjustMenu('prom_1',$(this));">�ҽ� ���� <span class="imgsp">��</span></p>
	        						<div id="prom_1" class="option">
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_regularSauce" name="prom_sau_radio" value=""/>
		          							<label for="prom_regularSauce">�ҽ� ����(Normal)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_lightSauce" name="prom_sau_radio" value="20"/>
		          							<label for="prom_lightSauce">�ҽ� ����(LS)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_extraSauce" name="prom_sau_radio" value="30"/>
		          							<label for="prom_extraSauce">�ҽ� ����(XS)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_noSauce" name="prom_sau_radio" value="40"/>
		          							<label for="prom_noSauce">�ҽ� ����(NS)</label>
	          							</p>
									</div>
	       						</li>
	       						<li style=" cursor:pointer;">
	        						<p onclick="fnAdjustMenu('prom_2',$(this));">ġ�� ���� <span class="imgsp">��</span></p>
	        						<div id="prom_2" class="option">
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_normalCheese" name="prom_chee_radio" value="" />
		          							<label for="prom_normalCheese">ġ�� ����(Normal)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_lightCheese" name="prom_chee_radio" value="20"/>
		          							<label for="prom_lightCheese">ġ�� ����(LC)</label>  
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_noCheese" name="prom_chee_radio" value="30"/>
		          							<label for="prom_noCheese">ġ�� ����(NC)</label>
	          							</p>
									</div>
	       						</li>
	       						<li>
	        						<p onclick="fnAdjustMenu('prom_3',$(this));">���� ���� <span class="imgsp">��</span></p>
	        						<div id="prom_3" class="option">
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_normalBake" name="prom_bake_radio" value=""/>
		          							<label for="prom_normalBake">�⺻ ����(Normal)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_wellDone" name="prom_bake_radio" value="20"/>
		          							<label for="prom_wellDone">�ٽ� ����(WD)</label> 
	          							</p>
									</div>
	       						</li>
	       						<li>
	        						<p onclick="fnAdjustMenu('prom_4',$(this));">���� ���� <span class="imgsp">��</span></p>
	        						<div id="prom_4" class="option">
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_normalCut" name="prom_cut_radio" value=""/>
		          							<label for="prom_normalCut">�⺻����(Normal)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_squareCut" name="prom_cut_radio" value="60"/>
		          							<label for="prom_squareCut">�簢����(SC)</label>
	          							</p> 
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_sixCut" name="prom_cut_radio" value="20"/>
		          							<label for="prom_sixCut">6��������(6C)</label>
	          							</p> 
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_eightCut" name="prom_cut_radio" value="30"/>
		          							<label for="prom_eightCut">8��������(8C)</label>
	          							</p> 
										<p class="menu_opt_radio" >
											<input type="radio" id="prom_tenCut" name="prom_cut_radio" value="40"/>
		          							<label for="prom_tenCut">10��������(10C)</label>
	          							</p> 
									</div>
	       						</li> 
	          				</ul>
	  				</div> 
          			<p class="and"><img src="/assets/img/order/and.png" alt="and"/></p>
					<p class="plus"><img src="/assets/img/order/plus.png" alt="plus"/></p>
      			</div>
				<!-- prom_section end-->		


      			<!-- ��Ʈ�޴� ���� --> 
      			<div id="set_section" class="" style="display: none;">
      			</div>
      			<!-- ��Ʈ�޴� ���� ��-->
      			
      			<!-- 20140425 �����÷��� --> 
      			<div id="plat_section" class="" style="display: none;">
      			</div>
      			<!-- ��Ʈ�޴� ���� ��-->
      
      			<!-- ���������� ���� -->
      			<!-- half_section --> 
      			<div id="half_section" style="display: none;">
          			<!-- left-->
          			<div class="left">
            			<div class="size">
              				<label for="pro_size" class="hidden">������</label>
              				<select id="pro_size" name="pro_size" class="s_size" onchange="fnSelLeftHalfAndHalf(this.value);">
                				<option value="">���� ����� �������ּ���</option>
              				</select>
            			</div>
            			
            			<div class="half1">
            				<p class="tit"><img src="/assets/img/order/hp1.gif" alt="����1����" /></p>
              				<label for="half1" class="hidden">��������1 ����</label>
              				<select id="half1" name="half1" class="half" onchange="fnSelRightHalfAndHalf(this.value, 1)">
               					<option>����1 �������ּ���</option>
              				</select>
              				<p class="img" style="text-align:left" id="half1Img"><img src="" alt=""/></p>
              				<p class="select_price s15 half_name" style="width:100%;"> <span class="name"></span><span class="price"><span class="t_block"></span></span> </p>
            			</div>
            			
            			<div class="half2">
            				<p class="tit"><img src="/assets/img/order/hp2.gif" alt="����2����" /></p>
              				<label for="half2" class="hidden">��������2 ����</label>
              				<select id="half2" name="half2" class="half" onchange="fnSelImageHalfandHalf(this.value, 2);">
                				<option>����2 �������ּ���</option>
              				</select>
              				<p class="img" style="text-align:right" id="half2Img"> <img src="" alt=""/></p>
              				<p class="select_price s15 half_name"> <span class="name"></span><span class="price"><span class="t_block"></span></span></p>
            			</div>
          			</div>
          			<!--// left-->
          			
          			<!-- right -->
          			<div class="right">
            			<div class="half_spcInstruction">
							<p class="btn_h23 red"><button type="button">�ɼǺ���</button></p>
              				<!-- �ɼǺ��� ��ǳ�� --> 
              				<div class="comment">
                				<p class="top"><img src="/assets/img/order/ord_menuList_detail_commBg_top.png" alt=""></p>
                				<p class="bottom"><img src="/assets/img/order/ord_menuList_detail_commBg_bottom.png" alt=""></p>
            					<p class="center"><span>special instructions :</span>
	            		 			<br>��ư Ŭ�� �� sauce, cheese, bake, cut ���¸� �����Ͻ� �� �ֽ��ϴ�.
	            		 			<br>��ٱ��Ͽ� ���� �� �����Ͻ÷��� �޴��� ��ٱ��Ͽ��� ������ �ٽ� �����ž� �մϴ�!!</p> 
              				</div>
              				<!--// �ɼǺ��� ��ǳ�� --> 
							</div>
							
            			<p class="select_price"></p>
            			<p></p>
            			<p class="btn_cart" onclick="fnAddSet($(this), '59999','30', '55', '', '', '');fnReset_spcOption_up($(this))">
              				<button type="button" >��ٱ��Ͽ����</button>
            			</p>
          			</div>
          			<!--// right -->
        			<div id ="option_box_59999" class="half_option_box"><!--  display: none; -->
	          				<ul class="spcInstructions">
	         					<li>
	        						<p onclick="fnAdjustMenu('59999_1',$(this));">�ҽ� ���� <span class="imgsp">��</span></p>
	        						<div id="59999_1" class="option">
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_regularSauce" name="59999_sau_radio" value=""/>
		          							<label for="59999_regularSauce">�ҽ� ����(Normal)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_lightSauce" name="59999_sau_radio" value="20"/>
		          							<label for="59999_lightSauce">�ҽ� ����(LS)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_extraSauce" name="59999_sau_radio" value="30"/>
		          							<label for="59999_extraSauce">�ҽ� ����(XS)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_noSauce" name="59999_sau_radio" value="40"/>
		          							<label for="59999_noSauce">�ҽ� ����(NS)</label>
	          							</p>
									</div>
	       						</li>
	       						<li style=" cursor:pointer;">
	        						<p onclick="fnAdjustMenu('59999_2',$(this));">ġ�� ���� <span class="imgsp">��</span></p>
	        						<div id="59999_2" class="option">
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_normalCheese" name="59999_chee_radio" value="" />
		          							<label for="59999_normalCheese">ġ�� ����(Normal)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_lightCheese" name="59999_chee_radio" value="20"/>
		          							<label for="59999_lightCheese">ġ�� ����(LC)</label>  
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_noCheese" name="59999_chee_radio" value="30"/>
		          							<label for="59999_noCheese">ġ�� ����(NC)</label>
	          							</p>
									</div>
	       						</li>
	       						<li>
	        						<p onclick="fnAdjustMenu('59999_3',$(this));">���� ���� <span class="imgsp">��</span></p>
	        						<div id="59999_3" class="option">
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_normalBake" name="59999_bake_radio" value=""/>
		          							<label for="59999_normalBake">�⺻ ����(Normal)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_wellDone" name="59999_bake_radio" value="20"/>
		          							<label for="59999_wellDone">�ٽ� ����(WD)</label> 
	          							</p>
									</div>
	       						</li>
	       						<li>
	        						<p onclick="fnAdjustMenu('59999_4',$(this));">���� ���� <span class="imgsp">��</span></p>
	        						<div id="59999_4" class="option">
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_normalCut" name="59999_cut_radio" value=""/>
		          							<label for="59999_normalCut">�⺻����(Normal)</label>
	          							</p>
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_squareCut" name="59999_cut_radio" value="60"/>
		          							<label for="59999_squareCut">�簢����(SC)</label>
	          							</p> 
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_sixCut" name="59999_cut_radio" value="20"/>
		          							<label for="59999_sixCut">6��������(6C)</label>
	          							</p> 
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_eightCut" name="59999_cut_radio" value="30"/>
		          							<label for="59999_eightCut">8��������(8C)</label>
	          							</p> 
										<p class="menu_opt_radio" >
											<input type="radio" id="59999_tenCut" name="59999_cut_radio" value="40"/>
		          							<label for="59999_tenCut">10��������(10C)</label>
	          							</p> 
									</div>
	       						</li> 
	          				</ul>
		  				</div>
		  				<p class="plus"><img src="/assets/img/order/plus.png" alt="plus" style="display: none;"/></p>
      			</div>
      			<!--// half_section --> 
      			<!-- ���������� ���� �� --> 
      
      			<!-- E���� ���� -->
      			<div id="ecoup_section" style="display: none;">
          			<!-- left-->
        			<div class="left">
          				<div class="inquiry">
          					<p>
          						* E���� ��ȣ�� �Է��Ͻ� �� ��ȸ ��ư�� �����ּ���!!
          					</p>
            				<label for="coup_id">E���� ��ȣ</label>
            				<input type="text" id="coup_id" style="width:200px"/>
             				<span class="btn_h23 gray" onclick="$('#coup_id').val( $('#coup_id').val().toUpperCase() ); fnSelECoupon($('#coup_id').val());"><button type="button">��ȸ</button></span>
          				</div>
        			</div>
          			<!--// left-->
        
          			<!-- right -->
        			<div class="right"> 
          				<p><img src="/assets/img/order/menu/eCoupon_img_none.png" alt="e_Coupon" title="couponNm"/></p>
            			<p class="name" id="coupNm"></p>
            			<p class="btn_cart" onclick="fnAddSet($(this), '','', '', '', '', '')"><button type="button">��ٱ��Ͽ����</button></p> 
        			</div>
          			<!--// right -->
      			</div>
      			<!-- e���� ���� �� --> 
      
    		</div>
    		<!--// cont --> 
  		</div>
  		<!--// conternts --> 
	</div>
	<!--// con_container -->
</form>
 

<!-- ///////////////////////////////////////////////////////////// ��ٱ��� ���� //////////////////////////////////////////////////////////////////// -->
<!-- orderWrap --> 
<div id="orderWrap">
  	<!-- order_box --> 
  	<div id="order_box">
    	<p class="top"></p>
    	<p class="bottom"></p>
    	<!-- ord_area -->   
    	<div id="ord_area" style="padding:5px 20px">
      		<!-- ord_tracking_section -->
      		<div id="ord_tracking_section">
        		<p class="tracking"></p>
      		</div>
      		<!--// ord_tracking_section -->
      
      		<!-- ord_title -->
      		<div id="ord_title">
            	<h2><img src="../assets/img/order/tit_order.gif" alt="��ٱ���" /></h2>
        		<p class="ord_reset"> <span class="btn_h23 green"><button type="button" onclick="javascript:fnClearCart();">�ʱ�ȭ</button></span></p>
      		</div>
      		<!--// ord_title -->
      
      		<!-- ord_cart_section --> 
      		<div id="ord_cart_section" class="section_box">
        		<p class="section_top"></p>
        		<p class="section_bottom"></p>
        		<!-- cart_list_section -->
        		<div id="cart_list_section">
            		<h3 class="section_title"><img src="../assets/img/order/order_rboxTitle_ordList.gif" alt="�ֹ����" /></h3>
          			<!-- section_con --> 
          			<div class="section_con"> 
            			<!-- �ֹ� ����Ʈ :max-height:140px; -->
						<ul id="ord_list" >

						</ul>
            			<!--// �ֹ� ����Ʈ --> 
          			</div>
          			<!--// section_con --> 
        		</div>
        		<!-- cart_list_section -->
        
        	<script type="text/javascript">
				document.frmOrder.cartOrdCustName.value     = "";      // ����
				document.frmOrder.cartOrdCustPhone.value    = "";     // ��ȭ��ȣ
				document.frmOrder.cartOrdDevide.value       = "";        // �ֹ�����(�ֹ�����)
				document.frmOrder.cartOrdReserve.value      = "";       // �����ֹ�����
				document.frmOrder.cartOrdResDate.value      = "";       // ��������
				document.frmOrder.cartOrdResTime.value      = "";       // ����ð�
				document.frmOrder.cartOrdDevAddr1.value     = "";      // ������ּ�1
				document.frmOrder.cartOrdDevAddr2.value     = "";      // ������ּ�2
				document.frmOrder.cartOrdDevAddr3.value     = "";      // ������ּ�3
				document.frmOrder.cartOrdDevAddr4.value     = "";      // ������ּ�4
				document.frmOrder.cartOrdAddressID.value    = "";     // ADDRESS_ID
				document.frmOrder.cartOrdStoreCode.value    = "";     // �����ڵ�
				document.frmOrder.cartOrdStoreName.value    = "";     // �����
				document.frmOrder.cartOrdSectorCode.value   = "";    // ���弽���ڵ�
				document.frmOrder.cartOrdSectorName.value   = "";    // ���弽�͸�
				document.frmOrder.cartOrdDeliveryTime.value = "";  // ���Ϳ���ð�
				document.frmOrder.cartOrdDeliveryYN.value   = "";    // ��ް��ɿ���
				document.frmOrder.cartOrdNewAddressYN.value = "";  // ������ּҽű��߰�����

				$("#btn_addr").removeClass("active");
				$("#btn_store").removeClass("active");
				
				var sector = "�ּҴ� ";
				var ordType = "���";
				var serviceable_time =  "" + "��~" + ( parseInt( "") +10 ) + "��"; 
        		if( "" == "10" ) 
        		{ 
        			radio_btn($("#btn_addr"));      
    				$("#ord_optInfo_section .store_title").text("��޸���");
    				$("#ord_optInfo_section .addr_title").text("����ּ�");
//    				$("#ord_optInfo_section .time_title").text("��޽ð�");
        		}
        		if( "" == "20" ) 
        		{ 
        			radio_btn($("#btn_store"));     
    				$("#ord_optInfo_section .store_title").text("�湮����");
    				$("#ord_optInfo_section .addr_title").text("�����ּ�");
// 	  				$("#ord_optInfo_section .time_title").text("�湮�ð�");
    				sector = "������ ";
					ordType = "����";
					serviceable_time = ( parseInt( "") -15 ) + "��~" + ( parseInt( "") -10 ) + "��"; 
        		} 

				$sect_info.html("<br><span class='txt_green'>�����Ͻ� "+sector +"�ֹ��� �Ϸ�� ��<br><span class='txt_point'>"+ serviceable_time +"</span>�� " +ordType+"�ð��� �ҿ�˴ϴ�. ���� �ð��� ���� ȭ�鿡�� �����Ͻ� �� �ֽ��ϴ�.</span>");
				//contents_resize();
			</script>
        
        		<!-- cart_opt_section--> 
        		<div id="cart_opt_section" >
        			<%-- <h3 class="section_title"><img src="../assets/img/order/order_rboxTitle_ordway.gif" alt="�ֹ��������" /></h3>  --%>
          			<!-- section_con--> 
            		<div class="section_con" id="cart_opt_section">
            			<!-- ��� / �湮����  ����-->
            			<%-- 
	            		<div id="cart_btn_ordWay1">
	              			<p style="height:40px" class="radio">
	                			<a href="#ord_area">	<!-- ��ư Ŭ�� �� ȭ�� ������� �̵� : �����̵尡 �Ⱥ��̰� ��ũ�� �Ǿ��ִ� ���-->
	                				<button type="button" id="btn_addr"  class="btn_radio  btn_addr clear  " style="width:95px; display:block; float:left;" >
	                					<img src="/assets/img/btn/btn_bigRed_delivery.png" alt="���"/>
	                				</button>
	                				<button type="button" id="btn_store" class="btn_radio  btn_store clear " style="width:95px; display:block; float:left;"> 
	                					<img src="/assets/img/btn/btn_bigRed_visit.png"    alt="�湮����"/>
	                				</button>
	                			</a>
	              			</p>
	            		</div>
	            		--%>
             			<!-- ���������  ����-->
            			<div id="ord_optInfo_section" style="display:none" >
              				<h3 class="section_title"><img src="/assets/img/order/order_rboxTitle_addrInfo.gif" alt="���������" /></h3>
              				<div class="rBox_con">
                				<p style="padding:2px 0 2px 5px"><span style="font-weight:bold">������</span> : <span class="mem_name"></span></p>
                				<p style="padding:2px 0 2px 5px"><span style="font-weight:bold">����ó</span> : <span class="mem_phone"></span></p>
                				<p style="padding:2px 0 2px 5px"><span style="font-weight:bold" class="store_title">�湮����</span> : <span class="store_name"></span></p>
                				<p style="padding:2px 0 2px 5px"><span style="font-weight:bold" class="addr_title">�����ּ�</span> : <span class="addr"></span></p>
                				
                				<p style="padding:3px" class="sect_info bold"></p>
              				</div>
              				<p class="rBox_top"></p>
              				<p class="rBox_bottom"></p>
            			</div>
            			<!-- ��������� �� --> 
          			</div>
          			<!--// section_con--> 
        		</div>
        		<!--// cart_opt_section--> 
      		</div>
      		<!--// ord_cart_section --> 
 
      		<!-- �հ� -->
      		<div id="ord_total" >
        		<p><img src="../assets/img/order/order_total_title.gif" alt="���ֹ��ݾ�"/><span class="price">0��</span></p>
      		</div>
      		<!-- //�հ� --> 
      
		 	<!-- ��ٱ��� ���� ���̵� ��õ�޴� ��� �߰� -->
		 	<div id="side_banner" >
		  		<div id="banner_content">
				<!-- ���̵忡 �� �޴� �����͸� �ѷ��� :�̹����̸��� �޴� �ڵ� �����ϰ� ����� -->

					<img id="50501" src="../assets/img/order/banner/bn_50501.png" alt="��ī�ݶ� 1.25L" title="��ī�ݶ� 1.25L"  onerror="fnNoImages($(this));"/>
				  	<input type="hidden" id="bnMenuInfo" name="bnMenuInfo" value="50501,��ī�ݶ� 1.25L,10,40,4020,3013,,1600,1.25L,"/> 

					<img id="50268" src="../assets/img/order/banner/bn_50268.png" alt="��������Ʈ1.5L" title="��������Ʈ1.5L"  onerror="fnNoImages($(this));"/>
				  	<input type="hidden" id="bnMenuInfo" name="bnMenuInfo" value="50268,��������Ʈ1.5L,10,40,4009,3014,,1900,1.5L,"/> 

					<img id="50485" src="../assets/img/order/banner/bn_50485.png" alt="ȯŸ1.5L" title="ȯŸ1.5L"  onerror="fnNoImages($(this));"/>
				  	<input type="hidden" id="bnMenuInfo" name="bnMenuInfo" value="50485,ȯŸ1.5L,10,40,4010,3014,,1900,1.5L,"/> 

				</div>
		  		<a href="#ord_cart_section"><button type="button" id="banner_btn">��ٱ��Ͽ����</button></a> 
				<div id="ban_name" style="display:none; font-weight:bold; font-size:14px; border:1px solid #fcc; z-index:99;"></div>
			</div>
			<!-- ���̵� ��� �޴� -->
      
      		<!-- �ֹ��ϱ� ��ư -->
      		<div id="comp_ord_btn" >
        		<button class="clear" onclick="fnOrderInfoView();"><img src="../assets/img/btn/btn_order.png" alt="�ֹ��ϱ�" /></button>
      		</div>
      		<!--// �ֹ��ϱ� ��ư --> 
    	</div>
    	<!--// ord_area -->   
  	</div>
  	<!--// order_box --> 
  
    <!--20130923 ��ٱ��� ��ġ�� ȭ����ġ �̵� �߰�(usa����Ʈ ī��) --> 
	<div>
		<a href="#ord_cart_section" id="scrollTopBtn" class="btn_h23 red">0</a>
	</div>
	
  <script type="text/javascript">contents_resize();</script>
  
  
  	<!-- ////////////////////////////////////////////// �����̵� �ڽ� ����////////////////////////////////////////////////////// -->
  	<div id="ord_opt_area" class="side_con" >
    	<p style="position:relative; left:8px;top:-5px;"> 
    		<img src="/assets/img/btn/btn_close.gif" alt="�����̵�ݱ�" onclick="slide_con_close()"/>
    	</p>
    	<div class="con"> 
      		<!--<p style="padding-bottom:10px;"><img src="assets/img/order/img1.png" alt="" onclick="comp_addr()" style="cursor:pointer"/></p>--> 
    	</div>
    	<p class="bg_bottom" style="background:url(/assets/img/order/side_bottomBg.png) no-repeat; width:365px; height:15px; position:absolute; bottom:-15px; left:0;"></p>
  	</div>
  	<!--// �����̵� �ڽ� �� --> 
  
</div>
<!--// orderWrap --> 

<!-- ///////////////////////////////////////////////////////// �����ɼǿ� ��� �� ������ ����///////////////////////////////////////////////////////////////////////// --> 
<!-- ȸ������ (jsp : ȸ�� ���� ���) -->
<div id="mem_info" class="opt_box">
  	<p class="top"></p>
  	<p class="bottom"></p>
  	<div>
    	<h3 class="title line_btn"><img src="/assets/img/order/order_rboxTitle_memInfo.gif" alt="������ ����" /><span class="btn_h23 gray right" ><button type="button" class="mem_modify">����</button></span></h3>
    	<div class="opt_whBox">
      		<p class="top"></p>
      		<p class="bottom"></p>
      		<p class="line"><span class="tit">�̸� : </span> <span class="text m_name" >�����</span></p>
      		<p style="padding : 4px 0 0;"><span class="tit">����ó : </span> <span class="text m_phone" >01038085247</span></p>
      		<!-- jsp �̺κ��� ȸ�� ���� ��� �κ� �� --> 
    	</div>
  	</div>
</div>

<!-- ȸ�� �ּ�����/ ���� (jsp : ȸ�� �ּ� ���� ���) -->
<div id="select_addr" class="opt_box">
  	<p class="top"></p>
  	<p class="bottom"></p>
  	<div>
    	<h3 class="title line_btn">
	    	<img src="/assets/img/order/order_rboxTitle_addrSelect.gif" alt="���������" /> 
	    	<!-- <a href="#frame"><span class="btn_h23 gray right" ><button type="button" id="btn_newAddr_reg">���ּ� �Է�</button></span></a> -->
	    	<!-- ������� ie7, ie8 ���� ����-->
	    	<a href="javascript:;" onclick="parent.window.scrollTo(0, $('#frame').offset().top);">
	    		<span class="btn_h23 gray right" ><button type="button" id="btn_newAddr_reg">���ּ� �Է�</button></span>
	    	</a>
    	</h3>
    	<div id="addr_list" class="mem_addr opt_whBox">
      		<p class="top"></p>
			<p class="bottom"></p>

	  		<p class="line line_height15 line_btn">
	  			<span>��ȸ ������ �����ϴ�.</span>
      		<p/>

    	</div>
  	</div>
</div>

<!-- ������(����ã��:)(�ּ�ã��:)(����:) -->
<div id="frame" class="opt_box" >
  	<p class="top"></p>
  	<p class="bottom"></p>
  	<div>
    	<h3 class="title"><!--<img src="assets/img/order/order_rboxTitle_selectStore.gif" alt="�湮���弱��" />--></h3>
    	<div id="addr_list" class="mem_addr opt_whBox" style="padding:0;">
      		<iframe name="" frameborder="0" width="280px" height="200px" src="" id="ifrm">������������ �����Ǵ� ���������� Ȯ�ΰ����մϴ�.</iframe>
    	</div>
  	</div>
</div>
 
<!-- ////////////////////////////////////  alert �� ���� �˾�  ////////////////////////////////////-->
<!-- 20140730 8�� ���θ�� �ֹ� �� ���� ���� ���� �˸� �߰�  -->
<div class="pop_box6" id="pop_guide_coupon">
   	<p class="padd_t5"> 
   		<span class="txt_point txt_tit padd_tb5"> 8�� ���� ���θ�� �ֹ� �� ���� ����</span>
		<span class="btn_h23 gray" style="position: absolute; right:25px; top:20px"><button type="button" onclick='del_pop("#pop_guide_coupon")'>Ȯ��</button></span>
	</p>
	<br>
	<p class="padd_b5">
	* 8�� ���� ���θ��<span class="bold"> 'Double Upgrade(��帵/ġ��� ũ����Ʈ �йи� ������ �������Ľ�/�����̽�ġŲ��ġ/�������̹���)'</span> ���� �� �ֹ��� ���Ͻô� ���Ե��� 
 		<span class="bold">��帵/ġ��� ũ����Ʈ �йи������� �������Ľ�/�����̽�ġŲ��ġ/�������̹���</span> ���ڸ� ��ٱ��Ͽ� ������ ��, ������ �����ϼž� ������ �����մϴ�.<br><br>
	* <span class="bold padd_b10">8�� ���� ���θ�� 'Double Upgrade' �ֹ� ��� </span><br>
	�� �¶��� �ֹ� ���� &#8594; �� ��帵 �Ǵ� ġ��� ũ����Ʈ ���� &#8594; �� ���� ���Ľ�/�����̽� ġŲ��ġ/���� ���̹��� �йи� ������ ���� &#8594; �� ��ٱ��� ��� &#8594; �� ���� ȭ���� ��������ȸ/���� ��ư�� Ŭ�� �� �ش� ���� ���� &#8594; �� �ֹ� �Ϸ�!!<br>
	</p>
</div>

<!--��ٱ��� ����, E���� ������ȣ �̵�� ����, �ֹ�Ÿ�� ���� �˸�, �ּҼ��þ˸�, �ð����� �˸� -->
<div class="notice" id="notice_1002" style="display:none; width:320px; height:144px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header" >
	    <div class="left" style="float:left; width:6px;  background:url(/assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:308px; height:40px; background:url(/assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>�˸�!!</h2>
	    	<!-- <a id="closex" class="close" href="#">Close</a> -->
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(/assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div id="alertText" class="text_body" style="width:320px; height:90px; line-height: 35px; background:#fff; border: 0px none; padding: 10px 0px;"> 
	   	<p></p> 
    </div> 
 	<!-- //comm_list --> 
  	<div class="footer" style="position: absolute; height:30px; background:#fff; " >
		<div class="button" style=" bottom:15px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_1002');">Ȯ ��</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:308px; height:8px; background:url(/assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div>
 
<!-- ///////////////////////////// ���� ���� ���� alert  /////////////////////////////-->
<div class="notice" id="notice_limit" style="display:none; width:320px; height:144px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header" >
	    <div class="left" style="float:left; width:6px;  background:url(/assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:308px; height:40px; background:url(/assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>�˸�!!</h2>
	    	<!-- <a id="closex" class="close" href="#">Close</a> -->
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(/assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div class="text_body" style="width:320px; height:90px; line-height: 30px; background:#fff; border: 0px none; padding: 10px 0px;"> 
    	<p>�¶��� �ֹ��� ���� 5�Ǳ����� �����մϴ�. <br/>
    		��ٱ��ϸ� Ȯ���ϼ���</p> 
    </div> 
 	<!-- //comm_list --> 
  	<div class="footer" style="position: absolute; height:30px; background:#fff; " >
		<div class="button" style=" bottom:15px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_limit');">Ȯ ��</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:308px; height:8px; background:url(/assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div>

 
<!-- ///////////////////////////// E���� ��ȸ ��ſ��� alert  /////////////////////////////-->
<div class="notice" id="notice_eCopErr_NW" style="display:none; width:320px; height:144px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header" >
	    <div class="left" style="float:left; width:6px;  background:url(/assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:308px; height:40px; background:url(/assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>�˸�!!</h2>
	    	<!-- <a id="closex" class="close" href="#">Close</a> -->
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(/assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div class="text_body" style="width:320px; height:90px; line-height: 30px; background:#fff; border: 0px none; padding: 10px 0px;"> 
    	<p>��ȸ �� ������ �߻��߽��ϴ�.!<br/>
    		��� �� �ٽ� ��ȸ�� �ֽʽÿ�.</p> 
    </div> 
 	<!-- //comm_list --> 
  	<div class="footer" style="position: absolute; height:30px; background:#fff; " >
		<div class="button" style=" bottom:15px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_eCopErr_NW');">Ȯ ��</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:308px; height:8px; background:url(/assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div>




 
<!-- ///////////////////////////// E���� ������ȣ ���� alert  /////////////////////////////-->
<div class="notice" id="notice_eCopErr" style="display:none; width:320px; height:144px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header" >
	    <div class="left" style="float:left; width:6px;  background:url(/assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:308px; height:40px; background:url(/assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>�˸�!!</h2>
	    	<!-- <a id="closex" class="close" href="#">Close</a> -->
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(/assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div class="text_body" style="width:320px; height:90px; line-height: 30px; background:#fff; border: 0px none; padding: 10px 0px;"> 
    	<p>����� �� ���� ������ȣ�Դϴ�.!<br/>
    		������ȣ�� Ȯ���� �ٽ� �Է��Ͽ� �ֽʽÿ�.</p> 
    </div> 
 	<!-- //comm_list --> 
  	<div class="footer" style="position: absolute; height:30px; background:#fff; " >
		<div class="button" style=" bottom:15px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_eCopErr');">Ȯ ��</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:308px; height:8px; background:url(/assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div>

<!-- ///////////////////////////// E���� ������ȣ ��� alert  /////////////////////////////-->
<div class="notice" id="notice_eCopCart" style="display:none; width:320px; height:144px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header" >
	    <div class="left" style="float:left; width:6px;  background:url(/assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:308px; height:40px; background:url(/assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>�˸�!!</h2>
	    	<!-- <a id="closex" class="close" href="#">Close</a> -->
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(/assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div class="text_body" style="width:320px; height:90px; line-height: 30px; background:#fff; border: 0px none; padding: 10px 0px;"> 
    	<p>��ȸ�Ͻ� ���� ��ǰ�� �̹� ��ٱ��Ͽ� ��ϵǾ� �ֽ��ϴ�.<br/>
    		���� 1��� 1ȸ�� ��� �����մϴ�.</p> 
    </div> 
 	<!-- //comm_list --> 
  	<div class="footer" style="position: absolute; height:30px; background:#fff; " >
		<div class="button" style=" bottom:15px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_eCopCart');">Ȯ ��</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:308px; height:8px; background:url(/assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div> 
 
<!-- ///////////////////////////// E���� ������ȣ ��� alert  /////////////////////////////-->
<div class="notice" id="notice_eCopUse" style="display:none; width:320px; height:144px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header" >
	    <div class="left" style="float:left; width:6px;  background:url(/assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:308px; height:40px; background:url(/assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>�˸�!!</h2>
	    	<!-- <a id="closex" class="close" href="#">Close</a> -->
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(/assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div class="text_body" style="width:320px; height:90px; line-height: 30px; background:#fff; border: 0px none; padding: 10px 0px;"> 
    	<p>�Է��Ͻ� ��ȣ�� �̹� ���� ������ȣ�Դϴ�.!<br/>
    		������ȣ�� Ȯ���� �ٽ� �Է��Ͽ� �ֽʽÿ�.</p> 
    </div> 
 	<!-- //comm_list --> 
  	<div class="footer" style="position: absolute; height:30px; background:#fff; " >
		<div class="button" style=" bottom:15px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_eCopUse');">Ȯ ��</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:308px; height:8px; background:url(/assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div> 
<!-- ///////////////////////////// �˸� �˾�  /////////////////////////////-->

<!-- ///////////////////////////// E���� ������ȣ ��� alert  /////////////////////////////-->
<div class="notice" id="notice_eDate" style="display:none; width:320px; height:144px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header" >
	    <div class="left" style="float:left; width:6px;  background:url(/assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:308px; height:40px; background:url(/assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>�˸�!!</h2>
	    	<!-- <a id="closex" class="close" href="#">Close</a> -->
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(/assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div class="text_body" style="width:320px; height:90px; line-height: 30px; background:#fff; border: 0px none; padding: 10px 0px;"> 
    	<p>�ش� ������ȣ�� ���Ⱓ�� ����Ǿ����ϴ�.<br/>
    	   ��ȿ�Ⱓ�� Ȯ���Ͽ� �ֽʽÿ�.</p> 
    </div> 
 	<!-- //comm_list --> 
  	<div class="footer" style="position: absolute; height:30px; background:#fff; " >
		<div class="button" style=" bottom:15px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_eDate');">Ȯ ��</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:308px; height:8px; background:url(/assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div> 
<!-- ///////////////////////////// �˸� �˾�  /////////////////////////////-->

<!-- ///////////  20131108 ����ȭ�� �˷� �˾� �߰�!!  //////////// -->
<div class="notice" id="notice_topping" style="display:none; width:340px; height:auto; min-height:140px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header">
	    <div class="left" style="float:left; width:6px;  background:url(/assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:328px; height:40px; background:url(/assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>�˸�!!</h2> 
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(/assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div id="alertText" class="text_body" style="width:340px; height:auto; min-height:90px; line-height: 30px; background:#fff; border: 0px none; padding:8px 0px;"> 
    </div> 
  	<!-- //comm_list --> 
  	<div class="footer" style="position: absolute; height:32px; background:#fff; " >
		<div class="button" style="bottom:20px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_topping');">Ȯ ��</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:328px; height:8px; background:url(/assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div> 

<!-- ///////////////////////////// �ּ� ���� Ȯ�� alert  /////////////////////////////-->
<div class="notice" id="notice_del_addr" style="display:none; width:320px; height:144px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header" >
	    <div class="left" style="float:left; width:6px;  background:url(/assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:308px; height:40px; background:url(/assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>�˸�!!</h2>
	    	<!-- <a id="closex" class="close" href="#">Close</a> -->
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(/assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div class="text_body" style="width:320px; height:90px; line-height: 30px; background:#fff; border: 0px none; padding: 10px 0px;"> 
    	<p>���� �����Ͻðڽ��ϱ�?<br/>
    		 '��'�� �����Ͻø� �����Ͻ� �ּҰ� ���� �����˴ϴ�.</p> 
    </div> 
 	<!-- //comm_list --> 
  	<div class="footer" style="position: absolute; height:30px; background:#fff; " >
		<div class="button" style=" bottom:15px;">
			<input id="del_loginId"    type="hidden" name="del_loginId"    value="1">
			<input id="del_addressID"  type="hidden" name="del_addressID"  value="999">
			<input id="del_addrDetail" type="hidden" name="del_addrDetail" value="">
			<input id="del_addrListId" type="hidden" name="del_addrListId" value="0">
			<button class="alertBtn red" type="button" onclick="delete_addr($(this));">��</button>
			<button class="alertBtn gray" type="button" onclick="del_pop2('#notice_del_addr');">�ƴϿ�</button>
		</div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:308px; height:8px; background:url(/assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div>

<script type="text/javascript">	   
/*  /////////////////////////////////// ���ڸ޴��κ� Navi ///////////////////////////////////////////////////////// */
	
	var $pizz_menu = $(".pizza_list li a");
	var linkURL    = new Array();
	var overURL    = new Array();
	var onURL      = new Array();
	var $actv_menu = "";
	
	$pizz_menu.each(function(i,el)
	{
		// ó�����ö� Ȱ��ȭ �Ǿ��ִ� �޴� active�Լ��� ��������� ������
		active($pizz_menu.eq("${param.pizzaSelIdx}"));//���� ���켱�� ���а�
		// �޴��� �̹���(link,on,over�̹���) �迭 ����� ����
		linkURL[i] = "../assets/img/order/ordMenu_pizza"+(i+1)+".gif";
		overURL[i] = "../assets/img/order/ordMenu_pizza"+(i+1)+"_over.gif";
		onURL[i]   = "../assets/img/order/ordMenu_pizza"+(i+1)+"_on.gif";
	
		$(this).css("background","url("+linkURL[i]+") no-repeat"); 

		if( $(this).hasClass("active") )
		{
			$(this).css("background","url("+onURL[i]+") no-repeat");
		}
		
		// �̺�Ʈ ����
		$(this).bind("mouseenter",overMenu);
		$(this).bind("mouseleave",outMenu);
		$(this).bind("click",onMenu);
	});

	// ���ڸ޴� ���������� : Ȱ��ȭ�� �޴��� ������ ������ �޴��� ���������� ��ü
	function overMenu()
	{
		var num=$(this).parent().index();
		
		if( !$(this).hasClass("active") )
		{
			$(this).css("background","url("+overURL[num]+") no-repeat");
		}
	}
	
	// ���ڸ޴� �ƿ������� : Ȱ��ȭ�� �޴��� ������ ������ �޴��� �ƿ������� ��ü
	function outMenu()
	{
		var num=$(this).parent().index();
		
		if( !$(this).hasClass("active") )
		{
			$(this).css("background","url("+linkURL[num]+") no-repeat");
		}
	}
	
	// ���ڸ޴� Ŭ�������� : ����Ȱ��ȭ�Ǿ��ִ� �޴��� Ŭ����(active)�������ְ� ��ũ�̹����� ��ü �� ����޴��� active�Լ��� ȣ����� Ȱ��ȭ ��Ŵ
	function onMenu()
	{
		active($(this));
	}
	
	// ���� Ŭ���� �޴� Ȱ��ȭ �Լ�
	function active($el)
	{
 		var num=$el.parent().index();
		$el.addClass("active"); 
		$actv_menu$ =$el;
	}
</script> 

