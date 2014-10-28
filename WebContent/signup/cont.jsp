<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Cache-Control" content="no-store" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
	<meta http-equiv="Description" content="Order Papa John's Pizza online for fast pizza delivery or pickup. Get Papa John's Special Offers or use Papa John's promo codes for online pizza orders." />
	<meta http-equiv="Keywords" content="Papa john's, papa johns, papa johns pizza, papa johns online, pizza, papa johns menu, order papa johns, pizza delivery, order pizza online, pizza specials, papa johns coupons, papa johns promo codes, papa johns specials, pizza coupons, fast order, papa's picks, papas picks" />
	<link rel="icon" href="../assets/img/favicon.ico" />
	<link type="text/css" rel="stylesheet" href="../assets/css/import.css" />
	<link type="text/css" rel="stylesheet" href="../assets/css/sub.css" />
	<link type="text/css" rel="stylesheet" href="../assets/css/lib_style.css" />
	<title>파파존스-Better Ingredients.Better Pizza.</title>
	<style type="text/css"></style>
	<script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
	<!-- <script type="text/javascript" src="assets/js/common.js"></script> -->
	<script type="text/javascript" src="../assets/js/common.min.js"></script>
	<script type="text/javascript" src="../assets/js/snb.js"></script> 
</head>

<body>
	<div id="skipNavi"> <a href="#gnb">메뉴 바로가기</a> <a href="#contents">본문바로가기</a></div>
	
	<!-- wrap -->
	<div id="wrap">
	
  		<!-- header -->
  		<div id="header">
  			<!--  <script type="text/javascript"> $("#header").load("../include/header.jsp?menuGb=member&menuId=pj_0005"); </script>-->
  			<script type="text/javascript">$("#header").load('../include/header.jsp?menuGb='+'${menuGb}'+'menuId='+'${menuId}'); </script>
  		</div>
  		<!-- // header --> 
  
  		<!-- container -->
  		<div id="container">
  		
    		<!-- con_header -->
    		<div class="con_header">
      			<p><!-- 타이틀 --></p>
    		</div>
    		<!-- //con_header -->
	  
    		<!-- content_area -->
    		<div id="content_area">
  				<!-- <script type="text/javascript">$("#content_area").load('../member/pj_0005.jsp?menuId=pj_0005&msg=&step='); </script> -->
  				<script type="text/javascript">$("#content_area").load('../member/'+'${menuId}'+'.jsp?menuId='+'${menuId}'+'&msg=&step='); </script>
  			</div>
    		<!--// content_area -->
    		
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
 		<p>Loading....</p> 
	</div>
	
</body>
</html>
