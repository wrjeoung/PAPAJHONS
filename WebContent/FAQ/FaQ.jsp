<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.js"></script>

<p abp="101"><script>
$(document).ready(function(){
	$(".q>a").click(function(){
		$(this).next("ul").toggleClass("a");
	});
});
</script>
</p>
<style type="text/css">
.q a{cursor: pointer;}
.q .a{display: none;}
</style>
<!-- <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body> -->
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
	<link type="text/css" rel="stylesheet" href="../assets/css/import.css" />
	<link type="text/css" rel="stylesheet" href="../assets/css/sub.css" />
	<link type="text/css" rel="stylesheet" href="../assets/css/lib_style.css" />
	<!-- 0404 �߰��κ�(�޷����� ��Ÿ��) ���� -->
	<link type="text/css" rel="stylesheet" href="../assets/css/ui.all.css" />
	<!-- 0404 �߰��κ�(�޷����� ��Ÿ��)��-->
	<title>��������-Better Ingredients.Better Pizza.</title>


<style type="text/css">
/* �޴�ȭ�� �����˾� ��Ÿ�� ���� 20131128*/
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
<script type="text/javascript" src="../assets/js/snb.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{	
 		$('#viewLoading').fadeOut();
 		$('#viewLoading')	// ajax ���� �� �Ϸ�� 'Loading �̹���'�� ���� ��Ʈ���ϱ�
		.ajaxStart(function()
		{  
			$(this).fadeIn(500);
		})
		.ajaxStop(function()
		{ 
			$(this).fadeOut(500);
		});

 		//20140527 �����ִ� ȭ�� ����� ���� ���� �˾� ��ġ ����
// 		var $ev_page = $("#worldCupEvent");
// 		var top = ($(window).height()/2)-($ev_page.height()/2);
// 		$ev_page.css("top",top+"px");
	});
	
	
</script>
</head>

<body>
	<div id="skipNavi"><a href="#gnb">�޴� �ٷΰ���</a> <a href="#contents">�����ٷΰ���</a></div>
	
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
    			<p >Papa John's CUSTOMER<span><img src="../assets/img/sub/conHeader_text_phone.gif" alt="�¶����ֹ����� ����ȣ"></span></p>
    		</div>
    		<!--// con_header -->
			<!-- con_container -->  
    		<div id="con_container">
    		
      			<!-- snb -->
    			<div class="snb">
    				<!--  1�޴� ���� : menuGd=menu -->
			  		<h2><img alt="������" src="../assets/img/cus/snb_title_5.gif"></h2>
			  		<dl class="sub" id="snb1">
			    		<!--  <dt class="dep1 pj_2001"><a href="/sub.jsp?menuGb=menu&menuId=pj_2001"><img src="../assets/img/sub/sub_2_1.gif" alt="�� ���� ���θ��"></a></dt> -->
			    		<dt><a href="listAction.action"><img src="../assets/img/cus/sub_5_1_over.gif" alt="��������"></a></dt>
			    		<dt><a href="qnalistAction.action"><img src="../assets/img/cus/sub_5_2_over.gif" alt="Q&A"></a></dt>
			    		<!--  <dt class="dep1 pj_2014"><a href="subAction.action?menuId=pj_2014"><img src="../assets/img/sub/sub_2_14.gif" alt="�ҽ�&��Ŭ"></a></dt>-->
			  			<dt><img src="../assets/img/cus/sub_5_3_over.gif" alt="���� ī�� �ȳ�"></a></dt>
     						<dd class="dep2">
      							<ul>
        							<li><a href="memcardlistAction.action">��Ż� ����� ī��</a></li>
        							<li><a href="crecardlistAction.action">�ſ�ī��</a></li>
      							</ul>
    						</dd>
			  			<dt class="dep1 pj_5004"><a href="storeAction.action"><img src="../assets/img/sub/sub_5_4.gif" alt="���� �ȳ�"></a></dt>
			  		
			  		</dl>
    				<%-- 
     				<script type="text/javascript">	$("#con_container .snb").load("../include/snb.jsp?menuGb=menu&menuId=pj_2003&tab=null"); </script>
     				--%> 
      			</div>
      			<!-- //snb -->
 		    
				<!-- contents -->
  				<div id="contents">
      				<div class="top_title">
      					<c:if test="${menuId == 'pj_2001'}"><h2>�̴������θ��</h2>	</c:if>
      					<c:if test="${menuId == 'pj_2002'}"><h2>����Ʈ�޴�</h2>	</c:if>
      					<c:if test="${menuId == 'pj_2003'}"><h2>��������</h2></c:if>
      					<c:if test="${menuId == 'pj_2004'}"><h2>��帵</h2></c:if>
      					<c:if test="${menuId == 'pj_2005'}"><h2>ġ���ũ����Ʈ</h2></c:if>
      					<c:if test="${menuId == 'pj_2006'}"><h2>��</h2></c:if>
      					<c:if test="${menuId == 'pj_2008'}"><h2>��帵��</h2></c:if>
      					<c:if test="${menuId == 'pj_2001'}"><h2>����</h2>	</c:if>
      					<c:if test="${menuId == 'pj_2009'}"><h2>��Ʈ��</h2></c:if>
      					<c:if test="${menuId == 'pj_2010'}"><h2>���ĸ�����</h2>	</c:if>
      					<c:if test="${menuId == 'pj_2011'}"><h2>��Ʈ�޴�</h2></c:if>
      					<c:if test="${menuId == 'pj_2012'}"><h2>���̵�</h2></c:if>
      					<c:if test="${menuId == 'pj_2013'}"><h2>����</h2></c:if>
      					<c:if test="${menuId == 'pj_2014'}"><h2>�ҽ�&��Ŭ</h2></c:if>
      					
      					<!-- 20140319  ���̽��� ���ƿ� ��ư �߰� 
						<div class="fb-like" data-href="https://www.facebook.com/papajohnskorea" data-layout="standard" data-action="like" data-show-faces="false" data-share="false"></div>
						 ���ƿ� ��ư �� -->
						
						<!-- 20140627 �̺�Ʈ ��ư ����(�ѱ� ��� ���� -->
<!-- 						<div id="myEventBtn" style="display: none;"> -->
<!-- 							<button class="listBtn_blank red"  type="button" onclick="$('#worldCupEvent').show();">�̺�Ʈ ���� Ȯ��</button> -->
<!-- 						</div> -->
						
					</div>
      				<!-- cont -->
        			<div class="cont" style="text-align:center">
<table align="left">
	<tr>
		<td>
			<a href="qnalistAction.action"><img src="../assets/img/qna/faq_tab_title1.gif" alt="��۰���"/></a>
			<a href="onlinelistAction.action"><img src="../assets/img/qna/faq_tab_title2.gif" alt="�¶��ΰ���"/></a>
			<a href="cardlistAction.action"><img src="../assets/img/qna/faq_tab_title3.gif" alt="����ī��"/></a>
			<a href="shoplistAction.action"><img src="../assets/img/qna/faq_tab_title4.gif" alt="������"/></a>
			<a href="homelistAction.action"><img src="../assets/img/qna/faq_tab_title5.gif" alt="Ȩ������"/></a>
			<a href="joblistAction.action"><img src="../assets/img/qna/faq_tab_title6.gif" alt="ä�����"/></a>
			<!-- <a href="stolistAction.action"><img src="../assets/img/qna/faq_tab_title7.gif" alt="�������"/></a> -->
		</td>
	</tr>
</table>
<br/>
<br/>
<c:forEach var="vo" items="${list }">
	<div>
		<ul>
			<li class="q">
			<a><img src="../boardimg/q.PNG"><b>${vo.qcontent }</b></a>
			<ul class="a">
				<li><img src="../boardimg/a.PNG">${vo.acontent }</li>
			</ul>
			</li>
		</ul>
	</div>
</c:forEach>
<!-- </body> -->
<!-- <input type="button" value="�۾���" onclick="document.location.href='qnawriteForm.action'"> -->
</div>
      				<!--// cont -->
				</div>
				<!--// contents -->
				
			</div>
			<!--// con_container -->  

  		</div>
  		<!--// container -->
  
    	<!-- footer -->
  		<div id="footer">
  			<script type="text/javascript"> $("#footer").load("../include/foot.jsp"); </script>
  		</div> 
  		<!--// footer --> 

		<!-- 20140520 ������ �̺�Ʈ ���������� ȭ�� -->
<!-- 		<div id="worldCupEvent" style="display: none;"> -->
<!-- 			<script type="text/javascript">	$("#worldCupEvent").load("include/ev_worldcup.jsp?page=mypage"); </script> -->
<!-- 		</div> -->
	
	</div>
	<!--// wrap -->

  		
	<!-- �ε� �̹��� -->
	<div id="viewLoading">
		<img src="../assets/img/viewLoading.gif" /> 
 		<p>Loading....</p> 
	</div>

	<!-- ���̽��� ���ƿ� ��ư ��ũ��Ʈ start-->
	<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/ko_KR/all.js#xfbml=1";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>
	<!-- ���̽��� ���ƿ� ��ư ��ũ��Ʈ end-->
</body>
</html>