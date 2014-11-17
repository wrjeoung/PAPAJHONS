package admin;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;

import db.MenuDTO;

public class MenuItemViewAction implements Action, IbatisAware {
	public static SqlMapClient sqlMapper;
	private int no;
	private MenuDTO list = new MenuDTO();

	public String execute() throws Exception {
		
		list=(MenuDTO)sqlMapper.queryForObject("menuSQL.selectOne",no);
		return SUCCESS;
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public MenuDTO getList() {
		return list;
	}	
	
	public void setList(MenuDTO list) {
		this.list = list;
	}

	public void setIbatis(SqlMapClient sqlMapper) {
		this.sqlMapper=sqlMapper;
	}

}
