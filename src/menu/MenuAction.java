package menu;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;

import db.MenuBeverageDTO;
import db.MenuOriginalDTO;

public class MenuAction implements Action, IbatisAware {
	public static SqlMapClient sqlMapper;
	private List<MenuBeverageDTO> list = new ArrayList<MenuBeverageDTO>();
	private List<MenuOriginalDTO> originallist = new ArrayList<MenuOriginalDTO>();
	private String memId;

	public String execute() throws Exception {
		/*
		if(memId.equals("pj_2013")){
			list = sqlMapper.queryForList("menu_berverage.selectAll");
		}else if(memId.equals("pj_2003")){
			originallist = sqlMapper.queryForList("original.selectAll");
		}
		*/
		list = sqlMapper.queryForList("menu_berverage.selectAll");
		
		for(Object a : list)
		{
			System.out.println(((MenuBeverageDTO)a).getName());
		}
		
		return SUCCESS;
	}

	public void setIbatis(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}
	
	public List<MenuBeverageDTO> getList() {
		return list;
	}

	public void setList(List<MenuBeverageDTO> list) {
		this.list = list;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}
}
