package admin;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import db.MenuDTO;

public class MenuItemDeleteAction implements Action, IbatisAware {
	static SqlMapClient sqlMapper;
	MenuDTO menuList;
	int no;	
	
	public String execute() throws Exception {
		
		sqlMapper.delete("menuSQL.deleteMenu",no);
		System.out.println("MenuItemDeleteAction Param no : "+no);
		return SUCCESS;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public MenuDTO getModel() {
		return menuList;
	}
	
	public void setIbatis(SqlMapClient sqlMapper) {
		this.sqlMapper=sqlMapper;
	}
}
