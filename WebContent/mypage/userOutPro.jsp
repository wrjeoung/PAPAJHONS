<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="../assets/js/common.min.js"></script>
<script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../assets/js/snb.js"></script>
<script type="text/javascript">
	parent.$('#viewLoading').fadeOut();
	
	var alertFrame = $(parent.document.getElementById("notice_7003"));
	
	alertFrame.find("#alertText p").remove();
	alertFrame.find("#alertText").append("<p>정상적으로 탈퇴되었습니다.</p>"); 
	parent.popAlert(alertFrame);
	parent.location.href = "mainAction.action";
</script>