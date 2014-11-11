<script type="text/javascript">
	function init()
	{
		snb(8,1);
		head_title("LOGIN");

		$(document).ready(function(){$('#viewLoading').hide();});
		
		var alertFrame = $("#notice_caution");
		var result = parent.document.getElementById("login_result").value;
		
		if( result == "no" )
		{	
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>입력하신 정보가 맞지 않습니다.<br>다시 확인 하시고 로그인 해 주세요.</p>"); 
			popAlert("#notice_caution");
			
			document.loginForm.mem_id.focus();
		}
		else if(result == "yes")
		{
			document.loginForm.action = "mainAction.action?msg=ok";
			document.loginForm.submit();
		}
	}
	
	//20140219 검색버튼 enter key 이벤트 처리
	function CheckEnt(val) {
		if (event.keyCode == 13) {
			Login();
		}
	}	
	
	function Login()
	{
		if( document.loginForm.mem_id.value == "" )
		{ 
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>아이디가 입력되지 않았습니다.<br>'아이디'를 입력해 주세요.</p>"); 
			popAlert("#notice_caution");
				
			document.loginForm.mem_id.focus();
			return;
		}
		
		if( document.loginForm.mem_pw.value == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>비밀번호가 입력되지 않았습니다.<br>'비밀번호'를 입력해 주세요.</p>"); 
			popAlert("#notice_caution");
			
			document.loginForm.mem_pw.focus();
			return;
		}

		// 20140503 기존 가입자 중 한글ID 문제로 수정
		document.loginForm.userID.value = encodeURIComponent(document.loginForm.mem_id.value);
		
		var menuGb = parent.document.getElementById("menuGb").value;
		var menuId = parent.document.getElementById("menuId").value;

		document.loginForm.action = 'loginProAction.action?menuGb='+menuGb+'&menuId='+menuId;
		document.loginForm.submit();	
	}
	
	//회원  - 로그인
	function fnLogin()
	{
		
		if( document.loginForm.mem_id.value == "" )
		{ 
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>아이디가 입력되지 않았습니다.<br>'아이디'를 입력해 주세요.</p>"); 
			popAlert("#notice_caution");
				
			document.loginForm.mem_id.focus();
			return;
		}
		
		if( document.loginForm.mem_pw.value == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>비밀번호가 입력되지 않았습니다.<br>'비밀번호'를 입력해 주세요.</p>"); 
			popAlert("#notice_caution");
			
			document.loginForm.mem_pw.focus();
			return;
		}
	
		if( "" == "step5" )
		{ 
			$.ajax(
			{
				url      : "/order/user_ok.jsp",
				type     : "POST",
				data     : $("#loginForm").serialize(),
				dataType : "html", 
				success  : function(data)
						   {  
							   if( trim(data) == "ok" )
							   { 
								   location.href = "/order.jsp?step=step5&orderNumber="+""; 
					           }
							   else if( trim(data) == "no" )
							   {
									alertFrame.find("#alertText p").remove();
									alertFrame.find("#alertText").append("<p>입력하신 정보는 로그인이 불가능합니다.<br>'아이디' 또는 '비밀번호'를 확인해 주세요.</p>"); 
									popAlert("#notice_caution");
					           }
				           }
			});
		}
		else
		{
			// 20140503 기존 가입자 중 한글ID 문제로 수정
			document.loginForm.userID.value = encodeURIComponent(document.loginForm.mem_id.value);
			
			document.loginForm.action = "member/pj_0001_login.jsp";
			document.loginForm.submit();	
		}
		
	}
	
	//비회원주문조회 - 로그인
	function fnNoLogin()
	{
		
		if( document.nonmemberForm.nonmem_ord_name.value == "" )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>주문 시 발급된 '주문번호'를 입력해 주세요.</p>"); 
			popAlert("#notice_caution");
			document.nonmemberForm.nonmem_ord_name.focus();
			return;
		}
		
		var hp_no = document.nonmemberForm.nonmem_ord_mobile1.value + document.nonmemberForm.nonmem_ord_mobile2.value + document.nonmemberForm.nonmem_ord_mobile3.value
		if( !(hp_no.length == 10 || hp_no.length == 11) )
		{
			alertFrame.find("#alertText p").remove();
			alertFrame.find("#alertText").append("<p>조회할 수 없는 번호입니다.<br>'휴대폰 번호'를 확인해주세요.</p>"); 
			popAlert("#notice_caution");
			document.nonmemberForm.nonmem_ord_mobile1.focus();
			return;
		}
	
		document.nonmemberForm.action = "member/pj_0001_nomem.jsp";
		document.nonmemberForm.submit();
		
	}
	
	//
	function fn_NextPage(val)
	{
		
		var url = "confirmInfoAction.action?menuGb=member&menuId=pj_0002";
		document.loginForm.action = url;
		document.loginForm.submit();
		
	}
</script>

<script for=window event=onload>
	document.loginForm.mem_id.focus();
	init();
</script>

<div id="login_section">
  	<!-- member -->
  	<div id="member">
    	<h3 class="title text_hidden">회원로그인:로그인이 안되는 고객님들께서는 파파존스홈페이지를 다시 접속해주시 바랍니다</h3>
    	<form name="loginForm" id="loginForm" method="post">
    	<input type="hidden" id="userID" name="userID" value="">
      		<fieldset>
        		<legend class="hidden">회원로그인</legend>
	        	<div class="mem_form">
	          		<p class="login_box">
	            		<label for="mem_id"><img src="../assets/img/forms/login_id.gif" alt="아이디"/></label>
	            		<input type="text" id="mem_id" name="mem_id" onkeydown="CheckEnt()" />
	            		<label for="mem_pw"><img src="../assets/img/forms/login_pw.gif" alt="패스워드"/></label>
	            		<input type="password" id="mem_pw" name="mem_pw" onkeydown="CheckEnt()" />
	          		</p>
	          		<p class="login_btn">
	            		<button type="button" onclick="Login();"><img src="../assets/img/forms/btn_login.gif" alt="로그인" /></button>
	          		</p>
	        	</div>
			</fieldset>
			
        	<div class="find_id_pw">
          		<p class="text">아이디나 패스워드가 기억이 안나시나요?</p>
          		<p class="btn_h23 gray btn"><button type="button" onclick="fn_NextPage(0);">아이디/패스워드찾기</button></p>
        	</div>
        	
        	<div class="non_join">
          		<div class="btn_nonmember">
            		<p><button type="button" onclick='$("#nonmember").show(); $("#member").hide(); document.nonmemberForm.nonmem_ord_name.focus();'><img src="../assets/img/forms/login_btn_nonmem.gif" alt="비회원주문조회" /></button></p>
            		<p class="text">아직 회원이 아니시거나 비회원으로 주문 조회를 원하시면 '비회원 주문'을 선택해주세요</p>
          		</div> 
          		<div class="btn_join">
            		<p><a href="signUpAction.action?menuGb=member&menuId=pj_0005"><img src="../assets/img/forms/login_btn_join.gif" alt="회원가입" /></a></p>
          			<!-- 
            		<p><a href="/cont.jsp?menuGb=member&menuId=pj_0004"><img src="</%=root%>/assets/img/forms/login_btn_join.gif" alt="회원가입" /></a></p>
          			-->
            		<p class="text">회원가입을 하시면 보다 많은 혜택을 누릴수 있습니다.</p>
          		</div>
        	</div>
    	</form>
  	</div>
  	<!--// member -->
  
  	<!-- nonmember --> 
  	<div id="nonmember">
    	<h3 class="title text_hidden">비회원주문조회:주문번호와 주문 하신 전화번호를 입력하시면 주문 조회를 하실 수 있습니다.</h3>
    	<form name="nonmemberForm" method="post">
      		<fieldset>
        		<legend class="hidden">비회원주문조회</legend>
        		<div  class="mem_form">
          			<p class="login_box">
            			<label for="nonmem_ord_name"><img src="../assets/img/forms/login_ord_num.gif" alt="주문번호"/></label>
            			<input type="text" id="nonmem_ord_name" name="nonmem_ord_name" />
            			<label for="nonmem_ord_mobile1"><img src="../assets/img/forms/login_mobile.gif" alt="핸드폰번호"/></label>
            			<input type="text" id="nonmem_ord_mobile1" name="nonmem_ord_mobile1" title="통신사번호입력" maxlength="3" />
            			-
            			<input type="text" id="nonmem_ord_mobile2" name="nonmem_ord_mobile2" title="핸드폰 앞번호 입력" maxlength="4" />
            			-
            			<input type="text" id="nonmem_ord_mobile3" name="nonmem_ord_mobile3" title="핸드폰 뒷번호 입력" maxlength="4" />
          			</p>
          			<p class="login_btn">
            			<button type="button" onclick="fnNoLogin()"><img src="../assets/img/forms/btn_nonmem_ordview.gif" alt="인증번호받기" /></button>
          			</p>
        		</div>
        		
        		<div class="non_join">
          			<div class="btn_nonmember">
            			<p><button type="button" onclick='$("#nonmember").hide(); $("#member").show(); document.loginForm.mem_id.focus();'><img src="../assets/img/forms/login_btn_memLogin.gif" alt="로그인" /></button></p>
            			<p class="text">아직회원이 아니시거나 비회원으로 주문조회를 원하시면 비회원주문을 선택해주세요</p>
          			</div>
          			<div class="btn_join">
            			<p><a href="signUpAction.action?menuGb=member&menuId=pj_0005"><img src="../assets/img/forms/login_btn_join.gif" alt="회원가입" /></a></p>
            			<p class="text">회원가입을 하시면 보다 많은 혜택을 누릴수 있습니다.</p>
          			</div>
        		</div>
      		</fieldset>
    	</form>
  	</div>
  	<!-- //nonmember --> 
</div>



<!-- ///////////////////////////// 20131108 알림창 전체 적용 /////////////////////////////-->
<div class="notice" id="notice_caution" style="display:none; width:340px; height:auto; min-height:140px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header">
	    <div class="left" style="float:left; width:6px;  background:url(../assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:328px; height:40px; background:url(../assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>알림!!</h2> 
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(../assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div id="alertText" class="text_body" style="width:340px; height:auto; min-height:90px; line-height: 30px; background:#fff; border: 0px none; padding:8px 0px;"> 
    </div> 
  	<!-- //comm_list --> 
  	<div class="footer" style="position: absolute; height:32px; background:#fff; " >
		<div class="button" style="bottom:20px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_caution');">확 인</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(../assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:328px; height:8px; background:url(../assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(../assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div> 
<!-- //login_section -->