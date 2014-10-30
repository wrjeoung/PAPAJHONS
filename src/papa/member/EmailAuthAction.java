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
		String host = "smtp.gmail.com";//smtp ����
		String subject = "�������� ������ȣ ����";
		String phone = "test"; 
		String fromName = "������";
		String from = "kimjuggang@nate.com";//������ ����
		String goodsName = "test";
		String to1 = email;
		String content = "������ȣ�� [12345] �Դϴ�.";
		
		try{
		Properties props = new Properties();
        // G-Mail SMTP ����
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
        msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName,"UTF-8","B")));//������ ��� ����
        
        InternetAddress[] address1 = {new InternetAddress(to1)};
        msg.setRecipients(Message.RecipientType.TO, address1);//�޴� �������1
        msg.setSubject(subject);// ���� ����
        msg.setSentDate(new java.util.Date());// ������ ��¥ ����
        msg.setContent(content,"text/html;charset=euc-kr"); // ���� ���� (HTML ����)
        
        Transport.send(msg); // ���� ������
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
