package qna.board;

import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class writeAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private qnaVO vo;
	
	private int num;
	private String qmenu;
	private String qcontent;
	private String acontent;
	
	Calendar today=Calendar.getInstance();
	
	public writeAction()throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String form()throws Exception{
		return SUCCESS;
	}
	public String execute()throws Exception{
		vo=new qnaVO();
		vo.setQmenu(getQmenu());
		vo.setQcontent(getQcontent());
		vo.setAcontent(getAcontent());
		vo.setReg_date(today.getTime());
		
		sqlMapper.insert("qna.insertQna", vo);
		return SUCCESS;
	}
	public static Reader getReader() {
		return reader;
	}
	public static void setReader(Reader reader) {
		writeAction.reader = reader;
	}
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		writeAction.sqlMapper = sqlMapper;
	}
	public qnaVO getVo() {
		return vo;
	}
	public void setVo(qnaVO vo) {
		this.vo = vo;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	public Calendar getToday() {
		return today;
	}
	public void setToday(Calendar today) {
		this.today = today;
	}
	public String getQmenu() {
		return qmenu;
	}
	public void setQmenu(String qmenu) {
		this.qmenu = qmenu;
	}
	
}
