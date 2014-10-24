package menu;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import db.MenuBeverageDTO;

public class SubAction extends ActionSupport implements IbatisAware, Preparable, ModelDriven{
	public static SqlMapClient sqlMapper;
	
	private List<MenuBeverageDTO> list = new ArrayList<MenuBeverageDTO>();
	private MenuBeverageDTO menuBevDTO;
	
	
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

	public void prepare() throws Exception {
		menuBevDTO = new MenuBeverageDTO();
	}

	public Object getModel() {
		return menuBevDTO;
	}

}
