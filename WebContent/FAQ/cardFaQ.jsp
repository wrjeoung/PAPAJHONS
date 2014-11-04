<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table align="center">
	<tr>
		<td>
			<a href="qnalistAction.action"><img src="../assets/img/qna/faq_tab_title1.gif" alt="배송관련"/></a>
			<a href="onlinelistAction.action"><img src="../assets/img/qna/faq_tab_title2.gif" alt="온라인관련"/></a>
			<a href="cardlistAction.action"><img src="../assets/img/qna/faq_tab_title3.gif" alt="제휴카드"/></a>
			<a href="shoplistAction.action"><img src="../assets/img/qna/faq_tab_title4.gif" alt="가맹점"/></a>
			<a href="homelistAction.action"><img src="../assets/img/qna/faq_tab_title5.gif" alt="홈페이지"/></a>
			<a href="joblistAction.action"><img src="../assets/img/qna/faq_tab_title6.gif" alt="채용관련"/></a>
			<a href="storelistAction.action"><img src="../assets/img/qna/faq_tab_title7.gif" alt="매장관련"/></a>
		</td>
	</tr>
</table>

<c:forEach var="vo" items="${list3 }">
	<div>
		<ul>
			<li class="q">
			<a>${vo.qcontent }</a>
			<ul class="a">
				<li>${vo.acontent }</li>
			</ul>
			</li>
		</ul>
	</div>
</c:forEach>

</body>
</html>