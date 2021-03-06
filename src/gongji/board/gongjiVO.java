package gongji.board;

import java.util.Date;

public class gongjiVO {
	private int num;
	private String subject;
	private Date reg_date;
	private int readhit;
	private String content;
	
	private String file_orgname;
	private String file_savname;
	
	
	//검색용 필드
	private String searchCondition;
	private String searchKeyword;
	
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	
	
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
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
	public int getReadhit() {
		return readhit;
	}
	public void setReadhit(int readhit) {
		this.readhit = readhit;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "gongjiVO [num=" + num + ", subject=" + subject + ", reg_date="
				+ reg_date + ", readhit=" + readhit + ", content=" + content
				+ ", file_orgname=" + file_orgname + ", file_savname="
				+ file_savname + "]";
	}
}
