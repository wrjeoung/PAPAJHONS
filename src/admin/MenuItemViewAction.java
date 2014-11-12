package admin;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;

import db.MenuDTO;

public class MenuItemViewAction implements Action, IbatisAware {
	public static SqlMapClient sqlMapper;
	private String name;
	private MenuDTO list = new MenuDTO();

	public String execute() throws Exception {
		
		list=(MenuDTO)sqlMapper.queryForObject("menuSQL.selectMenuName",name);
		return SUCCESS;
	}
	
	public MenuDTO getList() {
		return list;
	}	
	
	public void setList(MenuDTO list) {
		this.list = list;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}


	public void setIbatis(SqlMapClient sqlMapper) {
		this.sqlMapper=sqlMapper;
	}

}
