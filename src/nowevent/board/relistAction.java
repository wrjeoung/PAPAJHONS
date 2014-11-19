package nowevent.board;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class relistAction extends ActionSupport implements SessionAware{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private int num;
	private int num1;	//Ãß°¡
	private List<reVO> list2=new ArrayList<reVO>();
	private reVO revo=new reVO();
	
	
	private Map sessionMap;
	private String memId=null;
	private String id;
	
	public relistAction() throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String execute()throws Exception{
		memId=(String)sessionMap.get("memId");
		revo.setNum(getNum());
		revo.setNum1(getNum1());
		revo.setId(getId());
		list2=sqlMapper.queryForList("reple.selectRe", getNum());
		
		return SUCCESS;
	}

	public int getNum1() {
		return num1;
	}
	public void setNum1(int num1) {
		this.num1 = num1;
	}
	//--
	public reVO getRevo() {
		return revo;
	}
	public void setRevo(reVO revo) {
		this.revo = revo;
	}
	//--
	public static Reader getReader() {
		return reader;
	}
	public static void setReader(Reader reader) {
		relistAction.reader = reader;
	}
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		relistAction.sqlMapper = sqlMapper;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public List<reVO> getList2() {
		return list2;
	}
	public void setList2(List<reVO> list2) {
		this.list2 = list2;
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
