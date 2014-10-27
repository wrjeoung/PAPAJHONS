package menu;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;
import db.MenuDTO;

public class MenuAction implements Action, IbatisAware {
	public static SqlMapClient sqlMapper;
	private List<MenuDTO> list = new ArrayList<MenuDTO>();
	private String memId;

		public String execute() throws Exception {
		/*
		if(memId.equals("pj_2013")){
			list = sqlMapper.queryForList("menu_berverage.selectAll");
		}else if(memId.equals("pj_2003")){
			originallist = sqlMapper.queryForList("original.selectAll");
		}
		*/
		list = sqlMapper.queryForList("menuSQL.selectAll");
		
		for(Object a : list)
		{
			System.out.println(((MenuDTO)a).getName());
		}
		
		return SUCCESS;
	}

	public void setList(List<MenuDTO> list) {
		this.list = list;
	}

	public void setIbatis(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}
	
	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}
}
