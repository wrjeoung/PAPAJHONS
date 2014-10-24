<script type="text/javascript">
	
	snb(8,3);
	head_title("JOIN-US"); 
	$("#content_area").css({"width":"800px", "background":"#fff", "padding":"20px 10px", "margin":"0 auto"}); 
	
	
	$(document).ready(function(){$('#viewLoading').fadeOut(500);});
	
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
     				event.preventDefault();		//for i
    			else
     				event.returnValue = false;		//for 표준 브라우저(IE9, 파이어폭스, 오페라, 사파리, 크롬)
   			}
		}
	});

	var alertFrame = $("#notice_0005");
	// 입력항목 Check	

	
	function fnAlert(msg)
	{
		alertFrame.find("#alertText p").remove();
		alertFrame.find("#alertText").append(msg); 
		popAlert(alertFrame); 		
	}

	
	function fnMember()
	{
		
		if( document.f1.join_id_chk.value == "N" )
		{
			fnAlert("<p>아이디 중복 체크를 해 주세요.</p>");
			return;
		}
		
		if( document.f1.join_id.value == "" )
		{
			fnAlert("<p>아이디를 입력해 주세요.</p>"); 
			document.f1.join_id.focus();
			return;
		}
		
		if( document.f1.join_pass.value == "" )
		{
			fnAlert("<p>비밀번호를 입력해 주세요.</p>"); 
			document.f1.join_pass.focus();
			return;
		}
		if( !isABCNum(document.f1.join_pass.value) )
		{
			fnAlert("<p>비밀번호는 영문 또는 숫자만 가능합니다.</p>"); 
			document.f1.join_pass.focus();
			return;
		}
		if( document.f1.join_pass.value.length < 4 || document.f1.join_pass.value.length > 20 )
		{
			fnAlert("<p>비밀번호는 4자 이상, 20자 이내로 입력하셔야 합니다.</p>"); 
			document.f1.join_pass.focus();
			return;
		}
		if( document.f1.join_passConf.value == "" )
		{
			fnAlert("<p>비밀번호 확인란을 입력해 주세요.</p>"); 
			document.f1.join_passConf.focus();
			return;
		}
		if( !isABCNum(document.f1.join_passConf.value) )
		{
			fnAlert("<p>비밀번호는 영문 또는 숫자만 가능합니다.</p>"); 
			document.f1.join_passConf.focus();
			return;
		}
		if( document.f1.join_passConf.value.length < 4 || document.f1.join_passConf.value.length > 20 )
		{
			fnAlert("<p>비밀번호는 4자 이상, 20자 이내로 입력하셔야 합니다.</p>"); 
			document.f1.join_passConf.focus();
			return;
		}
		if( document.f1.join_pass.value != document.f1.join_passConf.value )
		{
			fnAlert("<p>입력하신 비밀번호가 일치하지 않습니다. <br>비밀번호를 확인해 주세요.</p>"); 
			document.f1.join_passConf.value = "";
			document.f1.join_passConf.focus();
			return;
		}
		
		if( document.f1.join_sex.value == "" )
		{
			fnAlert("<p>가입자분의 성별을 선택해 주세요.</p>"); 
			document.f1.join_sex.focus();
			return;
		}
		
		if( document.f1.join_mobile1.value == "" )
		{
			fnAlert("<p>휴대폰 번호를 입력해 주세요.</p>"); 
			document.f1.join_mobile1.focus();
			return;
		}
		
		if( document.f1.join_mobile2.value == "" )
		{
			fnAlert("<p>휴대폰 번호를 입력해 주세요.</p>"); 
			document.f1.join_mobile2.focus();
			return;
		}
		
		if( document.f1.join_mobile3.value == "" )
		{
			fnAlert("<p>휴대폰 번호를 입력해 주세요.</p>"); 
			document.f1.join_mobile3.focus();
			return;
		}
		
		if( document.f1.addr1.value == "" )
		{
			fnAlert("<p>주소를 입력해 주세요.</p>"); 
			return;
		}
		//전화번호 숫자입력 체크하기!!
		
//		$('#viewLoading').fadeIn(500);
//		document.f1.action = "member/pj_0005_ok.jsp";
//		document.f1.submit();
		
		$.ajax(
		{
			url      : "/member/pj_0005_ok.jsp",
			type     : "post",
			data     : $("#f1").serialize(),
			dataType : "html",
			beforeSend: function() 
			{              
				//통신을 시작할때 처리             
				$('#viewLoading').show().fadeIn('fast');          
			},
	   		complete: function() 
			{             
				//통신이 완료된 후 처리              
				$('#viewLoading').fadeOut();  
			},
			success  : function(data)
			{
				var msg = trim(data);
//				alert(msg);
				if( msg == "no" )
				{
					alert("잘못된 정보로 인해 미가입 되었습니다.\n다시 가입해 주세요."); 
					url = '/cont.jsp?menuGb=member&menuId=pj_0005&msg='+msg;
				}
				else if( msg == "ok" )
				{
					
					url = "/cont.jsp?menuGb=member&menuId=pj_0006";
				}
				else if( msg == "dup" )
				{
					alert("이미 회원 가입이 되어 있습니다.");
					url = '/cont.jsp?menuGb=member&menuId=pj_0005&msg='+msg;	
				}
				
//				alert(url);
				location.href = url;
			},	
			error : function( jqXHR, textStatus, errorThrown )
       		{
					
       		}
		});	
	}


	//
	function fnRadioClick(gb, val)
	{
		
		if( gb == "sms" )
		{
			document.all.join_sms.value = val;
		}
		else if( gb == "sun" ) 
		{
			document.all.calendar_type.value = val;
		}
		else if( gb == "meil" ) 
		{
			document.all.join_send_mail.value = val;
		}
		
	}

	//
	function fnIdChk()
	{
		document.f1.join_id_chk.value = "N";
	}

	//
	function fn_cancel()
	{
		document.f1.action = "/index.jsp";
		document.f1.submit();
	}
</script>

<div id="join_setp" style="background:url(../assets/img/forms/join_setp3.png) no-repeat; width:341px; height:53px; position:relative;left:-20px;"></div>
<!-- join_form_sectio -->
<div id="join_form_section">
  	<!-- join_form -->
  	<div id="join_form">
  		<h3 class="title text_hidden">회원가입양식</h3>
    	<form name="f1" id="f1" method="post">
    		<input type="hidden" id="calendar_type"  name="calendar_type"  value="Y">                <!-- 양력음력구분 -->
    		<input type="hidden" id="join_sms"       name="join_sms"       value="Y">                <!-- SMS 수신여부 -->
    		<input type="hidden" id="join_send_mail" name="join_send_mail" value="Y">                <!-- 메일수신여부 -->
    		<input type="hidden" id="ci"             name="ci"             value="0SA+3KjmSrdvgXo3RO2bQ/uuSMh9ESraUKsepl0KTOa4tkqd0zeVItxod4a76y1qJq++BjE8O2OkzMWGei2c3Q=="/>  <!-- 휴대폰CI     -->
    		<input type="hidden" id="di"             name="di"             value="MC0GCCqGSIb3DQIJAyEA6gNdv5BC+GOUjH7Wnc+FZ0QsZ9o2yvAog8cal0ywZcY=" />  <!-- 휴대폰DI     -->
    	
    		<div class="form">
      			<p>
        			<label class="tit" for="join_name"><img src="../assets/img/forms/label_name.gif" alt="이름" /></label>
            		<input type="text" id="join_name" name="join_name" value="홍길동" class="base" readOnly />
        		</p>
        		<p>
        			<label class="tit" for="join_id"><img src="../assets/img/forms/login_id.gif" alt="아이디" /></label>
            		<input type="text" id="join_id" name="join_id" class="base" onkeydown="fnIdChk();" readOnly onclick='popup("#search_id"); $("#search_id").focus()'/>  
            		<span class="btn_h23 gray"><button type="button" onclick='popup("#search_id"); $("#search_id").focus()'>아이디 중복 체크</button></span> 
            		<span class="text_s11">*영문, 숫자만 가능, 4~20 글자 이내.</span>
            		<input type="hidden" id="join_id_chk" name="join_id_chk" value="N" />  
        		</p>
        		<p>
        			<label class="tit" for="join_pass"><img src="../assets/img/forms/login_pw.gif" alt="비밀번호" /></label>
            		<input type="password" id="join_pass" name="join_pass" class="base" maxlength="20" /> <span class="text_s11">*영문, 숫자만 가능, 4~20 글자 이내.</span>
        		</p>
        		<p>
        			<label class="tit" for="join_passConf"><img src="../assets/img/forms/label_passConf.gif" alt="비밀번호확인" /></label>
            		<input type="password" id="join_passConf" name="join_passConf" class="base" maxlength="20" />
        		</p>
        		<p>
        			<label class="tit" for="join_birthday1"><img src="../assets/img/forms/label_birthday.gif" alt="생년월일" /></label>
            		<select id="join_birthday1" name="join_birthday1" title="태어난 해 입력" ><option value='2000' selected='selected'>2000 년</option></select> 
            		<select id="join_birthday2" name="join_birthday2" title="태어난 월 입력" ><option value='12' selected='selected'>12 월</option></select> 
            		<select id="join_birthday3" name="join_birthday3" title="태어난 일 입력" ><option value='12' selected='selected'>12 일</option></select> 
            		(
            		<label for="sun">양력</label>
          			<input type="radio" id="sun" name="sun" onclick="fnRadioClick('sun', this.value)" value="Y" checked/>
            		<label for="lunar">음력</label>
            		<input type="radio" id="sun" name="sun" onclick="fnRadioClick('sun', this.value)" value="N"/>
            		)
            		&nbsp;
            		<select id="join_sex" name="join_sex" disabled>
          				<option value="">성별</option>
            			<option value="M" selected="selected" >남자</option>
            			<option value="F" >여자</option>
            		</select>
        		</p>
        		<p>
        			<label class="tit" for="join_phone1"><img src="../assets/img/forms/label_phone.gif" alt="전화번호" /></label>
            		<input type="text" id="join_phone1" name="join_phone1" class="w50" title="지역번호입력" maxlength="4"/> - 
            		<input type="text" id="join_phone2" name="join_phone2" class="w50" title="전화번호 앞자리 입력" maxlength="4"/> - 
            		<input type="text" id="join_phone3" name="join_phone3" class="w50" title="전화번호 뒷자리 입력" maxlength="4"/>
        		</p>
        		<p>
        			<label class="tit" for="join_mobile1"><img src="../assets/img/forms/login_mobile.gif" alt="핸드폰번호" /></label>
            		<input type="text" id="join_mobile1" name="join_mobile1" class="w50" title="지역번호입력" maxlength="3"/> - 
            		<input type="text" id="join_mobile2" name="join_mobile2" class="w50" title="전화번호 앞자리 입력" maxlength="4"/> - 
            		<input type="text" id="join_mobile3" name="join_mobile3" class="w50" title="전화번호 뒷자리 입력" maxlength="4"/>
        		</p>
        		<p style="padding:0 0 0 120px;">
            		<span style="font-weight:bold; background:url(/assets/img/icon/icon_gray1.gif) no-repeat 0 2px; padding-left:10px;" >SMS수신동의 : </span>
            		<label for="sms_yes" class="text_s11">예</label>
            		<input type="radio" id="sms" name="sms" value="Y" onclick="fnRadioClick('sms', this.value)" checked/>
            		<label for="sms_no" class="text_s11">아니오</label>
            		<input type="radio" id="sms" name="sms" value="N" onclick="fnRadioClick('sms', this.value)" />
            		<br>
            		<span class="text_s11">수신 동의하시면, 이벤트 및 할인쿠폰에 대한 파파존스 서비스를 받으실 수 있습니다.</span>
        		</p>
        		<p>
        			<label class="tit" for="join_email"><img src="../assets/img/forms/label_email.gif" alt="이메일" /></label>
            		<input type="text" id="join_email" name="join_email" class="w200"/>
        		</p>
        		<p>
        			<span class="tit"><img src="../assets/img/forms/label_sendMail.gif" alt="이메일수신여부" /></span>
            		<span class="text_s11">파파존스 정기 메일을 받아보시겠습니까?</span>
            		<label for="join_sendMail_yes">예</label>
            		<input type="radio" id="sendMail" name="join_sendMail" value="Y" onclick="fnRadioClick('meil', this.value)" checked/>
            		<label for="join_sendMail_no">아니오</label>
            		<input type="radio" id="sendMail" name="join_sendMail" value="N" onclick="fnRadioClick('meil', this.value)" />
        		</p>
        		<p style="border-bottom:none">
        			<span class="tit"><img src="../assets/img/forms/label_address.gif" alt="주소" /></span>
            		<label for="zip1" class="hidden">우편번호</label>
            		<input type="text" id="zip1" name="zip1" class="w50" readonly="readonly"/> - 
            		<input type="text" id="zip2" name="zip2" class="w50" readonly="readonly"/>
            		<!-- 
            		<span class="btn_h23 gray"><button type="button"  onclick='popup("#search_addr")'>우편번호검색</button></span>
            		-->
            		<span class="btn_h23 gray"><button type="button"  onclick='popup("#search_addr"); $("#search_id").focus()'>주소검색</button></span>
       			</p>
       			<p style="padding:0 0 10px 120px; border-bottom:none;">
            		<label for="join_address1" class="hidden" >주소</label>
            		<input type="text" id="addr1" name="addr1" class="w400" readonly="readonly"/>
   					<input type="hidden" id="addrZipCode"    name="addrZipCode"    value="" /> 
   					<input type="hidden" id="addrSiName"     name="addrSiName"     value="" /> 
   					<input type="hidden" id="addrGuName"     name="addrGuName"     value="" /> 
   					<input type="hidden" id="addrDongName"   name="addrDongName"   value="" /> 
   					<input type="hidden" id="addrAddressId"  name="addrAddressId"  value="" /> 
   					<input type="hidden" id="addrStoreCode"  name="addrStoreCode"  value="" /> 
   					<input type="hidden" id="addrSectorCode" name="addrSectorCode" value="" /> 
       			</p>
       			<p style="padding:0 0 10px 120px;">
            		<label for="join_address2" class="hidden">상세주소입력</label>
            		<input type="text" id="addr2" name="addr2" class="w400"/>
       			</p>
      		</div>
    	</form>
  	</div> 
  	<!--// join_form -->
  	
  	<div class="btn">
  		<button type="submit" onclick="fnMember();"><img src="../assets/img/forms/join_btn_join.gif" alt="가입신청" /></button>
    	<button type="cancel" onclick="fn_cancel();"><img src="../assets/img/forms/join_btn_cancle.gif" alt="취소" /></button>
  	</div>
</div>
<!--// join_form_sectio -->

<!--[ 2013/3/22 ] 추가 부분 시작-->
<!-- 팝업_아이디찾기&주소찾기 20130709 수정 -->
<div id="search_id" class="pop_box4"> 
	<p class="cont">
  	<h3 class="title" style="width:50%; float:left; padding:10px;"><img src="../assets/img/forms/title_searchId.gif" alt="아이디검색" /></h3> 
	<span class="btn_h23 gray" style="float:right;"><button type="button" onclick="del_pop('search_id',true,$(this))">취소</button></span>
    <div>
    	<iframe src="/member/search_id.jsp" width="290px" height="150px;" frameborder="0">아이프레임이지원되는 브라우저에서 확인할수있습니다.</iframe>
    </div>
	</p>
</div>
<!-- //////////// 주소검색 /////////////// -->
	<div id="search_addr" class="pop_box3" style="position:absolute; top:0px; left:0px; display:none;"><p class="top"></p><p class="bottom"></p>
		<p class="cont">
  		<h3 class="title" style="width:50%; float:left; padding:5px;"><img src="../assets/img/forms/title_searchAddr.gif" alt="주소검색" /></h3>
		<span class="btn_h23 gray" style="float:right;"><button type="button" onclick="del_pop('search_addr',true, $(this))">취소</button></span> 
    	<div>
 			<iframe src="addressAction.action?flag=member" width="370px" height="198px;" frameborder="0">아이프레임이지원되는 브라우저에서 확인할수있습니다.</iframe>
    	</div>
		</p>
	</div>
<!--[ 2013/3/22 ] 추가 부분 끝-->


<!--20131212  알럿 변경-->
<div class="notice" id="notice_0005" style="display:none; width:340px; height:auto; min-height:140px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header">
	    <div class="left" style="float:left; width:6px;  background:url(../assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:328px; height:40px; background:url(../assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>알림!!</h2> 
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(../assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div id="alertText" class="text_body" style="width:340px; height:auto; min-height:92px; line-height: 30px; background:#fff; border: 0px none; padding:8px 0px;">  
    	<br><p></p> 
    </div>  
  	<div class="footer" style="position: absolute; height:32px; background:#fff; " >
		<div class="button" style="bottom:20px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_0005');">확 인</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(../assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:328px; height:8px; background:url(../assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(../assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div>
