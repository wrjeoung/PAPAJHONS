package pastevent.board;

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
	private List<re2VO> list3=new ArrayList<re2VO>();
	private re2VO re2vo=new re2VO();
	
	//¼¼¼Ç2
	private Map sessionMap;
	private String memId=null;
	private String id;
	
	public relistAction()throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String execute()throws Exception{
		memId=(String)sessionMap.get("memId");
		re2vo.setId(getId());
		re2vo.setNum(getNum());
		list3=sqlMapper.queryForList("reple2.selectRe2", getNum());
		return SUCCESS;
	}
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
	public List<re2VO> getList3() {
		return list3;
	}
	public void setList3(List<re2VO> list3) {
		this.list3 = list3;
	}
	public re2VO getRe2vo() {
		return re2vo;
	}
	public void setRe2vo(re2VO re2vo) {
		this.re2vo = re2vo;
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
