package admin;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import db.MenuDTO;

public class MenuItemWriteProAction implements Action, IbatisAware, ModelDriven<MenuDTO>, Preparable {
	static private SqlMapClient sqlMapper;
	MenuDTO list;

	public String execute() throws Exception {
		if(((String)list.getMenuid()).equals("pj_noSelected"))
			return "noSelected";
		else
		{
			sqlMapper.insert("menuSQL.insertMenu", list);
			System.out.println("MenuitemWriteProAction name : "+list.getName());
			return SUCCESS;
		}
	}

	public MenuDTO getModel() {
		return list;
	}

	public void setIbatis(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

	public void prepare() throws Exception {
		list = new MenuDTO();
	}
}
