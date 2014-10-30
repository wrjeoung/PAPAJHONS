<html>
<HEAD>
	<TITLE>로그아웃</TITLE>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta content="MSHTML 6.00.3790.4357" name="GENERATOR">
	
	<link type="text/css" rel="stylesheet" href="../assets/css/import.css" />
	<link type="text/css" rel="stylesheet" href="../assets/css/main.css" />
	<link type="text/css" rel="stylesheet" href="../assets/css/lib_style.css" />
	<style type="text/css">
		body{overflow:hidden;padding:0;}
		#alertLogout{display:none; width:336px; height:136px; min-height:140px;  padding:1px; z-index:2000;}
		#alertLogout .header .left{float:left; width:6px; height:40px; background:url(/assets/img/usa/modal_header_left.png) left top no-repeat;}
		#alertLogout .header .center{float:left; width:323px; height:40px; background:url(/assets/img/usa/modal_header_center.png) center top repeat-x; }
		#alertLogout .header .right{float:left; width:6px; height:40px; background:url(/assets/img/usa/modal_header_right.png) right top no-repeat; }
		#alertLogout .text_body{float:left; width:335px; height:85px;  line-height: 30px; background:#fff; border: 0px none; padding:4px 0px;}

		#alertLogout .footer .left{float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_left.png) left bottom no-repeat;}
		#alertLogout .footer .center{float:left; width:323px; height:8px; background:url(/assets/img/usa/modal_footer_center.png) center bottom repeat-x;}
		#alertLogout .footer .right{float:left; width:6px; height:8px; background:url(/assets/img/usa/modal_footer_right.png) right bottom no-repeat;}
	
		#alertLogout .button{width:334px;position:relative; bottom:32px;}
	</style>

    <script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
	
	<script type="text/javascript" src="../assets/js/common.min.js"></script>
	<script type="text/javascript" src="../assets/js/lib.js"></script>
	<script type="text/javascript">
	function logout()
	{ 
		//ie 쿼크모드 화면 깨짐 수정
		$("body").width($(window).width());
		$("body").height($(window).height());
		
		popAlert("#alertLogout"); 
	}
	function fnGoToIndex()
	{
		del_pop2('#alertLogout');
		location.href="mainAction.action";
	}
</script>
</HEAD>
<body onload="logout();" >
<form name="left" method="post"></form>

<!--20131128 로그아웃 알럿 변경-->
<div class="notice" id="alertLogout"> 
    <div class="header">
	    <div class="left"></div>
	    <div class="center">
	    	<h2>알림!!</h2> 
	    </div>
	    <div class="right"></div>
	</div>
    <div id="alertText" class="text_body"> 
    	<p>로그 아웃이 완료되었습니다.<br>이용해 주셔서 감사합니다.</p> 
    </div>  
  	<div class="footer">
		<div class="left" ></div>
    	<div class="center"></div>
    	<div class="right"></div>
  	</div>
  	<div class="button"><button class="alertBtn gray" type="button" onclick="fnGoToIndex();">확 인</button></div> 
</div>	
</body>
</html>