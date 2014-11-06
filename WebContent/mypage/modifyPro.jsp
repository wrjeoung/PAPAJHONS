<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="../assets/js/common.min.js"></script>
<script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../assets/js/snb.js"></script>
<script type="text/javascript">
	$(document).ready(function(){parent.$('#viewLoading').fadeOut(500);});
	var alertFrame = $(parent.document.getElementById("notice_7003"));
	
	if("${result}" == 1)
	{
		alertFrame.find("#alertText p").remove();
		alertFrame.find("#alertText").append("<p>비밀번호가 정상적으로 변경 되었습니다.</p>"); 
		parent.popAlert(alertFrame);
		alertFrame.find(".alertBtn").focus();
		parent.autoFocus = parent.$("#pass");
		
		parent.$("#origin_password").val("");
		parent.$("#new_password").val("");
		parent.$("#new_password_conf").val("");
		del_pop('change_pw',true, $(this));
	}
	else if("${result}" == 0)
	{
		alertFrame.find("#alertText p").remove();
		alertFrame.find("#alertText").append("<p>변경 전 비밀번호를 확인 해주세요.</p>");
		parent.popAlert(alertFrame);
		alertFrame.find(".alertBtn").focus();
        parent.autoFocus = parent.$("#origin_password");
	}
</script>