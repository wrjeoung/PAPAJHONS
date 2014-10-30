package papa.member;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import papa.address.IbatisAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;


public class EmailAuthAction extends ActionSupport implements ServletRequestAware,IbatisAware {
	public static SqlMapClient sqlMapper;	//SqlMapClient API를 사용하기 위한 sqlMapper 객체.
	private String email;
	private boolean result = true;
	private HttpServletRequest request;
	private String activation_key; 
	
	public String getActivation_key() {
		return activation_key;
	}

	public void setActivation_key(String activation_key) {
		this.activation_key = activation_key;
	}

	public boolean isResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String form() throws Exception {
		return SUCCESS;
	}
	
	public String activation() throws Exception {
		MemberData data = null;
		HashMap params = new HashMap();
		
		params.put("email", email);
		params.put("activation_key", activation_key);
		
		
		System.out.println("email = "+email+"activation_key = "+activation_key);
		data = (MemberData) sqlMapper.queryForObject("memberSQL.verifyEmailAddress",params);
		
		if(data != null)
		{
			System.out.println("데이터 있음");
		}
		
		return SUCCESS;
	}
	
	public String gen_ActivationKey()
	{
		StringBuffer buffer = new StringBuffer();
		
		for(int i = 1; i<=25; i++)
		{
			char ch = (char)((Math.random()* 26)+97);
			buffer.append(ch);
		}
		return buffer.toString();
	}
	
	public String execute() throws Exception {
		String host = "smtp.gmail.com";//smtp 서버
		String subject = "파파존스 인증번호 전달";
		String phone = "test"; 
		String fromName = "김주혁";
		String from = "kimjuggang@nate.com";//보내는 메일
		String goodsName = "test";
		String to1 = email;
		String url = request.getRequestURL().toString();
		String domain = url.substring(0,url.indexOf("/",8));
		setActivation_key(gen_ActivationKey()); 
		
		String content = "<a href="+"'"+domain+request.getContextPath()+"/member/activationAction.action?email="+email+"&activation_key="+getActivation_key()+"'"+">Activation URL</a>";
		
		try{
		Properties props = new Properties();
        // G-Mail SMTP 사용시
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.host", host);
        props.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.auth", "true");
		
        Session mailSession = Session.getInstance(props,
        		  new javax.mail.Authenticator() {
        			protected PasswordAuthentication getPasswordAuthentication() {
        				return new PasswordAuthentication("kimjuggang", "wngur12wngur");
        			}
        });
        
        Message msg = new MimeMessage(mailSession);
        msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName,"UTF-8","B")));//보내는 사람 설정
        
        InternetAddress[] address1 = {new InternetAddress(to1)};
        msg.setRecipients(Message.RecipientType.TO, address1);//받는 사람설정1
        msg.setSubject(subject);// 제목 설정
        msg.setSentDate(new java.util.Date());// 보내는 날짜 설정
        msg.setContent(content,"text/html;charset=euc-kr"); // 내용 설정 (HTML 형식)
        
        Transport.send(msg); // 메일 보내기
		}catch(MessagingException e) {
			result = false;
			e.printStackTrace();
		}catch(Exception e) {
			result = false;
			e.printStackTrace();
		}
				
		return SUCCESS;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request; 
	}

	@Override
	public void setIbatis(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper; 
	}
}
