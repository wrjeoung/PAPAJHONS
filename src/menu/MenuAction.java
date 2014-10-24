package menu;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;

import db.MenuBeverageDTO;

public class MenuAction implements Action, IbatisAware {
	public static SqlMapClient sqlMapper;
	private List<MenuBeverageDTO> list = new ArrayList<MenuBeverageDTO>();


	public String execute() throws Exception {
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
}
