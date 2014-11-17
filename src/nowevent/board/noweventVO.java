package nowevent.board;

import java.util.Date;

public class noweventVO {
	private int num;
	private String subject;
	private Date reg_date;
	
	private String file_orgname;
	private String file_savname;
	private String file_orgname2;
	private String file_savname2;
	
	private String day;
	
	
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getFile_orgname() {
		return file_orgname;
	}
	public void setFile_orgname(String file_orgname) {
		this.file_orgname = file_orgname;
	}
	public String getFile_savname() {
		return file_savname;
	}
	public void setFile_savname(String file_savname) {
		this.file_savname = file_savname;
	}
	public String getFile_orgname2() {
		return file_orgname2;
	}
	public void setFile_orgname2(String file_orgname2) {
		this.file_orgname2 = file_orgname2;
	}
	public String getFile_savname2() {
		return file_savname2;
	}
	public void setFile_savname2(String file_savname2) {
		this.file_savname2 = file_savname2;
	}
}
