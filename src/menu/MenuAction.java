package menu;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;
import db.MenuDTO;

public class MenuAction implements Action, IbatisAware {
	public static SqlMapClient sqlMapper;
	private List<MenuDTO> list = new ArrayList<MenuDTO>();
	private String menuId;
	

	public String execute() throws Exception {
		/*
		if(memId.equals("pj_2013")){
			list = sqlMapper.queryForList("menu_berverage.selectAll");
		}else if(memId.equals("pj_2003")){
			originallist = sqlMapper.queryForList("original.selectAll");
		}
		*/
		System.out.println("MenuAction menuId : " + menuId);
		list = sqlMapper.queryForList("menuSQL.selectAll");
		
		
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

	public void setIbatis(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}
	
	
	public String getMenuId() {
		System.out.println("MenuAction getMemId : " + menuId);
		return menuId;
	}

	public void setMenuId(String menuId) {
		System.out.println("MenuAction setMemId : " + menuId);
		this.menuId = menuId;
	}

	
}
