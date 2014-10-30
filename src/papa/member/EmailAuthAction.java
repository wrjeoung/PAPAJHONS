package papa.member;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

import com.opensymphony.xwork2.ActionSupport;


public class EmailAuthAction extends ActionSupport {
	private String email;
	private boolean result=true;
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String form() throws Exception {
		return SUCCESS;
	}
	
	public String execute() throws Exception {
		String host = "smtp.gmail.com";//smtp 서버
		String subject = "파파존스 인증번호 전달";
		String phone = "test"; 
		String fromName = "김주혁";
		String from = "kimjuggang@nate.com";//보내는 메일
		String goodsName = "test";
		String to1 = email;
		String content = "인증번호는 [12345] 입니다.";
		
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
}
