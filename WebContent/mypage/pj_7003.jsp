<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript"> 
	//백스페이스 버튼의 뒤로가기 기능을 막는다.
	$(document).keydown(function(event)
	{
  		var code;
  		if( event.keyCode ) code = event.keyCode;
  		else if( event.which ) code = event.which;
 
  		if( code == 8 )
  		{
   			var targetNode = event.target.nodeName;
   			var readonly   = event.target.readOnly;
   			var disabled   = event.target.disabled;
   			var type       = event.target.type;
 
     		//type이 password나 text인 input와 textarea를 제외한 모든 엘리먼트에서 백스페이스기능을 제한함
   			if( !( ((targetNode=="INPUT"&&(type=="text"||type=="password"))||targetNode=="TEXTAREA")&&(!readonly&&!disabled) ) )
   			{
    			if( event.preventDefault )
     				event.preventDefault();		//for ie
    			else
     				event.returnValue = false;		//for 표준 브라우저(IE9, 파이어폭스, 오페라, 사파리, 크롬)
   			}
  		}
	});
	var alertFrame = $("#notice_7003");
 	var autoFocus = $("#pass");
	function fnAutoFocus()
	{
		autoFocus.focus();
	}
	
	function fnRadioClick(gb, val)
	{
		if( gb == "sms" )
		{
			$("#sms").val(val);
			if( val == "N" ) 
			{
				myPageForm.sms_yes.checked = false; 
				myPageForm.sms_no.checked = true;
				
			}
			else
			{
				myPageForm.sms_no.checked = false;
				myPageForm.sms_yes.checked = true; 
			}  

		}
		else if( gb == "sun" ) 
		{
			$("#cldTp").val(val);
		}
		else if( gb == "email" ) 
		{
			$("#sendmail").val(val);

			 if( val == "N" ) 
			{
				myPageForm.sendMail_yes.checked = false;
				myPageForm.sendMail_no.checked  = true; 
			}
			else
			{
				myPageForm.sendMail_no.checked  = false; 
				myPageForm.sendMail_yes.checked = true;
			} 
		}
		
	}

	function modifyInfo()
	{
		if( $("#pw").val() == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>비밀번호를 입력해 주세요.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			autoFocus = $("#pass");
			return;
		}
		if( !isABCNum($("#pw").val()) )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>비밀번호는 영문 또는 숫자만 가능합니다.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			autoFocus = $("#pass");
			return;
		}
		if( $("#pw").val().length < 4 || $("#pw").val().length > 20 )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>비밀번호는 4자 이상, 20자 이내로 입력하셔야 합니다.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			autoFocus = $("#pass");
			return;
		}
 		
		if( $("#mobile1").val() == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>휴대폰 번호를 입력해 주세요.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			autoFocus = $("#mobile1");
			return;
		}
		
		if ( $("#mobile2").val() == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>휴대폰 번호를 입력해 주세요.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			autoFocus = $("#mobile2");
			return;
		}
		
		if ( $("#mobile3").val() == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>휴대폰 번호를 입력해 주세요.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			autoFocus = $("#mobile3");
			return;
		}
		
 		if ( $("#email").val() == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>이메일 주소을 입력해 주세요.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			autoFocus = $("#email");
			return;
		}
		
		if ( $("#addr1").val() == "" || $("#addr2").val() == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>주소를 입력해 주세요.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
		    autoFocus = $("#addr2");
			return;
		}
		
		var phone = $("#phone1").attr("value")+'-'+$("#phone2").attr("value")+'-'+$("#phone3").attr("value")
		var mobile = $("#mobile1").attr("value")+'-'+$("#mobile2").attr("value")+'-'+$("#mobile3").attr("value")
		var addr = $("#addrZipCode").attr("value")+','+$("#addr1").attr("value")+','+$("#addr2").attr("value")
		
		$("#phone").val(phone);
		$("#mobile").val(mobile);
		$("#addr").val(addr);		
		$("#viewLoading").show().fadeIn("500"); 
		
		f = document.myPageForm;
		f.action = 'modifyProAction.action';
		f.submit();

/*
		$.ajax(
		{
			url      : "/mypage/pj_7003_ok.jsp",
			type     : "POST",
			data     : $("#myPageForm").serialize(),
			dataType : "html", 
			success  : function(data)
			{
 				if( trim(data) == "ok" )
 				{
 					alertFrame.find("#alertText p").remove();
 					alertFrame.find("#alertText").append("<p>개인정보가 수정 되었습니다.</p>"); 
 					popAlert(alertFrame);
 					alertFrame.find(".alertBtn").focus();
 				}else if( trim(data) == "false" ){
 					alertFrame.find("#alertText p").remove();
 					alertFrame.find("#alertText").append("<p>등록 된 비밀번호와 일치하지 않습니다. <br>비밀번호를 확인해 주세요.</p>"); 
 					popAlert(alertFrame);
 					alertFrame.find(".alertBtn").focus();
 				}
 				else
 				{
 					alertFrame.find("#alertText p").remove();
 					alertFrame.find("#alertText").append("<p>개인정보 수정에 실패했습니다.<br>다시 확인해 주세요.</p>"); 
 					popAlert(alertFrame);
 					alertFrame.find(".alertBtn").focus();
 				}
		        autoFocus = $("#pass");
			}
		});

		$("#pass").val("");
        autoFocus = $("#pass");
*/        
	}	
	
	//개인정보 폼 업데이트 
	function fn_Update()
	{
		if( $("#pass").val() == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>비밀번호를 입력해 주세요.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			autoFocus = $("#pass");
			return;
		}
		if( !isABCNum($("#pass").val()) )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>비밀번호는 영문 또는 숫자만 가능합니다.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			autoFocus = $("#pass");
			return;
		}
		if( $("#pass").val().length < 4 || $("#pass").val().length > 20 )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>비밀번호는 4자 이상, 20자 이내로 입력하셔야 합니다.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			autoFocus = $("#pass");
			return;
		}
 		
 		//20140212 
 		//비밀번호 입력 확인은 비밀번호 변경 시에만 입력하는 것으로 수정
 		//비밀번호 변경 팝업에서 새 비밀번호 확인 입력


/*    // DB에서 비밀번호 확인으로 수정(2014-02-17)
		if( $("#pass").val() != $("#passWord").val() )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>등록 된 비밀번호와 일치하지 않습니다. <br>비밀번호를 확인해 주세요.</p>"); 
			popAlert(alertFrame);
			
			$("#pass").val("");
			$("#passConf").val("");
			$("#pass").focus();
			return;
		}	 
*/	

		if( $("#sex").val() == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>회원님의 성별을 선택해 주세요.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			autoFocus = $("#sex");
			return;
		}
		
		if( $("#mobile1").val() == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>휴대폰 번호를 입력해 주세요.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			autoFocus = $("#mobile1");
			return;
		}
		
		if ( $("#mobile2").val() == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>휴대폰 번호를 입력해 주세요.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			autoFocus = $("#mobile2");
			return;
		}
		
		if ( $("#mobile3").val() == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>휴대폰 번호를 입력해 주세요.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			autoFocus = $("#mobile3");
			return;
		}
		
 		if ( $("#email").val() == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>이메일 주소을 입력해 주세요.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
			autoFocus = $("#email");
			return;
		}
		
		if ( $("#addr1").val() == "" || $("#addr2").val() == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>주소를 입력해 주세요.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
		    autoFocus = $("#addr2");
			return;
		}
		 
		//disabled 된 경우 폼 전송이 누락되어 빈값이 들어가므로 잠시 해제
		document.getElementById("birth1").disabled=false;
		document.getElementById("birth2").disabled=false;
		document.getElementById("birth3").disabled=false;
		
		$.ajax(
		{
			url      : "/mypage/pj_7003_ok.jsp",
			type     : "POST",
			data     : $("#myPageForm").serialize(),
			dataType : "html", 
			success  : function(data)
			{
 				if( trim(data) == "ok" )
 				{
 					alertFrame.find("#alertText p").remove();
 					alertFrame.find("#alertText").append("<p>개인정보가 수정 되었습니다.</p>"); 
 					popAlert(alertFrame);
 					alertFrame.find(".alertBtn").focus();
 				}else if( trim(data) == "false" ){
 					alertFrame.find("#alertText p").remove();
 					alertFrame.find("#alertText").append("<p>등록 된 비밀번호와 일치하지 않습니다. <br>비밀번호를 확인해 주세요.</p>"); 
 					popAlert(alertFrame);
 					alertFrame.find(".alertBtn").focus();
 				}
 				else
 				{
 					alertFrame.find("#alertText p").remove();
 					alertFrame.find("#alertText").append("<p>개인정보 수정에 실패했습니다.<br>다시 확인해 주세요.</p>"); 
 					popAlert(alertFrame);
 					alertFrame.find(".alertBtn").focus();
 				}
		        autoFocus = $("#pass");
			}
		});
		//event.preventDefault();

		//폼 전송 후 생년월일 다시 disabled
		document.getElementById("birth1").disabled=true;
		document.getElementById("birth2").disabled=true;
		document.getElementById("birth3").disabled=true;
		$("#pass").val("");
        autoFocus = $("#pass");
	}
	
	function userOut()
	{
		if( confirm("정말로 탈퇴 하시겠습니까?") == true )
		{
			$("#viewLoading").show().fadeIn("500"); 
			document.getElementById("ifr_hidden").src = "userOutAction.action";
		}
	}
	
	//회원 탈퇴 검사
	function fn_userOut()
	{
		
		if( confirm("정말로 탈퇴 하시겠습니까?") == true )
		{
			$.ajax(
			{
				url      : "/mypage/pj_7003_out.jsp",
				type     : "POST",
				data     : $("#myPageForm").serialize(),
				dataType : "html", 
				success  : function(data)
				{
	 				if( trim(data) == "out" )
	 				{
	 					alertFrame.find("#alertText p").remove();
	 					alertFrame.find("#alertText").append("<p>정상적으로 탈퇴되었습니다.</p>"); 
	 					popAlert(alertFrame);
	 					location.href = "/index.jsp";
	 				}
	 				else
	 				{
	 					alertFrame.find("#alertText p").remove();
	 					alertFrame.find("#alertText").append("<p>오류로 인하여 정상적으로 탈퇴되지 않았습니다.<br>다시 시도해 주세요.</p>"); 
	 					popAlert(alertFrame);
	 					alertFrame.find(".alertBtn").focus();

	 				}
				}
			});
		}
		
	}
	

	function fnOnloadWindow()
	{	
		var myPageForm = document.myPageForm;
		
		if( "" != "1985" )
		{
			$("#birth1").val("1985");
			$("#birth2").val("01");
			$("#birth3").val("27");
		}
		
		fnRadioClick('sun', "Y");
		if( "Y" == "Y" )
		{
			$("#lunar").attr("checked", "checked");
		}
		
		$("#sex").val("");

		fnRadioClick('sms', '${data.sms}');
		fnRadioClick('email', '${data.sendmail}');
	}
	
	function ChangePassword()
	{
		$(this).focus();	//변경팝업 확인버튼에 포커스
 		if( $("#origin_password").val() == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>변경 전 비밀번호를 입력해 주세요.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
	        autoFocus = $("#origin_password");
			return;
		}
 		if( $("#new_password").val() == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>새로운 비밀번호를 입력해 주세요.</p>"); 
			popAlert(alertFrame);
			
			alertFrame.find(".alertBtn").focus();
	        autoFocus = $("#new_password");
			return;
		}
 		if( $("#new_password_conf").val() == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>새로운 비밀번호 확인란을 입력해 주세요.</p>"); 
			popAlert(alertFrame);
		
			alertFrame.find(".alertBtn").focus();
	        autoFocus = $("#new_password_conf");
			return;
		}
		if( !isABCNum($("#new_password").val()) )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>비밀번호는 영문 또는 숫자만 가능합니다.</p>"); 
			popAlert(alertFrame);

			alertFrame.find(".alertBtn").focus();
	        autoFocus = $("#new_password");
			return;
		}
		if( $("#new_password").val().length < 4 || $("#new_password").val().length > 20 )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>비밀번호는 4자 이상, 20자 이내로 입력하셔야 합니다.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
	        autoFocus = $("#new_password");
			return;
		}
		if( $("#new_password_conf").val() != $("#new_password").val() )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>입력하신 비밀번호가 일치하지 않습니다. <br>비밀번호를 확인해 주세요.</p>"); 
			popAlert(alertFrame);
			$("#new_password_conf").val("");
			alertFrame.find(".alertBtn").focus();
	        autoFocus = $("#new_password_conf");
			return;
		}
		$("#viewLoading").show().fadeIn("500"); 
		document.getElementById("ifr_hidden").src = "changePasswdProAction.action?flag=confPwd&oPwd="+$("#origin_password").val()+"&nPwd="+$("#new_password").val();
	}
	
	/* 비밀번호 변경 */
	function fnChangePasswd(){
		$(this).focus();	//변경팝업 확인버튼에 포커스
 		if( $("#origin_password").val() == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>변경 전 비밀번호를 입력해 주세요.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
	        autoFocus = $("#origin_password");
			return;
		}
 		if( $("#new_password").val() == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>새로운 비밀번호를 입력해 주세요.</p>"); 
			popAlert(alertFrame);
			
			alertFrame.find(".alertBtn").focus();
	        autoFocus = $("#new_password");
			return;
		}
 		if( $("#new_password_conf").val() == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>새로운 비밀번호 확인란을 입력해 주세요.</p>"); 
			popAlert(alertFrame);
		
			alertFrame.find(".alertBtn").focus();
	        autoFocus = $("#new_password_conf");
			return;
		}
		if( !isABCNum($("#new_password").val()) )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>비밀번호는 영문 또는 숫자만 가능합니다.</p>"); 
			popAlert(alertFrame);

			alertFrame.find(".alertBtn").focus();
	        autoFocus = $("#new_password");
			return;
		}
		if( $("#new_password").val().length < 4 || $("#new_password").val().length > 20 )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>비밀번호는 4자 이상, 20자 이내로 입력하셔야 합니다.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus();
	        autoFocus = $("#new_password");
			return;
		}
		if( $("#new_password_conf").val() != $("#new_password").val() )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>입력하신 비밀번호가 일치하지 않습니다. <br>비밀번호를 확인해 주세요.</p>"); 
			popAlert(alertFrame);
			$("#new_password_conf").val("");
			alertFrame.find(".alertBtn").focus();
	        autoFocus = $("#new_password_conf");
			return;
		}	
		
		
		//비밀번호 변경
		$.ajax(
				{
					url        : "/mypage/pj_7003_ok.jsp",
					type     : "POST",
					data     : "flag=confPwd&oPwd="+$("#origin_password").val()+"&nPwd="+$("#new_password").val()+"&userId="+$("#userId").val(),
					dataType : "html",					
					success  : function(data)
					{
		 				if( trim(data) == "ok" )
		 				{
		 					alertFrame.find("#alertText p").remove();
		 					alertFrame.find("#alertText").append("<p>비밀번호가 정상적으로 변경 되었습니다.</p>"); 
		 					popAlert(alertFrame);
		 					alertFrame.find(".alertBtn").focus();
		 			        autoFocus = $("#pass");
		 					
		 					$("#origin_password").val("");
		 					$("#new_password").val("");
		 					$("#new_password_conf").val("");
		 					del_pop('change_pw',true, $(this));
		 				}
		 				else if( trim(data) == "false" )
		 				{
		 					alertFrame.find("#alertText p").remove();
		 					alertFrame.find("#alertText").append("<p>변경 전 비밀번호를 확인 해주세요.</p>"); 
		 					popAlert(alertFrame);

		 					alertFrame.find(".alertBtn").focus();
		 			        autoFocus = $("#origin_password");
		 				}
		 				else
		 				{
		 					alertFrame.find("#alertText p").remove();
		 					alertFrame.find("#alertText").append("<p>비밀번호 변경에 실패 했습니다.<br>다시 시도해 주세요.</p>"); 
		 					popAlert(alertFrame);

		 					alertFrame.find(".alertBtn").focus();
		 			        autoFocus = $("#origin_password");
		 				}
					}
				});
		
	}
	
	//비밀번호 변경 취소
	function fnCancelChange()
	{
		del_pop('change_pw',true, $(this));
		$('#origin_password').val('');
		$('#new_password').val('');
		$('#new_password_conf').val('');
        autoFocus = $("#pass");
	}
	
	function init()
	{
		var addr = "${data.addr}".split(",");
		var zipcode = addr[0];
		var zip1 = zipcode.split("-")[0];
		var zip2 = zipcode.split("-")[1];
		$("#addr1").val(addr[1]);
		$("#addr2").val(addr[2]);
		$("#addrZipCode").val(zip1+zip2);
		$("#zip1").val(zip1);
		$("#zip2").val(zip2);
	}
</script>

<script for="window" event="onload">
	setTimeout("fnOnloadWindow()",100);
	init();
</script>
	
<form id="myPageForm" name="myPageForm" method="post" action="" target=ifr_hidden>
	<input type="hidden" id="userId"   name="userId"   value="">        <!-- 아이디       -->
	<input type="hidden" id="userNo"   name="userNo"   value="">        <!-- 고객번호     -->

	<input type="hidden" id="sms"    name="sms"    value="">                   <!-- SMS 수신여부 -->
	<input type="hidden" id="sendmail"   name="sendmail"   value="">                   <!-- 메일수신여부 -->
   	<input type="hidden" id="phone"  name="phone" value="">  
	<input type="hidden" id="mobile"  name="mobile" value="">
	<input type="hidden" id="addr"  name="addr" value="">
    	
	<div id="form_section" class="txt_left">
		<div id="join_form">
	  		<h3 class="title text_hidden">회원가입양식</h3>
    		<div class="form">
      			<p>
          			<span class="tit"><img src="../assets/img/forms/label_name.gif" alt="이름" /></span>
          			<span>${data.name}</span>
        		</p>
        		<p>
          			<span class="tit"><img src="../assets/img/forms/login_id.gif" alt="아이디" /></span>
          			<span>${memId}</span>
        		</p> 
        		<p>
          			<label class="tit" for="pw"><img src="../assets/img/forms/login_pw.gif" alt="비밀번호" /></label>
          			<input type="password" id="pw" name="pw" class="base" value="" /> 
        			<span class="btn_h23 red"><button type="button" onclick="popup('#change_pw'); $('#change_pw').find('.alertBtn').focus();">비밀번호 변경</button></span>
        			<span class="text_s11">*영문, 숫자만 가능, 4~20 글자 이내</span>
				</p>
<!--         		<p>
          			<label class="tit" for="passConf"><img src="assets/img/forms/label_passConf.gif" alt="비밀번호확인" /></label>
          			<input type="password" id="passConf" name="passConf" class="base" value="" />
        		</p> -->
        		<p>
	        		<c:set var="phone" value="${fn:split(data.phone, '-')}"/>
	        		<label class="tit" for="phone1"><img src="../assets/img/forms/label_phone.gif" alt="전화번호" /></label>
          			<input type="text" id="phone1" name="phone1" class="w50" value='${phone[0]}' title="지역번호입력" maxlength="4"/> - 
          			<input type="text" id="phone2" name="phone2" class="w50" value='${phone[1]}' title="전화번호 앞자리 입력" maxlength="4"/> - 
          			<input type="text" id="phone3" name="phone3" class="w50" value='${phone[2]}' title="전화번호 뒷자리 입력" maxlength="4"/>
        		</p>
        		<p>
        		    <c:set var="mobile" value="${fn:split(data.mobile, '-')}"/>
          			<label class="tit" for="mobile1"><img src="../assets/img/forms/login_mobile.gif" alt="핸드폰번호" /></label>
          			<input type="text" id="mobile1" name="mobile1" class="w50" value='${mobile[0]}' title="지역번호입력" maxlength="3" /> - 
          			<input type="text" id="mobile2" name="mobile2" class="w50" value='${mobile[1]}' title="전화번호 앞자리 입력" maxlength="4" /> - 
          			<input type="text" id="mobile3" name="mobile3" class="w50" value='${mobile[2]}' title="전화번호 뒷자리 입력" maxlength="4" />
        		</p>
        		<p style="padding:0 0 0 120px;">
          			<span style="font-weight:bold; background:url(../assets/img/icon/icon_gray1.gif) no-repeat 0 2px; padding-left:10px;" >SMS수신동의 : </span>
          			<label for="sms_yes" class="text_s11">예</label>
          			<input type="radio" id="sms_yes" name="sms_yes" value="Y" onclick="fnRadioClick('sms', this.value)" checked/>
          			<label for="sms_no" class="text_s11">아니오</label>
          			<input type="radio" id="sms_no" name="sms_no" value="N" onclick="fnRadioClick('sms', this.value)" />
          			<br/>
          			<span class="text_s11">수신 동의하시면, 이벤트 및 할인쿠폰에 대한 파파존스 서비스를 받으실 수 있습니다.</span>
        		</p>
        	
        		<p>
          			<label class="tit" for="email"><img src="../assets/img/forms/label_email.gif" alt="이메일" /></label>
          			<input type="text" id="email" name="email" value='${data.email}' class="w200"/>
        		</p>
        		<p>
          			<span class="tit"><img src="../assets/img/forms/label_sendMail.gif" alt="이메일수신여부" /></span>
          			<span class="text_s11">파파존스 정기 메일을 받아보시겠습니까?</span>
          			<label for="sendMail_yes">예</label>
          			<input type="radio" id="sendMail_yes" name="sendMail_yes" value="Y" onclick="fnRadioClick('email', this.value)" checked/>
          			<label for="sendMail_no">아니오</label>
          			<input type="radio" id="sendMail_no" name="sendMail_no" value="N" onclick="fnRadioClick('email', this.value)" />
        		</p>
        		<p style="border-bottom:none">
          			<span class="tit"><img src="../assets/img/forms/label_address.gif" alt="주소" /></span>
          			<label for="zip1" class="hidden">우편번호</label>
          			<input type="text" id="zip1" name="zip1" class="w50" readonly="readonly" value=""/> - 
          			<input type="text" id="zip2" name="zip2" class="w50" readonly="readonly" value=""/>
            		<span class="btn_h23 gray"><button type="button"  onclick='popup("#search_addr"); $("#search_addr").focus()'>주소검색</button></span>
       			</p>
       			<p style="padding:0 0 10px 120px; border-bottom:none;">
          			<label for="addr1" class="hidden" >주소</label>
          			<input type="text" id="addr1" name="addr1" class="w400" readonly="readonly" value=""/>
   					<input type="hidden" id="addrZipCode"    name="addrZipCode"    value="" /> 
   					<input type="hidden" id="addrSiName"     name="addrSiName"     value="" /> 
   					<input type="hidden" id="addrGuName"     name="addrGuName"     value="" /> 
   					<input type="hidden" id="addrDongName"   name="addrDongName"   value="" /> 
   					<input type="hidden" id="addrAddressId"  name="addrAddressId"  value="" /> 
   					<input type="hidden" id="addrStoreCode"  name="addrStoreCode"  value="" /> 
   					<input type="hidden" id="addrSectorCode" name="addrSectorCode" value="" /> 
       			</p>
       			<p style="padding:0 0 10px 120px;">
          			<label for="addr2" class="hidden">상세주소입력</label>
          			<input type="text" id="addr2" name="addr2" class="w400" value=""/>
        		</p>
        		<p>
        			<span class="tit"><img src="../assets/img/forms/label_quit.gif" alt="회원탈퇴" /></span>
         			<span>파파존스 홈페이지 회원탈퇴를 하시겠습니까?</span>
          			<span class="btn_h23 green"><button type="button" onclick="userOut();">탈퇴</button></span>
        		</p>
      		</div>
  		</div> <!-- //join_form -->
  		
  		<div class="btn" style="text-align:center; margin:10px 0;">
  			<button type="submit" onclick="modifyInfo();return false;" class="listBtn_blank green">수정</button>
  		</div>
	</div>
	<!-- //join_form_sectio -->

<!-- //////////// 주소검색 /////////////// -->
	<div id="search_addr" class="pop_box3" style="position:absolute; top:0px; left:0px; display:none;">
		<p class="top"></p><p class="bottom"></p>
		<p class="cont">
  		<h3 class="title" style="width:50%; float:left; padding:5px;"><img src="../assets/img/forms/title_searchAddr.gif" alt="주소검색" /></h3>
		<span class="btn_h23 gray" style="float:right;"><button type="button" onclick="del_pop('search_addr',true, $(this))">취소</button></span> 
    	<div>

 			<iframe src="addressAction.action?flag=mypage" width="370px" height="198px;" frameborder="0" >아이프레임이지원되는 브라우저에서 확인할수있습니다.</iframe>
    	</div>
		</p>
	</div>
	
	<!-- //////////// 20140211 비밀번호 변경 추가 /////////////// -->
	<div id="change_pw" class="pop_box3" style="position:absolute; top:0px; left:0px; display:none;">
		<div class="cont">
	  		<h3 class="title" style="width:50%; float:left; padding:10px 5px;"><img src="../assets/img/forms/title_change_pw.gif" alt="비밀번호 변경" /></h3>
			<span class="btn_h23 gray" style="float:right;"><button type="button" onclick="fnCancelChange();">취소</button></span> 
    	</div>
    	<p style="float:left; padding:5px;">
   			<span class="text_s11">*비밀번호는 영문 또는 숫자로 4~20 글자 이내로만 입력 가능합니다.</span><br><br>
   			<label class="tit" for="origin_password"><img src="../assets/img/forms/label_org_password.gif" alt="변경 전 비밀번호" /></label>
   			<input type="password" id="origin_password" name="origin_password" class="base" value="" />
		</p>
		<br>
		<p style="float:left; padding:5px;">
   			<label class="tit" for="new_password"><img src="../assets/img/forms/label_new_password.gif" alt="새로운 비밀번호" /></label>
   			<input type="password" id="new_password" name="new_password" class="base" value="" /> 
		</p>
		<br>
		<p style="float:left; padding:5px;">
   			<label class="tit" for="new_password_conf"><img src="../assets/img/forms/label_new_password_conf.gif" alt="새로운 비밀번호 확인" /></label>
   			<input type="password" id="new_password_conf" name="new_password_conf" class="base" value="" /> 
		</p>
		<br>
    	<p class="button" style="clear:both; text-align:center; padding-top:20px;"><button class="alertBtn gray" type="button" onclick="ChangePassword();" >확 인</button></p> 
	</div>
</form>

<!--//////////// 20131212 알럿 변경 ////////////-->
<div class="notice" id="notice_7003" style="display:none; width:340px; height:auto; min-height:140px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header">
	    <div class="left" style="float:left; width:6px;  background:url(../assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:328px; height:40px; background:url(../assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>알림!!</h2> 
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(../assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div id="alertText" class="text_body" style="width:340px; height:auto; min-height:90px; line-height: 30px; background:#fff; border: 0px none; padding:8px 0px;">  
    	<br><p></p> 
    </div>  
  	<div class="footer" style="position: absolute; height:32px; background:#fff; " >
		<div class="button" style="bottom:20px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_7003');fnAutoFocus();">확 인</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(../assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:328px; height:8px; background:url(../assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(../assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div>
<iframe id="ifr_hidden" name="ifr_hidden"  src="" style="width:0;height:0;visibility: hidden;">