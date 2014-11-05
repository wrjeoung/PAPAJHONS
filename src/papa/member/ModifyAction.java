package papa.member;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import papa.address.IbatisAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

public class ModifyAction extends ActionSupport implements IbatisAware,SessionAware {
	public static SqlMapClient sqlMapper;	//SqlMapClient API를 사용하기 위한 sqlMapper 객체.
	private Map sessionMap;
	private String memId = null;
	private MemberData data = null;
	
	public MemberData getData() {
		return data;
	}

	public void setData(MemberData data) {
		this.data = data;
	}

	public String modify() throws Exception {
		memId = (String) sessionMap.get("memId");
		
		data = (MemberData) sqlMapper.queryForObject("memberSQL.selectOne",memId);
		
		return SUCCESS;
	}
	
	public String execute() throws Exception {
		//sqlMapper.insert("memberSQL.insertMember", dto);
		return SUCCESS;
	}
	
	@Override
	public void setIbatis(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

	@Override
	public void setSession(Map arg0) {
		sessionMap = arg0;
	}
}
