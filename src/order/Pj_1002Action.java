package order;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;

import db.MenuDTO;

public class Pj_1002Action implements Action, IbatisAware {

	public static SqlMapClient sqlMapper;
	private List<MenuDTO> list = new ArrayList<MenuDTO>();
	private String menuId;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Pj_1002Action menuId : " + menuId);
		list = sqlMapper.queryForList("menuSQL.selectMenuId",menuId);
		
		for(Object a : list)
		{
			System.out.println(((MenuDTO)a).getName());
		}
		
		return SUCCESS;
	}
	
	public List<MenuDTO> getList() {
		return list;
	}

	public void setList(List<MenuDTO> list) {
		this.list = list;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	@Override
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper = sqlMapper;
	}
}
