package papa.member;

public class MemberData {
	private String name;
	private String id;
	private String pw;
	private String phone;
	private String mobile;
	private String sms;
	private String email;
	private String sendmail;
	private String addr;
	private String activation_status;
	private String activation_key;
	
	public String getActivation_status() {
		return activation_status;
	}
	public void setActivation_status(String activation_status) {
		this.activation_status = activation_status;
	}
	public String getActivation_key() {
		return activation_key;
	}
	public void setActivation_key(String activation_key) {
		this.activation_key = activation_key;
	}
	public String getSms() {
		return sms;
	}
	public void setSms(String sms) {
		this.sms = sms;
	}
	public String getSendmail() {
		return sendmail;
	}
	public void setSendmail(String sendmail) {
		this.sendmail = sendmail;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	
}
