package nowevent.board;

import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class rewriteAction  extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private reVO vo;
	
	private int num;
	private String content;
	Calendar today=Calendar.getInstance();
	
	public rewriteAction()throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String form()throws Exception{
		return SUCCESS;
	}
	public String execute()throws Exception{
		vo=new reVO();
		vo.setContent(getContent());
		vo.setReg_date(today.getTime());
		
		sqlMapper.insert("reple.insertReple", vo);
		
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
	public reVO getVo() {
		return vo;
	}
	public void setVo(reVO vo) {
		this.vo = vo;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	
}
