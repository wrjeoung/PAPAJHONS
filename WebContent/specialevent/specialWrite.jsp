<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>스페셜 할인 이벤트</title>
</head>
<body> -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge" />
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
	0404 추가부분(달력쿼리 스타일) 시작
	<link type="text/css" rel="stylesheet" href="../assets/css/ui.all.css" />
	0404 추가부분(달력쿼리 스타일)끝
	<title>파파존스-Better Ingredients.Better Pizza.</title>


<style type="text/css">
/* 메뉴화면 공통팝업 스타일 수정 20131128*/
#notice_caution{display:none; width:340px; height:auto; min-height:140px; padding:1px; position:absolute; top:0; left:0; z-index:1000;}
#notice_caution .header .left{float:left; width:6px; background:url(../assets/img/usa/modal_header_left.png) top left no-repeat;}
#notice_caution .header .center{float:left; width:328px; height:40px; background:url(../assets/img/usa/modal_header_center.png) top center repeat-x; }
#notice_caution .header .right{float:right; width:6px; height:40px; background:url(../assets/img/usa/modal_header_right.png) top right no-repeat; }
#notice_caution .text_body{width:340px; height:auto; min-height:90px; line-height: 30px; background:#fff; border: 0px none; padding:8px 0px;}
#notice_caution .footer{position: absolute; height:32px; background:#fff;}
#notice_caution .footer .button{bottom:20px;}
#notice_caution .footer .left{float:left; width:6px; height:8px; background:url(../assets/img/usa/modal_footer_left.png) bottom left no-repeat;}
#notice_caution .footer .center{float:left; width:328px; height:8px; background:url(../assets/img/usa/modal_footer_center.png) bottom center repeat-x;}
#notice_caution .footer .right{float:right; width:6px; height:8px; background:url(../assets/img/usa/modal_footer_right.png) bottom right no-repeat;}
</style>
	
<script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../assets/js/common.min.js"></script>
<script type="text/javascript" src="../assets/js/snb.js"></script> -->
<script type="text/javascript">
	/* $(document).ready(function()
	{	
 		$('#viewLoading').fadeOut();
 		$('#viewLoading')	// ajax 실행 및 완료시 'Loading 이미지'의 동작 컨트롤하기
		.ajaxStart(function()
		{  
			$(this).fadeIn(500);
		})
		.ajaxStop(function()
		{ 
			$(this).fadeOut(500);
		});

 		//20140527 열려있는 화면 사이즈에 따라 응모 팝업 위치 변경
// 		var $ev_page = $("#worldCupEvent");
// 		var top = ($(window).height()/2)-($ev_page.height()/2);
// 		$ev_page.css("top",top+"px");
	}); */
	function validation(){
		var specialWrite=eval("document.specialWrite");

		if(!specialWrite.upload.value){
			alert("첨부파일을 올려주세요.");
			return false;
		}
		
	}
</script>
</head>

<body>
	<%-- <div id="skipNavi"><a href="#gnb">메뉴 바로가기</a> <a href="#contents">본문바로가기</a></div>
	
  	<!-- wrap -->
	<div id="wrap">
	
  		<!-- header -->
  		<div id="header" >
  			<script type="text/javascript">	$("#header").load("../include/header.jsp?menuGb=event&menuId=pj_3001"); </script> 
  		</div>
  		<!--// header --> 
  
  		<!-- container -->
  		<div id="container">
    
    		<!-- con_header -->
    		<div class="con_header">
    			<p >Papa John's PROMOTION<span><img src="../assets/img/sub/conHeader_text_phone.gif" alt="온라인주문관련 상담번호"></span></p>
    		</div>
    		<!--// con_header -->
			<!-- con_container -->  
    		<div id="con_container">
    		
      			<!-- snb -->
    			<div class="snb">
    				<!--  1메뉴 서브 : menuGd=menu -->
			  		<h2><img alt="프로모션" src="../assets/img/pro/snb_title_3.gif"></h2>
			  		<dl class="sub" id="snb1">
			    		<!--  <dt class="dep1 pj_2001"><a href="/sub.jsp?menuGb=menu&menuId=pj_2001"><img src="../assets/img/sub/sub_2_1.gif" alt="이 달의 프로모션"></a></dt> -->
			    		<dt><a href="listAction2.action"><img src="../assets/img/pro/sub_3_1_over.gif" alt="진행중인 이벤트"></a></dt>
			    		<dt><a href="pastlistAction.action"><img src="../assets/img/pro/sub_3_2_over.gif" alt="지난 이벤트"></a></dt>
			    		<dt><a href="storelistAction.action"><img src="../assets/img/pro/sub_3_3_over.gif" alt="매장별 이벤트"></a></dt>
			    		<dt><a href="speciallistAction.action"><img src="../assets/img/pro/sub_3_4_over.gif" alt="스페셜 할인 이벤트"></a>
			    		<!--  <dt class="dep1 pj_2014"><a href="subAction.action?menuId=pj_2014"><img src="../assets/img/sub/sub_2_14.gif" alt="소스&피클"></a></dt>-->
			  		</dl>
    				
     				<script type="text/javascript">	$("#con_container .snb").load("../include/snb.jsp?menuGb=menu&menuId=pj_2003&tab=null"); </script>
     				 
      			</div>
      			<!-- //snb -->
 		    
				<!-- contents -->
  				<div id="contents">
      				<div class="top_title">
      					<c:if test="${menuId == 'pj_2001'}"><h2>이달의프로모션</h2>	</c:if>
      					<c:if test="${menuId == 'pj_2002'}"><h2>베스트메뉴</h2>	</c:if>
      					<c:if test="${menuId == 'pj_2003'}"><h2>오리지널</h2></c:if>
      					<c:if test="${menuId == 'pj_2004'}"><h2>골드링</h2></c:if>
      					<c:if test="${menuId == 'pj_2005'}"><h2>치즈롤크러스트</h2></c:if>
      					<c:if test="${menuId == 'pj_2006'}"><h2>씬</h2></c:if>
      					<c:if test="${menuId == 'pj_2008'}"><h2>골드링씬</h2></c:if>
      					<c:if test="${menuId == 'pj_2001'}"><h2>음료</h2>	</c:if>
      					<c:if test="${menuId == 'pj_2009'}"><h2>하트씬</h2></c:if>
      					<c:if test="${menuId == 'pj_2010'}"><h2>파파를래터</h2>	</c:if>
      					<c:if test="${menuId == 'pj_2011'}"><h2>세트메뉴</h2></c:if>
      					<c:if test="${menuId == 'pj_2012'}"><h2>사이드</h2></c:if>
      					<c:if test="${menuId == 'pj_2013'}"><h2>음료</h2></c:if>
      					<c:if test="${menuId == 'pj_2014'}"><h2>소스&피클</h2></c:if>
      					
      					<!-- 20140319  페이스북 좋아요 버튼 추가 
						<div class="fb-like" data-href="https://www.facebook.com/papajohnskorea" data-layout="standard" data-action="like" data-show-faces="false" data-share="false"></div>
						 좋아요 버튼 끝 -->
						
						<!-- 20140627 이벤트 버튼 숨김(한국 경기 종료 -->
<!-- 						<div id="myEventBtn" style="display: none;"> -->
<!-- 							<button class="listBtn_blank red"  type="button" onclick="$('#worldCupEvent').show();">이벤트 응모 확인</button> -->
<!-- 						</div> -->
						
					</div>
      				<!-- cont -->
        			<div class="cont" style="text-align:center"> --%>
<center><b>스페셜 할인 이벤트</b>
<br/>
<form method="post" name="specialWrite" action="specialwriteAction.action" enctype="multipart/form-data" onsubmit="return validation();">
	<table width="600" border="1" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td width="70" align="center">첨부파일</td>
			<td width="530">
				<input type="file" name="upload"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="글쓰기">
			</td>
		</tr>		
	</table>
</form>
<!-- </body> -->
<!-- </div>
      				// cont
				</div>
				// contents
				
			</div>
			// con_container  

  		</div>
  		// container
  
    	footer
  		<div id="footer">
  			<script type="text/javascript"> $("#footer").load("../include/foot.jsp");
  			</script>
  		</div> 
  		// footer 

		20140520 월드컵 이벤트 마이페이지 화면
		<div id="worldCupEvent" style="display: none;">
			<script type="text/javascript">	$("#worldCupEvent").load("include/ev_worldcup.jsp?page=mypage"); </script>
		</div>
	
	</div>
	// wrap

  		
	로딩 이미지
	<div id="viewLoading">
		<img src="../assets/img/viewLoading.gif" /> 
 		<p>Loading....</p> 
	</div>

	페이스북 좋아요 버튼 스크립트 start
	<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/ko_KR/all.js#xfbml=1";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>
	페이스북 좋아요 버튼 스크립트 end -->
</body>
</html>