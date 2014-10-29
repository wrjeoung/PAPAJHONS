package store;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;

public class StoreDetailAction implements Action, IbatisAware{
	
	public static SqlMapClient sqlMapper;
	
	public String execute() throws Exception{
		return SUCCESS;
	}

	@Override
	public void setIbatis(SqlMapClient sqlMapper) {
		// TODO Auto-generated method stub
		this.sqlMapper = sqlMapper;
	}
}
