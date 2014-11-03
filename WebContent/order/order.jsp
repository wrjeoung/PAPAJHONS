<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	<link rel="icon" href="../assets/img/favicon.ico" />
	<link type="text/css" rel="stylesheet" href="../assets/css/import.css" />
	<link type="text/css" rel="stylesheet" href="../assets/css/sub.css" />
	<link type="text/css" rel="stylesheet" href="../assets/css/order.css" />
	<link type="text/css" rel="stylesheet" href="../assets/css/lib_style.css" />
	
<style type="text/css">
	#con_container{background:none; border:none;padding-left:0;}
	#contents{background:none; border:none;padding-left:0;}
	#contents .cont{width:99%;}
	#container {padding-bottom:0px;}
</style>

<script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../assets/js/common.min.js"></script>
	
<script type="text/javascript">
	//20140702 콘솔로그 ie 오류 막기
	var console = window.console || {log:function(){}};
</script>
<title>파파존스-Better Ingredients.Better Pizza.</title>
</head>

<body>
	<div id="skipNavi">
		<a href="#gnb">메뉴 바로가기</a> <a href="#contents">본문바로가기</a> 
	</div>
	
	<!-- wrap -->	
	<div id="wrap">
  		<!-- header -->
  		<div id="header">
  			<script type="text/javascript">	$("#header").load("../include/header.jsp?menuGb=order");	</script>
  		</div>
  		<!-- header --> 
  
  		<!-- container -->
  		<div id="container">    
    		<!-- con_header -->
    		<div class="con_header">
      			<p><!-- 타이틀 --></p>
    		</div>
    		<!-- //con_header -->

  			<!-- include -->
  			<div id="content_area">
  			
  				<!-- 페이지 로딩 시 이전화면 상태에서 불러오기 테스트 -->
  				<div class="testView" style="width:inherit; height:380px; background: #fff;"></div>
  				
  				
  				
  				<script type="text/javascript">$("#content_area").load("../order/pj_1002.jsp?onlineGroupCd=10&pizzaSelIdx=${param.pizzaSelIdx}"); </script>
  			</div>
  			<!-- //include -->
  		</div>
  		<!-- //container -->
  
  		<!-- footer -->
  		<div id="footer">
  			<script type="text/javascript">	$("#footer").load("../include/foot.jsp"); </script>
  		</div> 
  		<!-- // footer --> 

	</div>
	<!-- //wrap -->	

	<!-- 로딩 이미지 -->
	<div id="viewLoading">
		<img src="../assets/img/viewLoading.gif" />
		<p> Please wait...</p>
	</div> 
	<!-- //로딩 이미지 -->
</body>
</html>
