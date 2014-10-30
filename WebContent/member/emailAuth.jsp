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
	<link rel="icon" href="../assets/img/favicon.ico" />
	<link type="text/css" rel="stylesheet" href="../assets/css/reset.css" />
	<link type="text/css" rel="stylesheet" href="../assets/css/sub.css" />
	<link type="text/css" rel="stylesheet" href="../assets/css/lib_style.css" />
	<style type="text/css">
		body{overflow:hidden;padding:0;}
		#alertLogout{width:336px; height:136px; min-height:140px;  padding:1px; z-index:2000;}
		#alertLogout .header .left{float:left; width:6px; height:40px; background:url(../assets/img/usa/modal_header_left.png) left top no-repeat;}
		#alertLogout .header .center{float:left; width:323px; height:40px; background:url(../assets/img/usa/modal_header_center.png) center top repeat-x; }
		#alertLogout .header .right{float:left; width:6px; height:40px; background:url(../assets/img/usa/modal_header_right.png) right top no-repeat; }
		#alertLogout .text_body{float:left; width:335px; height:85px;  line-height: 30px; background:#fff; border: 0px none; padding:4px 0px;}

		#alertLogout .footer .left{float:left; width:6px; height:8px; background:url(../assets/img/usa/modal_footer_left.png) left bottom no-repeat;}
		#alertLogout .footer .center{float:left; width:323px; height:8px; background:url(../assets/img/usa/modal_footer_center.png) center bottom repeat-x;}
		#alertLogout .footer .right{float:left; width:6px; height:8px; background:url(../assets/img/usa/modal_footer_right.png) right bottom no-repeat;}
	
		#alertLogout .button{width:334px;position:relative; bottom:32px;}
	</style>
	
	<title>파파존스-Better Ingredients.Better Pizza.</title>
	
<script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
<!-- <script type="text/javascript" src="../assets/js/common.js"></script> -->
<script type="text/javascript" src="../assets/js/common.min.js"></script>
<script language="JavaScript" type="text/JavaScript" >
	

	parent.$('#viewLoading').fadeOut();         
	
	var alertFrame = $( parent.document.getElementById("notice_0005") );
	//질문 입력에 따른 리스트 다시 표시
	function search_list() 
	{
		
		if( document.f1.s_id.value == "" ) 
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>검색하실 아이디을 입력해 주세요</p>");
			parent.popAlert(alertFrame);
			
			document.f1.s_id.focus();
			return;
		}
		if( !isABCNum(document.f1.s_id.value) )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>아이디는 영문 또는 숫자만 가능합니다.</p>");
			parent.popAlert(alertFrame);
			
			document.f1.join_passConf.focus();
			return;
		}
		if( document.f1.s_id.value.length < 4 || document.f1.s_id.value.length > 20 )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>아이디는 4자 이상, 20자 이내로 입력하셔야 합니다.</p>");
			parent.popAlert(alertFrame);
			
			document.f1.join_passConf.focus();
			return;
		}

		document.f1.action='idSearchProAction.action';
		document.f1.submit();
			
	}
	function close()
	{
		parent
	}

	//
	function i_close()
	{
			
		self.close();
			
	}
</script>
</head>

<body>
<form name="f1" method="post">
<div class="notice" id="alertLogout"> 
    <div class="header">
	    <div class="left"></div>
	    <div class="center">
	    	<h2>알림!!</h2> 
	    </div>
	    <div class="right"></div>
	</div>
    <div id="alertText" class="text_body"> 
    	<c:if test="${result == true}">
    		<p>이메일 인증메일이 발송되었습니다.<br>확인 바랍니다.</p>
    	</c:if>
    	<c:if test="${result == false}">
    		<p>죄송합니다.<br>이메일 전송을 실패하였습니다</p>
    	</c:if>
    </div>  
  	<div class="footer">
		<div class="left" ></div>
    	<div class="center"></div>
    	<div class="right"></div>
  	</div>

  	<div class="button"><button class="alertBtn gray" type="button" onclick="del_pop('email_auth',true,$(this))">확인</button>
</div>	
</form>
</body>
</html>
