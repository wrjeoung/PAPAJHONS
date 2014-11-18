package pastevent.board;

import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class rewriteAction extends ActionSupport implements SessionAware{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private re2VO vo;
	
	private int num1;
	private String content;
	Calendar today=Calendar.getInstance();
	private int num;
	
	//¼¼¼Ç
	private Map sessionMap;
	private String memId=null;
	private String id;
	
	public rewriteAction()throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String form()throws Exception{
		return SUCCESS;
	}
	public String execute()throws Exception{
		vo=new re2VO();
		vo.setContent(getContent());
		vo.setReg_date(today.getTime());
		vo.setNum(getNum());
		
		vo.setId((String)sessionMap.get("memId"));
		sqlMapper.insert("reple2.insertReple2",vo);
		
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
	public re2VO getVo() {
		return vo;
	}
	public void setVo(re2VO vo) {
		this.vo = vo;
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
	public Map getSessionMap() {
		return sessionMap;
	}
	public void setSessionMap(Map sessionMap) {
		this.sessionMap = sessionMap;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public void setSession(Map arg0) {
		// TODO Auto-generated method stub
		sessionMap = arg0;
	}
}
