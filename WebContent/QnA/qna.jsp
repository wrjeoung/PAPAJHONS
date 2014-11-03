<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
$(document).ready(function()
{
	//페이지 시작 시로딩 이미지 숨기기
	$('#viewLoading').hide();
	$('#viewLoading')	// ajax 실행 및 완료시 'Loading 이미지'의 동작 컨트롤하기
	.ajaxStart(function()
	{
		$(this).fadeIn(500);
	})
	.ajaxStop(function()
	{ 
		$(this).fadeOut(500);
	});
}); 
</script>
<div id="qna_area" class="txt_left">
	<div id="tab_section">
		<ul class="tabMenu">
			<li><a title="#tab1"><img src="../assets/img/qna/faq_tab_title1.gif" alt="배송관련"/></a></li>
			<li><a title=#tab2><img src="../assets/img/qna/faq_tab_title2.gif" alt="온라인관련"/></a></li>
			<li><a title=#tab2><img src="../assets/img/qna/faq_tab_title3.gif" alt="제휴카드"/></a></li>
			<li><a title=#tab2><img src="../assets/img/qna/faq_tab_title4.gif" alt="가맹점"/></a></li>
			<li><a title=#tab2><img src="../assets/img/qna/faq_tab_title5.gif" alt="홈페이지"/></a></li>
			<li><a title=#tab2><img src="../assets/img/qna/faq_tab_title6.gif" alt="채용관련"/></a></li>
			<li><a title=#tab2><img src="../assets/img/qna/faq_tab_title7.gif" alt="매장관련"/></a></li>
		</ul>
	</div>
		<!-- 배달관련 -->
		<div id="tab1" class="tab">
		<h4 class="title"><img src="../assets/img/qna/faq_tab_title1.gif" alt="배송관련FAQ"/></h4>
			<c:forEach var="vo" items="${list }">
				<dl class="qna_list">
					<dt class="q">${vo.qcontent }</dt>
					<dd class="a">${vo.acontent }</dd>
				</dl>
			</c:forEach>
		</div>
		<!-- 온라인관련 -->
		<div id="tab2" class="tab">
			<h4 class="title"><img src="../assets/img/qna/faq_tab_title2.gif" alt="온라인관련FAQ"></h4>
			<c:forEach var="vo" items="${list2 }">
				<dl class="qna_list">
					<dt class="q">${vo.qcontent }</dt>
					<dd class="a">${vo.acontent }</dd>
				</dl>
			</c:forEach>
		</div>
		<!-- 제휴카드 -->
		<div id="tab3" class="tab">
			<h4 class="title"><img src="../assets/img/qna/faq_tab_title3.gif" alt="제휴카드FAQ"/></h4>
			<c:forEach var="vo" items="${list3 }">
				<dl calss="qna_list">
					<dt class="q">${vo.qcontent }</dt>
					<dd class="a">${vo.acontent }</dd>
				</dl>	
			</c:forEach>
		</div>
		<!-- 가맹점 FAQ 시작 -->
		<div id="tab4" class="tab">
			<h4 class="title"><img src="../assets/img/qna/faq_tab_title4.gif" alt="가맹점FAQ"/></h4>
			<c:forEach var="vo" items="${list4 }">
			<dl class="qna_list">
				<dt class="q">${vo.qcontent }</dt>
				<dd class="a">${vo.acontent }</dd>
			</dl>
			</c:forEach>
		</div>
		<!-- 홈페이지FAQ 시작 -->
		<div id="tab5" class="tab">
			<h4 class="title"><img src="../assets/img/qna/faq_tab_title5.gif" alt="홈페이지FAQ"/></h4>
			<c:forEach var="vo" items="${list5 }">
			<dl class="qna_list">
				<dt class="q">${vo.qcontent }</dt>
				<dd class="a">${vo.acontent }</dd>
			</dl>	
			</c:forEach>
		</div>
		<!-- 채용관련FAQ 시작 -->
		<div id="tab6" class="tab">
		<h4 class="title"><img src="../assets/img/qna/faq_tab_title6.gif" alt="채용관련FAQ"/></h4>
			<c:forEach var="vo" items="${list6 }">
			<dl class="qna_list">
				<dt class="q">${vo.qcontent }</dt>
				<dd class="a">${vo.acontent }</dd>
			</dl>
			</c:forEach>
		</div>
		<!-- 매장관련 -->
		<div id="tab7" class="tab">
		<h4 class="title"><img src="../assets/img/qna/faq_tab_title7.gif" alt="매장관련FAQ"/></h4>
			<c:forEach var="vo" items="${list7 }">
			<dl class="qna_list">
				<dt class="q">${vo.qcontent }</dt>
				<dd class="a">${vo.acontent }</dd>
			</dl>
			</c:forEach>
		</div>
</div>

<script type="text/javascript">
	var $tabMenu=$(".tabMenu li a");
	var $tab=$(".tab")
	var $tab_q=$tab.find(".q")
	var $tab_a=$tab.find(".a")
	var $activeMenu
	$tab.hide()
	$tab_a.hide()
	load_fn()
	
	/*시작fn*/
	function load_fn(){
		var $f_menu=$(".tabMenu li").eq(0).find("a")
		$("tab1").show()
		$activeMenu=$f_menu
		$f_menu.unbind()
		$f_menu.find("img").attr("src",function(){
			return $(this).attr("src").replace(".gif","_on.gif")
		});
	}
	/*qna 3차 메뉴 탭 버튼*/
	$tabMenu.bind("click",qna_tab)
	
	function qna_tab(){
		$tab_a.hide()
		var activ_tab=$(this).attr("title");		
		$activeMenu.find("img").attr("src",function(){
			return $(this).attr("src").replace("_on.gif",".gif")
		});	
		$activeMenu.bind("click",qna_tab)
		$(this).find("img").attr("src",function(){
			return $(this).attr("src").replace(".gif","_on.gif")
		});
		
		$(this).unbind()
		$activeMenu=$(this);
		$tab.hide()	
		$(activ_tab).show()
	}
	
	$tab_q.toggle(function(){
		$(this).next().show();
	},
	function(){
		$(this).next().hide();
	});
</script>