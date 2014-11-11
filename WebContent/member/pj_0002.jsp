<script type="text/javascript">
	snb(8,2);
	head_title("FIND ID/PW");
	$('#viewLoading').fadeOut();

	var alertFrame = $("#notice_0002");
	
	if( "" == "ok" )
	{
		alertFrame.find("#alertText p").remove();
		alertFrame.find("#alertText").append("<p>고객님에게 이메일이 발송 되었습니다.</p>"); 
		popAlert(alertFrame);
		alertFrame.find(".alertBtn").focus(); 
	}
	else if( "" == "no" )
	{
		alertFrame.find("#alertText p").remove();
		alertFrame.find("#alertText").append("<p>회원정보를 찾을 수 없습니다..</p>"); 
		popAlert(alertFrame);
		alertFrame.find(".alertBtn").focus(); 
	}

	//
	function fn_MemSearch(val)
	{ 
		
		if( document.f1.name.value == "" )
		{ 
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>가입자 이름을 입력해 주세요.</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus(); 
			return;
		}
		
		if( document.f1.custMobile1.value == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>휴대폰 번호를 입력해 주세요.</p>"); 
			popAlert(alertFrame)
			alertFrame.find(".alertBtn").focus(); 
			return;
		}
	
		if( document.f1.custMobile2.value == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>휴대폰 번호를 입력해 주세요</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus(); 
			return;
		}
		
		if( document.f1.custMobile3.value == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>휴대폰 번호를 입력해 주세요</p>"); 
			popAlert(alertFrame);

			alertFrame.find(".alertBtn").focus(); 
			return;
		}
		
		if( document.f1.email.value == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>이메일 주소를 입력해 주세요</p>"); 
			popAlert(alertFrame);
			alertFrame.find(".alertBtn").focus(); 
			return;
		}
		
		var mobile = $("#custMobile1").attr("value")+'-'+$("#custMobile2").attr("value")+'-'+$("#custMobile3").attr("value");
		$("#mobile").val(mobile);
		$('#viewLoading').show().fadeIn('fast');
		
		document.f1.action = "confirmInfoProAction.action?val="+val;
		document.f1.target = "ifr_hidden";
		document.f1.submit();
/*
		// 아이디 찾기
		if( val == "1" )
		{
			$.ajax(
			{
				url      : "/member/pj_0002_searchId.jsp",
				type     : "POST",
				data     : $("#f1").serialize(),
				dataType : "html",  
				success  : function(data)
			    {
				    if( trim(data) != "" )
					{
					    alertFrame.find("#alertText p").remove();
						alertFrame.find("#alertText").append("<p>고객님의 ID는 ["+ trim(data) + "] 입니다.</p>"); 
						popAlert(alertFrame);
						alertFrame.find(".alertBtn").focus(); 
						return;
					}
					else if( trim(data) == "" )
					{
					    alertFrame.find("#alertText p").remove();
						alertFrame.find("#alertText").append("<p>입력하신 정보가 바르지 않습니다.<br>정보를 확인하신 후 다시 입력해 주세요.</p>"); 
						popAlert(alertFrame);

						alertFrame.find(".alertBtn").focus(); 
						return;
					}
				}
			});
		}
		// 비밀번호 찾기
		else if( val == "2" )
		{
//			document.f1.action = "</%=root%>/member/pj_0002_ok.jsp";
//			document.f1.submit();
			$.ajax(
			{
				url      : "/member/pj_0002_ok.jsp",
				type     : "POST",
				data     : $("#f1").serialize(),
				dataType : "html",  
				success  : function(data)
			    {
			    	if( trim(data) == "ok" )
			    	{
			    		alertFrame.find("#alertText p").remove();
			    		alertFrame.find("#alertText").append("<p>고객님에게 이메일이 발송 되었습니다.</p>"); 
			    		popAlert(alertFrame);
						alertFrame.find(".alertBtn").focus(); 
						return;
			    	}
			    	else if( trim(data) == "no" )
			    	{
			    		alertFrame.find("#alertText p").remove();
			    		alertFrame.find("#alertText").append("<p>회원정보를 찾을 수 없습니다..</p>"); 
			    		popAlert(alertFrame);
						alertFrame.find(".alertBtn").focus(); 
						return;
			    	}
				}
			});
		}
		*/
	}
	
	//커서 자동으로 이동
	function autoFocus()
	{
		var mobile1 = document.f1.custMobile1.value; 
		var mobile2 = document.f1.custMobile2.value;
		var mobile3 = document.f1.custMobile3.value;
		if(mobile1.length >= 3) {
			document.f1.custMobile2.focus();
		}
		if(mobile2.length >= 4) {
			document.f1.custMobile3.focus();
		}
		if(mobile3.length >= 4) {
			document.f1.email.focus();
		}
	}
</script>

<script for=window event=onload>
	document.f1.name.focus();
</script>

<!-- find_idPass_section -->
<div id="find_idPass_section">
  	<!-- find_idPass--> 
  	<div id="find_idPass">
    	<h3 class="title text_hidden">아이디패스워드찾기:파파존스 웹사이트에 가입 당시 기재하셨던 정보를 기준으로 조회가 가능합니다.회원가입시 등록하신 정보를 정확히 입력해주세요. 이메일로 아이디와 비밀번호를 전송해드립니다.</h3>
    	<form name="f1" id="f1" method="post" onclick="return false;"><!-- event.preventDefault();-->
    		<input type="hidden" id="mobile" name="mobile" value="" />
      		<fieldset>
        		<legend class="hidden">아이디패스워드찾기 폼</legend>
        		<div class="mem_form">
          			<p class="login_box">
            			<label for="name"><img src="../assets/img/forms/label_memName.gif" alt="가입자이름"/></label>
            			<input type="text" id="name" name="name" value=""/>
            			<label for="custMobile1"><img src="../assets/img/forms/login_mobile.gif" alt="핸드폰번호"/></label>
<!-- 
         				<input type="text" id="custMobile1" name="custMobile1" value="</%=custMobile1%>" title="통신사번호입력" maxlength="3" onkeyup="autoFocus();"/> - 
            			<input type="text" id="custMobile2" name="custMobile2" value="</%=custMobile2%>"title="핸드폰 앞번호 입력" maxlength="4" onkeyup="autoFocus();"/> - 
            			<input type="text" id="custMobile3" name="custMobile3" value="</%=custMobile3%>"title="핸드폰 뒷번호 입력" maxlength="4" onkeyup="autoFocus();"/>
-->            			
         				<input type="text" id="custMobile1" name="custMobile1" value="" title="통신사번호입력"     maxlength="3" onkeyup=""/> - 
            			<input type="text" id="custMobile2" name="custMobile2" value="" title="핸드폰 앞번호 입력" maxlength="4" onkeyup=""/> - 
            			<input type="text" id="custMobile3" name="custMobile3" value="" title="핸드폰 뒷번호 입력" maxlength="4" onkeyup=""/>
            			<label for="email"><img src="../assets/img/forms/label_email.gif" alt="이메일"/></label>
            			<input type="text" id="email" name="email" value=""/>
          			</p>
        		</div>
      		</fieldset>
      		
      		<div class="btn_box">
				<input type="image" src="../assets/img/forms/login_btn_search_id.gif" alt="아이디찾기" style="margin-right:-3px;" onclick="fn_MemSearch('1')"/>
				<input type="image" src="../assets/img/forms/login_btn_search_pw.gif" alt="패스워드찾기"  onclick="fn_MemSearch('2')"/>
			</div>
    	</form>
  	</div>
  	<!--// find_idPass--> 
</div>
<!--// find_idPass_section -->

<!--20131212  알럿 변경-->
<div class="notice" id="notice_0002" style="display:none; width:340px; height:auto; min-height:140px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
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
		<div class="button" style="bottom:20px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_0002');">확 인</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(../assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:328px; height:8px; background:url(../assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(../assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div>	
<iframe name="ifr_hidden"  src="" style="width:0;height:0;visibility: hidden;">