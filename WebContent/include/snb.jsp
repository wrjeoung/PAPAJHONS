<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 0313 �߰� �κ� ���� 
   - �Ʒ��� <script type="text/javascript">snb("#snb1")</script> �κ� ��� ���� 
   - dep2 Ŭ���� �Ʒ� a �±� href�� tab �Ķ���� ���� ������
-->
<script type="text/javascript">
	var menuGb  = "null";
	var menuId  = "null";
	var tab     = "null";
	var $menuGb = $("#"+menuGb);
	var $meuId  = $("."+menuId);
	
	// 2014.07.17.�������̺�Ʈ




	$meuId.next().find(">ul>li>a").eq(tab-1).addClass("active");

	//���� �޴��׷쿡 �´� ����κ� ���̱�
	$menuGb.show();
		
	//���� ���� 2���޴��� Ŭ���� active�� �߰����� �޴� Ȱ��ȭ�ϱ�
	if( menuId == "pj_3001_view" || menuId == "pj_3002_view" || menuId == "pj_3003_view")
	{
		//20140319 �̺�Ʈ ������ ����ó��
		menuId = menuId.split("_")[0] + "_" + menuId.split("_")[1];
	}
	//20140410 �����ֹ����� �� ȭ��  ��ư Ȱ�� ó��
	if(menuGb =="mypage" && menuId == "view")
	{
		menuId = "pj_7001";
	}
	$("."+menuId).addClass("active");
	snb("#"+menuGb);
	
	
	// tab�޴��� null�ϰ�� dep1�� �̹��� alt���� Ÿ��Ʋ ����������/ tab���� ������� tab��ȣ�� �´� �ؽ�Ʈ�� �ҷ�����
	if( tab == "null" )
	{
		var title = $meuId.find("img").attr("alt");
	}
	else
	{
		var title = $meuId.next().find("li").eq(tab-1).text();
	}

	$("#contents .top_title h2").text(title);

	//20140319 ���̽��� like ��ư �߰� & ����
	if(menuGb == "menu" || menuGb == "mypage")
	{
		$("#contents .top_title").find(".fb-like").hide();
		
		//20140520 ������������ ������ �̺�Ʈ Ȯ�� ��ư ����
		//20140530 �̺�Ʈ �Ⱓ���ȸ� ȭ�� ���̱�
		//20140627 ���������� �̺�Ʈ ��ư ���� (�ѱ� ��� ����)
	}
</script>
<!-- 0313 �߰� �κ� �� -->

<form id="f1" name="f1">
	<div id="menu" style="display:none">
  		<!--  1�޴� ���� : menuGd=menu -->
  		<h2><img alt="�޴�" src="/assets/img/sub/snb_title_2.gif"></h2>
  		<dl class="sub" id="snb1">
    		<dt class="dep1 pj_2001"><a href="/sub.jsp?menuGb=menu&menuId=pj_2001"><img src="/assets/img/sub/sub_2_1.gif" alt="�� ���� ���θ��"></a></dt>
    		<dt class="dep1 pj_2002"><a href="/sub.jsp?menuGb=menu&menuId=pj_2002"><img src="/assets/img/sub/sub_2_2.gif" alt="����Ʈ �޴�"></a></dt>
    		<dt class="dep1 pj_2003"><a href="/sub.jsp?menuGb=menu&menuId=pj_2003"><img src="/assets/img/sub/sub_2_3.gif" alt="��������"></a></dt>
    		<dt class="dep1 pj_2004"><a href="/sub.jsp?menuGb=menu&menuId=pj_2004"><img src="/assets/img/sub/sub_2_4.gif" alt="��帵"></a></dt>
    		<dt class="dep1 pj_2005"><a href="/sub.jsp?menuGb=menu&menuId=pj_2005"><img src="/assets/img/sub/sub_2_5.gif" alt="ġ��� ũ����Ʈ"></a></dt>
    		<dt class="dep1 pj_2006"><a href="/sub.jsp?menuGb=menu&menuId=pj_2006"><img src="/assets/img/sub/sub_2_6.gif" alt="��"></a></dt>
    		<dt class="dep1 pj_2007" style="display:none;"><a href="/sub.jsp?menuGb=menu&menuId=pj_2007"><img src="/assets/img/sub/sub_2_7.gif" alt="�������� ��"></a></dt>
    		<dt class="dep1 pj_2008"><a href="/sub.jsp?menuGb=menu&menuId=pj_2008"><img src="/assets/img/sub/sub_2_8.gif" alt="��帵 ��"></a></dt>
    		<dt class="dep1 pj_2009"><a href="/sub.jsp?menuGb=menu&menuId=pj_2009"><img src="/assets/img/sub/sub_2_9.gif" alt="��Ʈ ��"></a></dt>
    		<!-- 20140425 �����÷��� -->
    		<dt class="dep1 pj_2010"><a href="/sub.jsp?menuGb=menu&menuId=pj_2010"><img src="/assets/img/sub/sub_2_10.gif" alt="�����÷���"></a></dt>
    		<dt class="dep1 pj_2011"><a href="/sub.jsp?menuGb=menu&menuId=pj_2011"><img src="/assets/img/sub/sub_2_11.gif" alt="��Ʈ�޴�"></a></dt>
    		<dt class="dep1 pj_2012"><a href="/sub.jsp?menuGb=menu&menuId=pj_2012"><img src="/assets/img/sub/sub_2_12.gif" alt="���̵�"></a></dt>
    		<dt class="dep1 pj_2013"><a href="/sub.jsp?menuGb=menu&menuId=pj_2013"><img src="/assets/img/sub/sub_2_13.gif" alt="����"></a></dt>
    		<dt class="dep1 pj_2014"><a href="/sub.jsp?menuGb=menu&menuId=pj_2014"><img src="/assets/img/sub/sub_2_14.gif" alt="�ҽ�&��Ŭ"></a></dt>
  		</dl>
	</div>

	<div id="event" style="display:none">
  		<!--  2���θ�� ����: menuGd=event -->
  		<h2><img alt="���θ��" src="/assets/img/sub/snb_title_3.gif"></h2>
  		<dl class="sub" id="snb2">
    		<dt class="dep1 pj_3001"><a href="/sub.jsp?menuGb=event&menuId=pj_3001"><img src="/assets/img/sub/sub_3_1.gif" alt="�������� �̺�Ʈ"></a></dt>
    		<dt class="dep1 pj_3002"><a href="/sub.jsp?menuGb=event&menuId=pj_3002"><img src="/assets/img/sub/sub_3_2.gif" alt="���� �̺�Ʈ"></a></dt>
    		<dt class="dep1 pj_3003"><a href="/sub.jsp?menuGb=event&menuId=pj_3003"><img src="/assets/img/sub/sub_3_3.gif" alt="���庰 �̺�Ʈ"></a></dt>
    		<dt class="dep1 pj_3004"><a href="/sub.jsp?menuGb=event&menuId=pj_3004"><img src="/assets/img/sub/sub_3_4.gif" alt="����� ���� �̺�Ʈ"></a></dt>
  		</dl>
	</div>

	<div id="story" style="display:none">
  		<!--  3�������� �̾߱� ����: menuGd=story -->
  		<h2><img alt="���������̾߱�" src="/assets/img/sub/snb_title_4.gif"></h2>
  		<dl class="sub" id="snb3">
    		<dt class="dep1 pj_4001"><a href="/sub.jsp?menuGb=story&menuId=pj_4001"><img src="/assets/img/sub/sub_4_1.gif" alt="ȸ�� �Ұ�"></a></dt>
    		<dd class="dep2">
    			<ul>
       				<li class=""><a href="/sub.jsp?menuGb=story&menuId=pj_4001&tab=1">Papa John's History</a></li>
       				<li class=""><a href="/sub.jsp?menuGb=story&menuId=pj_4001&tab=2">�ٽɰ�ġ</a></li>
       				<li class=""><a href="/sub.jsp?menuGb=story&menuId=pj_4001&tab=3">���󳻿�</a></li> 
    			</ul>
    		</dd>
    		<dt class="dep1 pj_4002"><a href="/sub.jsp?menuGb=story&menuId=pj_4002"><img src="/assets/img/sub/sub_4_2.gif" alt="���� �̾߱�"></a></dt>
    		<dt class="dep1 pj_4003"><a href="/sub.jsp?menuGb=story&menuId=pj_4003"><img src="/assets/img/sub/sub_4_3.gif" alt="â�� �̾߱�"></a></dt>
    		<dt class="dep1 pj_4004"><a href="/sub.jsp?menuGb=story&menuId=pj_4004"><img src="/assets/img/sub/sub_4_4.gif" alt="ȫ�� ����"></a></dt>
    		<dd class="dep2">
    			<ul>
       				<li><a href="/sub.jsp?menuGb=story&menuId=pj_4004&tab=1">TV����</a></li>
       				<li><a href="/sub.jsp?menuGb=story&menuId=pj_4004&tab=2">��ȸ����Ȱ���Ұ�</a></li>
       				<li><a href="/sub.jsp?menuGb=story&menuId=pj_4004&tab=3">�������� ����ī</a></li>
       				<li><a href="/sub.jsp?menuGb=story&menuId=pj_4004&tab=4">�����ڷ�</a></li>
    			</ul>
    		</dd>
    		<dt class="dep1 pj_4005"><a href="/sub.jsp?menuGb=story&menuId=pj_4005"><img src="/assets/img/sub/sub_4_5.gif" alt="ä�� ����"></a></dt>
    		<dd class="dep2">
    			<ul>
       				<li><a href="/sub.jsp?menuGb=story&menuId=pj_4005&tab=1">�������� �Ի�����</a></li>
       				<li><a href="/sub.jsp?menuGb=story&menuId=pj_4005&tab=2">�Ƹ�����Ʈ�Ի�����</a></li>
    			</ul>
    		</dd>
		</dl>
	</div>

	<div id="customer" style="display:none">
  		<!--  4������ ����: menuGd=customer -->
  		<h2><img alt="������" src="/assets/img/sub/snb_title_5.gif"></h2>
  		<dl class="sub" id="snb4">
    		<dt class="dep1 pj_5001"><a href="/sub.jsp?menuGb=customer&menuId=pj_5001"><img src="/assets/img/sub/sub_5_1.gif" alt="��������"></a></dt>
    		<dt class="dep1 pj_5002"><a href="/sub.jsp?menuGb=customer&menuId=pj_5002&tab=1"><img src="/assets/img/sub/sub_5_2.gif" alt="Q&A "></a></dt>
    		<dd class="dep2">
      			<ul>
        			<li><a href="/sub.jsp?menuGb=customer&menuId=pj_5002&tab=1">FAQ</a></li>
        			<li><a href="/sub.jsp?menuGb=customer&menuId=pj_5002&tab=2">��������</a></li>
      			</ul>
    		</dd>
    		<dt class="dep1 pj_5003"><a href="/sub.jsp?menuGb=customer&menuId=pj_5003"><img src="/assets/img/sub/sub_5_3.gif" alt="���� ī�� �ȳ�"></a></dt>
     		<dd class="dep2">
      			<ul>
        			<li><a href="/sub.jsp?menuGb=customer&menuId=pj_5003&tab=1">��Ż� ����� ī��</a></li>
        			<li><a href="/sub.jsp?menuGb=customer&menuId=pj_5003&tab=2">�ſ�ī��</a></li>
      			</ul>
    		</dd>
    		<dt class="dep1 pj_5004"><a href="/sub.jsp?menuGb=customer&menuId=pj_5004"><img src="/assets/img/sub/sub_5_4.gif" alt="���� �ȳ�"></a></dt>
  		</dl>
	</div>

	<div id="mypage" style="display:none">
  		<!--  5���������� ����: menuGd=mypage -->
  		<h2><img alt="����������" src="/assets/img/sub/snb_title_6.gif"></h2>
  		<dl class="sub" id="snb5">
    		<dt class="dep1 pj_7001"><a href="/sub.jsp?menuGb=mypage&menuId=pj_7001"><img src="/assets/img/sub/sub_6_1.gif" alt="���� �ֹ� ����"></a></dt>
    		<dt class="dep1 pj_7002"><a href="/sub.jsp?menuGb=mypage&menuId=pj_7002"><img src="/assets/img/sub/sub_6_2.gif" alt="���� ���� Ȯ�� "></a></dt>
    		<dt class="dep1 pj_7003"><a href="/sub.jsp?menuGb=mypage&menuId=pj_7003"><img src="/assets/img/sub/sub_6_3.gif" alt="������������ "></a></dt>
    	</dl>
	</div>
</form>