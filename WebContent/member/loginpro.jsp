<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="../assets/js/common.min.js"></script>
<script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../assets/js/snb.js"></script>
<script type="text/javascript">
	parent.$('#viewLoading').fadeOut();   

	var result_val = "${result}";
	var menuGb = parent.document.getElementById("menuGb").value;
	var alertFrame = $( parent.document.getElementById("notice_caution") );
	
	if( result_val == "no" )
	{	
		alertFrame.find("#alertText p").remove();
		alertFrame.find("#alertText").append("<p>입력하신 정보가 맞지 않습니다.<br>다시 확인 하시고 로그인 해 주세요.</p>"); 
		parent.popAlert("#notice_caution");
		
		parent.document.loginForm.mem_id.focus();
	}
	else if(result_val == "yes")
	{
		if(menuGb == "order")
		{
			parent.document.location.href = "orderAction.action?menuId=pj_2003&pizzaSelIdx=1";
		}
		else
		{
			parent.document.location.href = "mainAction.action?msg=ok";
		}
	}
</script>