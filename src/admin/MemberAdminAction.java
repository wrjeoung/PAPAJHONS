package admin;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import papa.address.IbatisAware;
import papa.member.MemberData;

public class MemberAdminAction extends ActionSupport implements IbatisAware {
	public static SqlMapClient sqlMapper;	//SqlMapClient API를 사용하기 위한 sqlMapper 객체.
	private List<MemberData> list = new ArrayList<MemberData>();
	
	public String form() throws Exception {
		return SUCCESS;
	}
	
	public String execute() throws Exception {
		list = sqlMapper.queryForList("memberSQL.selectAll");
		
		return SUCCESS;
	}	
	
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper = sqlMapper;
	}

}
