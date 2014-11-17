package admin;


import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import db.MenuDTO;

public class MenuItemModifyProAction implements Action, IbatisAware,Preparable, ModelDriven<MenuDTO> {

	private static SqlMapClient sqlMapper;
	private String menuCategory;
	private MenuDTO list = new MenuDTO();
	
	
	
	public String execute() throws Exception {
		System.out.println("MenuItemModifyProAction menuid : "+list.getMenuid());
		System.out.println("MenuItemModifyProAction no : "+list.getNo());
		sqlMapper.update("menuSQL.updateMenu",list);
		return SUCCESS;
	}
	
	public String getMenuCategory() {
		return menuCategory;
	}

	public void setMenuCategory(String menuCategory) {
		this.menuCategory = menuCategory;
	}

	public void setIbatis(SqlMapClient sqlMapper) {
		this.sqlMapper=sqlMapper;
	}

	
	public MenuDTO getModel() {
		return list;
	}

	
	public void prepare() throws Exception {
		list = new MenuDTO();	
	}

}
