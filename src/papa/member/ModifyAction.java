package papa.member;

import java.util.HashMap;
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
	private String oPwd;
	private String nPwd;
	private int result = 0;
	
	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public String getoPwd() {
		return oPwd;
	}

	public void setoPwd(String oPwd) {
		this.oPwd = oPwd;
	}

	public String getnPwd() {
		return nPwd;
	}

	public void setnPwd(String nPwd) {
		this.nPwd = nPwd;
	}

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
	
	public String changePasswdPro() throws Exception {
		memId = (String) sessionMap.get("memId");
		
		HashMap params = new HashMap();
		
		params.put("id", memId);
		params.put("pw", oPwd);
		
		data = (MemberData) sqlMapper.queryForObject("memberSQL.loginCheck",params);
		
		if(data != null)
		{
			params.remove("pw");
			params.put("pw", nPwd);
			sqlMapper.update("memberSQL.updatePassword", params);
			result = 1;
		}
		else
		{
			result = 0;
		}
		
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
