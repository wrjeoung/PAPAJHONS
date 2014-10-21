<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript">
	
	snb(8,3);
	head_title("JOIN-US");
	$("#content_area").css({"width":"800px", "background":"#fff", "padding":"20px 10px", "margin":"0 auto"}); 
	
	
	$(document).ready(function(){$('#viewLoading').fadeOut(500);});
	
	//�齺���̽� ��ư�� �ڷΰ��� ����� ���´�.
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

 		//type�� password�� text�� input�� textarea�� ������ ��� ������Ʈ���� �齺���̽������ ������
			if( !( ((targetNode=="INPUT"&&(type=="text"||type=="password"))||targetNode=="TEXTAREA")&&(!readonly&&!disabled) ) )
			{
    			if( event.preventDefault )
     				event.preventDefault();		//for i
    			else
     				event.returnValue = false;		//for ǥ�� ������(IE9, ���̾�����, �����, ���ĸ�, ũ��)
   			}
		}
	});

	var alertFrame = $("#notice_0005");
	// �Է��׸� Check	

	
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
			fnAlert("<p>���̵� �ߺ� üũ�� �� �ּ���.</p>");
			return;
		}
		
		if( document.f1.join_id.value == "" )
		{
			fnAlert("<p>���̵� �Է��� �ּ���.</p>"); 
			document.f1.join_id.focus();
			return;
		}
		
		if( document.f1.join_pass.value == "" )
		{
			fnAlert("<p>��й�ȣ�� �Է��� �ּ���.</p>"); 
			document.f1.join_pass.focus();
			return;
		}
		if( !isABCNum(document.f1.join_pass.value) )
		{
			fnAlert("<p>��й�ȣ�� ���� �Ǵ� ���ڸ� �����մϴ�.</p>"); 
			document.f1.join_pass.focus();
			return;
		}
		if( document.f1.join_pass.value.length < 4 || document.f1.join_pass.value.length > 20 )
		{
			fnAlert("<p>��й�ȣ�� 4�� �̻�, 20�� �̳��� �Է��ϼž� �մϴ�.</p>"); 
			document.f1.join_pass.focus();
			return;
		}
		if( document.f1.join_passConf.value == "" )
		{
			fnAlert("<p>��й�ȣ Ȯ�ζ��� �Է��� �ּ���.</p>"); 
			document.f1.join_passConf.focus();
			return;
		}
		if( !isABCNum(document.f1.join_passConf.value) )
		{
			fnAlert("<p>��й�ȣ�� ���� �Ǵ� ���ڸ� �����մϴ�.</p>"); 
			document.f1.join_passConf.focus();
			return;
		}
		if( document.f1.join_passConf.value.length < 4 || document.f1.join_passConf.value.length > 20 )
		{
			fnAlert("<p>��й�ȣ�� 4�� �̻�, 20�� �̳��� �Է��ϼž� �մϴ�.</p>"); 
			document.f1.join_passConf.focus();
			return;
		}
		if( document.f1.join_pass.value != document.f1.join_passConf.value )
		{
			fnAlert("<p>�Է��Ͻ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�. <br>��й�ȣ�� Ȯ���� �ּ���.</p>"); 
			document.f1.join_passConf.value = "";
			document.f1.join_passConf.focus();
			return;
		}
		
		if( document.f1.join_sex.value == "" )
		{
			fnAlert("<p>�����ں��� ������ ������ �ּ���.</p>"); 
			document.f1.join_sex.focus();
			return;
		}
		
		if( document.f1.join_mobile1.value == "" )
		{
			fnAlert("<p>�޴��� ��ȣ�� �Է��� �ּ���.</p>"); 
			document.f1.join_mobile1.focus();
			return;
		}
		
		if( document.f1.join_mobile2.value == "" )
		{
			fnAlert("<p>�޴��� ��ȣ�� �Է��� �ּ���.</p>"); 
			document.f1.join_mobile2.focus();
			return;
		}
		
		if( document.f1.join_mobile3.value == "" )
		{
			fnAlert("<p>�޴��� ��ȣ�� �Է��� �ּ���.</p>"); 
			document.f1.join_mobile3.focus();
			return;
		}
		
		if( document.f1.addr1.value == "" )
		{
			fnAlert("<p>�ּҸ� �Է��� �ּ���.</p>"); 
			return;
		}
		//��ȭ��ȣ �����Է� üũ�ϱ�!!
		
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
				//����� �����Ҷ� ó��             
				$('#viewLoading').show().fadeIn('fast');          
			},
	   		complete: function() 
			{             
				//����� �Ϸ�� �� ó��              
				$('#viewLoading').fadeOut();  
			},
			success  : function(data)
			{
				var msg = trim(data);
//				alert(msg);
				if( msg == "no" )
				{
					alert("�߸��� ������ ���� �̰��� �Ǿ����ϴ�.\n�ٽ� ������ �ּ���."); 
					url = '/cont.jsp?menuGb=member&menuId=pj_0005&msg='+msg;
				}
				else if( msg == "ok" )
				{
					
					url = "/cont.jsp?menuGb=member&menuId=pj_0006";
				}
				else if( msg == "dup" )
				{
					alert("�̹� ȸ�� ������ �Ǿ� �ֽ��ϴ�.");
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

<div id="join_setp" style="background:url(/assets/img/forms/join_setp3.png) no-repeat; width:341px; height:53px; position:relative;left:-20px;"></div>
<!-- join_form_sectio -->
<div id="join_form_section">
  	<!-- join_form -->
  	<div id="join_form">
  		<h3 class="title text_hidden">ȸ�����Ծ��</h3>
    	<form name="f1" id="f1" method="post">
    		<input type="hidden" id="calendar_type"  name="calendar_type"  value="Y">                <!-- ������±��� -->
    		<input type="hidden" id="join_sms"       name="join_sms"       value="Y">                <!-- SMS ���ſ��� -->
    		<input type="hidden" id="join_send_mail" name="join_send_mail" value="Y">                <!-- ���ϼ��ſ��� -->
    		<input type="hidden" id="ci"             name="ci"             value="0SA+3KjmSrdvgXo3RO2bQ/uuSMh9ESraUKsepl0KTOa4tkqd0zeVItxod4a76y1qJq++BjE8O2OkzMWGei2c3Q=="/>  <!-- �޴���CI     -->
    		<input type="hidden" id="di"             name="di"             value="MC0GCCqGSIb3DQIJAyEA6gNdv5BC+GOUjH7Wnc+FZ0QsZ9o2yvAog8cal0ywZcY=" />  <!-- �޴���DI     -->
    	
    		<div class="form">
      			<p>
        			<label class="tit" for="join_name"><img src="/assets/img/forms/label_name.gif" alt="�̸�" /></label>
            		<input type="text" id="join_name" name="join_name" value="������" class="base" readOnly />
        		</p>
        		<p>
        			<label class="tit" for="join_id"><img src="/assets/img/forms/login_id.gif" alt="���̵�" /></label>
            		<input type="text" id="join_id" name="join_id" class="base" onkeydown="fnIdChk();" readOnly onclick='popup("#search_id"); $("#search_id").focus()'/>  
            		<span class="btn_h23 gray"><button type="button" onclick='popup("#search_id"); $("#search_id").focus()'>���̵� �ߺ� üũ</button></span> 
            		<span class="text_s11">*����, ���ڸ� ����, 4~20 ���� �̳�.</span>
            		<input type="hidden" id="join_id_chk" name="join_id_chk" value="N" />  
        		</p>
        		<p>
        			<label class="tit" for="join_pass"><img src="/assets/img/forms/login_pw.gif" alt="��й�ȣ" /></label>
            		<input type="password" id="join_pass" name="join_pass" class="base" maxlength="20" /> <span class="text_s11">*����, ���ڸ� ����, 4~20 ���� �̳�.</span>
        		</p>
        		<p>
        			<label class="tit" for="join_passConf"><img src="/assets/img/forms/label_passConf.gif" alt="��й�ȣȮ��" /></label>
            		<input type="password" id="join_passConf" name="join_passConf" class="base" maxlength="20" />
        		</p>
        		<p>
        			<label class="tit" for="join_birthday1"><img src="/assets/img/forms/label_birthday.gif" alt="�������" /></label>
            		<select id="join_birthday1" name="join_birthday1" title="�¾ �� �Է�" ><option value='1985' selected='selected'>1985 ��</option></select> 
            		<select id="join_birthday2" name="join_birthday2" title="�¾ �� �Է�" ><option value='01' selected='selected'>01 ��</option></select> 
            		<select id="join_birthday3" name="join_birthday3" title="�¾ �� �Է�" ><option value='27' selected='selected'>27 ��</option></select> 
            		(
            		<label for="sun">���</label>
          			<input type="radio" id="sun" name="sun" onclick="fnRadioClick('sun', this.value)" value="Y" checked/>
            		<label for="lunar">����</label>
            		<input type="radio" id="sun" name="sun" onclick="fnRadioClick('sun', this.value)" value="N"/>
            		)
            		&nbsp;
            		<select id="join_sex" name="join_sex" disabled>
          				<option value="">����</option>
            			<option value="M" selected="selected" >����</option>
            			<option value="F" >����</option>
            		</select>
        		</p>
        		<p>
        			<label class="tit" for="join_phone1"><img src="/assets/img/forms/label_phone.gif" alt="��ȭ��ȣ" /></label>
            		<input type="text" id="join_phone1" name="join_phone1" class="w50" title="������ȣ�Է�" maxlength="4"/> - 
            		<input type="text" id="join_phone2" name="join_phone2" class="w50" title="��ȭ��ȣ ���ڸ� �Է�" maxlength="4"/> - 
            		<input type="text" id="join_phone3" name="join_phone3" class="w50" title="��ȭ��ȣ ���ڸ� �Է�" maxlength="4"/>
        		</p>
        		<p>
        			<label class="tit" for="join_mobile1"><img src="/assets/img/forms/login_mobile.gif" alt="�ڵ�����ȣ" /></label>
            		<input type="text" id="join_mobile1" name="join_mobile1" class="w50" title="������ȣ�Է�" maxlength="3"/> - 
            		<input type="text" id="join_mobile2" name="join_mobile2" class="w50" title="��ȭ��ȣ ���ڸ� �Է�" maxlength="4"/> - 
            		<input type="text" id="join_mobile3" name="join_mobile3" class="w50" title="��ȭ��ȣ ���ڸ� �Է�" maxlength="4"/>
        		</p>
        		<p style="padding:0 0 0 120px;">
            		<span style="font-weight:bold; background:url(/assets/img/icon/icon_gray1.gif) no-repeat 0 2px; padding-left:10px;" >SMS���ŵ��� : </span>
            		<label for="sms_yes" class="text_s11">��</label>
            		<input type="radio" id="sms" name="sms" value="Y" onclick="fnRadioClick('sms', this.value)" checked/>
            		<label for="sms_no" class="text_s11">�ƴϿ�</label>
            		<input type="radio" id="sms" name="sms" value="N" onclick="fnRadioClick('sms', this.value)" />
            		<br>
            		<span class="text_s11">���� �����Ͻø�, �̺�Ʈ �� ���������� ���� �������� ���񽺸� ������ �� �ֽ��ϴ�.</span>
        		</p>
        		<p>
        			<label class="tit" for="join_email"><img src="/assets/img/forms/label_email.gif" alt="�̸���" /></label>
            		<input type="text" id="join_email" name="join_email" class="w200"/>
        		</p>
        		<p>
        			<span class="tit"><img src="/assets/img/forms/label_sendMail.gif" alt="�̸��ϼ��ſ���" /></span>
            		<span class="text_s11">�������� ���� ������ �޾ƺ��ðڽ��ϱ�?</span>
            		<label for="join_sendMail_yes">��</label>
            		<input type="radio" id="sendMail" name="join_sendMail" value="Y" onclick="fnRadioClick('meil', this.value)" checked/>
            		<label for="join_sendMail_no">�ƴϿ�</label>
            		<input type="radio" id="sendMail" name="join_sendMail" value="N" onclick="fnRadioClick('meil', this.value)" />
        		</p>
        		<p style="border-bottom:none">
        			<span class="tit"><img src="/assets/img/forms/label_address.gif" alt="�ּ�" /></span>
            		<label for="zip1" class="hidden">�����ȣ</label>
            		<input type="text" id="zip1" name="zip1" class="w50" readonly="readonly"/> - 
            		<input type="text" id="zip2" name="zip2" class="w50" readonly="readonly"/>
            		<!-- 
            		<span class="btn_h23 gray"><button type="button"  onclick='popup("#search_addr")'>�����ȣ�˻�</button></span>
            		-->
            		<span class="btn_h23 gray"><button type="button"  onclick='popup("#search_addr"); $("#search_id").focus()'>�ּҰ˻�</button></span>
       			</p>
       			<p style="padding:0 0 10px 120px; border-bottom:none;">
            		<label for="join_address1" class="hidden" >�ּ�</label>
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
            		<label for="join_address2" class="hidden">���ּ��Է�</label>
            		<input type="text" id="addr2" name="addr2" class="w400"/>
       			</p>
      		</div>
    	</form>
  	</div> 
  	<!--// join_form -->
  	
  	<div class="btn">
  		<button type="submit" onclick="fnMember();"><img src="/assets/img/forms/join_btn_join.gif" alt="���Խ�û" /></button>
    	<button type="cancel" onclick="fn_cancel();"><img src="/assets/img/forms/join_btn_cancle.gif" alt="���" /></button>
  	</div>
</div>
<!--// join_form_sectio -->

<!--[ 2013/3/22 ] �߰� �κ� ����-->
<!-- �˾�_���̵�ã��&�ּ�ã�� 20130709 ���� -->
<div id="search_id" class="pop_box4"> 
	<p class="cont">
  	<h3 class="title" style="width:50%; float:left; padding:10px;"><img src="/assets/img/forms/title_searchId.gif" alt="���̵�˻�" /></h3> 
	<span class="btn_h23 gray" style="float:right;"><button type="button" onclick="del_pop('search_id',true,$(this))">���</button></span>
    <div>
    	<iframe src="/member/search_id.jsp" width="290px" height="150px;" frameborder="0">�����������������Ǵ� ���������� Ȯ���Ҽ��ֽ��ϴ�.</iframe>
    </div>
	</p>
</div>
<!-- //////////// �ּҰ˻� /////////////// -->
	<div id="search_addr" class="pop_box3" style="position:absolute; top:0px; left:0px; display:none;"><p class="top"></p><p class="bottom"></p>
		<p class="cont">
  		<h3 class="title" style="width:50%; float:left; padding:5px;"><img src="assets/img/forms/title_searchAddr.gif" alt="�ּҰ˻�" /></h3>
		<span class="btn_h23 gray" style="float:right;"><button type="button" onclick="del_pop('search_addr',true, $(this))">���</button></span> 
    	<div>
 			<iframe src="/com/zipCode.jsp?flag=member" width="370px" height="198px;" frameborder="0">�����������������Ǵ� ���������� Ȯ���Ҽ��ֽ��ϴ�.</iframe>
    	</div>
		</p>
	</div>
<!--[ 2013/3/22 ] �߰� �κ� ��-->


<!--20131212  �˷� ����-->
<div class="notice" id="notice_0005" style="display:none; width:340px; height:auto; min-height:140px; padding:1px; position:absolute; top:0; left:0; z-index:1000;"> 
    <div class="header">
	    <div class="left" style="float:left; width:6px;  background:url(../assets/img/usa/modal_header_left.png) top left no-repeat; "></div>
	    <div class="center" style="float:left; width:328px; height:40px; background:url(../assets/img/usa/modal_header_center.png) top center repeat-x; ">
	    	<h2>�˸�!!</h2> 
	    </div>
	    <div class="right" style="float:right; width:6px; height:40px; background:url(../assets/img/usa/modal_header_right.png) top right no-repeat; "></div>
	</div>    
    <div id="alertText" class="text_body" style="width:340px; height:auto; min-height:92px; line-height: 30px; background:#fff; border: 0px none; padding:8px 0px;">  
    	<br><p></p> 
    </div>  
  	<div class="footer" style="position: absolute; height:32px; background:#fff; " >
		<div class="button" style="bottom:20px;"><button class="alertBtn gray" type="button" onclick="del_pop2('#notice_0005');">Ȯ ��</button></div> 
		<div class="left" style="float:left; width:6px; height:8px; background:url(../assets/img/usa/modal_footer_left.png) bottom left no-repeat; "></div>
    	<div class="center" style="float:left; width:328px; height:8px; background:url(../assets/img/usa/modal_footer_center.png) bottom center repeat-x; "></div>
    	<div class="right" style="float:right; width:6px; height:8px; background:url(../assets/img/usa/modal_footer_right.png) bottom right no-repeat; "></div>
  	</div>
</div>
