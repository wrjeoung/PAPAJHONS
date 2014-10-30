package store;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;

import db.StoreDTO;

public class StoreDetailAction implements Action, IbatisAware{
	
	public static SqlMapClient sqlMapper;
	private List<StoreDTO> list = new ArrayList<StoreDTO>();
	
	public String execute() throws Exception{
		
		list = sqlMapper.queryForList("storeSQL.selectAll");
		
		for(Object a : list){
			System.out.println(((StoreDTO)a).getStorename());
		}
		
		return SUCCESS;
	}
	
	public List<StoreDTO> getList() {
		return list;
	}
	
	public void setList(List<StoreDTO> list) {
		this.list = list;
	}

	@Override
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper = sqlMapper;
	}
}
