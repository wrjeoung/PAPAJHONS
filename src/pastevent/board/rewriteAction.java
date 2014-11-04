package pastevent.board;

import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;

import nowevent.board.reVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class rewriteAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private reVO vo2;
	private int num1;
	private String content;
	
	Calendar today=Calendar.getInstance();
	private int num;
	
	public rewriteAction()throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String form()throws Exception{
		return SUCCESS;
	}
	public String execute()throws Exception{
		vo2=new reVO();
		vo2.setContent(getContent());
		vo2.setReg_date(today.getTime());
		vo2.setNum(getNum());
		sqlMapper.insert("reple.insertReple", vo2);
		return SUCCESS;
	}
	public static Reader getReader() {
		return reader;
	}
	public static void setReader(Reader reader) {
		rewriteAction.reader = reader;
	}
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		rewriteAction.sqlMapper = sqlMapper;
	}
	public reVO getVo2() {
		return vo2;
	}
	public void setVo2(reVO vo2) {
		this.vo2 = vo2;
	}
	public int getNum1() {
		return num1;
	}
	public void setNum1(int num1) {
		this.num1 = num1;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Calendar getToday() {
		return today;
	}
	public void setToday(Calendar today) {
		this.today = today;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
