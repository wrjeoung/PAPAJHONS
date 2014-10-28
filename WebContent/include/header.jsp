<!--  0331 추가부분 시작 
	index.jps, sub.jps, conf.jsp 에 load("header.jps")부분에 menuGb,menuId 파라미터값 보내기
-->
<script  type="text/javascript">
	var menuGb = "null";
	var menuId = "null";
	var m_num;
	var s_num;
		
	//온라인 주문 페이지
	if( menuGb == "order" ) 
	{ 
		m_num = 1;
		s_num = 0;
		head_title("ORDER");
	}
	//메뉴페이지
	else if( menuGb == "menu" )
	{	 
		m_num = 2;
		s_num = menuId.substr(5, 2);  // s_num이 10번이상 갈수 있으므로 자르는 문자수를 2로 한다.
		head_title("MENU");
	}
	//프로모션 페이지
	else if( menuGb == "event" )
	{	
		m_num = 3;
		s_num = menuId.substr(6, 1);
		head_title("PROMOTION");   
	}
	//파파존스 이야기 페이지
	else if( menuGb == "story" )
	{	
		m_num = 4;
		s_num = menuId.substr(6, 1);
		head_title("STORY");
	}
	//고객센터 페이지
	else if( menuGb == "customer" )
	{	
		m_num = 5;
		s_num = menuId.substr(6, 1);
		head_title("CUSTOMER");
	}
	//마이페이지
	else if( menuGb == "mypage" )
	{	
		m_num = "index";
		head_title("MYPAGE");
	}
	//가맹점안내 페이지
	else if( menuGb == "franch" )
	{	
		m_num = "index";
		head_title("FRANCHISE");
	}
	//기타 메인화면 메뉴들
	else if( menuGb == "member" )
	{	
		m_num = "index";
		head_title("MEMBER");
	}
	else
	{
		m_num = "index";
	}
		
	gnb(m_num, s_num);
</script>
<!--  0331 추가부분 끝 -->

	<h1 class="logo png24" onclick="location.href='/index.jsp'">
		<img src="../assets/img/common/logo.png" alt="파파존스 피자" title="papajohn's pizza"/>
	</h1>
   	<h3 class="hidden">유틸리티 메뉴</h3>
   	<ul class="utilityNav">

   		<li><h2><a href="signUpAction.action?menuGb=member&menuId=pj_0001"><img src="../assets/img/common/topUtil_01.gif" alt="로그인" /></a></h2></li>
   		<li><h2><a href="signUpAction.action?menuGb=member&menuId=pj_0005"><img src="../assets/img/common/topUtil_08.gif" alt="회원가입" /></a></h2></li>


  		<li><h2><a href="/sub.jsp?menuGb=customer&menuId=pj_5003"><img src="../assets/img/common/topUtil_02.gif" alt="제휴카드안내" /></a></h2></li>
     	<li><h2><a href="../signup/cont.jsp?menuGb=franch&menuId=pj_6001"><img src="../assets/img/common/topUtil_03.gif" alt="가맹점안내" /></a></h2></li>
      	<li><h2><a href="/sub.jsp?menuGb=customer&menuId=pj_5004"><img src="../assets/img/common/topUtil_04.gif" alt="매장안내" /></a></h2></li>
		<li><h2><a href="../signup/cont.jsp?menuGb=member&menuId=pj_0001&step=step5&orderNumber="+"null"><img src="../assets/img/common/topUtil_05.gif" alt="온라인주문확인" /></a></h2></li>
    </ul>
    	
	<div id="gnb">
  		<h3 class="hidden">글로벌 메뉴</h3>
  		<ul>
    		<li class="navItem1"> <a href="/order.jsp">온라인주문</a> </li>
    		<li class="navItem2"> <a href="subAction.action?menuId=pj_2003">메뉴</a>
      			<ul class="sub">
        			<li><h2><a href="/sub.jsp?menuGb=menu&menuId=pj_2001"><img src="../assets/img/common/m2_s01.gif" alt="이달의 프로모션" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=menu&menuId=pj_2002"><img src="../assets/img/common/m2_s02.gif" alt="베스트메뉴" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=menu&menuId=pj_2003"><img src="../assets/img/common/m2_s03.gif" alt="오리지널" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=menu&menuId=pj_2004"><img src="../assets/img/common/m2_s04.gif" alt="골드링" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=menu&menuId=pj_2005"><img src="../assets/img/common/m2_s05.gif" alt="치즈롤 크러스트" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=menu&menuId=pj_2006"><img src="../assets/img/common/m2_s06.gif" alt="씬" /></a></h2></li>
        			<li style="display:none;"><h2><a href="/sub.jsp?menuGb=menu&menuId=pj_2007"><img src="../assets/img/common/m2_s07.gif" alt="오리지널 씬" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=menu&menuId=pj_2008"><img src="../assets/img/common/m2_s08.gif" alt="골드링 씬" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=menu&menuId=pj_2009"><img src="../assets/img/common/m2_s09.gif" alt="하트 씬" /></a></h2></li>
        			<!-- 20140425 파파플래터 -->
        			<li><h2><a href="/sub.jsp?menuGb=menu&menuId=pj_2010"><img src="../assets/img/common/m2_s10.gif" alt="파파플래터" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=menu&menuId=pj_2011"><img src="../assets/img/common/m2_s11.gif" alt="세트메뉴" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=menu&menuId=pj_2012"><img src="../assets/img/common/m2_s12.gif" alt="사이드" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=menu&menuId=pj_2013"><img src="../assets/img/common/m2_s13.gif" alt="음료" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=menu&menuId=pj_2014"><img src="../assets/img/common/m2_s14.gif" alt="소스&피클" /></a></h2></li>
      			</ul>
    		</li>
    		<li class="navItem3"> <a href="/sub.jsp?menuGb=event&menuId=pj_3001">프로모션</a>
      			<ul class="sub">
        			<li><h2><a href="/sub.jsp?menuGb=event&menuId=pj_3001&subGb=0"><img src="../assets/img/common/m3_s1.gif" alt="진행중인 이벤트" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=event&menuId=pj_3002&subGb=0"><img src="../assets/img/common/m3_s2.gif" alt="지난 이벤트" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=event&menuId=pj_3003&subGb=0"><img src="../assets/img/common/m3_s3.gif" alt="매장별 이벤트" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=event&menuId=pj_3004&subGb=0"><img src="../assets/img/common/m3_s4.gif" alt="스페셜할인 이벤트" /></a></h2></li>
      			</ul>
    		</li>
    		<li class="navItem4"> <a href="/sub.jsp?menuGb=story&menuId=pj_4001">파파존스이야기</a>
      			<ul class="sub">
        			<li><h2><a href="/sub.jsp?menuGb=story&menuId=pj_4001&subGb=A"><img src="../assets/img/common/m4_s1.gif" alt="회사소개" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=story&menuId=pj_4002&subGb=0"><img src="../assets/img/common/m4_s2.gif" alt="피자이야기" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=story&menuId=pj_4003&subGb=0"><img src="../assets/img/common/m4_s3.gif" alt="창립이야기" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=story&menuId=pj_4004&subGb=B"><img src="../assets/img/common/m4_s4.gif" alt="홍보센터" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=story&menuId=pj_4005&subGb=C"><img src="../assets/img/common/m4_s5.gif" alt="채용공고" /></a></h2></li>
      			</ul>
    		</li>
    		<li class="navItem5"> <a href="/sub.jsp?menuGb=customer&menuId=pj_5001">고객센터</a>
      			<ul class="sub">
        			<li><h2><a href="/sub.jsp?menuGb=customer&menuId=pj_5001"><img src="../assets/img/common/m5_s1.gif" alt="공지사항" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=customer&menuId=pj_5002"><img src="../assets/img/common/m5_s2.gif" alt="Q&A" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=customer&menuId=pj_5003"><img src="../assets/img/common/m5_s3.gif" alt="제휴카드안내" /></a></h2></li>
        			<li><h2><a href="/sub.jsp?menuGb=customer&menuId=pj_5004"><img src="../assets/img/common/m5_s4.gif" alt="매장안내" /></a></h2></li>
      			</ul>
    		</li>
  		</ul>
	</div>