<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>회원 정보 수정</title>	
	<script type="text/javascript" src="../assets/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="../assets/js/common.min.js"></script>
	<script type="text/javascript" src="../assets/js/snb.js"></script> 	
</head>

<script type="text/javascript"> 

function modifyInfo()
{
	var phone = $("#phone1").attr("value")+'-'+$("#phone2").attr("value")+'-'+$("#phone3").attr("value")
	var mobile = $("#mobile1").attr("value")+'-'+$("#mobile2").attr("value")+'-'+$("#mobile3").attr("value")
	var addr = $("#zip1").attr("value")+'-'+$("#zip2").attr("value")+','+$("#addr1").attr("value")+','+$("#addr2").attr("value")
	
	$("#phone").val(phone);
	$("#mobile").val(mobile);
	$("#addr").val(addr);	
	
	form = document.modify;
	form.action = "adminMemberModifyProAction.action";
	form.submit();
}

function fnRadioClick(gb, val)
{
	
	if( gb == "sms" )
	{
		$("#sms").val(val);
		var sms_yes = document.getElementById("sms_yes");
		var sms_no = document.getElementById("sms_no");
		
		if( val == "N" ) 
		{
			sms_yes.checked = false; 
			sms_no.checked = true;
			
		}
		else
		{
			sms_no.checked = false;
			sms_yes.checked = true; 
		}  

	}

	else if( gb == "email" ) 
	{
		$("#sendmail").val(val);
		var sendMail_yes = document.getElementById("sendMail_yes");
		var sendMail_no = document.getElementById("sendMail_no");
		
		 if( val == "N" ) 
		{
			sendMail_yes.checked = false;
			sendMail_no.checked  = true; 
		}
		else
		{
			sendMail_no.checked  = false; 
			sendMail_yes.checked = true;
		} 
	}
	
	else if( gb == "activation" )
	{
		$("#activation_status").val(val);
		var activation_yes = document.getElementById("activation_yes");
		var activation_no = document.getElementById("activation_no");
		
		 if( val == "inactive" ) 
		{
			activation_yes.checked = false;
			activation_no.checked  = true; 
		}
		else
		{
			activation_no.checked  = false; 
			activation_yes.checked = true;
		} 	
	}
	
	
}

function setObjSize(obj){
	obj.setAttribute("size",obj.value.length+15);
}

function init()
{
	var addr1 = document.getElementById("addr1");
	var addr = "${data.addr}".split(",");
	var zipcode = addr[0];
	var zip1 = zipcode.split("-")[0];
	var zip2 = zipcode.split("-")[1];
	$("#addr1").val(addr[1]);
	$("#addr2").val(addr[2]);
	$("#addrZipCode").val(zip1+zip2);
	$("#zip1").val(zip1);
	$("#zip2").val(zip2);
	setObjSize(addr1);
	
	fnRadioClick('sms', '${data.sms}');
	fnRadioClick('email', '${data.sendmail}');
	fnRadioClick('activation', '${data.activation_status}');
}

function fnOnloadWindow()
{	
	init();
}
</script>

<script for="window" event="onload">
	setTimeout("fnOnloadWindow()",100);
</script>


<form id="modify" name="modify" method="post" action="" target=ifr_hidden>
	<input type="hidden" id="id"  name="id" value="${data.id}">
	<input type="hidden" id="sms"    name="sms"    value="">                   <!-- SMS 수신여부 -->
	<input type="hidden" id="sendmail"   name="sendmail"   value="">                   <!-- 메일수신여부 -->
   	<input type="hidden" id="phone"  name="phone" value="">  
	<input type="hidden" id="mobile"  name="mobile" value="">
	<input type="hidden" id="addr"  name="addr" value="">
	<input type="hidden" id="activation_status"  name="activation_status" value="">
		
	<div id="form_section" class="txt_left" align="center">
	  	<table align="center" width="600" border="0" cellspacing="0" cellpadding="2">
	  		<tr>
	  			<td align="center"><h2>회원 관리</h2></td>
	  		</tr>
	  		<tr>
	  			<td height="20"></td>
	  		</tr>
	  	</table>				
	
		<table border="1" cellspacing="0" cellpadding="2">
			<tr bgcolor="#ececec" align="center">
    			<th colspan="2">회원 정보 수정</th>
   			</tr>
			<tr>
				<td bgcolor="#ececec" align="center">이름</td>
				<td><input type="text" id="name" name="name" value='${data.name}'></td>
				</tr>
			<tr>
				<td bgcolor="#ececec" align="center">아이디</td>
				<td>${data.id}</td>
				</tr>
			<tr>
				<td bgcolor="#ececec" align="center">패스워드</td>
				<td><input type="password" id="pw" name="pw" class="base" value='${data.pw}' /></td>
				</tr> 				
				<tr> 
					<td bgcolor="#ececec" align="center">전화번호</td>
					<td>
						<c:set var="phone" value="${fn:split(data.phone, '-')}"/>
						<input type="text" id="phone1" name="phone1" class="w50" value='${phone[0]}' title="지역번호입력" maxlength="4"/> - 
         				<input type="text" id="phone2" name="phone2" class="w50" value='${phone[1]}' title="전화번호 앞자리 입력" maxlength="4"/> - 
         				<input type="text" id="phone3" name="phone3" class="w50" value='${phone[2]}' title="전화번호 뒷자리 입력" maxlength="4"/>
       	        </td>
 				</tr>
				<tr> 
					<td bgcolor="#ececec" align="center">핸드폰번호</td>
					<td>
						<c:set var="mobile" value="${fn:split(data.mobile, '-')}"/>
        				<input type="text" id="mobile1" name="mobile1" class="w50" value='${mobile[0]}' title="지역번호입력" maxlength="3" /> - 
         				<input type="text" id="mobile2" name="mobile2" class="w50" value='${mobile[1]}' title="전화번호 앞자리 입력" maxlength="4" /> - 
         				<input type="text" id="mobile3" name="mobile3" class="w50" value='${mobile[2]}' title="전화번호 뒷자리 입력" maxlength="4" />
         			</td>
 				</tr>
				<tr> 
					<td bgcolor="#ececec" align="center"><span style="font-weight:bold; background:url(../assets/img/icon/icon_gray1.gif) no-repeat 0 2px; padding-left:10px;" >SMS수신동의 </span></td>
					<td>
         				<label>예</label>
         				<input type="radio" id="sms_yes" name="sms_yes" value="Y" onclick="fnRadioClick('sms', this.value)"/>
         				<label>아니오</label>
         				<input type="radio" id="sms_no" name="sms_no" value="N" onclick="fnRadioClick('sms', this.value)" />
         			</td>
 				</tr>
				<tr> 
					<td bgcolor="#ececec" align="center">이메일</td>
					<td><input type="text" id="email" name="email" value='${data.email}'/></td>
 				</tr>
				<tr> 
					<td bgcolor="#ececec" align="center" style="font-weight:bold;">이메일수신여부</td>
					<td>
         				<label>예</label>
         				<input type="radio" id="sendMail_yes" name="sendMail_yes" value="Y" onclick="fnRadioClick('email', this.value)" />
         				<label>아니오</label>
         				<input type="radio" id="sendMail_no" name="sendMail_no" value="N" onclick="fnRadioClick('email', this.value)" />
         			</td>
 				</tr>
 				<tr>
 					<td bgcolor="#ececec" align="center">우편번호</td>
 					<td>
  					<input type="text" id="zip1" name="zip1"  value=""/> - 
          			<input type="text" id="zip2" name="zip2"  value=""/>
         			</td>
				</tr>
				<tr>
					<td bgcolor="#ececec" align="center">주소</td>
					<td>
						<input type="text" id="addr1" name="addr1" value=""/>
						<input type="text" id="addr2" name="addr2" value=""/>
					</td>
				</tr>
				<tr> 
					<td bgcolor="#ececec" align="center">계정활성화</td>
					<td>
         				<label>active</label>
         				<input type="radio" id="activation_yes" name="activation_yes" value="active" onclick="fnRadioClick('activation', this.value)"/>
         				<label>inactive</label>
         				<input type="radio" id="activation_no" name="activation_no" value="inactive" onclick="fnRadioClick('activation', this.value)" />
         			</td> 					
 				</tr>
				<tr> 
					<td bgcolor="#ececec" align="center">계정활성코드</td>
					<td><input type="text" id="activation_key" name="activation_key" value='${data.activation_key}'/></td>
 				</tr>
				<tr bgcolor="#ececec" align="center">
					<td colspan="2">
    					<input type="button" value="수정" onclick="modifyInfo()"/>
    					<input type="button" value="목록" onClick="javascript:location.href='adminMemberAction.action'"/>
    				</td>
	   			</tr> 				  								  					  					  									   			
		</table>
	</div>
</form>
<iframe name="ifr_hidden"  src="" style="width:0;height:0;visibility: hidden;">

