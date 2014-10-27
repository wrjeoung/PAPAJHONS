package papa.member;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import papa.address.IbatisAware;

public class MemberAction extends ActionSupport implements IbatisAware, Preparable, ModelDriven {
	public static SqlMapClient sqlMapper;	//SqlMapClient API를 사용하기 위한 sqlMapper 객체.
	private String s_id;
	private int check = -1;
	private String menuId = "pj_0005";
	private MemberData dto;
	
	public Object getModel() {
		return dto;
	}

	public void prepare() throws Exception {
		dto = new MemberData();
	}	
		
	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String form() throws Exception {
		//등록 폼.
		return SUCCESS;
	}
	
	public String checkIdPro() throws Exception {
		MemberData data = null;
		
		data = (MemberData) sqlMapper.queryForObject("memberSQL.selectOne",s_id);
		
		check = data != null ? 1 : 0;
		return SUCCESS;
	}
	
	public String execute() throws Exception {
		sqlMapper.insert("memberSQL.insertMember", dto);
		return SUCCESS;
	}
	
	@Override
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper = sqlMapper;
	}	
}
