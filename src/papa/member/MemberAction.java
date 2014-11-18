package papa.member;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import papa.address.IbatisAware;

public class MemberAction extends ActionSupport implements IbatisAware, Preparable, ModelDriven {
	public static SqlMapClient sqlMapper;	//SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü.
	private String s_id;
	private int check = -1;
	private String menuId;
	private String menuGb;
	private MemberData dto;
	private String val;
	
	public String getVal() {
		return val;
	}

	public void setVal(String val) {
		this.val = val;
	}

	public String getMenuGb() {
		return menuGb;
	}

	public void setMenuGb(String menuGb) {
		this.menuGb = menuGb;
	}

	public Object getModel() {
		return dto;
	}

	public void prepare() throws Exception {
		dto = new MemberData();
	}	
		
	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String form() throws Exception {
		//��� ��.
		return SUCCESS;
	}

	public String checkIdPro() throws Exception {
		MemberData data = null;
		
		data = (MemberData) sqlMapper.queryForObject("memberSQL.selectOne",s_id);
		
		check = data != null ? 1 : 0;
		return SUCCESS;
	}
	
	public String execute() throws Exception {
		
		if(dto.getActivation_key() != null && dto.getActivation_key().length() >=1)
			dto.setActivation_status("active");
		else
			dto.setActivation_status("inactive");
		
		sqlMapper.insert("memberSQL.insertMember", dto);
		return SUCCESS;
	}
	
	public int sendMail(MemberData data) {
		int result = 1;
		String host = "smtp.gmail.com";//smtp ����
		String subject = data.getName()+" �� ȸ������ �Դϴ�.";
		String fromName = data.getName();
		String from = "kimjuggang@nate.com";//������ ����
		String to1 = data.getEmail();
		
		String content = "���̵� : "+data.getId()+"<br/> �н����� : "+data.getPw();
		
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
			result = -1;
			e.printStackTrace();
		}catch(Exception e) {
			result = -1;
			e.printStackTrace();
		}
		return result;
	}	
	
	public String confirmInfo() throws Exception {
		MemberData data = null;

		data = (MemberData) sqlMapper.queryForObject("memberSQL.checkInfo",dto);
		
		if(val.equals("1"))
		{
			if(data != null)
			{
				s_id = data.getId();
				check = 1;
			}
			else
			{
				check = 0;
			}
		}
		else if(val.equals("2"))
		{
			check = data != null ? sendMail(data) : 0;
		}
		
		return SUCCESS;
	}
	
	@Override
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper = sqlMapper;
	}	
}
