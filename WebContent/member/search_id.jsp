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
	<title>파파존스-Better Ingredients.Better Pizza.</title>
	
<script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
<!-- <script type="text/javascript" src="../assets/js/common.js"></script> -->
<script type="text/javascript" src="../assets/js/common.min.js"></script>
<script language="JavaScript" type="text/JavaScript" >

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


	//
	function i_close()
	{
			
		self.close();
			
	}
</script>
</head>

<body>

<form name="f1" method="post">
	<div style="margin:0px auto 2px; width:250px">
		<label for="s_id" style=" display:block; padding:0 0 5px 0;"><img src="../assets/img/forms/login_id.gif" alt="아이디" /></label>
		<input type="text"   id="s_id"     name="s_id"     value="${s_id}"/>
		<input type="hidden" id="s_id_chk" name="s_id_chk" value="N"/>
		<span class="btn_h23 gray"><button type="button" onclick="search_list()">아이디검색</button></span>
	</div>
	
	<div style="margin:16px auto; width:250px; background:#efefef; padding:3px; text-align:center; font-size:12px; line-height:1.5em; font-family:''돋움',dotum,Helvetica,AppleGothic, Sans-serif; color:#666666;">
		<c:if test="${check == -1}">  
			<p>검색 하실 아이디를 입력 해 주세요</p>
		</c:if>
		
		<c:if test="${check == 1}">  
			<p>입력하신 <span style="font-weight:bold; color:#e32744">${s_id}</span> 는</p>
			<p>사용 불가능한 아이디입니다.</p>
			<script>
				$("#s_id").val("");
				document.f1.s_id_chk.value = "N";
			</script>
		</c:if>
		
		 <c:if test="${check == 0}">  
			<p>입력하신 <span style="font-weight:bold; color:#e32744">${s_id}</span> 는</p>
			<p>사용가능한 아이디입니다.</p>
	    	<p style="text-align:center; padding:5px 0;">
	    		<script>
					document.f1.s_id_chk.value = "Y";
				</script>
	    		<span class="btn_h23 gray" id="useButton">
	      			<button type="button" onclick='del_pop("search_id",true,$("#s_id").attr("value"),"id",$("#s_id_chk").attr("value"),"id_chk")'>사용하기</button>
	    		</span>
	    	</p>
		</c:if>			
	
 	</div>
</form>
</body>
</html>
