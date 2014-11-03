package order;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class IbatisInterceptor implements Interceptor{

	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public void destroy() {
		
	}

	public void init() {
		try {
			reader = Resources.getResourceAsReader("sqlMapConfig.xml");
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String intercept(ActionInvocation invocation) throws Exception {
		Object action = invocation.getAction();
		if(action instanceof IbatisAware) {
			IbatisAware ibatis = (IbatisAware)action;
			ibatis.setIbatis(sqlMapper);
		}
		return invocation.invoke();
	}

}
