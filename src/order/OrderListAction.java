package order;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.Action;

public class OrderListAction implements Action, IbatisAware {
	public static SqlMapClient sqlMapper;
	

	public String execute() throws Exception {
		

		return SUCCESS;
	}


	public void setIbatis(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

}
