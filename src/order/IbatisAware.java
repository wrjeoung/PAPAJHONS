package order;

import com.ibatis.sqlmap.client.SqlMapClient;

public interface IbatisAware {
	public abstract void setIbatis(SqlMapClient sqlMapper);
}
