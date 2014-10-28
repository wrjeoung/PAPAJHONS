package papa.member;

import java.util.HashMap;

import papa.address.IbatisAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

public class LogInOutAction extends ActionSupport implements IbatisAware {
	public static SqlMapClient sqlMapper;	//SqlMapClient API를 사용하기 위한 sqlMapper 객체.
	private String mem_id;
	private String mem_pw;
	private String menuId;
	private String menuGb;
	private String result = "";
	
		
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getMenuGb() {
		return menuGb;
	}

	public void setMenuGb(String menuGb) {
		this.menuGb = menuGb;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String form() throws Exception {
		return SUCCESS;
	}

	public String loginPro() throws Exception {
		MemberData data = null;
		HashMap params = new HashMap();
		
		params.put("id", mem_id);
		params.put("pw", mem_pw);

		data = (MemberData) sqlMapper.queryForObject("memberSQL.loginCheck",params);
			
		result = data != null ? "yes" : "no";
		return SUCCESS;
	}		
	
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper = sqlMapper;
	}
}
