<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="../assets/js/common.min.js"></script>
<script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../assets/js/snb.js"></script>
<script type="text/javascript">
	parent.$('#viewLoading').fadeOut();   
	var alertFrame = $(parent.document.getElementById("notice_0002"));

	if("${val}" == 1)
	{
		if("${check}" == 1)
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>고객님의 ID는 ["+ "${s_id}" + "] 입니다.</p>"); 
			parent.popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
		}
		else if("${check}" == 0)
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>입력하신 정보가 바르지 않습니다.<br>정보를 확인하신 후 다시 입력해 주세요.</p>");
			parent.popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
		}
	}
	else if("${val}" == 2)
	{
		if("${check}" == 1)
		{
    		alertFrame.find("#alertText p").remove();
    		alertFrame.find("#alertText").append("<p>고객님에게 이메일이 발송 되었습니다.</p>"); 
    		parent.popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus(); 
		}
		else if("${check}" == 0)
		{
    		alertFrame.find("#alertText p").remove();
    		alertFrame.find("#alertText").append("<p>회원정보를 찾을 수 없습니다..</p>"); 
    		parent.popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus(); 
		}		
		else if("${check}" == -1)
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>죄송합니다.<br>이메일 전송을 실패하였습니다.</p>");
			parent.popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();			
		}			
	}
</script>