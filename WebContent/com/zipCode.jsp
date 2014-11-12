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
	<meta http-equiv="Description" content="Order Papa John's Pizza online for fast pizza delivery or pickup. Get Papa John's Special Offers or use Papa John's promo codes for online pizza orders." />
	<meta http-equiv="Keywords" content="Papa john's, papa johns, papa johns pizza, papa johns online, pizza, papa johns menu, order papa johns, pizza delivery, order pizza online, pizza specials, papa johns coupons, papa johns promo codes, papa johns specials, pizza coupons, fast order, papa's picks, papas picks" />
	<link rel="icon" href="assets/img/favicon.ico" />
	<link type="text/css" rel="stylesheet" href="../assets/css/reset.css" />
	<link type="text/css" rel="stylesheet" href="../assets/css/sub.css" />
	<link type="text/css" rel="stylesheet" href="../assets/css/lib_style.css" />
	
	<style type="text/css">
		body {background:#f5eccf; margin: auto;}
		#search{margin:0px 0px 5px 0px; width:278px; }
		#info_text{font-size: 11px;}
		#search_btn{float: left; }
		#stepBack_btn{ margin-left:2px; text-align: center;  color: #fff;  padding:0px 12px 0px 6px;}
		#addr_list{width:356px; height:140px; background:#fff; padding:5px 4px 6px 3px; border: 1px solid #ddd; 
		text-align:center; font-size:11px; overflow:auto; text-align: center; }
		#addr_list li{width:326px; border-bottom: 1px dotted #ddd;text-align:left; }
		#addr_list li:hover{background:#eee;}
		#addr_list li a{text-decoration: none;}
		#addr_list li a:hover{color:  green;} 
		span#zip{padding-left: 2px;}
		span#addr{border-left: 1px dotted #ddd; }
	</style>
	
	<title>파파존스-Better Ingredients.Better Pizza.</title>
	
<script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../assets/js/common.min.js"></script>
<script language="JavaScript" type="text/JavaScript" >
 	//var alertFrame = $( parent.document.getElementById("notice_4005") );
      var alertFrame = $("#notice_zipcode");

    function init()
    {
    	$("#addr_list").html("${addressHtml}");
    }
      
    function search()
    {
		$("#addr_list").css("height","140px");
 		var dongName = document.frmAddr.s_addr.value;
 		
 		if( dongName == "" ) 
 		{
			$("#notice_zipcode").find("#alertText p").remove();
			$("#notice_zipcode").find("#alertText").append("<p>검색하실 '읍/면/동' 이름을 입력해 주세요</p>");
			parent.popAlert($("#notice_zipcode"));
			
 			document.frmAddr.s_addr.focus();
 			return;
 		}
 		
		var list = "";
		list += "<li>";
		list += "</li>";
		$("#addr_list").html(list);
		
     	document.frmAddr.action='addrSearchAction.action?dong='+dongName+'&flag='+"${flag}";
     	document.frmAddr.submit();
	}
	function search_step1() 
	{
		$("#addr_list").css("height","140px");
 		var dongName = document.frmAddr.s_addr.value;  // 읍면동명
 		
 		if( dongName == "" ) 
 		{
			$("#notice_zipcode").find("#alertText p").remove();
			$("#notice_zipcode").find("#alertText").append("<p>검색하실 '읍/면/동' 이름을 입력해 주세요</p>");
			parent.popAlert($("#notice_zipcode"));
			
 			document.frmAddr.s_addr.focus();
 			return;
 		}
		
		var list = "";
		list += "<li>";
		list += "</li>";
		$("#addr_list").html(list);
		
		$.ajax(
		{
			url        : "/com/searchZipCode.jsp",
  			type       : "POST",
  			data       : "searchFlag=dong&dongName="+dongName,
  			dataType   : "json",
  			beforeSend : function() 
  			{             
  				//통신을 시작할때 처리             
  				parent.$('#viewLoading').show().fadeIn('fast');          
  			}, 
  			complete   : function() 
  			{             
  				//통신이 완료된 후 처리              
  				parent.$('#viewLoading').fadeOut();         
  			},
  			success    : function(data)
  			{	
	   			var str = "";	
	   			
	   			if(data.addr.length > 0 && data != null){		
		     		for( var i = 0; i < data.addr.length; i++ )
		     		{
		     			var addrData        = data.addr[i];
		     			var addrZipCode     = addrData.addrZipCode;     // 우편번호
		     			var addrSiName      = addrData.addrSiName;      // 시도
		     			var addrGuName      = addrData.addrGuName;      // 시군구
		     			var addrDongName    = addrData.addrDongName;    // 읍면동
		     			var addrRee         = addrData.addrRee;         // 리
		     			var addrBuilding    = addrData.addrBuilding;    // 건물명
	 	     			var addrStartbeonGi = addrData.addrStartbeonGi; // 시작번지
	 	     			var addrEndbeonGi   = addrData.addrEndbeonGi;   // 끝번지
	 	     			var addrDisplay     = addrData.addrDisplay;     // 화면표시용 주소
	 	     			
	 	     			var zip1 = addrZipCode.substring(0,3);
	 	     			var zip2 = addrZipCode.substring(3,6);
	 					
		     			/* a 링크 내용 참고 : http://blog.naver.com/ahog3?Redirect=Log&logNo=188533047 */
		     			str += "<li>";
		     			str += "<a href='javascript:void();'>";	//javascript:void() >> 자바스크립트에서 기본으로 지원해주는 '아무것도 하지 않는다.' 라는 함수
		     			str += "<span id='addr' class='addr'> [" + zip1 + "-" + zip2 + "] " + addrDisplay +"</span>";
		     			str += "<input type='hidden' name='zipCode'      class='zipCode'      value='"+ addrZipCode      +"' />";
		     			str += "<input type='hidden' name='siName'       class='siName'       value='"+ addrSiName       +"' />";
		     			str += "<input type='hidden' name='guName'       class='guName'       value='"+ addrGuName       +"' />";
		     			str += "<input type='hidden' name='dongName'     class='dongName'     value='"+ addrDongName     +"' />";
		     			str += "<input type='hidden' name='ree'          class='ree'          value='"+ addrRee          +"' />";	     					
		     			str += "<input type='hidden' name='building'     class='building'     value='"+ addrBuilding     +"' />";
		     			str += "<input type='hidden' name='startBeonGi'  class='startBeonGi'  value='"+ addrStartbeonGi  +"' />";
		     			str += "<input type='hidden' name='endBeonGi'    class='endBeonGi'    value='"+ addrEndbeonGi    +"' />";
		     			str += "</a></li>";
		     			
		     		}
	     		}
	     		else
	     		{
	     				str += "<li>";
		     			str += "<span style='display: block; margin: 0px auto; text-align: center;''>검색 된 주소가 없습니다.</span>";
		     			str += "</li>";
		     			
	     		}
	     		
	     		$("#addr_list").html(str);
     			
  			},
		 	error: function()
		 	{
  				$("#notice_zipcode").find("#alertText p").remove();
				$("#notice_zipcode").find("#alertText").append("<p>검색 된 주소가 없습니다.</p>");
				parent.popAlert($("#notice_zipcode"));
			}
  		});
		
	}
	
</script>
</head>

<body onload="init()">

<div  id="s_addr"> 
  		<div class="search" >
  			<form id="frmAddr" name="frmAddr" method="post">
	     		<input type='hidden' id='addrZipCode'      name='addrZipCode'     value="" />
	     		<input type='hidden' id='addrSiName'       name='addrSiName'      value="" />
	     		<input type='hidden' id='addrGuName'       name='addrGuName'      value="" />
	     		<input type='hidden' id='addrDongName'     name='addrDongName'    value="" />
	     		<input type='hidden' id='addrBunJi'        name='addrBunJi'       value="" />
 					
	     		<!--  <input type='hidden' id='addrBuilding'     name='addrBuilding'    value="" />
	     		<input type='hidden' id='addrStartBeonGi'  name='addrStartBeonGi' value="" />
	     		<input type='hidden' id='addrEndBeonGi'    name='addrEndBeonGi'   value="" />-->
  
    			<div id="input_addr">
   	 				<span id="info_text"> *읍,면,동을 입력하세요 </span><br/>
     				<label for="s_addr" class="hidden">주소</label>
     				<input type="text" id="s_addr" name="s_addr" style="width:130px;" value="${s_addr}"/>
     				<span class="btn_h23 gray"><button type="button" onclick="javascript:search();">검색</button></span>
				</div>
				 
     			<!-- 20130509 modify -->
     			<div id="step2" style="display: none;"> 
	     			<p id="seleced_addr1" style="border-bottom: 1px dashed #f00; height:20px; margin-bottom:3px; vertical-align:middle; text-align: center; font-weight: bold; font-size: 12px; "></p>
	   	 			<span id="info_text" style="font-size:11px; color:red;"> <!-- *검색하실 '번지/건물/상호/마을'을 입력하세요--> *검색하실 '번지/건물/상호'를 입력하세요</span><br/>
	     			<label for="input_step2" class="hidden">주소</label>
	     			<input type="text" id="input_step2" name="input_step2" style="width:160px;" value=" "/>
     				<span class="btn_h23 gray"><button  id="search_btn"type="button" onclick="javascript:search_step2();">검색</button></span>
     				<span class="btn_h23 gray"  style="margin-left:-3px"><button id="stepBack_btn" type="button">이전단계</button></span>
     			</div>
     			
     			<ul class="list addr_step1" id="addr_list" >
 	  				<li style="text-align: center; color: maroon;"></li>
  				</ul>
  				
    			<div id="detail_addr" style="display:none; position:relative; top:60px;">  
					<p id="seleced_addr2" style="border-bottom: 1px dashed #f00; height:20px; margin-bottom:3px; vertical-align:middle; text-align: center; font-weight: bold; font-size: 12px; "></p>
      				<div style="padding-top:5px">
	   	 			<span id="info_text" style="font-size:11px; color:red;"> * 상세주소를 입력하세요</span><br/>
        				<label for="addr2" class="hidden">주소</label>
        				<input type="text" id="detail_input" name="detail_input" style="width:220px;"/>
        				<span  class="btn_h23 gray"><button type="button" class="ok">확인</button></span>
        				<p style="padding:5px; text-align:center"><span class="btn_h23 gray"  style="margin-left:-3px"><button id="stepBack_btn2" type="button">이전단계</button></span></p>
      				</div>
    			</div>
    		</form>
  		</div>
	</div>
	
	<!--20131212  알럿 변경-->
	<div class="notice" id="notice_zipcode" style="display:none; width:340px; height:auto; min-height:140px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
	    <div class="header">
		    <div class="left" style="float:left; width:6px;  background:url(../assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
		    <div class="center" style="float:left; width:328px; height:40px; background:url(../assets/img/usa/modal_header_center.png) top center repeat-x; ">
		    	<h2>알림!!</h2> 
		    </div>
		    <div class="right" style="float:right; width:6px; height:40px; background:url(../assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
		</div>    
	    <div id="alertText" class="text_body" style="width:340px; height:auto; min-height:90px; line-height: 30px; background:#fff; border: 0px none; padding:8px 0px;">  
	    	<br><p></p> 
	    </div>  
	  	<div class="footer" style="position: absolute; height:32px; background:#fff; " >
			<div class="button" style="bottom:20px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_zipcode');">확 인</button></div> 
			<div class="left" style="float:left; width:6px; height:8px; background:url(../assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
	    	<div class="center" style="float:left; width:328px; height:8px; background:url(../assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
	    	<div class="right" style="float:right; width:6px; height:8px; background:url(../assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
	  	</div>
	</div>
</body>
</html>



<script type="text/javascript"> 
	var $detail_addr       = $("#detail_addr");
	var $input_zip         = $("#s_addr #zip");
	var $input_addr1       = $("#s_addr #addr1");
	var $input_store_name  = $("form #store_name");
	var $input_store_phone = $("form #store_phone");
	
	/* 주소입력 완료  */
	var $bnt_ok = $("#detail_addr button.ok");
	$bnt_ok.bind("click",input_adrr);
	function input_adrr()
	{
		if( document.frmAddr.detail_input.value == "" ) 
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>상세 주소를 입력해 주세요</p>");
			parent.popAlert(alertFrame);
			
			document.frmAddr.detail_input.focus();
			return;
		}
		
		
		var flag = "${flag}";
		var beongi = ""; //번지
	    
	    var addrZipCode      = document.frmAddr.addrZipCode.value;       // 우편번호
	    var addrSiName       = document.frmAddr.addrSiName.value;        // 시도
	    var addrGuName       = document.frmAddr.addrGuName.value;        // 시군구
	    var addrDongName     = document.frmAddr.addrDongName.value;      // 읍면동
	    var addrBunJi        = document.frmAddr.addrBunJi.value;      // 번지
	    
	    var addrFull = addrSiName+" "+addrGuName+" "+addrDongName;

	    
	    
	    //번지
	    if(addrBunJi !="")
	    {
	    	addrFull = addrFull + " " + addrBunJi;
	    }
	    

		
	    
	    //고객주소3형태
	    var addr3 = addrDongName;
	    //addr3 = addrRee      != "" ? addr3 + " " + addrRee      : addr3;
	    //addr3 = addrBuilding != "" ? addr3 + " " + addrBuilding : addr3;
	    
	    if(flag == "mypage" ) 
	    {
		    parent.document.myPageForm.zip1.value  = addrZipCode.substring(0, 3);
		    parent.document.myPageForm.zip2.value  = addrZipCode.substring(4); 
		    parent.document.myPageForm.addr1.value = addrFull; 
		    parent.document.myPageForm.addr2.value = $("#detail_input").attr("value"); 
		    parent.document.myPageForm.addrZipCode.value    = addrZipCode;
		    parent.document.myPageForm.addrSiName.value     = addrSiName; 
		    parent.document.myPageForm.addrGuName.value     = addrGuName; 
		    parent.document.myPageForm.addrDongName.value   = addr3 + beongi;
		}
		else if( flag == "story" )
		{
			parent.document.recruit_form.zip1.value  = addrZipCode.substring(0, 3);
	    	parent.document.recruit_form.zip2.value  = addrZipCode.substring(3, 6); 
	    	parent.document.recruit_form.addr1.value = addrFull; 
	    	parent.document.recruit_form.addr2.value = $("#detail_input").attr("value");
	    	 
		}
		else if( flag == "franch" )
		{
			parent.document.counsel_form.zip1.value  = addrZipCode.substring(0, 3);
	    	parent.document.counsel_form.zip2.value  = addrZipCode.substring(3, 6); 
	    	parent.document.counsel_form.addr1.value = addrFull; 
	    	parent.document.counsel_form.addr2.value = $("#detail_input").attr("value");
		}
		else if(flag == "member")
		{
			parent.document.f1.zip1.value  = addrZipCode.substring(0, 3);
	    	parent.document.f1.zip2.value  = addrZipCode.substring(4); 
	    	parent.document.f1.addr1.value = addrFull; 
	    	parent.document.f1.addr2.value = $("#detail_input").attr("value");
	    	
	    	parent.document.f1.addrZipCode.value    = addrZipCode;
	    	parent.document.f1.addrSiName.value     = addrSiName; 
	    	parent.document.f1.addrGuName.value     = addrGuName; 
	    	parent.document.f1.addrDongName.value   = addr3 + beongi;
		}
	    
	    del_pop('search_addr',true, $(this));	    
	}

	
	// 주소 클릭 -> 상세주소 입력 이동
	var $addr_list1 = $("#s_addr .addr_step1 li a");
	$addr_list1.live("click",select_addr1);
	function select_addr1()
	{
		
		var addr1 = $(this).find(".addr").text(); 
		$("#addrHDongCode").attr("value", $(this).find("#hDongCode").val());
		$("#addrBDongCode").attr("value", $(this).find("#bDongCode").val());

		/* 20130509 수정 */
		$("#input_addr").hide();
		$("#addr_list").hide();
		$("#seleced_addr1").text(addr1); 
		
		document.frmAddr.addrZipCode.value      = $(this).find(".zipCode"     ).attr("value");  // 우편번호
     	document.frmAddr.addrSiName.value       = $(this).find(".siName"      ).attr("value");  // 시도
     	document.frmAddr.addrGuName.value       = $(this).find(".guName"      ).attr("value");  // 시군구
     	document.frmAddr.addrDongName.value     = $(this).find(".dongName"    ).attr("value");  // 읍면동
     	document.frmAddr.addrBunJi.value        = $(this).find(".bunJi"         ).attr("value");  // 리	     					
		
		//상세주소 입력 프레임
		$("#seleced_addr2").text(addr1);
		$detail_addr.show();
	}


	// stpe2 이전버튼
	$("#stepBack_btn2").bind("click",function()
	{
		$("#step1").css("display", "block");
		$("#detail_addr").css("display", "none"); 
		$("#detail_input").attr("value","");
		search_step1();
		$("#addr_list").css("height","140px");
		$("#input_addr").show();
		$("#addr_list").show();
		$("#seleced_addr1").text("");
	}); 
</script>		